#include "mmu.h"
#include "acia.h"

/*
 * mmu.c
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
 * derived from original assembler sources:
 * Copyright 2010 - 2012 F. Aschwanden
 * Copyright 2013        M. Froeschle
 */

#define ACR_BA(x)                   ((x) & 0xffff0000)
#define ACR_ADMSK(x)                (((x) & 0xffff) << 16)
#define ACR_E(x)                    (((x) & 1) << 15)

#define ACR_S(x)                    (((x) & 3) << 13)
#define ACR_S_USERMODE              0
#define ACR_S_SUPERVISOR_MODE       1
#define ACR_S_ALL                   2

#define ACR_AMM(x)                  (((x) & 1) << 10)

#define ACR_CM(x)                   (((x) & 3) << 5)
#define ACR_CM_CACHEABLE_WT         0x0
#define ACR_CM_CACHEABLE_CB         0x1
#define ACR_CM_CACHE_INH_PRECISE    0x2
#define ACR_CM_CACHE_INH_IMPRECISE  0x3

#define ACR_SP(x)           (((x) & 1) << 3)
#define ACR_W(x)            (((x) & 1) << 2)

#include <stdint.h>
#include "bas_printf.h"
#include "bas_types.h"
#include "MCF5475.h"
#include "pci.h"
#include "cache.h"
#include "util.h"

#if defined(MACHINE_FIREBEE)
#include "firebee.h"
#elif defined(MACHINE_M5484LITE)
#include "m5484l.h"
#elif defined(MACHINE_M54455)
#include "m54455.h"
#else
#error "unknown machine!"
#endif /* MACHINE_FIREBEE */

#define DEBUG_MMU
#ifdef DEBUG_MMU
#define dbg(format, arg...) do { xprintf("DEBUG (%s()): " format, __FUNCTION__, ##arg);} while(0)
#else
#define dbg(format, arg...) do {;} while (0)
#endif /* DEBUG_MMU */
#define err(format, arg...) do { xprintf("ERROR (%s()): " format, __FUNCTION__, ##arg); xprintf("system halted\r\n"); } while(0); while(1)

struct page_descriptor
{
    uint8_t cache_mode          : 2;
    uint8_t supervisor_protect  : 1;
    uint8_t read                : 1;
    uint8_t write               : 1;
    uint8_t execute             : 1;
    uint8_t global              : 1;
    uint8_t locked              : 1;
};

static struct page_descriptor pages[65536];   /* 512 Mb RAM */

/*
 * set ASID register
 * saves new value to rt_asid and returns former value
 */
inline uint32_t set_asid(uint32_t value)
{
    extern long rt_asid;
    uint32_t ret = rt_asid;

    __asm__ __volatile__(
        "movec		%[value],ASID\n\t"
        : /* no output */
        : [value] "r" (value)
        :
    );

    rt_asid = value;

    return ret;
}


/*
 * set ACRx register
 * saves new value to rt_acrx and returns former value
 */
inline uint32_t set_acr0(uint32_t value)
{
    extern uint32_t rt_acr0;
    uint32_t ret = rt_acr0;

    __asm__ __volatile__(
        "movec		%[value],ACR0\n\t"
        : /* not output */
        : [value] "r" (value)
        :
    );
    rt_acr0 = value;

    return ret;
}

/*
 * set ACRx register
 * saves new value to rt_acrx and returns former value
 */
inline uint32_t set_acr1(uint32_t value)
{
    extern uint32_t rt_acr1;
    uint32_t ret = rt_acr1;

    __asm__ __volatile__(
        "movec		%[value],ACR1\n\t"
        : /* not output */
        : [value] "r" (value)
        :
    );
    rt_acr1 = value;

    return ret;
}


/*
 * set ACRx register
 * saves new value to rt_acrx and returns former value
 */
inline uint32_t set_acr2(uint32_t value)
{
    extern uint32_t rt_acr2;
    uint32_t ret = rt_acr2;

    __asm__ __volatile__(
        "movec		%[value],ACR2\n\t"
        : /* not output */
        : [value] "r" (value)
        :
    );
    rt_acr2 = value;

    return ret;
}

