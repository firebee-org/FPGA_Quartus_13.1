-- Xilinx XPort Language Converter, Version 4.1 (110)
-- 
-- AHDL Design Source:  .tdf
-- VHDL Design Output:  .vhd
-- Created 13-Jan-2016 10:03 AM
--
-- Copyright (c) 2016, Xilinx, Inc.  All Rights Reserved.
-- Xilinx Inc makes no warranty, expressed or implied, with respect to
-- the operation and/or functionality of the converted output files.
-- 

-- VIDEO MODUSE UND CLUT CONTROL


-- Some names could not be written out to VHDL as they were
-- in the source, and have been changed:
--
-- AHDL                VHDL
-- ====                ====
-- VERZ0_.q            VERZ0_q
-- VERZ0_.prn          VERZ0_prn
-- VERZ0_.clrn         VERZ0_clrn
-- VERZ0_.clk          VERZ0_clk
-- VERZ0_.d            VERZ0_d
-- VERZ0_              VERZ0
-- VERZ1_.q            VERZ1_q
-- VERZ1_.prn          VERZ1_prn
-- VERZ1_.clrn         VERZ1_clrn
-- VERZ1_.clk          VERZ1_clk
-- VERZ1_.d            VERZ1_d
-- VERZ1_              VERZ1
-- VERZ2_.q            VERZ2_q
-- VERZ2_.prn          VERZ2_prn
-- VERZ2_.clrn         VERZ2_clrn
-- VERZ2_.clk          VERZ2_clk
-- VERZ2_.d            VERZ2_d
-- VERZ2_              VERZ2
-- CLUT_MUX_AV0_.q     CLUT_MUX_AV0_q
-- CLUT_MUX_AV0_.prn   CLUT_MUX_AV0_prn
-- CLUT_MUX_AV0_.clrn  CLUT_MUX_AV0_clrn
-- CLUT_MUX_AV0_.clk   CLUT_MUX_AV0_clk
-- CLUT_MUX_AV0_.d     CLUT_MUX_AV0_d
-- CLUT_MUX_AV0_       CLUT_MUX_AV0
-- CLUT_MUX_AV1_.q     CLUT_MUX_AV1_q
-- CLUT_MUX_AV1_.prn   CLUT_MUX_AV1_prn
-- CLUT_MUX_AV1_.clrn  CLUT_MUX_AV1_clrn
-- CLUT_MUX_AV1_.clk   CLUT_MUX_AV1_clk
-- CLUT_MUX_AV1_.d     CLUT_MUX_AV1_d
-- CLUT_MUX_AV1_       CLUT_MUX_AV1


--  CREATED BY FREDI ASCHWANDEN
--  {{ALTERA_PARAMETERS_BEGIN}} DO NOT REMOVE THIS LINE!
--  {{ALTERA_PARAMETERS_END}} DO NOT REMOVE THIS LINE!
LIBRARY ieee;
    USE ieee.std_logic_1164.all;
    USE ieee.numeric_std.all;

ENTITY video_mod_mux_clutctr IS
    PORT
    (
        nRSTO           : IN std_logic;
        MAIN_CLK        : IN std_logic;
        nFB_CS1         : IN std_logic;
        nFB_CS2         : IN std_logic;
        nFB_CS3         : IN std_logic;
        nFB_WR          : IN std_logic;
        nFB_OE          : IN std_logic;
        FB_SIZE0        : IN std_logic;
	    FB_SIZE1        : IN std_logic;
        nFB_BURST       : IN std_logic;
        FB_ADR          : IN std_logic_vector(31 DOWNTO 0);
        CLK33M          : IN std_logic;
        CLK25M          : IN std_logic;
        BLITTER_RUN     : IN std_logic;
        CLK_VIDEO       : IN std_logic;
        VR_D            : IN std_logic_vector(8 DOWNTO 0);
        VR_BUSY         : IN std_logic;
        COLOR8          : OUT std_logic;
        ACP_CLUT_RD     : OUT std_logic;
        COLOR1          : OUT std_logic;
        FALCON_CLUT_RDH : OUT std_logic;
        FALCON_CLUT_RDL : OUT std_logic;
        FALCON_CLUT_WR  : OUT std_logic_vector(3 DOWNTO 0);
        ST_CLUT_RD      : OUT std_logic;
        ST_CLUT_WR      : OUT std_logic_vector(1 DOWNTO 0);
        CLUT_MUX_ADR    : OUT std_logic_vector(3 DOWNTO 0);
        HSYNC           : OUT std_logic;
        VSYNC           : OUT std_logic;
        nBLANK          : OUT std_logic;
        nSYNC           : OUT std_logic;
        nPD_VGA         : OUT std_logic;
        FIFO_RDE        : OUT std_logic;
        COLOR2          : OUT std_logic;
        color4          : OUT std_logic;
	    PIXEL_CLK       : OUT std_logic;
        CLUT_OFF        : OUT std_logic_vector(3 DOWNTO 0);
        BLITTER_ON      : OUT std_logic;
        VIDEO_RAM_CTR   : OUT std_logic_vector(15 DOWNTO 0);
        VIDEO_MOD_TA    : OUT std_logic;
        BORDER_COLOR    : OUT std_logic_vector(23 DOWNTO 0);
        CCSEL           : OUT std_logic_vector(2 DOWNTO 0);
        ACP_CLUT_WR     : OUT std_logic_vector(3 DOWNTO 0);
        INTER_ZEI       : OUT std_logic;
        DOP_FIFO_CLR    : OUT std_logic;
        VIDEO_RECONFIG  : OUT std_logic;
        VR_WR           : OUT std_logic;
        VR_RD           : OUT std_logic;
        CLR_FIFO        : OUT std_logic;
        FB_AD           : OUT std_logic_vector(31 DOWNTO 0)
   );
END video_mod_mux_clutctr;


