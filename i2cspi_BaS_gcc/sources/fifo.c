/*
 * fifo.c
 *
 * A general implementation of a fifo buffer
 *
 */

#include <fifo.h>

//This initializes the FIFO structure with the given buffer and size
void fifo_init(fifo_t * f, char * buf, int16_t size)
{
     f->head = 0;
     f->tail = 0;
     f->size = size;
     f->buf = buf;
     f->low = 0;
     f->high = 0;
}

// Get one byte from the fifo buffer
uint8_t fifo_get(fifo_t *f)
{
    uint8_t ch = 0;

    if( !fifo_empty(f) )
    {
	fifo_advance(f,&f->tail);
        ch = f->buf[f->tail];
    }

    return ch;
}

// Put one byte into the buffer
void fifo_put(fifo_t *f, uint8_t byte)
{
    if( fifo_unused(f) <= 0 )
        return;
    fifo_advance(f,&f->head);
    f->buf[f->head] = byte;
}

void fifo_clear(fifo_t *f)
{
    f->head = f->tail = 0;
}

int fifo_used(fifo_t *f)
{
    if( f->head > f->tail )
        return (f->head - f->tail);
    return (f->size - f->tail + f->head);
}

int fifo_unused(fifo_t *f)
{
    if( f->head > f->tail )
        return (f->size-f->head+f->tail);
    return (f->tail-f->head);
}

int fifo_full(fifo_t *f)
{
    if( f->head+1 >= f->size )
        return (f->tail == 0);
    return (f->head+1 == f->tail);
}

int fifo_empty(fifo_t *f)
{
    return (f->head == f->tail);
}

void fifo_advance(fifo_t *f, int16_t *ix)
{
    if( ++*ix > f->size )
        *ix=0;
}

//This reads at most nbytes bytes from the FIFO
//The number of bytes read is returned
int fifo_read(fifo_t *f, unsigned char *buf, int16_t nbytes){
     int n = 0;

     while( n < nbytes && !fifo_empty(f) )
     {
         n++;
         *buf++ = fifo_get(f);
     }

     return n;
}

//This writes up to nbytes bytes to the FIFO
//If the head runs in to the tail, not all bytes are written
//The number of bytes written is returned
int fifo_write(fifo_t *f, const unsigned char *buf, int16_t nbytes){
     int n = 0;

     while( n < nbytes && !fifo_full(f) )
     {
	 fifo_put(f,*buf++);
         n++;
     }

     return n;
}