/*
 * set ACRx register
 * saves new value to rt_acrx and returns former value
 */
inline uint32_t set_acr3(uint32_t value)
{
    extern uint32_t rt_acr3;
    uint32_t ret = rt_acr3;

    __asm__ __volatile__(
        "movec		%[value],ACR3\n\t"
        : /* not output */
        : [value] "r" (value)
        :
    );
    rt_acr3 = value;

    return ret;
}

inline uint32_t set_mmubar(uint32_t value)
{
    extern uint32_t rt_mmubar;
    uint32_t ret = rt_mmubar;

    __asm__ __volatile__(
        "movec		%[value],MMUBAR\n\t"
        : /* no output */
        : [value] "r" (value)
        : /* no clobber */
    );
    rt_mmubar = value;
    NOP();

    return ret;
}

/*
 * translation table for virtual addresses. Holds the virtual_offset (which must be added to a physical
 * address to get its virtual counterpart) for memory ranges.
 * Currently, this contains only the STRAM addresses which are mapped to Firebee video memory
 */
struct phys_to_virt
{
    uint32_t start_address;
    uint32_t length;
    uint32_t virtual_offset;
};

static struct phys_to_virt translation[] =
{
    { 0x00000000, 0x01000000, 0x60000000 },     /* map first 16 MByte to first 16 Mb of video ram */
    { 0x01000000, 0x10000000, 0x00000000 },     /* map rest of ram virt = phys */
    { 0x1fd00000, 0x01000000, 0x00000000 },     /* accessed by EmuTOS? */
};
static int num_translations = sizeof(translation) / sizeof(struct phys_to_virt);

static inline uint32_t lookup_phys(uint32_t phys)
{
    int i;

    for (i = 0; i < num_translations; i++)
    {
        if (phys >= translation[i].start_address && phys < translation[i].start_address + translation[i].length)
        {
            return phys + translation[i].virtual_offset;
        }
    }
    err("physical address 0x%lx not found in translation table!\r\n", phys);
}

/*
 * map a page of memory using virt and phys as addresses with the Coldfire MMU.
 *
 * Theory of operation: the Coldfire MMU in the Firebee has 64 TLB entries, 32 for data (DTLB), 32 for
 * instructions (ITLB). Mappings can either be done locked (normal MMU TLB misses will not consider them
 * for replacement) or unlocked (mappings will reallocate using a LRU scheme when the MMU runs out of
 * TLB entries). For proper operation, the MMU needs at least two ITLBs and/or four free/allocatable DTLBs
 * per instruction as a minimum, more for performance. Thus locked pages (that can't be touched by the
 * LRU algorithm) should be used sparsingly.
 *
 *
 */
int mmu_map_8k_page(uint32_t virt)
{
    const int size_mask = 0xffffe000;                   /* 8k pagesize */
    int page_index = (virt & size_mask) / 4096;          /* index into page_descriptor array */
    struct page_descriptor *page = &pages[page_index];  /* attributes of page to map */

    uint32_t adr = lookup_phys(virt);                /* phys2virt translation of page */

    /*
     * add page to TLB
     */
    MCF_MMU_MMUTR = (virt & size_mask) |    						/* virtual address */
        MCF_MMU_MMUTR_ID(0x00) |        							/* address space id (ASID) */
        MCF_MMU_MMUTR_SG |											/* shared global */
        MCF_MMU_MMUTR_V;											/* valid */
    NOP();

    MCF_MMU_MMUDR = (adr & size_mask) |                 			/* physical address */
        MCF_MMU_MMUDR_SZ(MMU_PAGE_SIZE_8K) |						/* page size */
        MCF_MMU_MMUDR_CM(page->cache_mode) |
        (page->read ? MCF_MMU_MMUDR_R : 0) |                    	/* read access enable */
        (page->write ? MCF_MMU_MMUDR_W : 0) |                       /* write access enable */
        (page->execute ? MCF_MMU_MMUDR_X : 0) |                     /* execute access enable */
        (page->locked ? MCF_MMU_MMUDR_LK : 0);
    NOP();

    MCF_MMU_MMUOR = MCF_MMU_MMUOR_ACC |		/* access TLB, data */
        MCF_MMU_MMUOR_UAA;					/* update allocation address field */
    NOP();

    MCF_MMU_MMUOR = MCF_MMU_MMUOR_ITLB | 	/* instruction */
        MCF_MMU_MMUOR_ACC |     			/* access TLB */
        MCF_MMU_MMUOR_UAA;      			/* update allocation address field */
    dbg("mapped virt=0x%08x to phys=0x%08x\r\n", virt, adr);

    return 1;
}