ARCHITECTURE rtl OF video_mod_mux_clutctr IS
    --  DIV. CONTROL REGISTER
    --  BRAUCHT EIN WAITSTAT
    --  LÄNGE HSYNC PULS IN PIXEL_CLK
    --  LETZTES PIXEL EINER ZEILE ERREICHT
    --  ATARI RESOLUTION
    --  HORIZONTAL TIMING 640x480
    --  VERTIKAL TIMING 640x480
    --  HORIZONTAL TIMING 320x240
    --  VERTIKAL TIMING 320x240
    --  HORIZONTAL
    --  VERTIKAL
    SIGNAL VR_DOUT                  : std_logic_vector(8 DOWNTO 0);
    SIGNAL VR_DOUT_d                : std_logic_vector(8 DOWNTO 0);
    SIGNAL VR_DOUT_q                : std_logic_vector(8 DOWNTO 0);
    SIGNAL VR_FRQ                   : std_logic_vector(7 DOWNTO 0);
    SIGNAL VR_FRQ_d                 : std_logic_vector(7 DOWNTO 0);
    SIGNAL VR_FRQ_q                 : std_logic_vector(7 DOWNTO 0);
    SIGNAL FB_B                     : std_logic_vector(3 DOWNTO 0);
    SIGNAL FB_16B                   : std_logic_vector(1 DOWNTO 0);
    SIGNAL ST_SHIFT_MODE            : std_logic_vector(1 DOWNTO 0);
    SIGNAL ST_SHIFT_MODE_d          : std_logic_vector(1 DOWNTO 0);
    SIGNAL ST_SHIFT_MODE_q          : std_logic_vector(1 DOWNTO 0);
    SIGNAL FALCON_SHIFT_MODE        : std_logic_vector(10 DOWNTO 0);
    SIGNAL FALCON_SHIFT_MODE_d      : std_logic_vector(10 DOWNTO 0);
    SIGNAL FALCON_SHIFT_MODE_q      : std_logic_vector(10 DOWNTO 0);
    SIGNAL CLUT_MUX_ADR_d           : std_logic_vector(3 DOWNTO 0);
    SIGNAL CLUT_MUX_ADR_q           : std_logic_vector(3 DOWNTO 0);
    SIGNAL CLUT_MUX_AV1             : std_logic_vector(3 DOWNTO 0);
    SIGNAL CLUT_MUX_AV1_d           : std_logic_vector(3 DOWNTO 0);
    SIGNAL CLUT_MUX_AV1_q           : std_logic_vector(3 DOWNTO 0);
    SIGNAL CLUT_MUX_AV0             : std_logic_vector(3 DOWNTO 0);
    SIGNAL CLUT_MUX_AV0_d           : std_logic_vector(3 DOWNTO 0);
    SIGNAL CLUT_MUX_AV0_q           : std_logic_vector(3 DOWNTO 0);
    SIGNAL ACP_VCTR                 : std_logic_vector(31 DOWNTO 0);
    SIGNAL ACP_VCTR_d               : std_logic_vector(31 DOWNTO 0);
    SIGNAL ACP_VCTR_q               : std_logic_vector(31 DOWNTO 0);
    SIGNAL BORDER_COLOR_d           : std_logic_vector(23 DOWNTO 0);
    SIGNAL BORDER_COLOR_q           : std_logic_vector(23 DOWNTO 0);
    SIGNAL SYS_CTR                  : std_logic_vector(6 DOWNTO 0);
    SIGNAL SYS_CTR_d                : std_logic_vector(6 DOWNTO 0);
    SIGNAL SYS_CTR_q                : std_logic_vector(6 DOWNTO 0);
    SIGNAL LOF                      : std_logic_vector(15 DOWNTO 0);
    SIGNAL LOF_d                    : std_logic_vector(15 DOWNTO 0);
    SIGNAL LOF_q                    : std_logic_vector(15 DOWNTO 0);
    SIGNAL LWD                      : std_logic_vector(15 DOWNTO 0);
    SIGNAL LWD_d                    : std_logic_vector(15 DOWNTO 0);
    SIGNAL LWD_q                    : std_logic_vector(15 DOWNTO 0);
    SIGNAL HSYNC_I                  : std_logic_vector(7 DOWNTO 0);
    SIGNAL HSYNC_I_d                : std_logic_vector(7 DOWNTO 0);
    SIGNAL HSYNC_I_q                : std_logic_vector(7 DOWNTO 0);
    SIGNAL HSY_LEN                  : std_logic_vector(7 DOWNTO 0);
    SIGNAL HSY_LEN_d                : std_logic_vector(7 DOWNTO 0);
    SIGNAL HSY_LEN_q                : std_logic_vector(7 DOWNTO 0);
    SIGNAL VSYNC_I                  : std_logic_vector(2 DOWNTO 0);
    SIGNAL VSYNC_I_d                : std_logic_vector(2 DOWNTO 0);
    SIGNAL VSYNC_I_q                : std_logic_vector(2 DOWNTO 0);
    SIGNAL VHCNT                    : std_logic_vector(11 DOWNTO 0);
    SIGNAL VHCNT_d                  : std_logic_vector(11 DOWNTO 0);
    SIGNAL VHCNT_q                  : std_logic_vector(11 DOWNTO 0);
    SIGNAL SUB_PIXEL_CNT            : std_logic_vector(6 DOWNTO 0);
    SIGNAL SUB_PIXEL_CNT_d          : std_logic_vector(6 DOWNTO 0);
    SIGNAL SUB_PIXEL_CNT_q          : std_logic_vector(6 DOWNTO 0);
    SIGNAL VVCNT                    : std_logic_vector(10 DOWNTO 0);
    SIGNAL VVCNT_d                  : std_logic_vector(10 DOWNTO 0);
    SIGNAL VVCNT_q                  : std_logic_vector(10 DOWNTO 0);
    SIGNAL VERZ2                    : std_logic_vector(9 DOWNTO 0);
    SIGNAL VERZ2_d                  : std_logic_vector(9 DOWNTO 0);
    SIGNAL VERZ2_q                  : std_logic_vector(9 DOWNTO 0);
    SIGNAL VERZ1                    : std_logic_vector(9 DOWNTO 0);
    SIGNAL VERZ1_d                  : std_logic_vector(9 DOWNTO 0);
    SIGNAL VERZ1_q                  : std_logic_vector(9 DOWNTO 0);
    SIGNAL VERZ0                    : std_logic_vector(9 DOWNTO 0);
    SIGNAL VERZ0_d                  : std_logic_vector(9 DOWNTO 0);
    SIGNAL VERZ0_q                  : std_logic_vector(9 DOWNTO 0);
    SIGNAL RAND                     : std_logic_vector(6 DOWNTO 0) := (OTHERS => '0');
    SIGNAL RAND_d                   : std_logic_vector(6 DOWNTO 0);
    SIGNAL RAND_q                   : std_logic_vector(6 DOWNTO 0);
    SIGNAL CCSEL_d                  : std_logic_vector(2 DOWNTO 0);
    SIGNAL CCSEL_q                  : std_logic_vector(2 DOWNTO 0);
    SIGNAL ATARI_HH                 : std_logic_vector(31 DOWNTO 0) := (OTHERS => '0');
    SIGNAL ATARI_HH_d               : std_logic_vector(31 DOWNTO 0);
    SIGNAL ATARI_HH_q               : std_logic_vector(31 DOWNTO 0);
    SIGNAL ATARI_VH                 : std_logic_vector(31 DOWNTO 0);
    SIGNAL ATARI_VH_d               : std_logic_vector(31 DOWNTO 0);
    SIGNAL ATARI_VH_q               : std_logic_vector(31 DOWNTO 0);
    SIGNAL ATARI_HL                 : std_logic_vector(31 DOWNTO 0) := (OTHERS => '0');
    SIGNAL ATARI_HL_d               : std_logic_vector(31 DOWNTO 0);
    SIGNAL ATARI_HL_q               : std_logic_vector(31 DOWNTO 0);
    SIGNAL ATARI_VL                 : std_logic_vector(31 DOWNTO 0);
    SIGNAL ATARI_VL_d               : std_logic_vector(31 DOWNTO 0);
    SIGNAL ATARI_VL_q               : std_logic_vector(31 DOWNTO 0);
    SIGNAL RAND_LINKS               : std_logic_vector(11 DOWNTO 0);
    SIGNAL HDIS_START               : std_logic_vector(11 DOWNTO 0);
    SIGNAL HDIS_END                 : std_logic_vector(11 DOWNTO 0);
    SIGNAL RAND_RECHTS              : std_logic_vector(11 DOWNTO 0);
    SIGNAL HS_START                 : std_logic_vector(11 DOWNTO 0);
    SIGNAL H_TOTAL                  : std_logic_vector(11 DOWNTO 0);
    SIGNAL HDIS_LEN                 : std_logic_vector(11 DOWNTO 0);
    SIGNAL MULF                     : std_logic_vector(5 DOWNTO 0);
    SIGNAL HHT                      : std_logic_vector(11 DOWNTO 0) := (OTHERS => '0');
    SIGNAL HHT_d                    : std_logic_vector(11 DOWNTO 0);
    SIGNAL HHT_q                    : std_logic_vector(11 DOWNTO 0);
    SIGNAL HBE                      : std_logic_vector(11 DOWNTO 0) := (OTHERS => '0');
    SIGNAL HBE_d                    : std_logic_vector(11 DOWNTO 0);
    SIGNAL HBE_q                    : std_logic_vector(11 DOWNTO 0);
    SIGNAL HDB                      : std_logic_vector(11 DOWNTO 0);
    SIGNAL HDB_d                    : std_logic_vector(11 DOWNTO 0);
    SIGNAL HDB_q                    : std_logic_vector(11 DOWNTO 0);
    SIGNAL HDE                      : std_logic_vector(11 DOWNTO 0);
    SIGNAL HDE_d                    : std_logic_vector(11 DOWNTO 0);
    SIGNAL HDE_q                    : std_logic_vector(11 DOWNTO 0);
    SIGNAL HBB                      : std_logic_vector(11 DOWNTO 0);
    SIGNAL HBB_d                    : std_logic_vector(11 DOWNTO 0);
    SIGNAL HBB_q                    : std_logic_vector(11 DOWNTO 0);
    SIGNAL HSS                      : std_logic_vector(11 DOWNTO 0) := (OTHERS => '0');
    SIGNAL HSS_d                    : std_logic_vector(11 DOWNTO 0);
    SIGNAL HSS_q                    : std_logic_vector(11 DOWNTO 0);
    SIGNAL RAND_OBEN                : std_logic_vector(10 DOWNTO 0);
    SIGNAL VDIS_START               : std_logic_vector(10 DOWNTO 0);
    SIGNAL VDIS_END                 : std_logic_vector(10 DOWNTO 0);
    SIGNAL RAND_UNTEN               : std_logic_vector(10 DOWNTO 0);
    SIGNAL VS_START                 : std_logic_vector(10 DOWNTO 0);
    SIGNAL V_TOTAL                  : std_logic_vector(10 DOWNTO 0);
    SIGNAL VBE                      : std_logic_vector(10 DOWNTO 0);
    SIGNAL VBE_d                    : std_logic_vector(10 DOWNTO 0);
    SIGNAL VBE_q                    : std_logic_vector(10 DOWNTO 0);
    SIGNAL VDB                      : std_logic_vector(10 DOWNTO 0);
    SIGNAL VDB_d                    : std_logic_vector(10 DOWNTO 0);
    SIGNAL VDB_q                    : std_logic_vector(10 DOWNTO 0);
    SIGNAL VDE                      : std_logic_vector(10 DOWNTO 0);
    SIGNAL VDE_d                    : std_logic_vector(10 DOWNTO 0);
    SIGNAL VDE_q                    : std_logic_vector(10 DOWNTO 0);
    SIGNAL VBB                      : std_logic_vector(10 DOWNTO 0);
    SIGNAL VBB_d                    : std_logic_vector(10 DOWNTO 0);
    SIGNAL VBB_q                    : std_logic_vector(10 DOWNTO 0);
    SIGNAL VSS                      : std_logic_vector(10 DOWNTO 0);
    SIGNAL VSS_d                    : std_logic_vector(10 DOWNTO 0);
    SIGNAL VSS_q                    : std_logic_vector(10 DOWNTO 0);
    SIGNAL VFT                      : std_logic_vector(10 DOWNTO 0);
    SIGNAL VFT_d                    : std_logic_vector(10 DOWNTO 0);
    SIGNAL VFT_q                    : std_logic_vector(10 DOWNTO 0);
    SIGNAL VCO                      : std_logic_vector(8 DOWNTO 0);
    SIGNAL VCO_d                    : std_logic_vector(8 DOWNTO 0);
    SIGNAL VCO_ena                  : std_logic_vector(8 DOWNTO 0);
    SIGNAL VCO_q                    : std_logic_vector(8 DOWNTO 0);
    SIGNAL VCNTRL                   : std_logic_vector(3 DOWNTO 0) := (OTHERS => '0');
    SIGNAL VCNTRL_d                 : std_logic_vector(3 DOWNTO 0);
    SIGNAL VCNTRL_q                 : std_logic_vector(3 DOWNTO 0);
    SIGNAL u0_data                  : std_logic_vector(15 DOWNTO 0);
    SIGNAL u0_tridata               : std_logic_vector(15 DOWNTO 0);
    SIGNAL u1_data                  : std_logic_vector(15 DOWNTO 0);
    SIGNAL u1_tridata               : std_logic_vector(15 DOWNTO 0);
    -- SIGNAL ST_SHIFT_MODE0_clk_ctrl  : std_logic;
    SIGNAL ST_SHIFT_MODE0_ena_ctrl  : std_logic;
 	-- SIGNAL FALCON_SHIFT_MODE0_clk_ctrl  : std_logic;
    SIGNAL FALCON_SHIFT_MODE8_ena_ctrl  : std_logic;
	SIGNAL FALCON_SHIFT_MODE0_ena_ctrl  : std_logic;
    
    SIGNAL ACP_VCTR24_ena_ctrl      : std_logic;
	SIGNAL ACP_VCTR16_ena_ctrl      : std_logic;
    SIGNAL ACP_VCTR8_ena_ctrl       : std_logic;
	SIGNAL ACP_VCTR6_ena_ctrl       : std_logic;
    SIGNAL ACP_VCTR0_ena_ctrl       : std_logic;
	
    SIGNAL ATARI_HH24_ena_ctrl      : std_logic;
    SIGNAL ATARI_HH16_ena_ctrl      : std_logic;
	SIGNAL ATARI_HH8_ena_ctrl       : std_logic;
    SIGNAL ATARI_HH0_ena_ctrl       : std_logic;
	SIGNAL ATARI_VH24_ena_ctrl      : std_logic;
    SIGNAL ATARI_VH16_ena_ctrl      : std_logic;
    SIGNAL ATARI_VH8_ena_ctrl       : std_logic;
    SIGNAL ATARI_VH0_ena_ctrl       : std_logic;
    SIGNAL ATARI_HL24_ena_ctrl      : std_logic;
	SIGNAL ATARI_HL16_ena_ctrl      : std_logic;
    SIGNAL ATARI_HL8_ena_ctrl       : std_logic;
    SIGNAL ATARI_HL0_ena_ctrl       : std_logic;
	SIGNAL ATARI_VL0_clk_ctrl       : std_logic;
    SIGNAL ATARI_VL24_ena_ctrl      : std_logic;
    SIGNAL ATARI_VL16_ena_ctrl      : std_logic;
	SIGNAL ATARI_VL8_ena_ctrl       : std_logic;
    SIGNAL ATARI_VL0_ena_ctrl       : std_logic;
	SIGNAL VR_DOUT0_ena_ctrl        : std_logic;
    SIGNAL VR_FRQ0_ena_ctrl         : std_logic;
	SIGNAL BORDER_COLOR16_ena_ctrl  : std_logic;
    SIGNAL BORDER_COLOR8_ena_ctrl   : std_logic;
	SIGNAL BORDER_COLOR0_ena_ctrl   : std_logic;
    SIGNAL SYS_CTR0_ena_ctrl        : std_logic;
	SIGNAL LOF8_ena_ctrl            : std_logic;
    SIGNAL LOF0_ena_ctrl            : std_logic;
    SIGNAL LWD8_ena_ctrl            : std_logic;
    SIGNAL LWD0_ena_ctrl            : std_logic;
    SIGNAL HHT8_ena_ctrl            : std_logic;
	SIGNAL HHT0_ena_ctrl            : std_logic;
    SIGNAL HBE8_ena_ctrl            : std_logic;
    SIGNAL HBE0_ena_ctrl            : std_logic;
	SIGNAL HDB8_ena_ctrl            : std_logic;
    SIGNAL HDB0_ena_ctrl            : std_logic;
	SIGNAL HDE8_ena_ctrl            : std_logic;
    SIGNAL HDE0_ena_ctrl            : std_logic;
    SIGNAL HBB8_ena_ctrl            : std_logic;
	SIGNAL HBB0_ena_ctrl            : std_logic;
    SIGNAL HSS0_clk_ctrl            : std_logic;
    SIGNAL HSS8_ena_ctrl            : std_logic;
    SIGNAL HSS0_ena_ctrl            : std_logic;
	SIGNAL VBE8_ena_ctrl            : std_logic;
    SIGNAL VBE0_ena_ctrl            : std_logic;
    SIGNAL VDB8_ena_ctrl            : std_logic;
    SIGNAL VDB0_ena_ctrl            : std_logic;
    SIGNAL VDE8_ena_ctrl            : std_logic;
	SIGNAL VDE0_ena_ctrl            : std_logic;
    SIGNAL VBB8_ena_ctrl            : std_logic;
    SIGNAL VBB0_ena_ctrl            : std_logic;
	SIGNAL VSS8_ena_ctrl            : std_logic;
    SIGNAL VSS0_ena_ctrl            : std_logic;
	SIGNAL VFT8_ena_ctrl            : std_logic;
    SIGNAL VFT0_ena_ctrl            : std_logic;
    SIGNAL VCO0_ena_ctrl            : std_logic;
	SIGNAL VCNTRL0_ena_ctrl         : std_logic;
    SIGNAL VVCNT0_ena_ctrl          : std_logic;
    SIGNAL VSYNC_I0_ena_ctrl        : std_logic;
    SIGNAL SUB_PIXEL_CNT0_ena_ctrl  : std_logic;
	SIGNAL COLOR8_2                 : std_logic;
    SIGNAL COLOR8_1                 : std_logic;
    SIGNAL COLOR1_3                 : std_logic;
    SIGNAL COLOR1_2                 : std_logic;
	SIGNAL COLOR1_1                 : std_logic;
    SIGNAL COLOR4_2                 : std_logic;
    SIGNAL COLOR4_1                 : std_logic;
    SIGNAL COLOR16_2                : std_logic;
    SIGNAL COLOR16_1                : std_logic;
    SIGNAL gnd                      : std_logic;
    SIGNAL u1_enabledt              : std_logic;
	SIGNAL u0_enabledt              : std_logic;
    SIGNAL VCNTRL_CS                : std_logic;
    SIGNAL VCO_CS                   : std_logic;
    SIGNAL VFT_CS                   : std_logic;
    SIGNAL VSS_CS                   : std_logic;
    SIGNAL VBB_CS                   : std_logic;
    SIGNAL VDE_CS                   : std_logic;
	SIGNAL VDB_CS                   : std_logic;
    SIGNAL VBE_CS                   : std_logic;
    SIGNAL DOP_FIFO_CLR_q           : std_logic;
    SIGNAL DOP_FIFO_CLR_d           : std_logic;
	SIGNAL DOP_ZEI_q                : std_logic;
    SIGNAL DOP_ZEI_d                : std_logic;
    SIGNAL DOP_ZEI                  : std_logic;
    SIGNAL INTER_ZEI_q              : std_logic;
	SIGNAL INTER_ZEI_d              : std_logic;
    SIGNAL ST_VIDEO                 : std_logic;
    SIGNAL FALCON_VIDEO             : std_logic;
    SIGNAL HSS_CS                   : std_logic;
    SIGNAL HBB_CS                   : std_logic;
	SIGNAL HDE_CS                   : std_logic;
    SIGNAL HDB_CS                   : std_logic;
    SIGNAL HBE_CS                   : std_logic;
    SIGNAL HHT_CS                   : std_logic;
    SIGNAL ATARI_VL_CS              : std_logic;
    SIGNAL ATARI_HL_CS              : std_logic;
    SIGNAL ATARI_VH_CS              : std_logic;
    SIGNAL ATARI_HH_CS              : std_logic;
    SIGNAL ATARI_SYNC               : std_logic;
    SIGNAL COLOR24                  : std_logic;
    SIGNAL COLOR16                  : std_logic;
    SIGNAL SYNC_PIX2_q              : std_logic;
    SIGNAL SYNC_PIX2_d              : std_logic;
    SIGNAL SYNC_PIX2                : std_logic;
    SIGNAL SYNC_PIX1_q              : std_logic;
    SIGNAL SYNC_PIX1_d              : std_logic;
	SIGNAL SYNC_PIX1                : std_logic;
    SIGNAL SYNC_PIX_q               : std_logic;
    SIGNAL SYNC_PIX_d               : std_logic;
    SIGNAL SYNC_PIX                 : std_logic;
	SIGNAL START_ZEILE_q            : std_logic;
    SIGNAL START_ZEILE_ena          : std_logic;
    SIGNAL START_ZEILE_d            : std_logic;
	SIGNAL START_ZEILE              : std_logic;
    SIGNAL CLR_FIFO_q               : std_logic;
    SIGNAL CLR_FIFO_ena             : std_logic;
    SIGNAL CLR_FIFO_d               : std_logic;
	SIGNAL FIFO_RDE_q               : std_logic;
    SIGNAL FIFO_RDE_d               : std_logic;
    SIGNAL RAND_ON                  : std_logic;
    SIGNAL VCO_OFF_q                : std_logic;
    SIGNAL VCO_OFF_d                : std_logic;
    SIGNAL VCO_OFF                  : std_logic;
    SIGNAL VCO_ON_q                 : std_logic;
    SIGNAL VCO_ON_d                 : std_logic;
    SIGNAL VCO_ON                   : std_logic;
    SIGNAL VCO_ZL_q                 : std_logic;
	SIGNAL VCO_ZL_ena               : std_logic;
    SIGNAL VCO_ZL_d                 : std_logic;
    SIGNAL VCO_ZL                   : std_logic;
    SIGNAL VDTRON_q                 : std_logic;
    SIGNAL VDTRON_d                 : std_logic;
    SIGNAL VDTRON                   : std_logic;
    SIGNAL DPO_OFF_q                : std_logic;
    SIGNAL DPO_OFF_d                : std_logic;
    SIGNAL DPO_OFF                  : std_logic;
	SIGNAL DPO_ON_q                 : std_logic;
    SIGNAL DPO_ON_d                 : std_logic;
    SIGNAL DPO_ON                   : std_logic;
    SIGNAL DPO_ZL_q                 : std_logic;
    SIGNAL DPO_ZL_ena               : std_logic;
	SIGNAL DPO_ZL_d                 : std_logic;
    SIGNAL DPO_ZL                   : std_logic;
    SIGNAL DISP_ON_q                : std_logic;
    SIGNAL DISP_ON_d                : std_logic;
	SIGNAL DISP_ON                  : std_logic;
    SIGNAL nBLANK_q                 : std_logic;
    SIGNAL nBLANK_d                 : std_logic;
    SIGNAL VSYNC_START_q            : std_logic;
    SIGNAL VSYNC_START_ena          : std_logic;
    SIGNAL VSYNC_START_d            : std_logic;
    SIGNAL VSYNC_START              : std_logic;
    SIGNAL VSYNC_q                  : std_logic;
    SIGNAL VSYNC_d                  : std_logic;
    SIGNAL LAST_q                   : std_logic;
    SIGNAL LAST_d                   : std_logic;
    SIGNAL LAST                     : std_logic;
    SIGNAL HSYNC_START_q            : std_logic;
	SIGNAL HSYNC_START_d            : std_logic;
    SIGNAL HSYNC_START              : std_logic;
    SIGNAL HSYNC_q                  : std_logic;
    SIGNAL HSYNC_d                  : std_logic;
    SIGNAL CLUT_TA_q                : std_logic;
    SIGNAL CLUT_TA_d                : std_logic;
    SIGNAL CLUT_TA                  : std_logic;
    SIGNAL LWD_CS                   : std_logic;
    SIGNAL LOF_CS                   : std_logic;
	SIGNAL SYS_CTR_CS               : std_logic;
    SIGNAL ACP_VIDEO_ON             : std_logic;
    SIGNAL BORDER_COLOR_CS          : std_logic;
    SIGNAL ACP_VCTR_CS              : std_logic;
	SIGNAL FALCON_SHIFT_MODE_CS     : std_logic;
    SIGNAL ST_SHIFT_MODE_CS         : std_logic;
    SIGNAL ST_CLUT                  : std_logic;
    SIGNAL ST_CLUT_CS               : std_logic;
	SIGNAL FALCON_CLUT              : std_logic;
    SIGNAL FALCON_CLUT_CS           : std_logic;
    SIGNAL VIDEO_RECONFIG_q         : std_logic;
    SIGNAL VIDEO_RECONFIG_d         : std_logic;
    SIGNAL VIDEO_PLL_RECONFIG_CS    : std_logic;
    SIGNAL VR_WR_q                  : std_logic;
    SIGNAL VR_WR_d                  : std_logic;
	SIGNAL VIDEO_PLL_CONFIG_CS      : std_logic;
    SIGNAL ACP_CLUT                 : std_logic;
    SIGNAL ACP_CLUT_CS              : std_logic;
    SIGNAL CLK13M_q                 : std_logic;
    SIGNAL CLK13M_d                 : std_logic;
    SIGNAL CLK13M                   : std_logic;
    SIGNAL CLK17M_q                 : std_logic;
    SIGNAL CLK17M_d                 : std_logic;
    SIGNAL CLK17M                   : std_logic;
    SIGNAL color4_i                 : std_logic;
    SIGNAL pixel_clk_i              : std_logic;
	 SIGNAL calc_freq						: unsigned(7 DOWNTO 0);
     
    -- Sub Module Interface Section


    COMPONENT lpm_bustri_WORD
        PORT
        (
            data        : IN std_logic_vector(15 DOWNTO 0);
            enabledt    : IN std_logic;
            tridata     : BUFFER std_logic_vector(15 DOWNTO 0)
        );
    END COMPONENT lpm_bustri_WORD;

    FUNCTION to_std_logic(X : IN boolean) RETURN std_logic IS
        VARIABLE ret : std_logic;
    BEGIN
        IF x THEN
            ret := '1';
        ELSE
            ret := '0';
        END IF;
        RETURN ret;
    END FUNCTION to_std_logic;


    -- sizeIt replicates a value to an array of specific length.
    FUNCTION sizeit(a : std_Logic; len : integer) RETURN std_logic_vector IS
        VARIABLE rep: std_logic_vector(len - 1 DOWNTO 0);
    BEGIN
        FOR i IN rep'RANGE LOOP
            rep(i) := a;
        END LOOP;
        RETURN rep;
    END FUNCTION sizeit;

