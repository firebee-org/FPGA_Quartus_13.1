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

typedef struct
{
	char * buf;
	int head;
	int tail;
	int size;
} fifo_t;

void fifo_init(fifo_t*, char*, int);
void fifo_advance(fifo_t*, int*);

uint8_t fifo_get(fifo_t*);
void fifo_put(fifo_t*, uint8_t);

void fifo_clear(fifo_t*);

int fifo_used(fifo_t*);
int fifo_unused(fifo_t*);

int fifo_full(fifo_t*);
int fifo_empty(fifo_t*);

int fifo_read(fifo_t*, unsigned char *, int);
int fifo_write(fifo_t*, const unsigned char*, int);

#endif
