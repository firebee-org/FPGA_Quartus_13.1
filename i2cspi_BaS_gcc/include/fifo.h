/*
 * This is taken from general implementations
 * on the internet, and definately needs some
 * work.
 *
 * good enough for now.
 *
 */

#ifndef FIREBEE_FIFO
#define FIREBEE_FIFO

#include <inttypes.h>

/*
 * FIFO
 * 
 * Make this look exactly like IOREC, so that
 * we can interchange the two.  But ignore the
 * low, high watermarks.  For now.
 *
 * in IOREC, the notion of head/tail is opposite
 * to ours.  So we place our head/tail, in the
 * equivalent positions as TOS use is.  So
 * we can use this structure, intermittantly
 * with TOS.
 */
typedef struct
{
    char * buf;
    int16_t size;
    int16_t tail;
    int16_t head;
    int16_t low;
    int16_t high;
} fifo_t;

void fifo_init(fifo_t*, char*, int16_t);
void fifo_advance(fifo_t*, int16_t*);

uint8_t fifo_get(fifo_t*);
void fifo_put(fifo_t*, uint8_t);

void fifo_clear(fifo_t*);

int fifo_used(fifo_t*);
int fifo_unused(fifo_t*);

int fifo_full(fifo_t*);
int fifo_empty(fifo_t*);

int fifo_read(fifo_t*, unsigned char *, int16_t);
int fifo_write(fifo_t*, const unsigned char*, int16_t);

#endif