BEGIN

    -- Sub Module Section
    u0 : lpm_bustri_WORD
        PORT MAP
        (
            data => u0_data,
            enabledt => u0_enabledt,
            tridata => u0_tridata
        );
        
    u1 : lpm_bustri_WORD
        PORT MAP
        (
            data => u1_data,
            enabledt => u1_enabledt,
            tridata => u1_tridata
        );

    -- Register Section

    CLUT_MUX_ADR <= CLUT_MUX_ADR_q;
    
    PROCESS (pixel_clk_i)
    BEGIN
        IF rising_edge(pixel_clk_i) THEN
            CLUT_MUX_ADR_q <= CLUT_MUX_ADR_d;
        END IF;
    END PROCESS;

    HSYNC <= HSYNC_q;
    PROCESS (pixel_clk_i)
    BEGIN
        IF rising_edge(pixel_clk_i) THEN
            HSYNC_q <= HSYNC_d;
        END IF;
    END PROCESS;

    VSYNC <= VSYNC_q;
    PROCESS (pixel_clk_i)
    BEGIN
        IF rising_edge(pixel_clk_i) THEN
            VSYNC_q <= VSYNC_d;
        END IF;
    END PROCESS;

    nBLANK <= nBLANK_q;
    PROCESS (pixel_clk_i)
    BEGIN
        IF rising_edge(pixel_clk_i) THEN
            nBLANK_q <= nBLANK_d;
        END IF;
    END PROCESS;

    FIFO_RDE <= FIFO_RDE_q;
    PROCESS (pixel_clk_i)
    BEGIN
        IF rising_edge(pixel_clk_i) THEN
            FIFO_RDE_q <= FIFO_RDE_d;
        END IF;
    END PROCESS;
    
    BORDER_COLOR(23 DOWNTO 16) <= BORDER_COLOR_q(23 DOWNTO 16);
    BORDER_COLOR(15 DOWNTO 8) <= BORDER_COLOR_q(15 DOWNTO 8);
    BORDER_COLOR(7 DOWNTO 0) <= BORDER_COLOR_q(7 DOWNTO 0);
    
    PROCESS (main_clk)
    BEGIN
        IF rising_edge(main_clk) THEN
            IF BORDER_COLOR16_ena_ctrl = '1' THEN
                border_color_q(23 DOWNTO 16) <= border_color_d(23 DOWNTO 16);
            END IF;
            IF BORDER_COLOR8_ena_ctrl = '1' THEN
                border_color_q(15 DOWNTO 8) <= border_color_d(15 DOWNTO 8);
            END IF;
            IF BORDER_COLOR0_ena_ctrl = '1' THEN
                border_color_q(7 DOWNTO 0) <= border_color_d(7 DOWNTO 0);
            END IF;
        END IF;
    END PROCESS;

    CCSEL <= CCSEL_q;
    PROCESS (pixel_clk_i)
    BEGIN
        IF rising_edge(pixel_clk_i) THEN
            CCSEL_q <= CCSEL_d;
        END IF;
    END PROCESS;

    INTER_ZEI <= INTER_ZEI_q;
    PROCESS (main_clk)
    BEGIN
        IF rising_edge(main_clk) THEN
            INTER_ZEI_q <= INTER_ZEI_d;
        END IF;
    END PROCESS;

    DOP_FIFO_CLR <= DOP_FIFO_CLR_q;
    PROCESS (pixel_clk_i)
    BEGIN
        IF rising_edge(pixel_clk_i) THEN
            DOP_FIFO_CLR_q <= DOP_FIFO_CLR_d;
        END IF;
    END PROCESS;

    VIDEO_RECONFIG <= VIDEO_RECONFIG_q;
    PROCESS (main_clk)
    BEGIN
        IF rising_edge(main_clk) THEN
            VIDEO_RECONFIG_q <= VIDEO_RECONFIG_d;
        END IF;
    END PROCESS;

    VR_WR <= VR_WR_q;
    PROCESS (main_clk)
    BEGIN
        IF rising_edge(main_clk) THEN
            VR_WR_q <= VR_WR_d;
        END IF;
    END PROCESS;

    CLR_FIFO <= CLR_FIFO_q;
    PROCESS (pixel_clk_i)
    BEGIN
        IF rising_edge(pixel_clk_i) THEN
            IF CLR_FIFO_ena = '1' THEN
                CLR_FIFO_q <= CLR_FIFO_d;
            END IF;
        END IF;
    END PROCESS;

    PROCESS (main_clk)
    BEGIN
        IF rising_edge(main_clk) THEN
            CLK17M_q <= CLK17M_d;
        END IF;
    END PROCESS;

    PROCESS (clk25m)
    BEGIN
        IF rising_edge(clk25m) THEN
            CLK13M_q <= CLK13M_d;
        END IF;
    END PROCESS;

    PROCESS (main_clk)
    BEGIN
        IF rising_edge(main_clk) THEN
            IF VR_DOUT0_ena_ctrl = '1' THEN
                VR_DOUT_q <= VR_DOUT_d;
            END IF;
        END IF;
    END PROCESS;

    PROCESS (main_clk)
    BEGIN
        IF rising_edge(main_clk) THEN
            IF VR_FRQ0_ena_ctrl = '1' THEN
                VR_FRQ_q <= VR_FRQ_d;
            END IF;
        END IF;
    END PROCESS;

    PROCESS (main_clk)
    BEGIN
        IF rising_edge(main_clk) THEN
            IF ST_SHIFT_MODE0_ena_ctrl = '1' THEN
                ST_SHIFT_MODE_q <= ST_SHIFT_MODE_d;
            END IF;
        END IF;
    END PROCESS;

    PROCESS (main_clk)
    BEGIN
        IF rising_edge(main_clk) THEN
            IF FALCON_SHIFT_MODE8_ena_ctrl = '1' THEN
                falcon_shift_mode_q(10 DOWNTO 8) <= falcon_shift_mode_d(10 DOWNTO 8);
            END IF;
            IF FALCON_SHIFT_MODE0_ena_ctrl = '1' THEN
                falcon_shift_mode_q(7 DOWNTO 0) <= falcon_shift_mode_d(7 DOWNTO 0);
            END IF;
        END IF;
    END PROCESS;

    PROCESS (pixel_clk_i)
    BEGIN
        IF rising_edge(pixel_clk_i) THEN
            CLUT_MUX_AV1_q <= CLUT_MUX_AV1_d;
        END IF;
    END PROCESS;

    PROCESS (pixel_clk_i)
    BEGIN
        IF rising_edge(pixel_clk_i) THEN
            CLUT_MUX_AV0_q <= CLUT_MUX_AV0_d;
        END IF;
    END PROCESS;

    PROCESS (main_clk)
    BEGIN
        IF rising_edge(main_clk) THEN
            IF ACP_VCTR24_ena_ctrl = '1' THEN
                ACP_VCTR_q(31 DOWNTO 24) <= ACP_VCTR_d(31 DOWNTO 24);
            END IF;
            IF ACP_VCTR16_ena_ctrl = '1' THEN
                ACP_VCTR_q(23 DOWNTO 16) <= ACP_VCTR_d(23 DOWNTO 16);
            END IF;
            IF ACP_VCTR8_ena_ctrl = '1' THEN
                ACP_VCTR_q(15 DOWNTO 8) <= ACP_VCTR_d(15 DOWNTO 8);
            END IF;
            IF ACP_VCTR6_ena_ctrl = '1' THEN
                ACP_VCTR_q(7 DOWNTO 6) <= ACP_VCTR_d(7 DOWNTO 6);
            END IF;
            IF ACP_VCTR0_ena_ctrl = '1' THEN
                ACP_VCTR_q(5 DOWNTO 0) <= ACP_VCTR_d(5 DOWNTO 0);
            END IF;
    
            IF SYS_CTR0_ena_ctrl='1' THEN
                SYS_CTR_q <= SYS_CTR_d;
            END IF;

            IF LOF8_ena_ctrl = '1' THEN
                LOF_q(15 DOWNTO 8) <= LOF_d(15 DOWNTO 8);
            END IF;
 
            IF LOF0_ena_ctrl = '1' THEN
                LOF_q(7 DOWNTO 0) <= LOF_d(7 DOWNTO 0);
            END IF;

            IF LWD8_ena_ctrl = '1' THEN
                LWD_q(15 DOWNTO 8) <= LWD_d(15 DOWNTO 8);
            END IF;

            IF LWD0_ena_ctrl = '1' THEN
                LWD_q(7 DOWNTO 0) <= LWD_d(7 DOWNTO 0);
            END IF;
        END IF;
    END PROCESS;

    PROCESS (pixel_clk_i)
    BEGIN
        IF rising_edge(pixel_clk_i) THEN
            CLUT_TA_q <= CLUT_TA_d;
        END IF;
    END PROCESS;

    PROCESS (pixel_clk_i)
    BEGIN
        IF rising_edge(pixel_clk_i) THEN
            HSYNC_I_q <= HSYNC_I_d;
        END IF;
    END PROCESS;

    PROCESS (pixel_clk_i)
    BEGIN
        IF rising_edge(pixel_clk_i) THEN
            HSY_LEN_q <= HSY_LEN_d;
        END IF;
    END PROCESS;

    PROCESS (pixel_clk_i)
    BEGIN
        IF rising_edge(pixel_clk_i) THEN
            HSYNC_START_q <= HSYNC_START_d;
            
            LAST_q <= LAST_d;
            
            IF VSYNC_START_ena = '1' THEN
                VSYNC_START_q <= VSYNC_START_d;
            END IF;
            
            IF VSYNC_I0_ena_ctrl='1' THEN
                VSYNC_I_q <= VSYNC_I_d;
            END IF;
            
            DISP_ON_q <= DISP_ON_d;
            
            IF DPO_ZL_ena = '1' THEN
                DPO_ZL_q <= DPO_ZL_d;
            END IF;
            
            DPO_ON_q <= DPO_ON_d;
            DPO_OFF_q <= DPO_OFF_d;
            VDTRON_q <= VDTRON_d;
            
            IF VCO_ZL_ena = '1' THEN
                VCO_ZL_q <= VCO_ZL_d;
            END IF;
            
            VCO_ON_q <= VCO_ON_d;
            VCO_OFF_q <= VCO_OFF_d;
            VHCNT_q <= VHCNT_d;
        
            IF SUB_PIXEL_CNT0_ena_ctrl = '1' THEN
                SUB_PIXEL_CNT_q <= SUB_PIXEL_CNT_d;
            END IF;
            
            IF VVCNT0_ena_ctrl='1' THEN
                VVCNT_q <= VVCNT_d;
            END IF;
            
            VERZ2_q <= VERZ2_d;
            VERZ1_q <= VERZ1_d;
            VERZ0_q <= VERZ0_d;
            RAND_q <= RAND_d;
            
            IF START_ZEILE_ena = '1' THEN
                START_ZEILE_q <= START_ZEILE_d;
            END IF;
            
            SYNC_PIX_q <= SYNC_PIX_d;
            SYNC_PIX1_q <= SYNC_PIX1_d;
            SYNC_PIX2_q <= SYNC_PIX2_d;

            IF ATARI_HH24_ena_ctrl = '1' THEN
                ATARI_HH_q(31 DOWNTO 24) <= ATARI_HH_d(31 DOWNTO 24);
            END IF;
            
            IF ATARI_HH16_ena_ctrl = '1' THEN
                ATARI_HH_q(23 DOWNTO 16) <= ATARI_HH_d(23 DOWNTO 16);
            END IF;
            
            IF ATARI_HH8_ena_ctrl = '1' THEN
                ATARI_HH_q(15 DOWNTO 8) <= ATARI_HH_d(15 DOWNTO 8);
            END IF;
            
            IF ATARI_HH0_ena_ctrl = '1' THEN
                ATARI_HH_q(7 DOWNTO 0) <= ATARI_HH_d(7 DOWNTO 0);
            END IF;
            
            IF ATARI_VH24_ena_ctrl = '1' THEN
                ATARI_VH_q(31 DOWNTO 24) <= ATARI_VH_d(31 DOWNTO 24);
            END IF;
            
            IF ATARI_VH16_ena_ctrl = '1' THEN
                ATARI_VH_q(23 DOWNTO 16) <= ATARI_VH_d(23 DOWNTO 16);
            END IF;
            
            IF ATARI_VH8_ena_ctrl = '1' THEN
                ATARI_VH_q(15 DOWNTO 8) <= ATARI_VH_d(15 DOWNTO 8);
            END IF;
            
            IF ATARI_VH0_ena_ctrl='1' THEN
                ATARI_VH_q(7 DOWNTO 0) <= ATARI_VH_d(7 DOWNTO 0);
            END IF;
            
            IF ATARI_HL24_ena_ctrl = '1' THEN
                ATARI_HL_q(31 DOWNTO 24) <= ATARI_HL_d(31 DOWNTO 24);
            END IF;
            
            IF ATARI_HL16_ena_ctrl = '1' THEN
                ATARI_HL_q(23 DOWNTO 16) <= ATARI_HL_d(23 DOWNTO 16);
            END IF;
            
            IF ATARI_HL8_ena_ctrl = '1' THEN
                ATARI_HL_q(15 DOWNTO 8) <= ATARI_HL_d(15 DOWNTO 8);
            END IF;
            
            IF ATARI_HL0_ena_ctrl = '1' THEN
                ATARI_HL_q(7 DOWNTO 0) <= ATARI_HL_d(7 DOWNTO 0);
            END IF;
            
            IF ATARI_VL24_ena_ctrl = '1' THEN
                ATARI_VL_q(31 DOWNTO 24) <= ATARI_VL_d(31 DOWNTO 24);
            END IF;
            
            IF ATARI_VL16_ena_ctrl = '1' THEN
                ATARI_VL_q(23 DOWNTO 16) <= ATARI_VL_d(23 DOWNTO 16);
            END IF;
            
            IF ATARI_VL8_ena_ctrl = '1' THEN
                ATARI_VL_q(15 DOWNTO 8) <= ATARI_VL_d(15 DOWNTO 8);
            END IF;
            
            IF ATARI_VL0_ena_ctrl = '1' THEN
                ATARI_VL_q(7 DOWNTO 0) <= ATARI_VL_d(7 DOWNTO 0);
            END IF;
            
            IF HHT8_ena_ctrl = '1' THEN
                HHT_q(11 DOWNTO 8) <= HHT_d(11 DOWNTO 8);
            END IF;
            
            IF HHT0_ena_ctrl = '1' THEN
                HHT_q(7 DOWNTO 0) <= HHT_d(7 DOWNTO 0);
            END IF;
            
            IF HBE8_ena_ctrl = '1' THEN
                HBE_q(11 DOWNTO 8) <= HBE_d(11 DOWNTO 8);
            END IF;
            
            IF HBE0_ena_ctrl = '1' THEN
                HBE_q(7 DOWNTO 0) <= HBE_d(7 DOWNTO 0);
            END IF;
        END IF;
    END PROCESS;

    PROCESS (main_clk)
    BEGIN
        IF rising_edge(main_clk) THEN
            IF HDB8_ena_ctrl = '1' THEN
                HDB_q(11 DOWNTO 8) <= HDB_d(11 DOWNTO 8);
            END IF;
            IF HDB0_ena_ctrl = '1' THEN
                HDB_q(7 DOWNTO 0) <= HDB_d(7 DOWNTO 0);
            END IF;
        END IF;
    END PROCESS;

    PROCESS (main_clk)
    BEGIN
        IF rising_edge(main_clk) THEN
            IF HDE8_ena_ctrl = '1' THEN
                HDE_q(11 DOWNTO 8) <= HDE_d(11 DOWNTO 8);
            END IF;
        END IF;
    END PROCESS;

    PROCESS (main_clk)
    BEGIN
        IF rising_edge(main_clk) THEN
            IF HDE0_ena_ctrl = '1' THEN
                HDE_q(7 DOWNTO 0) <= HDE_d(7 DOWNTO 0);
            END IF;
        END IF;
    END PROCESS;

    PROCESS (main_clk)
    BEGIN
        IF rising_edge(main_clk) THEN
            IF HBB8_ena_ctrl = '1' THEN
                HBB_q(11 DOWNTO 8) <= HBB_d(11 DOWNTO 8);
            END IF;
        END IF;
    END PROCESS;

    PROCESS (main_clk)
    BEGIN
        IF rising_edge(main_clk) THEN
            IF HBB0_ena_ctrl = '1' THEN
                HBB_q(7 DOWNTO 0) <= HBB_d(7 DOWNTO 0);
            END IF;
        END IF;
    END PROCESS;

    PROCESS (main_clk)
    BEGIN
        IF rising_edge(main_clk) THEN
            IF HSS8_ena_ctrl = '1' THEN
                HSS_q(11 DOWNTO 8) <= HSS_d(11 DOWNTO 8);
            END IF;
        END IF;
    END PROCESS;

    PROCESS (main_clk)
    BEGIN
        IF rising_edge(main_clk) THEN
            IF HSS0_ena_ctrl='1' THEN
                HSS_q(7 DOWNTO 0) <= HSS_d(7 DOWNTO 0);
            END IF;
        END IF;
    END PROCESS;

    PROCESS (main_clk)
    BEGIN
        IF rising_edge(main_clk) THEN
            DOP_ZEI_q <= DOP_ZEI_d;
        END IF;
    END PROCESS;

    PROCESS (main_clk)
    BEGIN
        IF rising_edge(main_clk) THEN
            IF VBE8_ena_ctrl = '1' THEN
                VBE_q(10 DOWNTO 8) <= VBE_d(10 DOWNTO 8);
            END IF;
        END IF;
    END PROCESS;

    PROCESS (main_clk)
    BEGIN
        IF rising_edge(main_clk) THEN
            IF VBE0_ena_ctrl = '1' THEN
                VBE_q(7 DOWNTO 0) <= VBE_d(7 DOWNTO 0);
            END IF;
        END IF;
    END PROCESS;

    PROCESS (main_clk)
    BEGIN
        IF rising_edge(main_clk) THEN
            IF VDB8_ena_ctrl = '1' THEN
                VDB_q(10 DOWNTO 8) <= VDB_d(10 DOWNTO 8);
            END IF;
        END IF;
    END PROCESS;

    PROCESS (main_clk)
    BEGIN
        IF rising_edge(main_clk) THEN
            IF VDB0_ena_ctrl = '1' THEN
                VDB_q(7 DOWNTO 0) <= VDB_d(7 DOWNTO 0);
            END IF;
        END IF;
    END PROCESS;

    PROCESS (main_clk)
    BEGIN
        IF rising_edge(main_clk) THEN
            IF VDE8_ena_ctrl = '1' THEN
                VDE_q(10 DOWNTO 8) <= VDE_d(10 DOWNTO 8);
            END IF;
        END IF;
    END PROCESS;

    PROCESS (main_clk)
    BEGIN
        IF rising_edge(main_clk) THEN
            IF VDE0_ena_ctrl = '1' THEN
                VDE_q(7 DOWNTO 0) <= VDE_d(7 DOWNTO 0);
            END IF;
        END IF;
    END PROCESS;

    PROCESS (main_clk)
    BEGIN
        IF rising_edge(main_clk) THEN
            IF VBB8_ena_ctrl = '1' THEN
                VBB_q(10 DOWNTO 8) <= VBB_d(10 DOWNTO 8);
            END IF;
        END IF;
    END PROCESS;

    PROCESS (main_clk)
    BEGIN
        IF rising_edge(main_clk) THEN
            IF VBB0_ena_ctrl = '1' THEN
                VBB_q(7 DOWNTO 0) <= VBB_d(7 DOWNTO 0);
            END IF;
        END IF;
    END PROCESS;

    PROCESS (main_clk)
    BEGIN
        IF rising_edge(main_clk) THEN
            IF VSS8_ena_ctrl = '1' THEN
                VSS_q(10 DOWNTO 8) <= VSS_d(10 DOWNTO 8);
            END IF;
        END IF;
    END PROCESS;

    PROCESS (main_clk)
    BEGIN
        IF rising_edge(main_clk) THEN
            IF VSS0_ena_ctrl = '1' THEN
                VSS_q(7 DOWNTO 0) <= VSS_d(7 DOWNTO 0);
            END IF;
        END IF;
    END PROCESS;

    PROCESS (main_clk)
    BEGIN
        IF rising_edge(main_clk) THEN
            IF VFT8_ena_ctrl = '1' THEN
                VFT_q(10 DOWNTO 8) <= VFT_d(10 DOWNTO 8);
            END IF;
        END IF;
    END PROCESS;

    PROCESS (main_clk)
    BEGIN
        IF rising_edge(main_clk) THEN
            IF VFT0_ena_ctrl = '1' THEN
                VFT_q(7 DOWNTO 0) <= VFT_d(7 DOWNTO 0);
            END IF;
        END IF;
    END PROCESS;

    PROCESS (main_clk)
    BEGIN
        IF rising_edge(main_clk) THEN
            IF VCO_ena(8) = '1' THEN
                VCO_q(8) <= VCO_d(8);
            END IF;
        END IF;
    END PROCESS;

    PROCESS (main_clk)
    BEGIN
        IF rising_edge(main_clk) THEN
            IF VCO0_ena_ctrl = '1' THEN
                VCO_q(7 DOWNTO 0) <= VCO_d(7 DOWNTO 0);
            END IF;
        END IF;
    END PROCESS;

    PROCESS (main_clk)
    BEGIN
        IF rising_edge(main_clk) THEN
            IF VCNTRL0_ena_ctrl = '1' THEN
                VCNTRL_q <= VCNTRL_d;
            END IF;
        END IF;
    END PROCESS;

