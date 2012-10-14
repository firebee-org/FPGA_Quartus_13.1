#include <MCF5475.h>

void startup(void)
{
	asm volatile(
		"		.extern	_initialize_hardware\n\t"
		"		bra		warmstart\n\t"
		"		jmp		___BOOT_FLASH + 8" 		/* that's also our reset vector */

		/* disable interrupts */
		"warmstart:\n\t"
		"		move.w #0x2700,sr\n\t"
		/* output */ :
		/* input */ :
		/* clobber */ : "d0");

	/* Initialize MBAR */
	asm volatile(
		"		MOVE.L	#__MBAR,D0\n\t"
		"		MOVEC	D0,MBAR\n\t"
		"		MOVE.L	D0,_rt_mbar\n\t"
		/* output */ :
		/* input */ :
		/* clobber */ : "d0");

	/* mmu off */
	asm volatile(
		"		move.l	#__MMUBAR+1,d0\n\t"
		"		movec	d0,MMUBAR\n\t"
		/* output */ :
		/* input */ :
		/* clobber */ : "d0");

	MCF_MMU_MMUCR = 0L;	/* MMU off */

	asm volatile(
		/* Initialize RAMBARs: locate SRAM and validate it */
		"		move.l	#__RAMBAR0 + 0x7,d0\n\t | supervisor only"
		"		movec	d0,RAMBAR0\n\t"
		"		move.l	#__RAMBAR1 + 0x1,d0\n\t"""
		"		movec	d0,RAMBAR1\n\t"
		/* set stack pointer to end of SRAM1 */
		"		lea 	__SUP_SP,a7\n\t"
		/* instruction cache on */
		"		move.l	#0x000C8100,d0\n\t"
		"		movec	d0,cacr\n\t"
		"		nop\n\t"
		/* initialize any hardware specific issues */
		"		bra    _initialize_hardware\n\t"
		/* output */ :
		/* input */ :
		/* clobber */ : "d0");
}