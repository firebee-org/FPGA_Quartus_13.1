/*
 * sd_card.c
 *
 * This file is part of BaS_gcc.
 *
 * BaS_gcc is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * BaS_gcc is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with BaS_gcc.  If not, see <http://www.gnu.org/licenses/>.
 *
 * Copyright 2010 - 2012 F. Aschwanden
 * Copyright 2011 - 2012 V. Riviere
 * Copyright 2012        M. Froeschle
 *
 */

#include <stdint.h>
#include <MCF5475.h>
#include <bas_printf.h>
#include <sd_card.h>
#include <wait.h>
#include "diskio.h"

/*
 * "standard value" for DSPI module configuration register MCF_DSPC_DMCR
 */
const uint32_t DSPI_DMCR_CONF = MCF_DSPI_DMCR_MSTR |	/* FireBee is DSPI master*/	/* 8 bit CS5 on */
			MCF_DSPI_DMCR_CSIS3 |	/* CS3 inactive */
			MCF_DSPI_DMCR_CSIS2 |	/* CS2 inactive */
			MCF_DSPI_DMCR_DTXF |	/* disable transmit FIFO */
			MCF_DSPI_DMCR_DRXF |	/* disable receive FIFO */
			MCF_DSPI_DMCR_CTXF |	/* clear transmit FIFO */
			MCF_DSPI_DMCR_CRXF;		/* clear receive FIFO */
			/* 0x800d3c00 */


/*
 * Write data to the DSPI TX FIFO register
 * First 16 bits are the SPI command field (basically say only HOW to transfer the second
 * half), second are the data to transfer
 */
uint32_t spi_command(uint32_t data)
{
	uint32_t ret;

	MCF_DSPI_DTFR = data;	/* write value to TX FIFO */

	while (! (MCF_DSPI_DSR & MCF_DSPI_DSR_TCF));	/* wait until DSPI transfer complete */
	ret = MCF_DSPI_DRFR;							/* read DSPI Rx FIFO register */
	MCF_DSPI_DSR = 0xffffffff;						/* clear DSPI status register */

	return ret;
}

/*
 * transfer a byte to SPI. This only works if the rest of the DSPI TX FIFO has been
 * initialized previously (either by spi_com or a direct register write).
 * Returns a byte received from SPI (contents of the RX FIFO).
 */

#define MCF_DSPI_DTFR_BYTE _MBAR[0x8a37]
inline uint8_t spi_send_byte(uint8_t byte)
{
	uint8_t ret;

	MCF_DSPI_DTFR_BYTE = byte;

	while (! (MCF_DSPI_DSR & MCF_DSPI_DSR_TCF));	/* wait until DSPI transfer complete */
	ret = MCF_DSPI_DTFR_BYTE;
	MCF_DSPI_DSR = 0xffffffff;

	return ret;
}

/*
 * as above, but word sized
 */
#define MCF_DSPI_DTFR_WORD * (uint16_t *) &_MBAR[0x8ad6]
inline uint16_t spi_send_word(uint16_t word)
{
	uint16_t ret;

	MCF_DSPI_DTFR_WORD = word;

	ret = MCF_DSPI_DTFR_WORD;
	MCF_DSPI_DSR = 0xffffffff;

	return ret;
}

int spi_init(void)
{
	uint32_t ret;
	uint8_t rb;
	int i;

	xprintf("SD-Card initialization: ");

	MCF_PAD_PAR_DSPI = 0x1fff;			/* configure all DSPI GPIO pins for DSPI usage */
	MCF_PAD_PAR_TIMER = 0xff;			/*
										 * FIXME: really necessary or just an oversight
										 * that PAD_PAR_DSPI is only 16 bit?
										 */

	MCF_DSPI_DMCR = DSPI_DMCR_CONF;

	MCF_DSPI_DCTAR0 = MCF_DSPI_DCTAR_TRSZ(0b111) |	/* transfer size = 8 bit */
					  MCF_DSPI_DCTAR_PCSSCK(0b01) |	/* 3 clock DSPICS to DSPISCK delay prescaler */
					  MCF_DSPI_DCTAR_PASC_3CLK |	/* 3 clock DSPISCK to DSPICS negation prescaler */
					  MCF_DSPI_DCTAR_PDT_3CLK |		/* 3 clock delay between DSPICS assertions prescaler */
					  MCF_DSPI_DCTAR_PBR_3CLK |		/* 3 clock prescaler */
					  MCF_DSPI_DCTAR_ASC(0b1001) |	/* 1024 */
					  MCF_DSPI_DCTAR_DT(0b1001) |	/* 1024 */
					  MCF_DSPI_DCTAR_BR(0b0111);
													/* 0x38558897 */

	MCF_DSPI_DSR = 0xffffffff; 	/* clear DSPI status register */
	wait(1000);					/* wait 1ms */

	MCF_DSPI_DMCR = DSPI_DMCR_CONF | MCF_DSPI_DMCR_CSCK; /* enable continuous serial comms clock */
	/* 0xc00d3c00 */

	wait(10000);

	MCF_DSPI_DMCR = DSPI_DMCR_CONF;

	ret = spi_command(MCF_DSPI_DTFR_EOQ | MCF_DSPI_DTFR_CS5 | 0x00FF);
	for (i = 1; i < 10; i++)
	{
		rb = spi_send_byte(0xff);
	}

	MCF_DSPI_DMCR = DSPI_DMCR_CONF | MCF_DSPI_DMCR_CSIS5; /* CS5 inactive */
	/* 0x802d3c00; */

	for (i = 0; i < 2; i++)
	{
		ret = spi_command(MCF_DSPI_DTFR_EOQ | MCF_DSPI_DTFR_CS5);
	}

	MCF_DSPI_DMCR = DSPI_DMCR_CONF;
	ret = spi_command(MCF_DSPI_DTFR_EOQ | MCF_DSPI_DTFR_CS5 | 0x00FF);
	rb = spi_send_byte(0xff);

	MCF_DSPI_DMCR = DSPI_DMCR_CONF;

	wait(10000);

	xprintf("finished\r\n");

	return 0;
}