-- Start of original equations

    --  BYT SELECT 32 BIT
    --  ADR==0
    FB_B(0) <= to_std_logic(FB_ADR(1 DOWNTO 0) = "00");

    --  ADR==1
    --  HIGH WORD
    --  LONG UND LINE
    FB_B(1) <= to_std_logic(FB_ADR(1 DOWNTO 0) = "01") or (FB_SIZE1 and (not
	 FB_SIZE0) and (not FB_ADR(1))) or (FB_SIZE1 and FB_SIZE0) or ((not
	 FB_SIZE1) and (not FB_SIZE0));

    --  ADR==2
    --  LONG UND LINE
    FB_B(2) <= to_std_logic(FB_ADR(1 DOWNTO 0) = "10") or (FB_SIZE1 and FB_SIZE0) or ((not FB_SIZE1) and (not FB_SIZE0));

    --  ADR==3
    --  LOW WORD
    --  LONG UND LINE
    FB_B(3) <= to_std_logic(FB_ADR(1 DOWNTO 0) = "11") or (FB_SIZE1 and (not FB_SIZE0) and FB_ADR(1)) or
               (FB_SIZE1 and FB_SIZE0) or
               ((not FB_SIZE1) and (not FB_SIZE0));

    --  BYT SELECT 16 BIT
    --  ADR==0
    FB_16B(0) <= to_std_logic(FB_ADR(0) = '0');

    --  ADR==1
    --  NOT BYT
    FB_16B(1) <= to_std_logic(FB_ADR(0) = '1') or (not ((not FB_SIZE1) and FB_SIZE0));

    --  ACP CLUT --
    --  0-3FF/1024
    ACP_CLUT_CS <= to_std_logic(((not nFB_CS2)='1') and FB_ADR(27 DOWNTO 10) = "000000000000000000");
    ACP_CLUT_RD <= ACP_CLUT_CS and (not nFB_OE);
    ACP_CLUT_WR <= FB_B and sizeIt(ACP_CLUT_CS,4) and sizeIt(not nFB_WR,4);
    CLUT_TA_d <= (ACP_CLUT_CS or FALCON_CLUT_CS or ST_CLUT_CS) and (not VIDEO_MOD_TA);

    -- FALCON CLUT --
    --  $F9800/$400
    FALCON_CLUT_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 DOWNTO 10) = "1111100110");

    --  HIGH WORD
    FALCON_CLUT_RDH <= FALCON_CLUT_CS and (not nFB_OE) and (not FB_ADR(1));

    --  LOW WORD
    FALCON_CLUT_RDL <= FALCON_CLUT_CS and (not nFB_OE) and FB_ADR(1);
    FALCON_CLUT_WR(1 DOWNTO 0) <= FB_16B and std_logic_vector'((not FB_ADR(1)) &
                   (not FB_ADR(1))) and std_logic_vector'(FALCON_CLUT_CS & FALCON_CLUT_CS) and std_logic_vector'((not nFB_WR) & (not nFB_WR));
    FALCON_CLUT_WR(3 DOWNTO 2) <= FB_16B and std_logic_vector'(FB_ADR(1) & FB_ADR(1)) and std_logic_vector'(FALCON_CLUT_CS & FALCON_CLUT_CS) and
                   std_logic_vector'((not nFB_WR) & (not nFB_WR));

    --  ST CLUT --
    --  $F8240/$20
    ST_CLUT_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 DOWNTO 5) = "111110000010010");
    ST_CLUT_RD <= ST_CLUT_CS and (not nFB_OE);
    ST_CLUT_WR <= FB_16B and std_logic_vector'(ST_CLUT_CS & ST_CLUT_CS) and std_logic_vector'((not nFB_WR) & (not nFB_WR));

    --  ST SHIFT MODE

    --  $F8260/2
    ST_SHIFT_MODE_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 DOWNTO 1) = "1111100000100110000");
    ST_SHIFT_MODE_d <= FB_AD(25 DOWNTO 24);
    ST_SHIFT_MODE0_ena_ctrl <= ST_SHIFT_MODE_CS and (not nFB_WR) and FB_B(0);

    --  MONO
    COLOR1_1 <= to_std_logic(ST_SHIFT_MODE_q = "10") and (not COLOR8) and ST_VIDEO and (not ACP_VIDEO_ON);

    --  4 FARBEN
    COLOR2 <= to_std_logic(ST_SHIFT_MODE_q = "01") and (not COLOR8) and ST_VIDEO and (not ACP_VIDEO_ON);

    --  16 FARBEN
    COLOR4_1 <= to_std_logic(ST_SHIFT_MODE_q = "00") and (not COLOR8) and ST_VIDEO and (not ACP_VIDEO_ON);

    --  FALCON SHIFT MODE

    --  $F8266/2
    FALCON_SHIFT_MODE_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 DOWNTO 1) = "1111100000100110011");
    FALCON_SHIFT_MODE_d <= FB_AD(26 DOWNTO 16);
    FALCON_SHIFT_MODE8_ena_ctrl <= FALCON_SHIFT_MODE_CS and (not nFB_WR) and FB_B(2);
    FALCON_SHIFT_MODE0_ena_ctrl <= FALCON_SHIFT_MODE_CS and (not nFB_WR) and FB_B(3);

    CLUT_OFF <= FALCON_SHIFT_MODE_q(3 DOWNTO 0) and sizeIt(COLOR4_i, 4);
    COLOR1_2 <= FALCON_SHIFT_MODE_q(10) and (not COLOR16) and (not COLOR8) and FALCON_VIDEO and (not ACP_VIDEO_ON);
    COLOR8_1 <= FALCON_SHIFT_MODE_q(4) and (not COLOR16) and FALCON_VIDEO and (not ACP_VIDEO_ON);
    COLOR16_1 <= FALCON_SHIFT_MODE_q(8) and FALCON_VIDEO and (not ACP_VIDEO_ON);
    COLOR4_2 <= (not COLOR1) and (not COLOR16) and (not COLOR8) and FALCON_VIDEO and (not ACP_VIDEO_ON);

    --  ACP VIDEO CONTROL
    --  BIT 0 = ACP VIDEO ON
    --  BIT 1 = POWER ON VIDEO DAC
    --  BIT 2 = ACP 24BIT
    --  BIT 3 = ACP 16BIT
    --  BIT 4 = ACP 8BIT
    --  BIT 5 = ACP 1BIT
    --  BIT 6 = FALCON SHIFT MODE
    --  BIT 7 = ST SHIFT MODE
    --  BIT 9..8 = VCLK FREQUENZ
    --  BIT 15 =-SYNC ALLOWED
    --  BIT 31..16 = VIDEO_RAM_CTR
    --  BIT 25 = RANDFARBE EINSCHALTEN
    --  BIT 26 = STANDARD ATARI SYNCS

    --  $400/4
    ACP_VCTR_CS <= to_std_logic(((not nFB_CS2)='1') and FB_ADR(27 DOWNTO 2) = "00000000000000000100000000");
   
    ACP_VCTR_d(31 DOWNTO 8) <= FB_AD(31 DOWNTO 8);
    ACP_VCTR_d(5 DOWNTO 0) <= FB_AD(5 DOWNTO 0);
   
    ACP_VCTR24_ena_ctrl <= ACP_VCTR_CS and FB_B(0) and (not nFB_WR);
    ACP_VCTR16_ena_ctrl <= ACP_VCTR_CS and FB_B(1) and (not nFB_WR);
    ACP_VCTR8_ena_ctrl <= ACP_VCTR_CS and FB_B(2) and (not nFB_WR);
    ACP_VCTR0_ena_ctrl <= ACP_VCTR_CS and FB_B(3) and (not nFB_WR);
    ACP_VIDEO_ON <= ACP_VCTR_q(0);
    nPD_VGA <= ACP_VCTR_q(1);

    --  ATARI MODUS
    --  WENN 1 AUTOMATISCHE AUFLÖSUNG
    ATARI_SYNC <= ACP_VCTR_q(26);

    --  HORIZONTAL TIMING 640x480

    --  $410/4
    ATARI_HH_CS <= to_std_logic(((not nFB_CS2)='1') and FB_ADR(27 DOWNTO 2) = "00000000000000000100000100");
    ATARI_HH_d <= FB_AD;
    ATARI_HH24_ena_ctrl <= ATARI_HH_CS and FB_B(0) and (not nFB_WR);
    ATARI_HH16_ena_ctrl <= ATARI_HH_CS and FB_B(1) and (not nFB_WR);
    ATARI_HH8_ena_ctrl <= ATARI_HH_CS and FB_B(2) and (not nFB_WR);
    ATARI_HH0_ena_ctrl <= ATARI_HH_CS and FB_B(3) and (not nFB_WR);

    --  VERTIKAL TIMING 640x480

    --  $414/4
    ATARI_VH_CS <= to_std_logic(((not nFB_CS2)='1') and FB_ADR(27 DOWNTO 2) = "00000000000000000100000101");
    ATARI_VH_d <= FB_AD;
    ATARI_VH24_ena_ctrl <= ATARI_VH_CS and FB_B(0) and (not nFB_WR);
    ATARI_VH16_ena_ctrl <= ATARI_VH_CS and FB_B(1) and (not nFB_WR);
    ATARI_VH8_ena_ctrl <= ATARI_VH_CS and FB_B(2) and (not nFB_WR);
    ATARI_VH0_ena_ctrl <= ATARI_VH_CS and FB_B(3) and (not nFB_WR);

    --  HORIZONTAL TIMING 320x240

    --  $418/4
    ATARI_HL_CS <= to_std_logic(((not nFB_CS2)='1') and FB_ADR(27 DOWNTO 2) = "00000000000000000100000110");
    ATARI_HL_d <= FB_AD;
    ATARI_HL24_ena_ctrl <= ATARI_HL_CS and FB_B(0) and (not nFB_WR);
    ATARI_HL16_ena_ctrl <= ATARI_HL_CS and FB_B(1) and (not nFB_WR);
    ATARI_HL8_ena_ctrl <= ATARI_HL_CS and FB_B(2) and (not nFB_WR);
    ATARI_HL0_ena_ctrl <= ATARI_HL_CS and FB_B(3) and (not nFB_WR);

    --  VERTIKAL TIMING 320x240

    --  $41C/4
    ATARI_VL_CS <= to_std_logic(((not nFB_CS2)='1') and FB_ADR(27 DOWNTO 2) = "00000000000000000100000111");
    ATARI_VL_d <= FB_AD;
    ATARI_VL24_ena_ctrl <= ATARI_VL_CS and FB_B(0) and (not nFB_WR);
    ATARI_VL16_ena_ctrl <= ATARI_VL_CS and FB_B(1) and (not nFB_WR);
    ATARI_VL8_ena_ctrl <= ATARI_VL_CS and FB_B(2) and (not nFB_WR);
    ATARI_VL0_ena_ctrl <= ATARI_VL_CS and FB_B(3) and (not nFB_WR);

    --  VIDEO PLL CONFIG
    --  $(F)000'0600-7FF ->6/2 WORD RESP LONG ONLY
    VIDEO_PLL_CONFIG_CS <= to_std_logic(((not nFB_CS2)='1') and FB_ADR(27 DOWNTO 9) = "0000000000000000011") and FB_B(0) and FB_B(1);
    VR_WR_d <= VIDEO_PLL_CONFIG_CS and (not nFB_WR) and (not VR_BUSY) and (not VR_WR_q);
    VR_RD <= VIDEO_PLL_CONFIG_CS and nFB_WR and (not VR_BUSY);
    VR_DOUT0_ena_ctrl <= not VR_BUSY;
    VR_DOUT_d <= VR_D;
    VR_FRQ0_ena_ctrl <= to_std_logic(VR_WR_q='1' and FB_ADR(8 DOWNTO 0) = "000000100");
    VR_FRQ_d <= FB_AD(23 DOWNTO 16);

    --  VIDEO PLL RECONFIG
    --  $(F)000'0800
    VIDEO_PLL_RECONFIG_CS <= to_std_logic(((not nFB_CS2)='1') and FB_ADR(27 DOWNTO 0) = "0000000000000000100000000000") and FB_B(0);
    VIDEO_RECONFIG_d <= VIDEO_PLL_RECONFIG_CS and (not nFB_WR) and (not VR_BUSY) and (not VIDEO_RECONFIG_q);

    -- ----------------------------------------------------------------------------------------------------------------------
    VIDEO_RAM_CTR <= ACP_VCTR_q(31 DOWNTO 16);

    -- ------------ COLOR MODE IM ACP SETZEN
    COLOR1_3 <= ACP_VCTR_q(5) and (not ACP_VCTR_q(4)) and (not ACP_VCTR_q(3)) and (not ACP_VCTR_q(2)) and ACP_VIDEO_ON;
    COLOR8_2 <= ACP_VCTR_q(4) and (not ACP_VCTR_q(3)) and (not ACP_VCTR_q(2)) and ACP_VIDEO_ON;
    COLOR16_2 <= ACP_VCTR_q(3) and (not ACP_VCTR_q(2)) and ACP_VIDEO_ON;
    COLOR24 <= ACP_VCTR_q(2) and ACP_VIDEO_ON;
    ACP_CLUT <= (ACP_VIDEO_ON and (COLOR1 or COLOR8)) or (ST_VIDEO and COLOR1);

    --  ST ODER FALCON SHIFT MODE SETZEN WENN WRITE X..SHIFT REGISTER
    ACP_VCTR_d(7) <= FALCON_SHIFT_MODE_CS and (not nFB_WR) and (not ACP_VIDEO_ON);
    ACP_VCTR_d(6) <= ST_SHIFT_MODE_CS and (not nFB_WR) and (not ACP_VIDEO_ON);
   
    ACP_VCTR6_ena_ctrl <= (FALCON_SHIFT_MODE_CS and (not nFB_WR)) or (ST_SHIFT_MODE_CS and (not nFB_WR)) or (ACP_VCTR_CS and FB_B(3) and (not nFB_WR) and FB_AD(0));
    FALCON_VIDEO <= ACP_VCTR_q(7);
    FALCON_CLUT <= FALCON_VIDEO and (not ACP_VIDEO_ON) and (not COLOR16);
    ST_VIDEO <= ACP_VCTR_q(6);
    ST_CLUT <= ST_VIDEO and (not ACP_VIDEO_ON) and (not FALCON_CLUT) and (not COLOR1);
    pixel_clk_i <= pixel_clk;

    --  ONLY FOR INFORMATION
    CCSEL_d <= ("000" and sizeIt(ST_CLUT,3)) or ("001" and
                sizeIt(FALCON_CLUT,3)) or ("100" and sizeIt(ACP_CLUT,3)) or ("101" and
                sizeIt(COLOR16,3)) or ("110" and sizeIt(COLOR24,3)) or ("111" and
                sizeIt(RAND_ON,3));

    --  DIVERSE (VIDEO)-REGISTER ----------------------------
    --  RANDFARBE

    --  $404/4
    BORDER_COLOR_CS <= to_std_logic(((not nFB_CS2) = '1') and FB_ADR(27 DOWNTO 2) = "00000000000000000100000001");
    BORDER_COLOR_d <= FB_AD(23 DOWNTO 0);
    BORDER_COLOR16_ena_ctrl <= BORDER_COLOR_CS and FB_B(1) and (not nFB_WR);
    BORDER_COLOR8_ena_ctrl <= BORDER_COLOR_CS and FB_B(2) and (not nFB_WR);
    BORDER_COLOR0_ena_ctrl <= BORDER_COLOR_CS and FB_B(3) and (not nFB_WR);

    --  System Config Register
    --  $FFFF8006 [R/W] B  76543210  Monitor-Type Hi
    --                     ||||||||
    --                     |||||||+- RAM Wait Status
    --                     |||||||   0 =  1 Wait (default)
    --                     |||||||   1 =  0 Wait
    --                     ||||||+-- Video Bus Width
    --                     ||||||    0 = 16 Bit
    --                     ||||||    1 = 32 Bit (default)
    --                     ||||++--- ROM Wait Status
    --                     ||||      00 = reserved
    --                     ||||      01 = 2 Wait (default)
    --                     ||||      10 = 1 Wait
    --                     ||||      11 = 0 Wait
    --                     ||++----- Main Memory Size
    --                     ||        01 =  4 MB
    --                     ||        10 = 16 MB
    --                     ++------- Monitor Type
    --                               00 Monochrome
    --                               01 RGB
    --                               10 VGA
    --                               11 TV
    --  $8006/2
    SYS_CTR_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 DOWNTO 1) = "1111100000000000011");
    SYS_CTR_d <= FB_AD(22 DOWNTO 16);
    SYS_CTR0_ena_ctrl <= SYS_CTR_CS and (not nFB_WR) and FB_B(3);
    BLITTER_ON <= not SYS_CTR_q(3);

    --  LOF
    --  $820E/2
    LOF_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 DOWNTO 1) = "1111100000100000111");
    LOF_d <= FB_AD(31 DOWNTO 16);
    LOF8_ena_ctrl <= LOF_CS and (not nFB_WR) and FB_B(2);
    LOF0_ena_ctrl <= LOF_CS and (not nFB_WR) and FB_B(3);

    --  LWD
    --  $8210/2
    LWD_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 DOWNTO 1) = "1111100000100001000");
    LWD_d <= FB_AD(31 DOWNTO 16);
    LWD8_ena_ctrl <= LWD_CS and (not nFB_WR) and FB_B(0);
    LWD0_ena_ctrl <= LWD_CS and (not nFB_WR) and FB_B(1);

    --  HORIZONTAL
    --  HHT
    --  $8282/2
    HHT_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 DOWNTO 1) = "1111100000101000001");
    HHT_d <= FB_AD(27 DOWNTO 16);
    HHT8_ena_ctrl <= HHT_CS and (not nFB_WR) and FB_B(2);
    HHT0_ena_ctrl <= HHT_CS and (not nFB_WR) and FB_B(3);

    --  HBE
    --  $8286/2
    HBE_CS <= '1' WHEN nFB_CS1 ='0' and FB_ADR(19 DOWNTO 1) = "1111100000101000011" ELSE '0';
    HBE_d <= FB_AD(27 DOWNTO 16);
    HBE8_ena_ctrl <= HBE_CS and (not nFB_WR) and FB_B(2);
    HBE0_ena_ctrl <= HBE_CS and (not nFB_WR) and FB_B(3);

    --  HDB
    --  $8288/2
    HDB_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 DOWNTO 1) = "1111100000101000100");
    HDB_d <= FB_AD(27 DOWNTO 16);
    HDB8_ena_ctrl <= HDB_CS and (not nFB_WR) and FB_B(0);
    HDB0_ena_ctrl <= HDB_CS and (not nFB_WR) and FB_B(1);

    --  HDE
    --  $828A/2
    HDE_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 DOWNTO 1) = "1111100000101000101");
    HDE_d <= FB_AD(27 DOWNTO 16);
    HDE8_ena_ctrl <= HDE_CS and (not nFB_WR) and FB_B(2);
    HDE0_ena_ctrl <= HDE_CS and (not nFB_WR) and FB_B(3);

    --  HBB
    --  $8284/2
    HBB_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 DOWNTO 1) = "1111100000101000010");
    HBB_d <= FB_AD(27 DOWNTO 16);
    HBB8_ena_ctrl <= HBB_CS and (not nFB_WR) and FB_B(0);
    HBB0_ena_ctrl <= HBB_CS and (not nFB_WR) and FB_B(1);

    --  HSS
    --  Videl HSYNC start register $828C / 2
    HSS_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 DOWNTO 1) = "1111100000101000110");
    HSS_d <= FB_AD(27 DOWNTO 16);
    HSS8_ena_ctrl <= HSS_CS and (not nFB_WR) and FB_B(0);
    HSS0_ena_ctrl <= HSS_CS and (not nFB_WR) and FB_B(1);

    --  VERTIKAL
    --  VBE
    --  $82A6/2
    VBE_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 DOWNTO 1) = "1111100000101010011");
    VBE_d <= FB_AD(26 DOWNTO 16);
    VBE8_ena_ctrl <= VBE_CS and (not nFB_WR) and FB_B(2);
    VBE0_ena_ctrl <= VBE_CS and (not nFB_WR) and FB_B(3);

    --  VDB
    --  $82A8/2
    VDB_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 DOWNTO 1) = "1111100000101010100");
    VDB_d <= FB_AD(26 DOWNTO 16);
    VDB8_ena_ctrl <= VDB_CS and (not nFB_WR) and FB_B(0);
    VDB0_ena_ctrl <= VDB_CS and (not nFB_WR) and FB_B(1);

    --  VDE
    --  $82AA/2
    VDE_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 DOWNTO 1) = "1111100000101010101");
    VDE_d <= FB_AD(26 DOWNTO 16);
    VDE8_ena_ctrl <= VDE_CS and (not nFB_WR) and FB_B(2);
    VDE0_ena_ctrl <= VDE_CS and (not nFB_WR) and FB_B(3);

    --  VBB
    --  $82A4/2
    VBB_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 DOWNTO 1) = "1111100000101010010");
    VBB_d <= FB_AD(26 DOWNTO 16);
    VBB8_ena_ctrl <= VBB_CS and (not nFB_WR) and FB_B(0);
    VBB0_ena_ctrl <= VBB_CS and (not nFB_WR) and FB_B(1);

    --  VSS
    --  $82AC/2
    VSS_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 DOWNTO 1) = "1111100000101010110");
    VSS_d <= FB_AD(26 DOWNTO 16);
    VSS8_ena_ctrl <= VSS_CS and (not nFB_WR) and FB_B(0);
    VSS0_ena_ctrl <= VSS_CS and (not nFB_WR) and FB_B(1);

    --  VFT
    --  $82A2/2
    VFT_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 DOWNTO 1) = "1111100000101010001");
    VFT_d <= FB_AD(26 DOWNTO 16);
    VFT8_ena_ctrl <= VFT_CS and (not nFB_WR) and FB_B(2);
    VFT0_ena_ctrl <= VFT_CS and (not nFB_WR) and FB_B(3);

    --  VCO
    --  $82C0 / 2 Falcon clock control register VCO
    VCO_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 DOWNTO 1) = "1111100000101100000");
    VCO_d <= FB_AD(24 DOWNTO 16);
    VCO_ena(8) <= VCO_CS and (not nFB_WR) and FB_B(0);
    VCO0_ena_ctrl <= VCO_CS and (not nFB_WR) and FB_B(1);

    --  VCNTRL
    --  $82C2 / 2 Falcon resolution control register VCNTRL
    VCNTRL_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 DOWNTO 1) = "1111100000101100001");
    VCNTRL_d <= FB_AD(19 DOWNTO 16);
    VCNTRL0_ena_ctrl <= VCNTRL_CS and (not nFB_WR) and FB_B(3);