struct mmu_map_flags
{
    unsigned cache_mode:2;
    unsigned protection:1;
    unsigned page_id:8;
    unsigned access:3;
    unsigned locked:1;
    unsigned unused:17;
};

/*
 * map a page of memory using virt and phys as addresses with the Coldfire MMU.
 *
 * Theory of operation: the Coldfire MMU in the Firebee has 64 TLB entries, 32 for data (DTLB), 32 for
 * instructions (ITLB). Mappings can either be done locked (normal MMU TLB misses will not consider them
 * for replacement) or unlocked (mappings will reallocate using a LRU scheme when the MMU runs out of
 * TLB entries). For proper operation, the MMU needs at least two ITLBs and/or four free/allocatable DTLBs
 * per instruction as a minimum, more for performance. Thus locked pages (that can't be touched by the
 * LRU algorithm) should be used sparsingly.
 *
 *
 */
int mmu_map_page(uint32_t virt, uint32_t phys, enum mmu_page_size sz, const struct mmu_map_flags *flags)
{
    int size_mask;

    switch (sz)
    {
        case MMU_PAGE_SIZE_1M:
            size_mask = 0xfff00000;
            break;

        case MMU_PAGE_SIZE_8K:
            size_mask = 0xffffe000;
            break;

        case MMU_PAGE_SIZE_4K:
            size_mask = 0xfffff000;
            break;

        case MMU_PAGE_SIZE_1K:
            size_mask = 0xfffff800;
            break;

        default:
            dbg("illegal map size %d\r\n", sz);
            return 0;
    }

    /*
     * add page to TLB
     */
    MCF_MMU_MMUTR = ((int) virt & size_mask) |						/* virtual address */
        MCF_MMU_MMUTR_ID(flags->page_id) |							/* address space id (ASID) */
        MCF_MMU_MMUTR_SG |											/* shared global */
        MCF_MMU_MMUTR_V;											/* valid */
    NOP();

    MCF_MMU_MMUDR = ((int) phys & size_mask) |						/* physical address */
        MCF_MMU_MMUDR_SZ(sz) |										/* page size */
        MCF_MMU_MMUDR_CM(flags->cache_mode) |
        (flags->access & ACCESS_READ ? MCF_MMU_MMUDR_R : 0) |		/* read access enable */
        (flags->access & ACCESS_WRITE ? MCF_MMU_MMUDR_W : 0) |		/* write access enable */
        (flags->access & ACCESS_EXECUTE ? MCF_MMU_MMUDR_X : 0) |		/* execute access enable */
        (flags->locked ? MCF_MMU_MMUDR_LK : 0);
    NOP();

    MCF_MMU_MMUOR = MCF_MMU_MMUOR_ACC |		/* access TLB, data */
        MCF_MMU_MMUOR_UAA;					/* update allocation address field */
    NOP();

    MCF_MMU_MMUOR = MCF_MMU_MMUOR_ITLB | 	/* instruction */
        MCF_MMU_MMUOR_ACC |     			/* access TLB */
        MCF_MMU_MMUOR_UAA;      			/* update allocation address field */
    dbg("mapped virt=0x%08x to phys=0x%08x\r\n", virt, phys);

    return 1;
}

