/*
 * fifo.c
 *
 * A general implementation of a fifo buffer
 *
 */

#include <fifo.h>

//This initializes the FIFO structure with the given buffer and size
void fifo_init(fifo_t * f, char * buf, int size)
{
     f->head = 0;
     f->tail = 0;
     f->size = size;
     f->buf = buf;
}

// Get one byte from the fifo buffer
uint8_t fifo_get(fifo_t *f)
{
    uint8_t ch = 0;

    if( f->tail != f->head && f->tail < f->size )
    {
        ch = f->buf[f->tail++];
        if( f->tail >= f->size )
            f->tail = 0;
    }

    return ch;
}

// Put one byte into the buffer
void fifo_put(fifo_t *f, uint8_t byte)
{
    if( f->head == f->tail || f->head >= f->size )
        return;
    f->buf[f->head] = byte;
    fifo_advance(f,&f->head);
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

void fifo_advance(fifo_t *f, int *ix)
{
    if( ++*ix > f->size )
        *ix=0;
}

//This reads at most nbytes bytes from the FIFO
//The number of bytes read is returned
int fifo_read(fifo_t *f, char *buf, int nbytes){
     int n = 0;

     while( n < nbytes && !fifo_empty(f) )
     {
         n++;
         *buf++ = f->buf[f->tail];
         fifo_advance(f,&f->tail);
     }

     return n;
}

//This writes up to nbytes bytes to the FIFO
//If the head runs in to the tail, not all bytes are written
//The number of bytes written is returned
int fifo_write(fifo_t *f, const char *buf, int nbytes){
     int n = 0;

     while( n < nbytes && !fifo_full(f) )
     {
         f->buf[f->head] = *buf++;
         fifo_advance(f,&f->head);
         n++;
     }

     return n;
}