-- - REGISTER OUT
--  low word register access
   u0_data <= (sizeIt(ST_SHIFT_MODE_CS,16) and std_logic_vector'("000000" & ST_SHIFT_MODE_q & "00000000")) or
              (sizeIt(FALCON_SHIFT_MODE_CS,16) and std_logic_vector'("00000" & FALCON_SHIFT_MODE_q)) or
              (sizeIt(SYS_CTR_CS,16) and std_logic_vector'("100000000" & SYS_CTR_q(6 DOWNTO 4) & (not BLITTER_RUN) & SYS_CTR_q(2 DOWNTO 0))) or
              (sizeIt(LOF_CS,16) and LOF_q) or (sizeIt(LWD_CS,16) and LWD_q) or
              (sizeIt(HBE_CS,16) and std_logic_vector'("0000" & HBE_q)) or
              (sizeIt(HDB_CS,16) and std_logic_vector'("0000" & HDB_q)) or
              (sizeIt(HDE_CS,16) and std_logic_vector'("0000" & HDE_q)) or
              (sizeIt(HBB_CS,16) and std_logic_vector'("0000" & HBB_q)) or
              (sizeIt(HSS_CS,16) and std_logic_vector'("0000" & HSS_q)) or
              (sizeIt(HHT_CS,16) and std_logic_vector'("0000" & HHT_q)) or
              (sizeIt(VBE_CS,16) and std_logic_vector'("00000" & VBE_q)) or
              (sizeIt(VDB_CS,16) and std_logic_vector'("00000" & VDB_q)) or
              (sizeIt(VDE_CS,16) and std_logic_vector'("00000" & VDE_q)) or
              (sizeIt(VBB_CS,16) and std_logic_vector'("00000" & VBB_q)) or
              (sizeIt(VSS_CS,16) and std_logic_vector'("00000" & VSS_q)) or
              (sizeIt(VFT_CS,16) and std_logic_vector'("00000" & VFT_q)) or
              (sizeIt(VCO_CS,16) and std_logic_vector'("0000000" & VCO_q)) or
              (sizeIt(VCNTRL_CS,16) and std_logic_vector'("000000000000" & VCNTRL_q)) or
              (sizeIt(ACP_VCTR_CS,16) and ACP_VCTR_q(31 DOWNTO 16)) or
              (sizeIt(ATARI_HH_CS,16) and ATARI_HH_q(31 DOWNTO 16)) or
              (sizeIt(ATARI_VH_CS,16) and ATARI_VH_q(31 DOWNTO 16)) or
              (sizeIt(ATARI_HL_CS,16) and ATARI_HL_q(31 DOWNTO 16)) or
              (sizeIt(ATARI_VL_CS,16) and ATARI_VL_q(31 DOWNTO 16)) or
              (sizeIt(BORDER_COLOR_CS,16) and std_logic_vector'("00000000" & BORDER_COLOR_q(23 DOWNTO 16))) or
              (sizeIt(VIDEO_PLL_CONFIG_CS,16) and std_logic_vector'("0000000" & VR_DOUT_q)) or
              (sizeIt(VIDEO_PLL_RECONFIG_CS,16) and std_logic_vector'(VR_BUSY & "0000" & VR_WR_q & VR_RD & VIDEO_RECONFIG_q & "11111010"));
    
    u0_enabledt <= (ST_SHIFT_MODE_CS or FALCON_SHIFT_MODE_CS or ACP_VCTR_CS or BORDER_COLOR_CS or SYS_CTR_CS or LOF_CS or LWD_CS or HBE_CS or HDB_CS or
	                HDE_CS or HBB_CS or HSS_CS or HHT_CS or ATARI_HH_CS or ATARI_VH_CS or ATARI_HL_CS or ATARI_VL_CS or VIDEO_PLL_CONFIG_CS or
                    VIDEO_PLL_RECONFIG_CS or VBE_CS or VDB_CS or VDE_CS or VBB_CS or VSS_CS or VFT_CS or VCO_CS or VCNTRL_CS) and (not nFB_OE);
    FB_AD(31 DOWNTO 16) <= u0_tridata;

--  high word register access
    u1_data <= (sizeIt(ACP_VCTR_CS,16) and ACP_VCTR_q(15 DOWNTO 0)) or
               (sizeIt(ATARI_HH_CS,16) and ATARI_HH_q(15 DOWNTO 0)) or
               (sizeIt(ATARI_VH_CS,16) and ATARI_VH_q(15 DOWNTO 0)) or
               (sizeIt(ATARI_HL_CS,16) and ATARI_HL_q(15 DOWNTO 0)) or
               (sizeIt(ATARI_VL_CS,16) and ATARI_VL_q(15 DOWNTO 0)) or
               (sizeIt(BORDER_COLOR_CS,16) and BORDER_COLOR_q(15 DOWNTO 0));
    u1_enabledt <= (ACP_VCTR_CS or BORDER_COLOR_CS or ATARI_HH_CS or ATARI_VH_CS or ATARI_HL_CS or ATARI_VL_CS) and (not nFB_OE);
    FB_AD(15 DOWNTO 0) <= u1_tridata;

    VIDEO_MOD_TA <= CLUT_TA_q or ST_SHIFT_MODE_CS or FALCON_SHIFT_MODE_CS or ACP_VCTR_CS or SYS_CTR_CS or LOF_CS or LWD_CS or HBE_CS or HDB_CS or
                    HDE_CS or HBB_CS or HSS_CS or HHT_CS or ATARI_HH_CS or ATARI_VH_CS or ATARI_HL_CS or ATARI_VL_CS or VBE_CS or VDB_CS or VDE_CS or VBB_CS or
                    VSS_CS or VFT_CS or VCO_CS or VCNTRL_CS;

    --  VIDEO AUSGABE SETZEN
    CLK17M_d <= not CLK17M_q;
    CLK13M_d <= not CLK13M_q;

    --  320 pixels, 32 MHz,
    --  320 pixels, 25.175 MHz,
    --  640 pixels, 32 MHz, VGA monitor
    --  640 pixels, 25.175 MHz, VGA monitor
    PIXEL_CLK <= (CLK13M_q and (not ACP_VIDEO_ON) and (FALCON_VIDEO or ST_VIDEO) and ((VCNTRL_q(2) and VCO_q(2)) or VCO_q(0))) or
                 (CLK17M_q and (not	 ACP_VIDEO_ON) and (FALCON_VIDEO or ST_VIDEO) and ((VCNTRL_q(2) and (not VCO_q(2))) or VCO_q(0))) or
                 (CLK25M and (not ACP_VIDEO_ON) and (FALCON_VIDEO or ST_VIDEO) and (not VCNTRL_q(2)) and VCO_q(2) and (not VCO_q(0))) or
                 (CLK33M and (not ACP_VIDEO_ON) and (FALCON_VIDEO or ST_VIDEO) and (not VCNTRL_q(2)) and (not VCO_q(2)) and (not VCO_q(0))) or
                 (to_std_logic((CLK25M and ACP_VIDEO_ON)='1' and ACP_VCTR_q(9 DOWNTO 8) = "00")) or
                 (to_std_logic((CLK33M and ACP_VIDEO_ON)='1' and ACP_VCTR_q(9 DOWNTO 8) = "01")) or
                 (CLK_VIDEO and ACP_VIDEO_ON and ACP_VCTR_q(9));

    -- ------------------------------------------------------------
    --  HORIZONTALE SYNC LÄNGE in PIXEL_CLK
    -- --------------------------------------------------------------

    --  320 pixels, 32 MHz, RGB
    --  320 pixels, 25.175 MHz, VGA
    --  640 pixels, 32 MHz, RGB
    --  640 pixels, 25.175 MHz, VGA
    --  hsync pulse length in pixeln = frequenz / = 500ns
	 calc_freq <= 8d"16" + unsigned("0" & vr_frq(7 DOWNTO 1));
    HSY_LEN_d <= std_logic_vector'(d"14") WHEN acp_video_on = '0' and (falcon_video = '1' or st_video = '1') and vcntrl(2) = '1' and (vco(2) = '1' or vco(0) = '1') ELSE
                 std_logic_vector'(d"16") WHEN acp_video_on = '0' and (falcon_video = '1' or st_video = '1') and vcntrl(2) = '1' and (vco(2) = '0' or vco(0) = '1') ELSE
                 std_logic_vector'(d"28") WHEN acp_video_on = '0' and (falcon_video = '1' or st_video = '1') and vcntrl(2) = '0' and vco(2) = '1' and vco(0) = '0' ELSE
                 std_logic_vector'(d"32") WHEN acp_video_on = '0' and (falcon_video = '1' or st_video = '1') and vcntrl(2) = '0' and vco(2) = '0' and vco(0) = '0' ELSE
                 std_logic_vector'(d"28") WHEN acp_video_on = '1' and acp_vctr(9 DOWNTO 8) = "00" ELSE
                 std_logic_vector'(d"32") WHEN acp_video_on = '1' and acp_vctr(9 DOWNTO 8) = "01" ELSE
                 std_logic_vector(calc_freq) WHEN acp_video_on = '1' and acp_vctr(9) = '1'           ;
                 
                 -- ("00001110" and sizeIt(not ACP_VIDEO_ON, 8) and (sizeIt(FALCON_VIDEO, 8) or sizeIt(ST_VIDEO, 8)) and ((sizeIt(VCNTRL_q(2), 8) and sizeIt(VCO_q(2), 8)) or sizeIt(VCO_q(0), 8))) or
                 -- ("00010000" and sizeIt(not ACP_VIDEO_ON, 8) and (sizeIt(FALCON_VIDEO, 8) or sizeIt(ST_VIDEO, 8)) and ((sizeIt(VCNTRL_q(2), 8) and sizeIt(not VCO_q(2), 8)) or sizeIt(VCO_q(0),8))) or
                 -- ("00011100" and sizeIt(not ACP_VIDEO_ON, 8) and (sizeIt(FALCON_VIDEO, 8) or sizeIt(ST_VIDEO, 8)) and sizeIt(not VCNTRL_q(2), 8) and sizeIt(VCO_q(2), 8) and sizeIt(not VCO_q(0), 8)) or
                 -- ("00100000" and sizeIt(not ACP_VIDEO_ON, 8) and (sizeIt(FALCON_VIDEO, 8) or sizeIt(ST_VIDEO, 8)) and sizeIt(not VCNTRL_q(2), 8) and sizeIt(not VCO_q(2), 8) and sizeIt(not VCO_q(0), 8)) or
                 -- ("00011100" and sizeIt(ACP_VIDEO_ON, 8) and sizeIt(to_std_logic(ACP_VCTR_q(9 DOWNTO 8) = "00"), 8)) or
                 -- ("00100000" and sizeIt(ACP_VIDEO_ON, 8) and sizeIt(to_std_logic(ACP_VCTR_q(9 DOWNTO 8) = "01"), 8)) or
                 -- ((std_logic_vector(to_unsigned(16, HSY_LEN_d'LENGTH) + unsigned(std_logic_vector('0' & VR_FRQ_q(7 DOWNTO 1))))) and sizeIt(ACP_VIDEO_ON, 8) and sizeIt(ACP_VCTR_q(9), 8));

--  MULTIPLIKATIONS FAKTOR
   MULF <= ("000010" and sizeIt(not ST_VIDEO,6) and sizeIt(VCNTRL_q(2),6)) or
	 ("000100" and sizeIt(not ST_VIDEO,6) and sizeIt(not VCNTRL_q(2),6)) or
	 ("010000" and sizeIt(ST_VIDEO,6) and sizeIt(VCNTRL_q(2),6)) or
	 ("100000" and sizeIt(ST_VIDEO,6) and sizeIt(not VCNTRL_q(2),6));

--  BREITE IN PIXELN
   HDIS_LEN <= ("000101000000" and sizeIt(VCNTRL_q(2),12)) or ("001010000000"
	 and sizeIt(not VCNTRL_q(2),12));

--  DOPPELZEILENMODUS
--  ZEILENVERDOPPELUNG EIN AUS
   DOP_ZEI_d <= VCNTRL_q(0) and (FALCON_VIDEO or ST_VIDEO);

--  EINSCHIEBEZEILE AUF "DOPPEL" ZEILEN UND ZEILE NULL WEGEN SYNC
--  EINSCHIEBEZEILE AUF "NORMAL" ZEILEN UND ZEILE NULL WEGEN SYNC
   INTER_ZEI_d <= (to_std_logic(DOP_ZEI_q='1' and VVCNT_q(0) /= VDIS_START(0)
	 and VVCNT_q /= "00000000000" and (unsigned(VHCNT_q) < unsigned(std_logic_vector(unsigned(HDIS_END) - 1))))) or (to_std_logic(DOP_ZEI_q='1' and
	 VVCNT_q(0) = VDIS_START(0) and VVCNT_q /= "00000000000" and
	 (unsigned(VHCNT_q) > unsigned(std_logic_vector(unsigned(HDIS_END) - 2)))));

--  DOPPELZEILENFIFO LÖSCHEN AM ENDE DER DOPPELZEILE UND BEI MAIN FIFO START
   DOP_FIFO_CLR_d <= (INTER_ZEI_q and HSYNC_START_q) or SYNC_PIX_q;

--    RAND_LINKS[]    =  HBE[]                                    &  ACP_VIDEO_ON
--                     #  21                                       & !ACP_VIDEO_ON &  ATARI_SYNC &  VCNTRL2
--                     #  42                                       & !ACP_VIDEO_ON &  ATARI_SYNC & !VCNTRL2
--                     #  HBE[] * (0, MULF[5..1])                  & !ACP_VIDEO_ON & !ATARI_SYNC;          --
    rand_links <= HBE_q WHEN acp_video_on ELSE
                  12d"12" WHEN not acp_video_on and atari_sync and vcntrl(2) ELSE
                  12d"42" WHEN not acp_video_on and atari_sync and not(vcntrl(2)) ELSE
                  std_logic_vector(resize(unsigned(hbe) * unsigned(mulf(5 DOWNTO 1)), 12)) WHEN not acp_video_on and not atari_sync;

                  /* rand_links <= (HBE_q and sizeit(acp_video_on, 12)) or
                  (std_logic_vector(to_unsigned(21, 12)) and sizeit(not acp_video_on and atari_sync and vcntrl(2), 12)) or
                  (std_logic_vector(to_unsigned(42, 12)) and sizeit(not acp_video_on and atari_sync and not vcntrl(2), 12)) or
                  (std_logic_vector(unsigned(hbe) * unsigned(mulf(5 DOWNTO 1))) and sizeit(not acp_video_on and not atari_sync, 12));  */

--	HDIS_START[] 	=  HDB[] 									&  ACP_VIDEO_ON
--					#  RAND_LINKS[] + 1							& !ACP_VIDEO_ON;						--  
   HDIS_START <= (HDB_q and sizeIt(ACP_VIDEO_ON,12)) or ((std_logic_vector(unsigned(RAND_LINKS) + 1)) and sizeIt(not ACP_VIDEO_ON,12));
   HDIS_END <= (HDE_q and sizeIt(ACP_VIDEO_ON,12)) or
              ((std_logic_vector(unsigned(RAND_LINKS) + unsigned(HDIS_LEN))) and sizeIt(not ACP_VIDEO_ON,12));
   RAND_RECHTS <= (HBB_q and sizeIt(ACP_VIDEO_ON,12)) or
	              ((std_logic_vector(unsigned(HDIS_END) + 1)) and sizeIt(not ACP_VIDEO_ON, 12));

    hs_start <= hss_q WHEN acp_video_on ELSE
                atari_hl(11 DOWNTO 0) WHEN not(acp_video_on) and atari_sync and vcntrl(2) ELSE
                atari_hh(11 DOWNTO 0) WHEN not(acp_video_on) and atari_sync and not vcntrl(2) ELSE
                std_logic_vector(resize(unsigned(hht) + 1 + unsigned(hss) * unsigned(mulf(5 DOWNTO 1)), 12)) WHEN not acp_video_on and not atari_sync;
            
--    HS_START[]      =  HSS[]                                    &  ACP_VIDEO_ON
--                     #  ATARI_HL[11..0]                          & !ACP_VIDEO_ON &  ATARI_SYNC &  VCNTRL2
--                     #  ATARI_HH[11..0]                          & !ACP_VIDEO_ON &  ATARI_SYNC & !VCNTRL2
--                     # (HHT[] + 1 + HSS[]) * (0, MULF[5..1])     & !ACP_VIDEO_ON & !ATARI_SYNC;          --
--  
    h_total <= hht_q WHEN acp_video_on ELSE
               atari_hl(27 DOWNTO 16) WHEN not acp_video_on and atari_sync and vcntrl(2) ELSE
               atari_hh(27 DOWNTO 16) WHEN not acp_video_on and atari_sync and not vcntrl(2) ELSE
               std_logic_vector(resize((unsigned(hht) + 2) * unsigned(mulf), 12)) WHEN not acp_video_on and not atari_sync;
               
--    H_TOTAL[]       =  HHT[]                                    &  ACP_VIDEO_ON
--                     #  ATARI_HL[27..16]                         & !ACP_VIDEO_ON &  ATARI_SYNC &  VCNTRL2
--                     #  ATARI_HH[27..16]                         & !ACP_VIDEO_ON &  ATARI_SYNC & !VCNTRL2
--                     # (HHT[] + 2) * (0, MULF[])                 & !ACP_VIDEO_ON & !ATARI_SYNC;          --
    RAND_OBEN <= (VBE_q and sizeIt(ACP_VIDEO_ON,11)) or ("00000011111" and
	 sizeIt(not ACP_VIDEO_ON,11) and sizeIt(ATARI_SYNC,11)) or
	 (std_logic_vector'('0' & VBE_q(10 DOWNTO 1)) and sizeIt(not
	 ACP_VIDEO_ON,11) and sizeIt(not ATARI_SYNC,11));
    
    VDIS_START <= (VDB_q and sizeIt(ACP_VIDEO_ON,11)) or 
                 ("00000100000" and sizeIt(not ACP_VIDEO_ON,11) and sizeIt(ATARI_SYNC,11)) or
                 ((std_logic_vector(unsigned(std_logic_vector('0' & VDB_q(10 DOWNTO 1))) + 1)) and sizeIt(not ACP_VIDEO_ON,11) and sizeIt(not ATARI_SYNC,11));
                 
    VDIS_END <= (VDE_q and sizeIt(ACP_VIDEO_ON,11)) or ("00110101111" and
	 sizeIt(not ACP_VIDEO_ON,11) and sizeIt(ATARI_SYNC,11) and
	 sizeIt(ST_VIDEO,11)) or ("00111111111" and sizeIt(not ACP_VIDEO_ON,11)
	 and sizeIt(ATARI_SYNC,11) and sizeIt(not ST_VIDEO,11)) or
	 (std_logic_vector'('0' & VDE_q(10 DOWNTO 1)) and sizeIt(not
	 ACP_VIDEO_ON,11) and sizeIt(not ATARI_SYNC,11));
    RAND_UNTEN <= (VBB_q and sizeIt(ACP_VIDEO_ON,11)) or
	 ((std_logic_vector(unsigned(VDIS_END) + 1)) and sizeIt(not ACP_VIDEO_ON,11) and sizeIt(ATARI_SYNC,11)) or
	 ((std_logic_vector(unsigned(std_logic_vector('0' & VBB_q(10 DOWNTO 1))) + 1)) and sizeIt(not ACP_VIDEO_ON,11) and sizeIt(not ATARI_SYNC,11));
     
    VS_START <= (VSS_q and sizeIt(ACP_VIDEO_ON,11)) or (ATARI_VL_q(10 DOWNTO 0)
	 and sizeIt(not ACP_VIDEO_ON,11) and sizeIt(ATARI_SYNC,11) and
	 sizeIt(VCNTRL_q(2),11)) or (ATARI_VH_q(10 DOWNTO 0) and sizeIt(not
	 ACP_VIDEO_ON,11) and sizeIt(ATARI_SYNC,11) and sizeIt(not
	 VCNTRL_q(2),11)) or (std_logic_vector'('0' & VSS_q(10 DOWNTO 1)) and
	 sizeIt(not ACP_VIDEO_ON,11) and sizeIt(not ATARI_SYNC,11));
    V_TOTAL <= (VFT_q and sizeIt(ACP_VIDEO_ON,11)) or (ATARI_VL_q(26 DOWNTO 16)
	 and sizeIt(not ACP_VIDEO_ON,11) and sizeIt(ATARI_SYNC,11) and
	 sizeIt(VCNTRL_q(2),11)) or (ATARI_VH_q(26 DOWNTO 16) and sizeIt(not
	 ACP_VIDEO_ON,11) and sizeIt(ATARI_SYNC,11) and sizeIt(not
	 VCNTRL_q(2),11)) or (std_logic_vector'('0' & VFT_q(10 DOWNTO 1)) and
	 sizeIt(not ACP_VIDEO_ON,11) and sizeIt(not ATARI_SYNC,11));

    --  ZÄHLER
    LAST_d <= to_std_logic(VHCNT_q = (std_logic_vector(unsigned(H_TOTAL) - 2)));

    VHCNT_d <= (std_logic_vector(unsigned(VHCNT_q) + 1)) and sizeIt(not LAST_q,12);

    VVCNT0_ena_ctrl <= LAST_q;
    VVCNT_d <= (std_logic_vector(unsigned(VVCNT_q) + 1)) and sizeIt(to_std_logic(VVCNT_q /= (std_logic_vector(unsigned(V_TOTAL) - 1))), 11);

    --  DISPLAY ON OFF
    --  1 ZEILE DAVOR ON OFF
    DPO_ZL_d <= to_std_logic((unsigned(VVCNT_q) > unsigned(std_logic_vector(unsigned(RAND_OBEN) - 1))) and (unsigned(VVCNT_q) < unsigned(std_logic_vector(unsigned(RAND_UNTEN) - 1))));

    --  AM ZEILENENDE ÜBERNEHMEN
    DPO_ZL_ena <= LAST_q;

    --  BESSER EINZELN WEGEN TIMING
    DPO_ON_d <= to_std_logic(VHCNT_q = RAND_LINKS);
    DPO_OFF_d <= to_std_logic(VHCNT_q = (std_logic_vector(unsigned(RAND_RECHTS) - 1)));
    DISP_ON_d <= (DISP_ON_q and (not DPO_OFF_q)) or (DPO_ON_q and DPO_ZL_q);

    --  DATENTRANSFER ON OFF
    
    
    --  BESSER EINZELN WEGEN TIMING
    VCO_ON_d <= to_std_logic(VHCNT_q = (std_logic_vector(unsigned(HDIS_START) - 1)));
    VCO_OFF_d <= to_std_logic(VHCNT_q = HDIS_END);

    
    --  AM ZEILENENDE ÜBERNEHMEN
    VCO_ZL_ena <= LAST_q;

    --  1 ZEILE DAVOR ON OFF
    VCO_ZL_d <= to_std_logic((unsigned(VVCNT_q) >= unsigned(std_logic_vector(unsigned(VDIS_START) - 1))) and (unsigned(VVCNT_q) < unsigned(VDIS_END)));

    VDTRON_d <= (VDTRON_q and (not VCO_OFF_q)) or (VCO_ON_q and VCO_ZL_q);

    --  VERZÖGERUNG UND SYNC

    HSYNC_START_d <= to_std_logic(VHCNT_q = (std_logic_vector(unsigned(HS_START) - 3)));

    HSYNC_I_d <= (HSY_LEN_q and sizeIt(HSYNC_START_q,8)) or
                ((std_logic_vector(unsigned(HSYNC_I_q) - 1)) and
	 sizeIt(not HSYNC_START_q,8) and sizeIt(to_std_logic(HSYNC_I_q /=
	 "00000000"),8));

     VSYNC_START_ena <= LAST_q;

    --  start am ende der Zeile vor dem vsync
    VSYNC_START_d <= to_std_logic(VVCNT_q = (std_logic_vector(unsigned(VS_START) - 3)));

    --  start am ende der Zeile vor dem vsync
    VSYNC_I0_ena_ctrl <= LAST_q;

    --  3 zeilen vsync length
    --  runterzählen bis 0
    VSYNC_I_d <= ("011" and sizeIt(VSYNC_START_q,3)) or
	 ((std_logic_vector(unsigned(VSYNC_I_q) - 1)) and sizeIt(not VSYNC_START_q,3) and sizeIt(to_std_logic(VSYNC_I_q /= "000"),3));
   
    (VERZ2_d(1), VERZ1_d(1), VERZ0_d(1)) <= std_logic_vector'(VERZ2_q(0) &
	 VERZ1_q(0) & VERZ0_q(0));
    (VERZ2_d(2), VERZ1_d(2), VERZ0_d(2)) <= std_logic_vector'(VERZ2_q(1) &
	 VERZ1_q(1) & VERZ0_q(1));
    (VERZ2_d(3), VERZ1_d(3), VERZ0_d(3)) <= std_logic_vector'(VERZ2_q(2) &
	 VERZ1_q(2) & VERZ0_q(2));
    (VERZ2_d(4), VERZ1_d(4), VERZ0_d(4)) <= std_logic_vector'(VERZ2_q(3) &
	 VERZ1_q(3) & VERZ0_q(3));
    (VERZ2_d(5), VERZ1_d(5), VERZ0_d(5)) <= std_logic_vector'(VERZ2_q(4) &
	 VERZ1_q(4) & VERZ0_q(4));
    (VERZ2_d(6), VERZ1_d(6), VERZ0_d(6)) <= std_logic_vector'(VERZ2_q(5) &
	 VERZ1_q(5) & VERZ0_q(5));
    (VERZ2_d(7), VERZ1_d(7), VERZ0_d(7)) <= std_logic_vector'(VERZ2_q(6) &
	 VERZ1_q(6) & VERZ0_q(6));
    (VERZ2_d(8), VERZ1_d(8), VERZ0_d(8)) <= std_logic_vector'(VERZ2_q(7) &
	 VERZ1_q(7) & VERZ0_q(7));
    (VERZ2_d(9), VERZ1_d(9), VERZ0_d(9)) <= std_logic_vector'(VERZ2_q(8) &
	 VERZ1_q(8) & VERZ0_q(8));
    VERZ0_d(0) <= DISP_ON_q;

    --   VERZ[1][0] = HSYNC_I[] != 0;
    --  NUR MÖGLICH WENN BEIDE
    VERZ1_d(0) <= (to_std_logic((((not ACP_VCTR_q(15)) or (not VCO_q(6)))='1')
	 and HSYNC_I_q /= "00000000")) or (to_std_logic((ACP_VCTR_q(15) and
	 VCO_q(6))='1' and HSYNC_I_q = "00000000"));

    --  NUR MÖGLICH WENN BEIDE
    VERZ2_d(0) <= (to_std_logic((((not ACP_VCTR_q(15)) or (not VCO_q(5)))='1')
	 and VSYNC_I_q /= "000")) or (to_std_logic((ACP_VCTR_q(15) and
	 VCO_q(5))='1' and VSYNC_I_q = "000"));

    --  nBLANK =  VERZ[0][8];
    nblank_d <= verz0_q(8);
    
    --  nBLANK_d <= DISP_ON_q;

    --  HSYNC  =  VERZ[1][9];
    --  NUR MÖGLICH WENN BEIDE
    HSYNC_d <= (to_std_logic((((not ACP_VCTR_q(15)) or (not VCO_q(6)))='1') and
	 HSYNC_I_q /= "00000000")) or (to_std_logic((ACP_VCTR_q(15) and
	 VCO_q(6))='1' and HSYNC_I_q = "00000000"));

    --  VSYNC  =  VERZ[2][9];
    --  NUR MÖGLICH WENN BEIDE
    VSYNC_d <= (to_std_logic((((not ACP_VCTR_q(15)) or (not VCO_q(5)))='1') and
	 VSYNC_I_q /= "000")) or (to_std_logic((ACP_VCTR_q(15) and
	 VCO_q(5))='1' and VSYNC_I_q = "000"));
    nSYNC <= gnd;

    --  RANDFARBE MACHEN ------------------------------------
    RAND_d(0) <= DISP_ON_q and (not VDTRON_q) and ACP_VCTR_q(25);
    RAND_d(1) <= RAND_q(0);
    RAND_d(2) <= RAND_q(1);
    RAND_d(3) <= RAND_q(2);
    RAND_d(4) <= RAND_q(3);
    RAND_d(5) <= RAND_q(4);
    RAND_d(6) <= RAND_q(5);
    
    --  RAND_ON = RAND[6];
    rand_on <= rand(6);
    -- RAND_ON <= DISP_ON_q and (not VDTRON_q) and ACP_VCTR_q(25);

    -- --------------------------------------------------------
    CLR_FIFO_ena <= LAST_q;

    --  IN LETZTER ZEILE LÖSCHEN
    CLR_FIFO_d <= to_std_logic(VVCNT_q = (std_logic_vector(unsigned(V_TOTAL) - 2)));
    START_ZEILE_ena <= LAST_q;

    --  ZEILE 1
    START_ZEILE_d <= to_std_logic(VVCNT_q = "00000000000");

    --  SUB PIXEL ZÄHLER SYNCHRONISIEREN
    SYNC_PIX_d <= to_std_logic(VHCNT_q = "000000000011") and START_ZEILE_q;

    --  SUB PIXEL ZÄHLER SYNCHRONISIEREN
    SYNC_PIX1_d <= to_std_logic(VHCNT_q = "000000000101") and START_ZEILE_q;

    --  SUB PIXEL ZÄHLER SYNCHRONISIEREN
    SYNC_PIX2_d <= to_std_logic(VHCNT_q = "000000000111") and START_ZEILE_q;

    SUB_PIXEL_CNT0_ena_ctrl <= VDTRON_q or SYNC_PIX_q;

    -- count up if display on sonst clear bei sync pix
    SUB_PIXEL_CNT_d <= (std_logic_vector(unsigned(SUB_PIXEL_CNT_q) + 1)) and sizeIt(not SYNC_PIX_q,7);

    --  3 CLOCK ZUSÄTZLICH FÜR FIFO SHIFT DATAOUT UND SHIFT RIGTH POSITION
    FIFO_RDE_d <= (((to_std_logic(SUB_PIXEL_CNT_q = "0000001") and COLOR1) or
	 (to_std_logic(SUB_PIXEL_CNT_q(5 DOWNTO 0) = "000001") and COLOR2) or
	 (to_std_logic(SUB_PIXEL_CNT_q(4 DOWNTO 0) = "00001") and color4_i) or
	 (to_std_logic(SUB_PIXEL_CNT_q(3 DOWNTO 0) = "0001") and COLOR8) or
	 (to_std_logic(SUB_PIXEL_CNT_q(2 DOWNTO 0) = "001") and COLOR16) or
	 (to_std_logic(SUB_PIXEL_CNT_q(1 DOWNTO 0) = "01") and COLOR24)) and
	 VDTRON_q) or SYNC_PIX_q or SYNC_PIX1_q or SYNC_PIX2_q;

    CLUT_MUX_AV0_d <= SUB_PIXEL_CNT_q(3 DOWNTO 0);
    CLUT_MUX_AV1_d <= CLUT_MUX_AV0_q;
    CLUT_MUX_ADR_d <= CLUT_MUX_AV1_q;


    -- Assignments added to explicitly combine the
    -- effects of multiple drivers in the source
    COLOR16 <= COLOR16_1 or COLOR16_2;
    color4_i <= COLOR4_1 or COLOR4_2;
    color4 <= color4_i;
    COLOR1 <= COLOR1_1 or COLOR1_2 or COLOR1_3;
    COLOR8 <= COLOR8_1 or COLOR8_2;

    -- Define power SIGNAL(s)
    gnd <= '0';
END ARCHITECTURE rtl;