void mmu_init(void)
{
    extern uint8_t _MMUBAR[];
    uint32_t MMUBAR = (uint32_t) &_MMUBAR[0];
    extern uint8_t _TOS[];
    uint32_t TOS = (uint32_t) &_TOS[0];
    struct mmu_map_flags flags;
    int i;

    /*
     * prelaminary initialization of page descriptor table
     */
    for (i = 0; i < sizeof(pages); i++)
    {
        pages[i].cache_mode = CACHE_WRITETHROUGH;
        pages[i].global = 1;
        pages[i].locked = 0;
        pages[i].read = 1;
        pages[i].write = 1;
        pages[i].execute = 1;
        pages[i].supervisor_protect = 0;
    }

    set_asid(0);			/* do not use address extension (ASID provides virtual 48 bit addresses */

    /* set data access attributes in ACR0 and ACR1 */
    set_acr0(ACR_W(0) |								/* read and write accesses permitted */
            ACR_SP(0) |								/* supervisor and user mode access permitted */
            ACR_CM(ACR_CM_CACHE_INH_PRECISE) |		/* cache inhibit, precise */
            ACR_AMM(0) |							/* control region > 16 MB */
            ACR_S(ACR_S_ALL) |						/* match addresses in user and supervisor mode */
            ACR_E(1) |								/* enable ACR */
#if defined(MACHINE_FIREBEE)
            ACR_ADMSK(0x7f) |						/* cover 2GB area from 0x80000000 to 0xffffffff */
            ACR_BA(0x80000000));					/* (equals area from 3 to 4 GB */
#elif defined(MACHINE_M5484LITE)
            ACR_ADMSK(0x7f) |						/* cover 2 GB area from 0x80000000 to 0xffffffff */
            ACR_BA(0x80000000));
#elif defined(MACHINE_M54455)
            ACR_ADMSK(0x7f) |
            ACR_BA(0x80000000));					/* FIXME: not determined yet */
#else
#error unknown machine!
#endif /* MACHINE_FIREBEE */

    // set_acr1(0x601fc000);
    set_acr1(ACR_W(0) |
            ACR_SP(0) |
            ACR_CM(0) |
#if defined(MACHINE_FIREBEE)
            ACR_CM(ACR_CM_CACHEABLE_WT) |			/* video RAM on the Firebee */
#elif defined(MACHINE_M5484LITE)
            ACR_CM(ACR_CM_CACHE_INH_PRECISE) |		/* Compact Flash on the M548xLITE */
#elif defined(MACHINE_M54455)
            ACR_CM(ACR_CM_CACHE_INH_PRECISE) |		/* FIXME: not determined yet */
#else
#error unknown machine!
#endif /* MACHINE_FIREBEE */
            ACR_AMM(0) |
            ACR_S(ACR_S_ALL) |
            ACR_E(1) |
            ACR_ADMSK(0x1f) |
            ACR_BA(0x60000000));

    /* set instruction access attributes in ACR2 and ACR3 */

    //set_acr2(0xe007c400);
    set_acr2(ACR_W(0) |
            ACR_SP(0) |
            ACR_CM(0) |
            ACR_CM(ACR_CM_CACHEABLE_WT) |
            ACR_AMM(1) |
            ACR_S(ACR_S_ALL) |
            ACR_E(1) |
            ACR_ADMSK(0x7) |
            ACR_BA(0xe0000000));

    /* disable ACR3 */
    set_acr3(0x0);

    set_mmubar(MMUBAR + 1);		/* set and enable MMUBAR */

    /* clear all MMU TLB entries */
    MCF_MMU_MMUOR = MCF_MMU_MMUOR_CA;

    /* create locked TLB entries */

    //flags.cache_mode = CACHE_COPYBACK;
    //flags.protection = SV_USER;
    //flags.page_id = 0;
    //flags.access = ACCESS_READ | ACCESS_WRITE | ACCESS_EXECUTE;
    //flags.locked = true;

    /* 0x0000_0000 - 0x000F_FFFF (first MB of physical memory) locked virt = phys */
    //mmu_map_page(0x0, 0x0, MMU_PAGE_SIZE_1M, &flags);

