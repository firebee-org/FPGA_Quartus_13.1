/*
 * i2c.h
 *
 */

#ifndef I2CFIREBEE_h
#define I2CFIREBEE_h

#include <fifo.h>

#ifndef BUFSIZ
#define BUFSIZ 512
#endif

#define I2CTLREAD   (('i'<<8) | 1)
#define I2CTLWRITE  (('i'<<8) | 2)
#define I2CTLSBUF   (('i'<<8) | 3)
#define I2CTLINIT   (('i'<<8) | 4)
#define I2CTLDEV    (('i'<<8) | 5)

// Set a specific bit
#define set_bit(p,bit)          p |= (bit)
#define set_bit_nr(p,nr)        set_bit(p,(1<<(nr)))

// Clear a specific bit
#define clear_bit(p,bit)        p &= ~(bit)
#define clear_bit_nr(p,nr)      clear_bit(p,(1<<(nr)))

#define ELAPSED(t)              (t - ReadTimer())

#define I2C_BUFFER_LENGTH 32

#define I2C_READY   0
#define I2C_MXRX    1
#define I2C_MXTX    2

#define I2C_ADDR    6

#define I2C_READ    1
#define I2C_WRITE   0

unsigned long ReadTimer();
void DelayMicroSec(unsigned long);

void I2C_Init();
int I2C_ioctl(unsigned int, unsigned long);

#endif
