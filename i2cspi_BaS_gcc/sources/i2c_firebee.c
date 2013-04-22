/*
 * i2c.c
 *
 */

#include <MCF5475.h>
#include <i2c_firebee.h>

#include <fifo.h>

int register_handler(uint8_t,uint8_t,void (*func)());

static struct
{
	uint8_t state;
	long delay;
	uint16_t len;
	fifo_t fifo;
	unsigned char *_buf;
	uint16_t device;
} i2c_param;

char local_buf[BUFSIZ];

#define FIFO    &i2c_param.fifo

void __attribute__ ((interrupt)) I2C_InterruptHandler(void)
{
	char ch;

	clear_bit(MCF_I2C_I2SR, MCF_I2C_I2SR_IIF);
	if (MCF_I2C_I2CR & MCF_I2C_I2CR_MSTA)
	{ // Masters of the known universe
		if (MCF_I2C_I2SR & MCF_I2C_I2SR_ICF)
		{
			switch (i2c_param.state)
			{
			case I2C_MXRX:
				if (fifo_used(&i2c_param.fifo) + 1 == i2c_param.len)
				{
					clear_bit(MCF_I2C_I2CR, MCF_I2C_I2CR_MSTA);
					i2c_param.state = I2C_READY;
				}
				else if (fifo_used(&i2c_param.fifo) + 2 == i2c_param.len)
				{
					set_bit(MCF_I2C_I2CR, MCF_I2C_I2CR_TXAK);
					i2c_param.state = I2C_READY;
				}
				fifo_put(&i2c_param.fifo, MCF_I2C_I2DR );
				break;
			case I2C_ADDR:
				if (fifo_empty(&i2c_param.fifo))
				{
					i2c_param.state = I2C_MXRX;
					clear_bit(MCF_I2C_I2CR, MCF_I2C_I2CR_MTX); // Receive mode
					set_bit(MCF_I2C_I2CR, MCF_I2C_I2CR_RSTA);
					ch = MCF_I2C_I2DR; // Dummy read
					break;
				}
			case I2C_MXTX:
				if (fifo_empty(&i2c_param.fifo)
						|| (MCF_I2C_I2SR & MCF_I2C_I2SR_RXAK))
				{
					clear_bit(MCF_I2C_I2CR, MCF_I2C_I2CR_MSTA);
					i2c_param.state = I2C_READY;
				}
				else
					MCF_I2C_I2DR = fifo_get(&i2c_param.fifo);
				break;
			}
		}
	}
	else
	{ // Slave mode.
		int set;

		if ((set = (MCF_I2C_I2SR & MCF_I2C_I2SR_IAL)))
			clear_bit(MCF_I2C_I2SR, MCF_I2C_I2SR_IAL);
		if (MCF_I2C_I2SR & MCF_I2C_I2SR_IAAS)
		{
			if (MCF_I2C_I2SR & MCF_I2C_I2SR_SRW)
			{
				set_bit(MCF_I2C_I2CR, MCF_I2C_I2CR_MTX);
				fifo_put(&i2c_param.fifo, MCF_I2C_I2DR );
			}
			else
			{
				clear_bit(MCF_I2C_I2CR, MCF_I2C_I2CR_MTX);
				ch = MCF_I2C_I2DR;
			}
		}
		else if (!set)
		{
			if (MCF_I2C_I2CR & MCF_I2C_I2CR_MTX)
			{
				if (MCF_I2C_I2SR & MCF_I2C_I2SR_RXAK)
					MCF_I2C_I2DR = fifo_get(&i2c_param.fifo);
				else
				{
					clear_bit(MCF_I2C_I2CR, MCF_I2C_I2CR_MTX);
					ch = MCF_I2C_I2DR;
				}
			}
			else
			{
				fifo_put(&i2c_param.fifo, MCF_I2C_I2DR );
			}
		}
	}
}

/*
 * I2Cinit: I2C initilazation as master
 *
 * Parameters: None.
 *
 * Return : None.
 */
void I2C_Init()
{
    i2c_param.fifo.buf = local_buf;
    i2c_param.fifo.size = BUFSIZ;
    i2c_param.delay = 133 * 10L; // We can safely ignore this
    i2c_param.len = 0;
    I2C_ioctl(0, 0);
    register_handler(1,40,I2C_InterruptHandler);
    xprintf("Registered I2C Handler ...\n\r");
}

void I2C_send(unsigned short device, unsigned char *buf, unsigned short len)
{
	if (len > i2c_param.fifo.size)
		return;
	i2c_param.len = len;
	fifo_clear(&i2c_param.fifo);
	if (device > 127) // Use I2C 10 bit address
	{
		fifo_put(FIFO, 0b11110 | ((device >> 5) & 6) | I2C_WRITE);
		fifo_put(FIFO, device & 255);
	}
	else
		fifo_put(FIFO, ((device << 1) & 0xFE) | I2C_WRITE);
	fifo_write(FIFO, buf, len);
	i2c_param.state = I2C_MXTX;
}

void I2C_receive(unsigned short device, unsigned char *buf, unsigned short len)
{
	if (len > i2c_param.fifo.size)
		return;
	i2c_param.len = len;
	fifo_clear(FIFO);
	if (device > 127) // Use I2C 10 bit address
	{
		fifo_put(FIFO, 0b11110 | ((device >> 5) & 6) | I2C_READ);
		fifo_put(FIFO, device & 255);
	}
	else
		fifo_put(FIFO, ((device << 1) & 0xFE) | I2C_READ);
	i2c_param.state = I2C_ADDR;
}

int I2C_ioctl(unsigned int index, unsigned long val)
{
	unsigned short len = val;
	uint8_t temp;

	// Set device as slave or
	switch (index)
	{
	case I2CTLINIT: // make me master
		/* set the frequency near 400KHz */
		MCF_I2C_I2FDR = MCF_I2C_I2FDR_IC(0x10);
		/* start the module */
		MCF_I2C_I2CR = MCF_I2C_I2CR_IIEN | MCF_I2C_I2CR_IEN;
		/* if bit busy set, send a stop condition to slave module */
		if (MCF_I2C_I2SR & MCF_I2C_I2SR_IBB)
		{
			MCF_I2C_I2CR = 0; /* clear control register */
			MCF_I2C_I2CR = MCF_I2C_I2CR_IIEN | MCF_I2C_I2CR_IEN
					| MCF_I2C_I2CR_MSTA; /*  enable module & send a START condition */
			temp = MCF_I2C_I2DR; /* dummy read */
			MCF_I2C_I2SR = 0; /* clear status register */
			MCF_I2C_I2CR = 0; /* clear control register */
			MCF_I2C_I2CR = MCF_I2C_I2CR_IIEN | MCF_I2C_I2CR_IEN; /* enable the module again */
		}
		i2c_param.state = I2C_READY;
		i2c_param._buf = 0;
		break;
	case I2CTLSBUF:
		i2c_param._buf = (unsigned char *) val;
		break;
	case I2CTLDEV:
		i2c_param.device = val;
		break;
	case I2CTLREAD:
		if (i2c_param._buf == 0 || i2c_param.device == 0)
			return -1;
		I2C_receive(i2c_param.device, i2c_param._buf, len);
		break;
	case I2CTLWRITE:
		if (i2c_param._buf == 0 || i2c_param.device == 0)
			return -1;
		I2C_send(i2c_param.device, i2c_param._buf, len);
		break;
	}
}