#if defined(MACHINE_FIREBEE)
    /*
     * 0x00d0'0000 - 0x00df'ffff (last megabyte of ST RAM = Falcon video memory) locked ID = 6
     * mapped to physical address 0x60d0'0000 (FPGA video memory)
     * video RAM: read write execute normal write true
     */
    //flags.cache_mode = CACHE_WRITETHROUGH;
    //flags.protection = SV_USER;
    //flags.page_id = SCA_PAGE_ID;
    //flags.access = ACCESS_READ | ACCESS_WRITE | ACCESS_EXECUTE;
    //flags.locked = true;
    //mmu_map_page(0x00d00000, 0x60d00000, MMU_PAGE_SIZE_1M, &flags);

    //video_tlb = 0x2000;						/* set page as video page */
    //video_sbt = 0x0;						/* clear time */
#endif /* MACHINE_FIREBEE */

    /*
     * Make the TOS (in SDRAM) read-only
     * This maps virtual 0x00e0'0000 - 0x00ef'ffff to the same virtual address
     */
    flags.cache_mode = CACHE_COPYBACK;
    flags.protection = SV_PROTECT;
    flags.page_id = 0;
    flags.access = ACCESS_READ | ACCESS_EXECUTE;
    flags.locked = true;
    mmu_map_page(TOS, TOS, MMU_PAGE_SIZE_1M, &flags);

#if defined(MACHINE_FIREBEE)
    /*
     * Map FireBee I/O area (0xfff0'0000 - 0xffff'ffff physical) to the Falcon-compatible I/O
     * area (0x00f0'0000 - 0x00ff'ffff virtual) for the FireBee
     */
    flags.cache_mode = CACHE_NOCACHE_PRECISE;
    flags.access = ACCESS_WRITE | ACCESS_READ;
    mmu_map_page(0x00f00000, 0xfff00000, MMU_PAGE_SIZE_1M, &flags);
#endif /* MACHINE_FIREBEE */

    /*
     * Map (locked) the second last MB of physical SDRAM (this is where BaS .data and .bss reside) to the same
     * virtual address. This is also used (completely) when BaS is in RAM
     */
    flags.cache_mode = CACHE_COPYBACK;
    flags.access = ACCESS_READ | ACCESS_WRITE | ACCESS_EXECUTE;
    mmu_map_page(SDRAM_START + SDRAM_SIZE - 0X00200000, SDRAM_START + SDRAM_SIZE - 0X00200000, MMU_PAGE_SIZE_1M, &flags);

    /*
     * Map (locked) the very last MB of physical SDRAM (this is where the driver buffers reside) to the same
     * virtual address. Used uncached for drivers.
     */
    flags.cache_mode = CACHE_NOCACHE_PRECISE;
    flags.access = ACCESS_READ | ACCESS_WRITE;
    flags.protection = SV_PROTECT;
    mmu_map_page(SDRAM_START + SDRAM_SIZE - 0x00100000, SDRAM_START + SDRAM_SIZE - 0x00100000, MMU_PAGE_SIZE_1M, &flags);
}


void mmutr_miss(uint32_t address, uint32_t pc, uint32_t format_status)
{
    dbg("MMU TLB MISS accessing 0x%08x\r\nFS = 0x%08x\r\nPC = 0x%08x\r\n", address, format_status, pc);
    flush_and_invalidate_caches();

    switch (address)
    {
        case keyctl:
        case keybd:
            /* do something to emulate the IKBD access */
            dbg("IKBD access\r\n");
            break;

        case midictl:
        case midi:
            /* do something to emulate MIDI access */
            dbg("MIDI ACIA access\r\n");
            break;

        default:
            /* add missed page to TLB */
            mmu_map_8k_page(address);

            flush_and_invalidate_caches();

            // experimental; try to ensure that supervisor stack area stays in mmu TLBs
            register uint32_t sp asm("sp");
            mmu_map_8k_page(sp);

            dbg("DTLB: MCF_MMU_MMUOR = %08x\r\n", MCF_MMU_MMUOR);
            dbg("ITLB: MCF_MMU_MMUOR = %08x\r\n\r\n", MCF_MMU_MMUOR);
    }
}



