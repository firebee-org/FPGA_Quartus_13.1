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
-- verz1_.q            verz1_q
-- verz1_.prn          verz1_prn
-- verz1_.clrn         verz1_clrn
-- verz1_.clk          verz1_clk
-- verz1_.d            verz1_d
-- verz1_              verz1
-- verz2_.q            verz2_q
-- verz2_.prn          verz2_prn
-- verz2_.clrn         verz2_clrn
-- verz2_.clk          verz2_clk
-- verz2_.d            verz2_d
-- verz2_              verz2
-- clut_mux_av0_.q     clut_mux_av0_q
-- clut_mux_av0_.prn   clut_mux_av0_prn
-- clut_mux_av0_.clrn  clut_mux_av0_clrn
-- clut_mux_av0_.clk   clut_mux_av0_clk
-- clut_mux_av0_.d     clut_mux_av0_d
-- clut_mux_av0_       clut_mux_av0
-- clut_mux_av1_.q     clut_mux_av1_q
-- clut_mux_av1_.prn   clut_mux_av1_prn
-- clut_mux_av1_.clrn  clut_mux_av1_clrn
-- clut_mux_av1_.clk   clut_mux_av1_clk
-- clut_mux_av1_.d     clut_mux_av1_d
-- clut_mux_av1_       clut_mux_av1


--  CREATED BY FREDI ASCHWANDEN
--  {{ALTERA_PARAMETERS_begin}} DO NOT REMOVE THIS LINE!
--  {{ALTERA_PARAMETERS_end}} DO NOT REMOVE THIS LINE!

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
    
library work;
use work.firebee_utils_pkg.all;

entity video_mod_mux_clutctr is
    port
    (
        nRSTO           : in std_logic;
        main_clk        : in std_logic;
        nFB_CS1         : in std_logic;
        nFB_CS2         : in std_logic;
        nFB_CS3         : in std_logic;
        nFB_WR          : in std_logic;
        nFB_OE          : in std_logic;
        fb_size0        : in std_logic;
	    fb_size1        : in std_logic;
        nFB_BURST       : in std_logic;
        fb_adr          : in std_logic_vector(31 downto 0);
        clk33m          : in std_logic;
        clk25m          : in std_logic;
        blitter_run     : in std_logic;
        clk_video       : in std_logic;
        vr_d            : in std_logic_vector(8 downto 0);
        vr_busy         : in std_logic;
        color8          : out std_logic;
        acp_clut_rd     : out std_logic;
        color1          : out std_logic;
        falcon_clut_rdh : out std_logic;
        falcon_clut_rdl : out std_logic;
        falcon_clut_wr  : out std_logic_vector(3 downto 0);
        st_clut_rd      : out std_logic;
        st_clut_wr      : out std_logic_vector(1 downto 0);
        clut_mux_adr    : out std_logic_vector(3 downto 0);
        hsync           : out std_logic;
        vsync           : out std_logic;
        nBLANK          : out std_logic;
        nSYNC           : out std_logic;
        nPD_VGA         : out std_logic;
        fifo_rde        : out std_logic;
        color2          : out std_logic;
        color4          : out std_logic;
	    pixel_clk       : out std_logic;
        clut_off        : out std_logic_vector(3 downto 0);
        blitter_on      : out std_logic;
        video_ram_ctr   : out std_logic_vector(15 downto 0);
        video_mod_ta    : out std_logic;
        border_color    : out std_logic_vector(23 downto 0);
        ccsel           : out std_logic_vector(2 downto 0);
        acp_clut_wr     : out std_logic_vector(3 downto 0);
        inter_zei       : out std_logic;
        dop_fifo_clr    : out std_logic;
        video_reconfig  : out std_logic;
        vr_wr           : out std_logic;
        vr_rd           : out std_logic;
        clr_fifo        : out std_logic;
        fb_ad_in        : in std_logic_vector(31 downto 0);
        fb_ad_out       : out std_logic_vector(31 downto 0)
   );
end video_mod_mux_clutctr;


architecture rtl of video_mod_mux_clutctr is
    --  DIV. CONTROL REGISTER
    --  BRAUCHT EIN WAITSTAT
    --  LÃƒâ€žNGE hsync PULS IN pixel_clk
    --  LETZTES PIXEL EINER ZEILE ERREICHT
    --  ATARI RESOLUTION
    --  HORIZONTAL TIMING 640x480
    --  VERTIKAL TIMING 640x480
    --  HORIZONTAL TIMING 320x240
    --  VERTIKAL TIMING 320x240
    --  HORIZONTAL
    --  VERTIKAL
    signal vr_dout                  : std_logic_vector(8 downto 0);
    signal vr_dout_d                : std_logic_vector(8 downto 0);
    signal vr_dout_q                : std_logic_vector(8 downto 0);
    signal vr_frq                   : unsigned(7 downto 0);
    signal vr_frq_d                 : std_logic_vector(7 downto 0);
    signal vr_frq_q                 : std_logic_vector(7 downto 0);
    signal fb_b                     : std_logic_vector(3 downto 0);
    signal FB_16B                   : std_logic_vector(1 downto 0);
    signal st_shift_mode            : std_logic_vector(1 downto 0);
    signal st_shift_mode_d          : std_logic_vector(1 downto 0);
    signal st_shift_mode_q          : std_logic_vector(1 downto 0);
    signal falcon_shift_mode        : std_logic_vector(10 downto 0);
    signal falcon_shift_mode_d      : std_logic_vector(10 downto 0);
    signal falcon_shift_mode_q      : std_logic_vector(10 downto 0);
    signal clut_mux_adr_d           : std_logic_vector(3 downto 0);
    signal clut_mux_adr_q           : std_logic_vector(3 downto 0);
    signal clut_mux_av1             : std_logic_vector(3 downto 0);
    signal clut_mux_av1_d           : std_logic_vector(3 downto 0);
    signal clut_mux_av1_q           : std_logic_vector(3 downto 0);
    signal clut_mux_av0             : std_logic_vector(3 downto 0);
    signal clut_mux_av0_d           : std_logic_vector(3 downto 0);
    signal clut_mux_av0_q           : std_logic_vector(3 downto 0);
    signal acp_vctr                 : std_logic_vector(31 downto 0);
    signal acp_vctr_d               : std_logic_vector(31 downto 0);
    signal acp_vctr_q               : std_logic_vector(31 downto 0);
    signal border_color_d           : std_logic_vector(23 downto 0);
    signal border_color_q           : std_logic_vector(23 downto 0);
    signal sys_ctr                  : std_logic_vector(6 downto 0);
    signal sys_ctr_d                : std_logic_vector(6 downto 0);
    signal sys_ctr_q                : std_logic_vector(6 downto 0);
    signal lof                      : std_logic_vector(15 downto 0);
    signal lof_d                    : std_logic_vector(15 downto 0);
    signal lof_q                    : std_logic_vector(15 downto 0);
    signal lwd                      : std_logic_vector(15 downto 0);
    signal lwd_d                    : std_logic_vector(15 downto 0);
    signal lwd_q                    : std_logic_vector(15 downto 0);
    signal hsync_I                  : std_logic_vector(7 downto 0);
    signal hsync_I_d                : std_logic_vector(7 downto 0);
    signal hsync_I_q                : std_logic_vector(7 downto 0);
    signal HSY_LEN                  : std_logic_vector(7 downto 0);
    signal HSY_LEN_d                : std_logic_vector(7 downto 0);
    signal HSY_LEN_q                : std_logic_vector(7 downto 0);
    signal vsync_I                  : std_logic_vector(2 downto 0);
    signal vsync_I_d                : std_logic_vector(2 downto 0);
    signal vsync_I_q                : std_logic_vector(2 downto 0);
    signal VHCNT                    : std_logic_vector(11 downto 0);
    signal VHCNT_d                  : std_logic_vector(11 downto 0);
    signal VHCNT_q                  : std_logic_vector(11 downto 0);
    signal SUB_PIXEL_CNT            : std_logic_vector(6 downto 0);
    signal SUB_PIXEL_CNT_d          : std_logic_vector(6 downto 0);
    signal SUB_PIXEL_CNT_q          : std_logic_vector(6 downto 0);
    signal VVCNT                    : std_logic_vector(10 downto 0);
    signal VVCNT_d                  : std_logic_vector(10 downto 0);
    signal VVCNT_q                  : std_logic_vector(10 downto 0);
    signal VERZ2                    : std_logic_vector(9 downto 0);
    signal VERZ2_d                  : std_logic_vector(9 downto 0);
    signal VERZ2_q                  : std_logic_vector(9 downto 0);
    signal VERZ1                    : std_logic_vector(9 downto 0);
    signal VERZ1_d                  : std_logic_vector(9 downto 0);
    signal VERZ1_q                  : std_logic_vector(9 downto 0);
    signal VERZ0                    : std_logic_vector(9 downto 0);
    signal VERZ0_d                  : std_logic_vector(9 downto 0);
    signal VERZ0_q                  : std_logic_vector(9 downto 0);
    signal RAND                     : std_logic_vector(6 downto 0) := (others => '0');
    signal RAND_d                   : std_logic_vector(6 downto 0);
    signal RAND_q                   : std_logic_vector(6 downto 0);
    signal ccsel_d                  : std_logic_vector(2 downto 0);
    signal ccsel_q                  : std_logic_vector(2 downto 0);
    signal atari_hh                 : std_logic_vector(31 downto 0) := (others => '0');
    signal atari_hh_d               : std_logic_vector(31 downto 0);
    signal atari_hh_q               : std_logic_vector(31 downto 0);
    signal atari_vh                 : std_logic_vector(31 downto 0);
    signal atari_vh_d               : std_logic_vector(31 downto 0);
    signal atari_vh_q               : std_logic_vector(31 downto 0);
    signal atari_hl                 : std_logic_vector(31 downto 0) := (others => '0');
    signal atari_hl_d               : std_logic_vector(31 downto 0);
    signal atari_hl_q               : std_logic_vector(31 downto 0);
    signal atari_vl                 : std_logic_vector(31 downto 0);
    signal atari_vl_d               : std_logic_vector(31 downto 0);
    signal atari_vl_q               : std_logic_vector(31 downto 0);
    signal rand_links               : std_logic_vector(11 downto 0);
    signal hdis_start               : std_logic_vector(11 downto 0);
    signal hdis_end                 : std_logic_vector(11 downto 0);
    signal rand_rechts              : std_logic_vector(11 downto 0);
    signal hs_start                 : std_logic_vector(11 downto 0);
    signal h_total                  : std_logic_vector(11 downto 0);
    signal hdis_len                 : std_logic_vector(11 downto 0);
    signal MULF                     : std_logic_vector(5 downto 0);
    signal HHT                      : std_logic_vector(11 downto 0) := (others => '0');
    signal HHT_d                    : std_logic_vector(11 downto 0);
    signal HHT_q                    : std_logic_vector(11 downto 0);
    signal HBE                      : std_logic_vector(11 downto 0) := (others => '0');
    signal HBE_d                    : std_logic_vector(11 downto 0);
    signal HBE_q                    : std_logic_vector(11 downto 0);
    signal HDB                      : std_logic_vector(11 downto 0);
    signal HDB_d                    : std_logic_vector(11 downto 0);
    signal HDB_q                    : std_logic_vector(11 downto 0);
    signal HDE                      : std_logic_vector(11 downto 0);
    signal hde_d                    : std_logic_vector(11 downto 0);
    signal hde_q                    : std_logic_vector(11 downto 0);
    signal HBB                      : std_logic_vector(11 downto 0);
    signal HBB_d                    : std_logic_vector(11 downto 0);
    signal HBB_q                    : std_logic_vector(11 downto 0);
    signal HSS                      : std_logic_vector(11 downto 0) := (others => '0');
    signal HSS_d                    : std_logic_vector(11 downto 0);
    signal HSS_q                    : std_logic_vector(11 downto 0);
    signal rand_OBEN                : std_logic_vector(10 downto 0);
    signal VDIS_START               : std_logic_vector(10 downto 0);
    signal VDIS_end                 : std_logic_vector(10 downto 0);
    signal border_bottom               : std_logic_vector(10 downto 0);
    signal VS_START                 : std_logic_vector(10 downto 0);
    signal V_TOTAL                  : std_logic_vector(10 downto 0);
    signal VBE                      : std_logic_vector(10 downto 0);
    signal VBE_d                    : std_logic_vector(10 downto 0);
    signal VBE_q                    : std_logic_vector(10 downto 0);
    signal VDB                      : std_logic_vector(10 downto 0);
    signal VDB_d                    : std_logic_vector(10 downto 0);
    signal VDB_q                    : std_logic_vector(10 downto 0);
    signal VDE                      : std_logic_vector(10 downto 0);
    signal VDE_d                    : std_logic_vector(10 downto 0);
    signal VDE_q                    : std_logic_vector(10 downto 0);
    signal VBB                      : std_logic_vector(10 downto 0);
    signal VBB_d                    : std_logic_vector(10 downto 0);
    signal VBB_q                    : std_logic_vector(10 downto 0);
    signal VSS                      : std_logic_vector(10 downto 0);
    signal VSS_d                    : std_logic_vector(10 downto 0);
    signal VSS_q                    : std_logic_vector(10 downto 0);
    signal VFT                      : std_logic_vector(10 downto 0);
    signal VFT_d                    : std_logic_vector(10 downto 0);
    signal VFT_q                    : std_logic_vector(10 downto 0);
    signal VCO                      : std_logic_vector(8 downto 0);
    signal VCO_d                    : std_logic_vector(8 downto 0);
    signal VCO_ena                  : std_logic_vector(8 downto 0);
    signal VCO_q                    : std_logic_vector(8 downto 0);
    signal VCNTRL                   : std_logic_vector(3 downto 0) := (others => '0');
    signal vcntrl_d                 : std_logic_vector(3 downto 0);
    signal vcntrl_q                 : std_logic_vector(3 downto 0);
    signal u0_data                  : std_logic_vector(15 downto 0);
    signal u0_tridata               : std_logic_vector(15 downto 0);
    signal u1_data                  : std_logic_vector(15 downto 0);
    signal u1_tridata               : std_logic_vector(15 downto 0);
    -- signal st_shift_mode0_clk_ctrl  : std_logic;
    signal st_shift_mode0_ena_ctrl  : std_logic;
 	-- signal falcon_shift_mode0_clk_ctrl  : std_logic;
    signal falcon_shift_mode8_ena_ctrl  : std_logic;
	signal falcon_shift_mode0_ena_ctrl  : std_logic;
    
    signal acp_vctr24_ena_ctrl      : std_logic;
	signal acp_vctr16_ena_ctrl      : std_logic;
    signal acp_vctr8_ena_ctrl       : std_logic;
	signal acp_vctr6_ena_ctrl       : std_logic;
    signal acp_vctr0_ena_ctrl       : std_logic;
	
    signal atari_hh24_ena_ctrl      : std_logic;
    signal atari_hh16_ena_ctrl      : std_logic;
	signal atari_hh8_ena_ctrl       : std_logic;
    signal atari_hh0_ena_ctrl       : std_logic;
	signal atari_vh24_ena_ctrl      : std_logic;
    signal atari_vh16_ena_ctrl      : std_logic;
    signal atari_vh8_ena_ctrl       : std_logic;
    signal atari_vh0_ena_ctrl       : std_logic;
    signal atari_hl24_ena_ctrl      : std_logic;
	signal atari_hl16_ena_ctrl      : std_logic;
    signal atari_hl8_ena_ctrl       : std_logic;
    signal atari_hl0_ena_ctrl       : std_logic;
	signal atari_vl0_clk_ctrl       : std_logic;
    signal atari_vl24_ena_ctrl      : std_logic;
    signal atari_vl16_ena_ctrl      : std_logic;
	signal atari_vl8_ena_ctrl       : std_logic;
    signal atari_vl0_ena_ctrl       : std_logic;
	signal vr_dout0_ena_ctrl        : std_logic;
    signal vr_frq0_ena_ctrl         : std_logic;
	signal border_color16_ena_ctrl  : std_logic;
    signal border_color8_ena_ctrl   : std_logic;
	signal border_color0_ena_ctrl   : std_logic;
    signal sys_ctr0_ena_ctrl        : std_logic;
	signal lof8_ena_ctrl            : std_logic;
    signal lof0_ena_ctrl            : std_logic;
    signal lwd8_ena_ctrl            : std_logic;
    signal lwd0_ena_ctrl            : std_logic;
    signal HHT8_ena_ctrl            : std_logic;
	signal HHT0_ena_ctrl            : std_logic;
    signal HBE8_ena_ctrl            : std_logic;
    signal HBE0_ena_ctrl            : std_logic;
	signal HDB8_ena_ctrl            : std_logic;
    signal HDB0_ena_ctrl            : std_logic;
	signal HDE8_ena_ctrl            : std_logic;
    signal hde0_ena_ctrl            : std_logic;
    signal HBB8_ena_ctrl            : std_logic;
	signal HBB0_ena_ctrl            : std_logic;
    signal HSS0_clk_ctrl            : std_logic;
    signal HSS8_ena_ctrl            : std_logic;
    signal HSS0_ena_ctrl            : std_logic;
	signal VBE8_ena_ctrl            : std_logic;
    signal VBE0_ena_ctrl            : std_logic;
    signal VDB8_ena_ctrl            : std_logic;
    signal VDB0_ena_ctrl            : std_logic;
    signal VDE8_ena_ctrl            : std_logic;
	signal vde0_ena_ctrl            : std_logic;
    signal VBB8_ena_ctrl            : std_logic;
    signal VBB0_ena_ctrl            : std_logic;
	signal VSS8_ena_ctrl            : std_logic;
    signal VSS0_ena_ctrl            : std_logic;
	signal VFT8_ena_ctrl            : std_logic;
    signal VFT0_ena_ctrl            : std_logic;
    signal VCO0_ena_ctrl            : std_logic;
	signal VCNTRL0_ena_ctrl         : std_logic;
    signal VVCNT0_ena_ctrl          : std_logic;
    signal vsync_I0_ena_ctrl        : std_logic;
    signal SUB_PIXEL_CNT0_ena_ctrl  : std_logic;
	signal color8_2                 : std_logic;
    signal color8_1                 : std_logic;
    signal color1_3                 : std_logic;
    signal color1_2                 : std_logic;
	signal color1_1                 : std_logic;
    signal COLOR4_2                 : std_logic;
    signal COLOR4_1                 : std_logic;
    signal color16_2                : std_logic;
    signal color16_1                : std_logic;
    signal gnd                      : std_logic;
    signal u1_enabledt              : std_logic;
	signal u0_enabledt              : std_logic;
    signal vcntrl_cs                : std_logic;
    signal VCO_CS                   : std_logic;
    signal VFT_CS                   : std_logic;
    signal VSS_CS                   : std_logic;
    signal VBB_CS                   : std_logic;
    signal VDE_CS                   : std_logic;
	signal VDB_CS                   : std_logic;
    signal VBE_CS                   : std_logic;
    signal dop_fifo_clr_q           : std_logic;
    signal dop_fifo_clr_d           : std_logic;
	signal DOP_ZEI_q                : std_logic;
    signal DOP_ZEI_d                : std_logic;
    signal DOP_ZEI                  : std_logic;
    signal inter_zei_q              : std_logic;
	signal inter_zei_d              : std_logic;
    signal st_video                 : std_logic;
    signal falcon_video             : std_logic;
    signal HSS_CS                   : std_logic;
    signal HBB_CS                   : std_logic;
	signal hde_CS                   : std_logic;
    signal HDB_CS                   : std_logic;
    signal HBE_CS                   : std_logic;
    signal HHT_CS                   : std_logic;
    signal atari_vl_cs              : std_logic;
    signal atari_hl_CS              : std_logic;
    signal atari_vh_CS              : std_logic;
    signal atari_hh_CS              : std_logic;
    signal ATARI_SYNC               : std_logic;
    signal color24                  : std_logic;
    signal color16                  : std_logic;
    signal SYNC_PIX2_q              : std_logic;
    signal SYNC_PIX2_d              : std_logic;
    signal SYNC_PIX2                : std_logic;
    signal SYNC_PIX1_q              : std_logic;
    signal SYNC_PIX1_d              : std_logic;
	signal SYNC_PIX1                : std_logic;
    signal SYNC_PIX_q               : std_logic;
    signal SYNC_PIX_d               : std_logic;
    signal SYNC_PIX                 : std_logic;
	signal START_ZEILE_q            : std_logic;
    signal START_ZEILE_ena          : std_logic;
    signal START_ZEILE_d            : std_logic;
	signal START_ZEILE              : std_logic;
    signal clr_fifo_q               : std_logic;
    signal clr_fifo_ena             : std_logic;
    signal clr_fifo_d               : std_logic;
	signal fifo_rde_q               : std_logic;
    signal fifo_rde_d               : std_logic;
    signal RAND_ON                  : std_logic;
    signal VCO_OFF_q                : std_logic;
    signal VCO_OFF_d                : std_logic;
    signal VCO_OFF                  : std_logic;
    signal vco_on_q                 : std_logic;
    signal vco_on_d                 : std_logic;
    signal vco_on                   : std_logic;
    signal VCO_ZL_q                 : std_logic;
	signal VCO_ZL_ena               : std_logic;
    signal VCO_ZL_d                 : std_logic;
    signal VCO_ZL                   : std_logic;
    signal VDTRON_q                 : std_logic;
    signal VDTRON_d                 : std_logic;
    signal VDTRON                   : std_logic;
    signal DPO_OFF_q                : std_logic;
    signal DPO_OFF_d                : std_logic;
    signal DPO_OFF                  : std_logic;
	signal dpo_on_q                 : std_logic;
    signal dpo_on_d                 : std_logic;
    signal DPO_ON                   : std_logic;
    signal dpo_zl_q                 : std_logic;
    signal dpo_zl_ena               : std_logic;
	signal dpo_zl_d                 : std_logic;
    signal DPO_ZL                   : std_logic;
    signal disp_on_q                : std_logic;
    signal disp_on_d                : std_logic;
	signal DISP_ON                  : std_logic;
    signal nBLANK_q                 : std_logic;
    signal nBLANK_d                 : std_logic;
    signal vsync_START_q            : std_logic;
    signal vsync_START_ena          : std_logic;
    signal vsync_START_d            : std_logic;
    signal vsync_START              : std_logic;
    signal vsync_q                  : std_logic;
    signal vsync_d                  : std_logic;
    signal LAST_q                   : std_logic;
    signal LAST_d                   : std_logic;
    signal LAST                     : std_logic;
    signal hsync_START_q            : std_logic;
	signal hsync_START_d            : std_logic;
    signal hsync_START              : std_logic;
    signal hsync_q                  : std_logic;
    signal hsync_d                  : std_logic;
    signal CLUT_TA_q                : std_logic;
    signal CLUT_TA_d                : std_logic;
    signal CLUT_TA                  : std_logic;
    signal lwd_CS                   : std_logic;
    signal lof_CS                   : std_logic;
	signal sys_ctr_CS               : std_logic;
    signal acp_video_on             : std_logic;
    signal border_color_CS          : std_logic;
    signal acp_vctr_cs              : std_logic;
	signal falcon_shift_mode_CS     : std_logic;
    signal st_shift_mode_CS         : std_logic;
    signal ST_CLUT                  : std_logic;
    signal st_clut_cs               : std_logic;
	signal falcon_clut              : std_logic;
    signal falcon_clut_cs           : std_logic;
    signal video_reconfig_q         : std_logic;
    signal video_reconfig_d         : std_logic;
    signal video_pll_reconfig_cs    : std_logic;
    signal vr_wr_q                  : std_logic;
    signal vr_wr_d                  : std_logic;
	signal video_pll_config_cs      : std_logic;
    signal acp_clut                 : std_logic;
    signal acp_clut_cs              : std_logic;
    signal CLK13M_q                 : std_logic;
    signal CLK13M_d                 : std_logic;
    signal CLK13M                   : std_logic;
    signal CLK17M_q                 : std_logic;
    signal CLK17M_d                 : std_logic;
    signal CLK17M                   : std_logic;
    signal color4_i                 : std_logic;
    signal pixel_clk_i              : std_logic;
     
    -- Sub Module Interface Section

    function to_std_logic(X : in boolean) return std_logic is
        variable ret : std_logic;
    begin
        if x then
            ret := '1';
        else
            ret := '0';
        end if;
        return ret;
    end function to_std_logic;


    -- sizeIt replicates a value to an array of specific length.
    function sizeit(a : std_Logic; len : integer) return std_logic_vector is
        variable rep : std_logic_vector(len - 1 downto 0);
    begin
        for i in rep'range loop
            rep(i) := a;
        end loop;
        return rep;
    end function sizeit;

begin
    -- Register Section

    clut_mux_adr <= clut_mux_adr_q;
    
    -- missing signals that seem to got lost during conversion
    hsync <= hsync_q;
    acp_vctr <= acp_vctr_q;
    rand <= rand_q;
    atari_hh <= atari_hh_q;
    atari_hl <= atari_hl_q;
    HBE <= HBE_q;
    HSS <= HSS_q;
    VCO <= VCO_q;
    VCNTRL <= vcntrl_q;
    
    vsync <= vsync_q;
    nBLANK <= nBLANK_q;
    fifo_rde <= fifo_rde_q;
    border_color(23 downto 16) <= border_color_q(23 downto 16);
    border_color(15 downto 8) <= border_color_q(15 downto 8);
    border_color(7 downto 0) <= border_color_q(7 downto 0);
    ccsel <= ccsel_q;
    inter_zei <= inter_zei_q;
    dop_fifo_clr <= dop_fifo_clr_q;
    HHT <= HHT_q;
    
    process (pixel_clk_i)
    begin
        if rising_edge(pixel_clk_i) then
            clut_mux_adr_q <= clut_mux_adr_d;
            hsync_q <= hsync_d;
            vsync_q <= vsync_d;
            nBLANK_q <= nBLANK_d;
            fifo_rde_q <= fifo_rde_d;
            if border_color16_ena_ctrl = '1' then
                border_color_q(23 downto 16) <= border_color_d(23 downto 16);
            end if;
            if border_color8_ena_ctrl = '1' then
                border_color_q(15 downto 8) <= border_color_d(15 downto 8);
            end if;
            if border_color0_ena_ctrl = '1' then
                border_color_q(7 downto 0) <= border_color_d(7 downto 0);
            end if;
            ccsel_q <= ccsel_d;
            inter_zei_q <= inter_zei_d;
            dop_fifo_clr_q <= dop_fifo_clr_d;
        end if;
    end process;

    video_reconfig <= video_reconfig_q;

    vr_wr <= vr_wr_q;

    clr_fifo <= clr_fifo_q;
    process (pixel_clk_i)
    begin
        if rising_edge(pixel_clk_i) then
            if clr_fifo_ena = '1' then
                clr_fifo_q <= clr_fifo_d;
            end if;
        end if;
    end process;

    process (clk25m)
    begin
        if rising_edge(clk25m) then
            CLK13M_q <= CLK13M_d;
        end if;
    end process;

    vr_frq <= unsigned(vr_frq_q);
    
    process (main_clk)
    begin
        if rising_edge(main_clk) then
            vr_wr_q <= vr_wr_d;

            video_reconfig_q <= video_reconfig_d;

            CLK17M_q <= CLK17M_d;

            if vr_dout0_ena_ctrl = '1' then
                vr_dout_q <= vr_dout_d;
            end if;
            
            if vr_frq0_ena_ctrl = '1' then
                vr_frq_q <= vr_frq_d;
            end if;
            
            if st_shift_mode0_ena_ctrl = '1' then
                st_shift_mode_q <= st_shift_mode_d;
            end if;
            
            if falcon_shift_mode8_ena_ctrl = '1' then
                falcon_shift_mode_q(10 downto 8) <= falcon_shift_mode_d(10 downto 8);
            end if;
            
            if falcon_shift_mode0_ena_ctrl = '1' then
                falcon_shift_mode_q(7 downto 0) <= falcon_shift_mode_d(7 downto 0);
            end if;
            if acp_vctr24_ena_ctrl = '1' then
                acp_vctr_q(31 downto 24) <= acp_vctr_d(31 downto 24);
            end if;
            
            if acp_vctr16_ena_ctrl = '1' then
                acp_vctr_q(23 downto 16) <= acp_vctr_d(23 downto 16);
            end if;
            
            if acp_vctr8_ena_ctrl = '1' then
                acp_vctr_q(15 downto 8) <= acp_vctr_d(15 downto 8);
            end if;
            
            if acp_vctr6_ena_ctrl = '1' then
                acp_vctr_q(7 downto 6) <= acp_vctr_d(7 downto 6);
            end if;
            
            if acp_vctr0_ena_ctrl = '1' then
                acp_vctr_q(5 downto 0) <= acp_vctr_d(5 downto 0);
            end if;
    
            if sys_ctr0_ena_ctrl='1' then
                sys_ctr_q <= sys_ctr_d;
            end if;

            if lof8_ena_ctrl = '1' then
                lof_q(15 downto 8) <= lof_d(15 downto 8);
            end if;
 
            if lof0_ena_ctrl = '1' then
                lof_q(7 downto 0) <= lof_d(7 downto 0);
            end if;

            if lwd8_ena_ctrl = '1' then
                lwd_q(15 downto 8) <= lwd_d(15 downto 8);
            end if;

            if lwd0_ena_ctrl = '1' then
                lwd_q(7 downto 0) <= lwd_d(7 downto 0);
            end if;
 
            if HDB8_ena_ctrl = '1' then
                HDB_q(11 downto 8) <= HDB_d(11 downto 8);
            end if;
            
            if HDB0_ena_ctrl = '1' then
                HDB_q(7 downto 0) <= HDB_d(7 downto 0);
            end if;

            if HDE8_ena_ctrl = '1' then
                hde_q(11 downto 8) <= hde_d(11 downto 8);
            end if;

            if hde0_ena_ctrl = '1' then
                hde_q(7 downto 0) <= hde_d(7 downto 0);
            end if;

            if HBB8_ena_ctrl = '1' then
                HBB_q(11 downto 8) <= HBB_d(11 downto 8);
            end if;

            if HBB0_ena_ctrl = '1' then
                HBB_q(7 downto 0) <= HBB_d(7 downto 0);
            end if;

            if HSS8_ena_ctrl = '1' then
                HSS_q(11 downto 8) <= HSS_d(11 downto 8);
            end if;

            if HSS0_ena_ctrl='1' then
                HSS_q(7 downto 0) <= HSS_d(7 downto 0);
            end if;

            dop_zei_q <= dop_zei_d;

            if VBE8_ena_ctrl = '1' then
                VBE_q(10 downto 8) <= VBE_d(10 downto 8);
            end if;

            if VBE0_ena_ctrl = '1' then
                VBE_q(7 downto 0) <= VBE_d(7 downto 0);
            end if;

            if VDB8_ena_ctrl = '1' then
                VDB_q(10 downto 8) <= VDB_d(10 downto 8);
            end if;

            if VDB0_ena_ctrl = '1' then
                VDB_q(7 downto 0) <= VDB_d(7 downto 0);
            end if;

            if VDE8_ena_ctrl = '1' then
                VDE_q(10 downto 8) <= VDE_d(10 downto 8);
            end if;

            if vde0_ena_ctrl = '1' then
                VDE_q(7 downto 0) <= VDE_d(7 downto 0);
            end if;

            if VBB8_ena_ctrl = '1' then
                VBB_q(10 downto 8) <= VBB_d(10 downto 8);
            end if;

            if VBB0_ena_ctrl = '1' then
                VBB_q(7 downto 0) <= VBB_d(7 downto 0);
            end if;

            if VSS8_ena_ctrl = '1' then
                VSS_q(10 downto 8) <= VSS_d(10 downto 8);
            end if;

            if VSS0_ena_ctrl = '1' then
                VSS_q(7 downto 0) <= VSS_d(7 downto 0);
            end if;

            if VFT8_ena_ctrl = '1' then
                VFT_q(10 downto 8) <= VFT_d(10 downto 8);
            end if;

            if VFT0_ena_ctrl = '1' then
                VFT_q(7 downto 0) <= VFT_d(7 downto 0);
            end if;

            if VCO_ena(8) = '1' then
                VCO_q(8) <= VCO_d(8);
            end if;

            if VCO0_ena_ctrl = '1' then
                VCO_q(7 downto 0) <= VCO_d(7 downto 0);
            end if;

            if vcntrl0_ena_ctrl = '1' then
                vcntrl_q <= vcntrl_d;
            end if;
        end if;
    end process;

    process (pixel_clk_i)
    begin
        if rising_edge(pixel_clk_i) then
            clut_mux_av1_q <= clut_mux_av1_d;
            clut_mux_av0_q <= clut_mux_av0_d;
            CLUT_TA_q <= CLUT_TA_d;
            hsync_I_q <= hsync_I_d;
            HSY_LEN_q <= HSY_LEN_d;
            hsync_START_q <= hsync_START_d;
            LAST_q <= LAST_d;
            
            if vsync_START_ena = '1' then
                vsync_START_q <= vsync_START_d;
            end if;
            
            if vsync_I0_ena_ctrl='1' then
                vsync_I_q <= vsync_I_d;
            end if;
            
            disp_on_q <= disp_on_d;
            
            if dpo_zl_ena = '1' then
                dpo_zl_q <= dpo_zl_d;
            end if;
            
            dpo_on_q <= dpo_on_d;
            DPO_OFF_q <= DPO_OFF_d;
            VDTRON_q <= VDTRON_d;
            
            if VCO_ZL_ena = '1' then
                VCO_ZL_q <= VCO_ZL_d;
            end if;
            
            vco_on_q <= vco_on_d;
            VCO_OFF_q <= VCO_OFF_d;
            vhcnt_q <= vhcnt_d;
        
            if sub_pixel_cnt0_ena_ctrl = '1' then
                sub_pixel_cnt_q <= sub_pixel_cnt_d;
            end if;
            
            if vvcnt0_ena_ctrl='1' then
                vvcnt_q <= vvcnt_d;
            end if;
            
            verz2_q <= verz2_d;
            verz1_q <= verz1_d;
            VERZ0_q <= VERZ0_d;
            rand_q <= rand_d;
            
            if START_ZEILE_ena = '1' then
                START_ZEILE_q <= START_ZEILE_d;
            end if;
            
            SYNC_PIX_q <= SYNC_PIX_d;
            SYNC_PIX1_q <= SYNC_PIX1_d;
            SYNC_PIX2_q <= SYNC_PIX2_d;

            if atari_hh24_ena_ctrl = '1' then
                atari_hh_q(31 downto 24) <= atari_hh_d(31 downto 24);
            end if;
            
            if atari_hh16_ena_ctrl = '1' then
                atari_hh_q(23 downto 16) <= atari_hh_d(23 downto 16);
            end if;
            
            if atari_hh8_ena_ctrl = '1' then
                atari_hh_q(15 downto 8) <= atari_hh_d(15 downto 8);
            end if;
            
            if atari_hh0_ena_ctrl = '1' then
                atari_hh_q(7 downto 0) <= atari_hh_d(7 downto 0);
            end if;
            
            if atari_vh24_ena_ctrl = '1' then
                atari_vh_q(31 downto 24) <= atari_vh_d(31 downto 24);
            end if;
            
            if atari_vh16_ena_ctrl = '1' then
                atari_vh_q(23 downto 16) <= atari_vh_d(23 downto 16);
            end if;
            
            if atari_vh8_ena_ctrl = '1' then
                atari_vh_q(15 downto 8) <= atari_vh_d(15 downto 8);
            end if;
            
            if atari_vh0_ena_ctrl='1' then
                atari_vh_q(7 downto 0) <= atari_vh_d(7 downto 0);
            end if;
            
            if atari_hl24_ena_ctrl = '1' then
                atari_hl_q(31 downto 24) <= atari_hl_d(31 downto 24);
            end if;
            
            if atari_hl16_ena_ctrl = '1' then
                atari_hl_q(23 downto 16) <= atari_hl_d(23 downto 16);
            end if;
            
            if atari_hl8_ena_ctrl = '1' then
                atari_hl_q(15 downto 8) <= atari_hl_d(15 downto 8);
            end if;
            
            if atari_hl0_ena_ctrl = '1' then
                atari_hl_q(7 downto 0) <= atari_hl_d(7 downto 0);
            end if;
            
            if atari_vl24_ena_ctrl = '1' then
                atari_vl_q(31 downto 24) <= atari_vl_d(31 downto 24);
            end if;
            
            if atari_vl16_ena_ctrl = '1' then
                atari_vl_q(23 downto 16) <= atari_vl_d(23 downto 16);
            end if;
            
            if atari_vl8_ena_ctrl = '1' then
                atari_vl_q(15 downto 8) <= atari_vl_d(15 downto 8);
            end if;
            
            if atari_vl0_ena_ctrl = '1' then
                atari_vl_q(7 downto 0) <= atari_vl_d(7 downto 0);
            end if;
            
            if HHT8_ena_ctrl = '1' then
                HHT_q(11 downto 8) <= HHT_d(11 downto 8);
            end if;
            
            if HHT0_ena_ctrl = '1' then
                HHT_q(7 downto 0) <= HHT_d(7 downto 0);
            end if;
            
            if HBE8_ena_ctrl = '1' then
                HBE_q(11 downto 8) <= HBE_d(11 downto 8);
            end if;
            
            if HBE0_ena_ctrl = '1' then
                HBE_q(7 downto 0) <= HBE_d(7 downto 0);
            end if;
        end if;
    end process;


-- Start of original equations

    --  BYT SELECT 32 BIT
    --  ADR==0
    -- fb_b(0) <= to_std_logic(fb_adr(1 downto 0) = "00");
    fb_b(0) <= '1' when fb_adr(1 downto 0) = "00" else '0';

    --  ADR==1
    --  HIGH WORD
    --  LONG UND LINE
    fb_b(1) <= to_std_logic(fb_adr(1 downto 0) = "01") or
                           (fb_size1 and (not fb_size0) and (not fb_adr(1))) or (fb_size1 and fb_size0) or
                           ((not fb_size1) and (not fb_size0));

    --  ADR==2
    --  LONG UND LINE
    fb_b(2) <= to_std_logic(fb_adr(1 downto 0) = "10") or
                                  (fb_size1 and fb_size0) or
                                  ((not fb_size1) and (not fb_size0));

    --  ADR==3
    --  LOW WORD
    --  LONG UND LINE
    fb_b(3) <= to_std_logic(fb_adr(1 downto 0) = "11") or
                           (fb_size1 and (not fb_size0) and fb_adr(1)) or
                           (fb_size1 and fb_size0) or
                           ((not fb_size1) and (not fb_size0));

    --  BYT SELECT 16 BIT
    --  ADR==0
    FB_16B(0) <= to_std_logic(fb_adr(0) = '0');

    --  ADR==1
    --  NOT BYT
    FB_16B(1) <= to_std_logic(fb_adr(0) = '1') or (not ((not fb_size1) and fb_size0));

    --  ACP CLUT --
    --  0-3FF/1024
    acp_clut_cs <= to_std_logic(((not nFB_CS2) = '1') and fb_adr(27 downto 10) = "000000000000000000");
    acp_clut_rd <= acp_clut_cs and (not nFB_OE);
    acp_clut_wr <= fb_b and sizeIt(acp_clut_cs, 4) and sizeIt(not nFB_WR, 4);
    CLUT_TA_d <= (acp_clut_cs or falcon_clut_cs or st_clut_cs) and (not video_mod_ta);

    -- FALCON CLUT --
    --  $F9800/$400
    falcon_clut_cs <= to_std_logic(((not nFB_CS1) = '1') and fb_adr(19 downto 10) = "1111100110");

    --  HIGH WORD
    falcon_clut_rdh <= falcon_clut_cs and (not nFB_OE) and (not fb_adr(1));

    --  LOW WORD
    falcon_clut_rdl <= falcon_clut_cs and (not nFB_OE) and fb_adr(1);
    falcon_clut_wr(1 downto 0) <= FB_16B and std_logic_vector'((not fb_adr(1)) &
                   (not fb_adr(1))) and std_logic_vector'(falcon_clut_cs & falcon_clut_cs) and std_logic_vector'((not nFB_WR) & (not nFB_WR));
    falcon_clut_wr(3 downto 2) <= FB_16B and std_logic_vector'(fb_adr(1) & fb_adr(1)) and std_logic_vector'(falcon_clut_cs & falcon_clut_cs) and
                   std_logic_vector'((not nFB_WR) & (not nFB_WR));

    --  ST CLUT --
    --  $F8240/$20
    st_clut_cs <= to_std_logic(((not nFB_CS1)='1') and fb_adr(19 downto 5) = "111110000010010");
    st_clut_rd <= st_clut_cs and (not nFB_OE);
    st_clut_wr <= FB_16B and std_logic_vector'(st_clut_cs & st_clut_cs) and std_logic_vector'((not nFB_WR) & (not nFB_WR));

    --  ST shift mode

    --  $F8260/2
    st_shift_mode_cs <= '1' when nFB_CS1 = '0' and fb_adr(19 downto 1) = 19x"7c130" else '0';
    -- st_shift_mode_CS <= to_std_logic(((not nFB_CS1)='1') and fb_adr(19 downto 1) = "1111100000100110000");
    st_shift_mode_d <= fb_ad_in(25 downto 24) when st_shift_mode_cs;
    st_shift_mode0_ena_ctrl <= st_shift_mode_CS and (not nFB_WR) and fb_b(0);

    --  MONO
    color1_1 <= to_std_logic(st_shift_mode_q = "10") and (not color8) and st_video and (not acp_video_on);

    --  4 FARBEN
    color2 <= to_std_logic(st_shift_mode_q = "01") and (not color8) and st_video and (not acp_video_on);

    --  16 FARBEN
    COLOR4_1 <= to_std_logic(st_shift_mode_q = "00") and (not color8) and st_video and (not acp_video_on);

    --  FALCON shift mode

    --  $F8266/2
    falcon_shift_mode_CS <= to_std_logic(((not nFB_CS1)='1') and fb_adr(19 downto 1) = "1111100000100110011");
    falcon_shift_mode_d <= fb_ad_in(26 downto 16) when falcon_shift_mode_cs;
    falcon_shift_mode8_ena_ctrl <= falcon_shift_mode_CS and (not nFB_WR) and fb_b(2);
    falcon_shift_mode0_ena_ctrl <= falcon_shift_mode_CS and (not nFB_WR) and fb_b(3);

    clut_off <= falcon_shift_mode_q(3 downto 0) and sizeIt(COLOR4_i, 4);
    color1_2 <= falcon_shift_mode_q(10) and (not color16) and (not color8) and falcon_video and (not acp_video_on);
    color8_1 <= falcon_shift_mode_q(4) and (not color16) and falcon_video and (not acp_video_on);
    color16_1 <= falcon_shift_mode_q(8) and falcon_video and (not acp_video_on);
    COLOR4_2 <= (not color1) and (not color16) and (not color8) and falcon_video and (not acp_video_on);

    --  ACP VIDEO CONTROL
    --  BIT 0 = ACP VIDEO ON
    --  BIT 1 = POWER ON VIDEO DAC
    --  BIT 2 = ACP 24BIT
    --  BIT 3 = ACP 16BIT
    --  BIT 4 = ACP 8BIT
    --  BIT 5 = ACP 1BIT
    --  BIT 6 = FALCON SHifT MODE
    --  BIT 7 = ST SHifT MODE
    --  BIT 9..8 = VCLK FREQUENZ
    --  BIT 15 =-SYNC ALLOWED
    --  BIT 31..16 = video_ram_ctr
    --  BIT 25 = RANDFARBE EINSCHALTEN
    --  BIT 26 = STANDARD ATARI SYNCS

    --  $400/4
    acp_vctr_cs <= to_std_logic(((not nFB_CS2)='1') and fb_adr(27 downto 2) = "00000000000000000100000000");
   
    acp_vctr_d(31 downto 8) <= fb_ad_in(31 downto 8) when acp_vctr_cs;
    acp_vctr_d(5 downto 0) <= fb_ad_in(5 downto 0) when acp_vctr_cs;
   
    acp_vctr24_ena_ctrl <= acp_vctr_cs and fb_b(0) and (not nFB_WR);
    acp_vctr16_ena_ctrl <= acp_vctr_cs and fb_b(1) and (not nFB_WR);
    acp_vctr8_ena_ctrl <= acp_vctr_cs and fb_b(2) and (not nFB_WR);
    acp_vctr0_ena_ctrl <= acp_vctr_cs and fb_b(3) and (not nFB_WR);
    acp_video_on <= acp_vctr_q(0);
    nPD_VGA <= acp_vctr_q(1);

    --  ATARI MODUS
    --  WENN 1 AUTOMATISCHE AUFLÃƒâ€“SUNG
    ATARI_SYNC <= acp_vctr_q(26);

    --  HORIZONTAL TIMING 640x480

    --  $410/4
    atari_hh_cs <= to_std_logic(((not nFB_CS2)='1') and fb_adr(27 downto 2) = "00000000000000000100000100");
    atari_hh_d <= fb_ad_in when atari_hh_cs;
    atari_hh24_ena_ctrl <= atari_hh_cs and fb_b(0) and (not nFB_WR);
    atari_hh16_ena_ctrl <= atari_hh_cs and fb_b(1) and (not nFB_WR);
    atari_hh8_ena_ctrl <= atari_hh_cs and fb_b(2) and (not nFB_WR);
    atari_hh0_ena_ctrl <= atari_hh_cs and fb_b(3) and (not nFB_WR);

    --  VERTIKAL TIMING 640x480

    --  $414/4
    atari_vh_cs <= to_std_logic(((not nFB_CS2)='1') and fb_adr(27 downto 2) = "00000000000000000100000101");
    atari_vh_d <= fb_ad_in when atari_vh_cs;
    atari_vh24_ena_ctrl <= atari_vh_cs and fb_b(0) and (not nFB_WR);
    atari_vh16_ena_ctrl <= atari_vh_cs and fb_b(1) and (not nFB_WR);
    atari_vh8_ena_ctrl <= atari_vh_cs and fb_b(2) and (not nFB_WR);
    atari_vh0_ena_ctrl <= atari_vh_cs and fb_b(3) and (not nFB_WR);

    --  HORIZONTAL TIMING 320x240

    --  $418/4
    atari_hl_cs <= to_std_logic(((not nFB_CS2)='1') and fb_adr(27 downto 2) = "00000000000000000100000110");
    atari_hl_d <= fb_ad_in when atari_hl_cs;
    atari_hl24_ena_ctrl <= atari_hl_cs and fb_b(0) and (not nFB_WR);
    atari_hl16_ena_ctrl <= atari_hl_cs and fb_b(1) and (not nFB_WR);
    atari_hl8_ena_ctrl <= atari_hl_cs and fb_b(2) and (not nFB_WR);
    atari_hl0_ena_ctrl <= atari_hl_cs and fb_b(3) and (not nFB_WR);

    --  VERTIKAL TIMING 320x240

    --  $41C/4
    atari_vl_cs <= to_std_logic(((not nFB_CS2)='1') and fb_adr(27 downto 2) = "00000000000000000100000111");
    atari_vl_d <= fb_ad_in when atari_vl_cs;
    atari_vl24_ena_ctrl <= atari_vl_cs and fb_b(0) and (not nFB_WR);
    atari_vl16_ena_ctrl <= atari_vl_cs and fb_b(1) and (not nFB_WR);
    atari_vl8_ena_ctrl <= atari_vl_cs and fb_b(2) and (not nFB_WR);
    atari_vl0_ena_ctrl <= atari_vl_cs and fb_b(3) and (not nFB_WR);

    --  VIDEO PLL CONFIG
    --  $(F)000'0600-7FF ->6/2 WORD RESP LONG ONLY
    video_pll_config_cs <= to_std_logic(((not nFB_CS2)='1') and fb_adr(27 downto 9) = "0000000000000000011") and fb_b(0) and fb_b(1);
    vr_wr_d <= video_pll_config_cs and (not nFB_WR) and (not vr_busy) and (not vr_wr_q);
    vr_rd <= video_pll_config_cs and nFB_WR and (not vr_busy);
    vr_dout0_ena_ctrl <= not vr_busy;
    vr_dout_d <= vr_d;
    vr_frq0_ena_ctrl <= to_std_logic(vr_wr_q='1' and fb_adr(8 downto 0) = "000000100");
    vr_frq_d <= fb_ad_in(23 downto 16) when video_pll_config_cs;

    --  VIDEO PLL RECONFIG
    --  $(F)000'0800
    video_pll_reconfig_cs <= to_std_logic(((not nFB_CS2)='1') and fb_adr(27 downto 0) = "0000000000000000100000000000") and fb_b(0);
    video_reconfig_d <= video_pll_reconfig_cs and (not nFB_WR) and (not vr_busy) and (not video_reconfig_q);

    -- ----------------------------------------------------------------------------------------------------------------------
    video_ram_ctr <= acp_vctr_q(31 downto 16);

    -- ------------ COLOR MODE IM ACP SETZEN
    color1_3 <= acp_vctr_q(5) and (not acp_vctr_q(4)) and (not acp_vctr_q(3)) and (not acp_vctr_q(2)) and acp_video_on;
    color8_2 <= acp_vctr_q(4) and (not acp_vctr_q(3)) and (not acp_vctr_q(2)) and acp_video_on;
    color16_2 <= acp_vctr_q(3) and (not acp_vctr_q(2)) and acp_video_on;
    color24 <= acp_vctr_q(2) and acp_video_on;
    acp_clut <= (acp_video_on and (color1 or color8)) or (st_video and color1);

    --  ST ODER FALCON SHifT MODE SETZEN WENN WRITE X..SHifT REGISTER
    acp_vctr_d(7) <= falcon_shift_mode_CS and (not nFB_WR) and (not acp_video_on);
    acp_vctr_d(6) <= st_shift_mode_CS and (not nFB_WR) and (not acp_video_on);
   
    acp_vctr6_ena_ctrl <= (falcon_shift_mode_CS and (not nFB_WR)) or (st_shift_mode_CS and (not nFB_WR)) or (acp_vctr_cs and fb_b(3) and (not nFB_WR) and fb_ad_in(0));
    falcon_video <= acp_vctr_q(7);
    falcon_clut <= falcon_video and (not acp_video_on) and (not color16);
    st_video <= acp_vctr_q(6);
    ST_CLUT <= st_video and (not acp_video_on) and (not falcon_clut) and (not color1);
    pixel_clk_i <= pixel_clk;

    --  ONLY FOR INFORMATION
    ccsel_d <= ("000" and sizeIt(ST_CLUT,3)) or ("001" and
                sizeIt(falcon_clut,3)) or ("100" and sizeIt(acp_clut,3)) or ("101" and
                sizeIt(color16,3)) or ("110" and sizeIt(color24,3)) or ("111" and
                sizeIt(RAND_ON,3));

    --  DIVERSE (VIDEO)-REGISTER ----------------------------
    --  randFARBE

    --  $404/4
    border_color_CS <= to_std_logic(((not nFB_CS2) = '1') and fb_adr(27 downto 2) = "00000000000000000100000001");
    border_color_d <= fb_ad_in(23 downto 0) when border_color_cs;
    border_color16_ena_ctrl <= border_color_CS and fb_b(1) and (not nFB_WR);
    border_color8_ena_ctrl <= border_color_CS and fb_b(2) and (not nFB_WR);
    border_color0_ena_ctrl <= border_color_CS and fb_b(3) and (not nFB_WR);

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
    sys_ctr_cs <= '1' when nFB_CS1 = '0' and f_addr_cmp_w(fb_adr, 20x"f8006") = '1' else '0';
            -- fb_adr(19 downto 1) = std_logic_vector'(20x"f8006")(19 downto 1) else '0';
    
    -- sys_ctr_CS <= to_std_logic(((not nFB_CS1) = '1') and fb_adr(19 downto 1) = "1111100000000000011");
    sys_ctr_d <= fb_ad_in(22 downto 16) when sys_ctr_cs;
    sys_ctr0_ena_ctrl <= sys_ctr_CS and (not nFB_WR) and fb_b(3);
    blitter_on <= not sys_ctr_q(3);

    --  lof
    --  $820E/2
    lof_CS <= to_std_logic(((not nFB_CS1)='1') and fb_adr(19 downto 1) = "1111100000100000111");
    lof_d <= fb_ad_in(31 downto 16) when lof_cs;
    lof8_ena_ctrl <= lof_CS and (not nFB_WR) and fb_b(2);
    lof0_ena_ctrl <= lof_CS and (not nFB_WR) and fb_b(3);
    lof <= lof_q;
    
    --  lwd
    --  $8210/2
    lwd_CS <= to_std_logic(((not nFB_CS1)='1') and fb_adr(19 downto 1) = "1111100000100001000");
    lwd_d <= fb_ad_in(31 downto 16) when lwd_cs;
    lwd8_ena_ctrl <= lwd_CS and (not nFB_WR) and fb_b(0);
    lwd0_ena_ctrl <= lwd_CS and (not nFB_WR) and fb_b(1);

    --  HORIZONTAL
    --  HHT
    --  $8282/2
    HHT_CS <= to_std_logic(((not nFB_CS1)='1') and fb_adr(19 downto 1) = "1111100000101000001");
    HHT_d <= fb_ad_in(27 downto 16) when hht_cs;
    HHT8_ena_ctrl <= HHT_CS and (not nFB_WR) and fb_b(2);
    HHT0_ena_ctrl <= HHT_CS and (not nFB_WR) and fb_b(3);

    --  HBE
    --  $8286/2
    HBE_CS <= to_std_logic(((not nFB_CS1)='1') and fb_adr(19 downto 1) = "1111100000101000011");
    HBE_d <= fb_ad_in(27 downto 16) when hbe_cs;
    HBE8_ena_ctrl <= HBE_CS and (not nFB_WR) and fb_b(2);
    HBE0_ena_ctrl <= HBE_CS and (not nFB_WR) and fb_b(3);

    --  HDB
    --  $8288/2
    HDB_CS <= to_std_logic(((not nFB_CS1)='1') and fb_adr(19 downto 1) = "1111100000101000100");
    HDB_d <= fb_ad_in(27 downto 16) when hdb_cs;
    HDB8_ena_ctrl <= HDB_CS and (not nFB_WR) and fb_b(0);
    HDB0_ena_ctrl <= HDB_CS and (not nFB_WR) and fb_b(1);

    --  HDE
    --  $828A/2
    HDE_CS <= to_std_logic(((not nFB_CS1)='1') and fb_adr(19 downto 1) = "1111100000101000101");
    HDE_d <= fb_ad_in(27 downto 16) when hde_cs;
    HDE8_ena_ctrl <= HDE_CS and (not nFB_WR) and fb_b(2);
    HDE0_ena_ctrl <= HDE_CS and (not nFB_WR) and fb_b(3);

    --  HBB
    --  $8284/2
    HBB_CS <= to_std_logic(((not nFB_CS1)='1') and fb_adr(19 downto 1) = "1111100000101000010");
    HBB_d <= fb_ad_in(27 downto 16) when hbb_cs;
    HBB8_ena_ctrl <= HBB_CS and (not nFB_WR) and fb_b(0);
    HBB0_ena_ctrl <= HBB_CS and (not nFB_WR) and fb_b(1);

    --  HSS
    --  Videl hsync start register $828C / 2
    HSS_CS <= to_std_logic(((not nFB_CS1)='1') and fb_adr(19 downto 1) = "1111100000101000110");
    HSS_d <= fb_ad_in(27 downto 16) when hss_cs;
    HSS8_ena_ctrl <= HSS_CS and (not nFB_WR) and fb_b(0);
    HSS0_ena_ctrl <= HSS_CS and (not nFB_WR) and fb_b(1);

    --  VERTIKAL
    --  VBE
    --  $82A6/2
    VBE_CS <= to_std_logic(((not nFB_CS1)='1') and fb_adr(19 downto 1) = "1111100000101010011");
    VBE_d <= fb_ad_in(26 downto 16) when vbe_cs;
    VBE8_ena_ctrl <= VBE_CS and (not nFB_WR) and fb_b(2);
    VBE0_ena_ctrl <= VBE_CS and (not nFB_WR) and fb_b(3);

    --  VDB
    --  $82A8/2
    VDB_CS <= to_std_logic(((not nFB_CS1)='1') and fb_adr(19 downto 1) = "1111100000101010100");
    VDB_d <= fb_ad_in(26 downto 16) when vdb_cs;
    VDB8_ena_ctrl <= VDB_CS and (not nFB_WR) and fb_b(0);
    VDB0_ena_ctrl <= VDB_CS and (not nFB_WR) and fb_b(1);

    --  VDE
    --  $82AA/2
    VDE_CS <= to_std_logic(((not nFB_CS1)='1') and fb_adr(19 downto 1) = "1111100000101010101");
    VDE_d <= fb_ad_in(26 downto 16) when vde_cs;
    VDE8_ena_ctrl <= VDE_CS and (not nFB_WR) and fb_b(2);
    VDE0_ena_ctrl <= VDE_CS and (not nFB_WR) and fb_b(3);

    --  VBB
    --  $82A4/2
    VBB_CS <= to_std_logic(((not nFB_CS1)='1') and fb_adr(19 downto 1) = "1111100000101010010");
    VBB_d <= fb_ad_in(26 downto 16) when vbb_cs;
    VBB8_ena_ctrl <= VBB_CS and (not nFB_WR) and fb_b(0);
    VBB0_ena_ctrl <= VBB_CS and (not nFB_WR) and fb_b(1);

    --  VSS
    --  $82AC/2
    VSS_CS <= to_std_logic(((not nFB_CS1)='1') and fb_adr(19 downto 1) = "1111100000101010110");
    VSS_d <= fb_ad_in(26 downto 16) when vss_cs;
    VSS8_ena_ctrl <= VSS_CS and (not nFB_WR) and fb_b(0);
    VSS0_ena_ctrl <= VSS_CS and (not nFB_WR) and fb_b(1);

    --  VFT
    --  $82A2/2
    -- VFT_CS <= to_std_logic(((not nFB_CS1)='1') and fb_adr(19 downto 1) = "1111100000101010001");
    vft_cs <= not nFB_CS1 and f_addr_cmp_w(fb_adr(19 downto 0), x"f82a2");
    VFT_d <= fb_ad_in(26 downto 16) when vft_cs;
    VFT8_ena_ctrl <= VFT_CS and (not nFB_WR) and fb_b(2);
    VFT0_ena_ctrl <= VFT_CS and (not nFB_WR) and fb_b(3);

    --  VCO
    --  $82C0 / 2 Falcon clock control register VCO
    VCO_CS <= to_std_logic(((not nFB_CS1)='1') and fb_adr(19 downto 1) = "1111100000101100000");
    VCO_d <= fb_ad_in(24 downto 16) when vco_cs;
    VCO_ena(8) <= VCO_CS and (not nFB_WR) and fb_b(0);
    VCO0_ena_ctrl <= VCO_CS and (not nFB_WR) and fb_b(1);

    --  VCNTRL
    --  $82C2 / 2 Falcon resolution control register VCNTRL
    vcntrl_cs <= '1' when nFB_CS1 = '0' and f_addr_cmp_w(fb_adr(19 downto 0), x"f82c2") = '1' else '0';
    vcntrl_d <= fb_ad_in(19 downto 16) when vcntrl_cs;
    VCNTRL0_ena_ctrl <= vcntrl_cs and (not nFB_WR) and fb_b(3);

-- - REGISTER OUT
--  low word register access
--   u0_data <= (sizeIt(st_shift_mode_CS,16) and std_logic_vector'("000000" & st_shift_mode_q & "00000000")) or
--              (sizeIt(falcon_shift_mode_CS,16) and std_logic_vector'("00000" & falcon_shift_mode_q)) or
--              (sizeIt(sys_ctr_CS,16) and std_logic_vector'("100000000" & sys_ctr_q(6 downto 4) & (not blitter_run) & sys_ctr_q(2 downto 0))) or
--              (sizeIt(lof_CS,16) and lof_q) or (sizeIt(lwd_CS,16) and lwd_q) or
--              (sizeIt(HBE_CS,16) and std_logic_vector'("0000" & HBE_q)) or
--              (sizeIt(HDB_CS,16) and std_logic_vector'("0000" & HDB_q)) or
--              (sizeIt(hde_CS,16) and std_logic_vector'("0000" & hde_q)) or
--              (sizeIt(HBB_CS,16) and std_logic_vector'("0000" & HBB_q)) or
--              (sizeIt(HSS_CS,16) and std_logic_vector'("0000" & HSS_q)) or
--              (sizeIt(HHT_CS,16) and std_logic_vector'("0000" & HHT_q)) or
--              (sizeIt(VBE_CS,16) and std_logic_vector'("00000" & VBE_q)) or
--              (sizeIt(VDB_CS,16) and std_logic_vector'("00000" & VDB_q)) or
--              (sizeIt(VDE_CS,16) and std_logic_vector'("00000" & VDE_q)) or
--              (sizeIt(VBB_CS,16) and std_logic_vector'("00000" & VBB_q)) or
--              (sizeIt(VSS_CS,16) and std_logic_vector'("00000" & VSS_q)) or
--              (sizeIt(VFT_CS,16) and std_logic_vector'("00000" & VFT_q)) or
--              (sizeIt(VCO_CS,16) and std_logic_vector'("0000000" & VCO_q)) or
--              (sizeIt(vcntrl_cs,16) and std_logic_vector'("000000000000" & vcntrl_q)) or
--              (sizeIt(acp_vctr_cs,16) and acp_vctr_q(31 downto 16)) or
--              (sizeIt(atari_hh_CS,16) and atari_hh_q(31 downto 16)) or
--              (sizeIt(atari_vh_CS,16) and atari_vh_q(31 downto 16)) or
--              (sizeIt(atari_hl_CS,16) and atari_hl_q(31 downto 16)) or
--              (sizeIt(atari_vl_cs,16) and atari_vl_q(31 downto 16)) or
--              (sizeIt(border_color_CS,16) and std_logic_vector'("00000000" & border_color_q(23 downto 16))) or
--              (sizeIt(video_pll_config_cs,16) and std_logic_vector'("0000000" & vr_dout_q)) or
--              (sizeIt(video_pll_reconfig_cs,16) and std_logic_vector'(vr_busy & "0000" & vr_wr_q & vr_rd & video_reconfig_q & "11111010"));
    
    fb_ad_out(31 downto 16) <= "000000" & st_shift_mode_q & "00000000" when st_shift_mode_cs = '1' else
                               "100000000" & sys_ctr_q(6 downto 4) & (not blitter_run) & sys_ctr_q(2 downto 0) when sys_ctr_cs = '1' else
                               lwd_q when lof_cs = '1' and lwd_cs = '1' else
                               "0000" & hbe_q when hbe_cs = '1' else
                               "0000" & hdb_q when hdb_cs = '1' else
                               "0000" & hde_q when hde_cs = '1' else
                               "0000" & hbb_q when hbb_cs = '1' else
                               "0000" & hss_q when hss_cs = '1' else
                               "0000" & hht_q when hht_cs = '1' else
                               "00000" & vbe_q when vbe_cs = '1' else
                               "00000" & vdb_q when vdb_cs = '1' else
                               "00000" & vde_q when vde_cs = '1' else
                               "00000" & vbb_q when vbb_cs = '1' else
                               "00000" & vss_q when vss_cs = '1' else
                               "00000" & vft_q when vft_cs = '1' else
                               "0000000" & vco_q when vco_cs = '1' else
                               "000000000000" & vcntrl_q when vcntrl_cs = '1' else
                               acp_vctr_q(31 downto 16) when acp_vctr_cs = '1' else
                               atari_hh_q(31 downto 16) when atari_hh_cs = '1' else
                               atari_vh_q(31 downto 16) when atari_vh_cs = '1' else
                               atari_hl_q(31 downto 16) when atari_hl_cs = '1' else
                               atari_vl_q(31 downto 16) when atari_vl_cs = '1' else
                               "00000000" & border_color_q(23 downto 16) when border_color_cs = '1' else
                               "0000000" & vr_dout_q when video_pll_config_cs = '1' else
                               vr_busy & "0000" & vr_wr_q & vr_rd & video_reconfig_q & "11111010" when video_pll_reconfig_cs = '1' else
                               (others => 'Z');
                   
--    u0_enabledt <= (st_shift_mode_CS or falcon_shift_mode_CS or acp_vctr_cs or border_color_CS or sys_ctr_CS or lof_CS or lwd_CS or HBE_CS or HDB_CS or
--	                hde_CS or HBB_CS or HSS_CS or HHT_CS or atari_hh_CS or atari_vh_CS or atari_hl_CS or atari_vl_cs or video_pll_config_cs or
--                    video_pll_reconfig_cs or VBE_CS or VDB_CS or VDE_CS or VBB_CS or VSS_CS or VFT_CS or VCO_CS or vcntrl_cs) and (not nFB_OE);
--    fb_ad(31 downto 16) <= u0_tridata;

--  high word register access
--    u1_data <= (sizeIt(acp_vctr_cs,16) and acp_vctr_q(15 downto 0)) or
--               (sizeIt(atari_hh_CS,16) and atari_hh_q(15 downto 0)) or
--               (sizeIt(atari_vh_CS,16) and atari_vh_q(15 downto 0)) or
--               (sizeIt(atari_hl_CS,16) and atari_hl_q(15 downto 0)) or
--               (sizeIt(atari_vl_cs,16) and atari_vl_q(15 downto 0)) or
--               (sizeIt(border_color_CS,16) and border_color_q(15 downto 0));
--    u1_enabledt <= (acp_vctr_cs or border_color_CS or atari_hh_cs or atari_vh_cs or atari_hl_cs or atari_vl_cs) and (not nFB_OE);
--    fb_ad(15 downto 0) <= u1_tridata;

    fb_ad_out(15 downto 0) <= acp_vctr_q(15 downto 0) when acp_vctr_cs = '1' else
                              atari_hh_q(15 downto 0) when atari_hh_cs = '1' else
                              atari_vh_q(15 downto 0) when atari_vh_cs = '1' else
                              atari_hl_q(15 downto 0) when atari_hl_cs = '1' else
                              atari_vl_q(15 downto 0) when atari_vl_cs = '1' else
                              border_color_q(15 downto 0) when border_color_cs = '1' else
                              (others => 'Z');

    video_mod_ta <= clut_ta_q or
                    st_shift_mode_cs or
                    falcon_shift_mode_cs or
                    acp_vctr_cs or
                    sys_ctr_cs or
                    lof_cs or
                    lwd_cs or
                    hbe_cs or
                    hdb_cs or
                    hde_cs or
                    hbb_cs or
                    hss_cs or
                    hht_cs or
                    atari_hh_cs or
                    atari_vh_cs or
                    atari_hl_cs or
                    atari_vl_cs or
                    vbe_cs or
                    vdb_cs or
                    vde_cs or
                    vbb_cs or
                    vss_cs or
                    vft_cs or
                    vco_cs or
                    vcntrl_cs;

    --  VIDEO AUSGABE SETZEN
    CLK17M_d <= not CLK17M_q;
    CLK13M_d <= not CLK13M_q;

    --  320 pixels, 32 MHz,
    --  320 pixels, 25.175 MHz,
    --  640 pixels, 32 MHz, VGA monitor
    --  640 pixels, 25.175 MHz, VGA monitor
    pixel_clk <= (CLK13M_q and (not acp_video_on) and (falcon_video or st_video) and ((VCNTRL_q(2) and VCO_q(2)) or VCO_q(0))) or
                 (CLK17M_q and (not	 acp_video_on) and (falcon_video or st_video) and ((VCNTRL_q(2) and (not VCO_q(2))) or VCO_q(0))) or
                 (clk25m and (not acp_video_on) and (falcon_video or st_video) and (not VCNTRL_q(2)) and VCO_q(2) and (not VCO_q(0))) or
                 (clk33m and (not acp_video_on) and (falcon_video or st_video) and (not VCNTRL_q(2)) and (not VCO_q(2)) and (not VCO_q(0))) or
                 (to_std_logic((clk25m and acp_video_on)='1' and acp_vctr_q(9 downto 8) = "00")) or
                 (to_std_logic((clk33m and acp_video_on)='1' and acp_vctr_q(9 downto 8) = "01")) or
                 (clk_video and acp_video_on and acp_vctr_q(9));

    -- ------------------------------------------------------------
    --  HORIZONTALE SYNC LÃƒâ€žNGE in pixel_clk
    -- --------------------------------------------------------------

    --  320 pixels, 32 MHz, RGB
    --  320 pixels, 25.175 MHz, VGA
    --  640 pixels, 32 MHz, RGB
    --  640 pixels, 25.175 MHz, VGA
    --  hsync pulse length in pixeln = frequenz / = 500ns
    
    hsy_len_d <= std_logic_vector'(8d"14") when acp_video_on = '0' and (falcon_video = '1' or st_video = '1') and vcntrl(2) = '1' and (vco(2) = '1' or vco(0) = '1') else
                 std_logic_vector'(8d"16") when acp_video_on = '0' and (falcon_video = '1' or st_video = '1') and vcntrl(2) = '1' and (vco(2) = '0' or vco(0) = '1') else
                 std_logic_vector'(8d"28") when acp_video_on = '0' and (falcon_video = '1' or st_video = '1') and vcntrl(2) = '0' and vco(2) = '1' and vco(0) = '0' else
                 std_logic_vector'(8d"32") when acp_video_on = '0' and (falcon_video = '1' or st_video = '1') and vcntrl(2) = '0' and vco(2) = '0' and vco(0) = '0' else
                 std_logic_vector'(8d"28") when acp_video_on = '1' and acp_vctr(9 downto 8) = "00" else
                 std_logic_vector'(8d"32") when acp_video_on = '1' and acp_vctr(9 downto 8) = "01" else
                 std_logic_vector(8d"16" + ("0" & vr_frq(7 downto 1))) when acp_video_on = '1' and acp_vctr(9) = '1' else
                 (others => '0');
                 
                 -- ("00001110" and sizeIt(not acp_video_on, 8) and (sizeIt(falcon_video, 8) or sizeIt(st_video, 8)) and ((sizeIt(vcntrl_q(2), 8) and sizeIt(VCO_q(2), 8)) or sizeIt(VCO_q(0), 8))) or
                 -- ("00010000" and sizeIt(not acp_video_on, 8) and (sizeIt(falcon_video, 8) or sizeIt(st_video, 8)) and ((sizeIt(vcntrl_q(2), 8) and sizeIt(not VCO_q(2), 8)) or sizeIt(VCO_q(0),8))) or
                 -- ("00011100" and sizeIt(not acp_video_on, 8) and (sizeIt(falcon_video, 8) or sizeIt(st_video, 8)) and sizeIt(not vcntrl_q(2), 8) and sizeIt(VCO_q(2), 8) and sizeIt(not VCO_q(0), 8)) or
                 -- ("00100000" and sizeIt(not acp_video_on, 8) and (sizeIt(falcon_video, 8) or sizeIt(st_video, 8)) and sizeIt(not vcntrl_q(2), 8) and sizeIt(not VCO_q(2), 8) and sizeIt(not VCO_q(0), 8)) or
                 -- ("00011100" and sizeIt(acp_video_on, 8) and sizeIt(to_std_logic(acp_vctr_q(9 downto 8) = "00"), 8)) or
                 -- ("00100000" and sizeIt(acp_video_on, 8) and sizeIt(to_std_logic(acp_vctr_q(9 downto 8) = "01"), 8)) or
                 -- ((std_logic_vector(to_unsigned(16, hsy_len_d'LENGTH) + unsigned(std_logic_vector('0' & vr_frq_q(7 downto 1))))) and sizeIt(acp_video_on, 8) and sizeIt(acp_vctr_q(9), 8));

--  MULTIPLIKATIONS FAKTOR
   MULF <= ("000010" and sizeIt(not st_video,6) and sizeIt(vcntrl_q(2),6)) or
	 ("000100" and sizeIt(not st_video,6) and sizeIt(not vcntrl_q(2),6)) or
	 ("010000" and sizeIt(st_video,6) and sizeIt(vcntrl_q(2),6)) or
	 ("100000" and sizeIt(st_video,6) and sizeIt(not vcntrl_q(2),6));

--  BREITE IN PIXELN
   hdis_len <= ("000101000000" and sizeIt(vcntrl_q(2),12)) or ("001010000000"
	 and sizeIt(not vcntrl_q(2),12));

--  DOPPELZEILENMODUS
--  ZEILENVERDOPPELUNG EIN AUS
   dop_zei_d <= vcntrl_q(0) and (falcon_video or st_video);

--  EINSCHIEBEZEILE AUF "DOPPEL" ZEILEN UND ZEILE NULL WEGEN SYNC
--  EINSCHIEBEZEILE AUF "NORMAL" ZEILEN UND ZEILE NULL WEGEN SYNC
   inter_zei_d <= (to_std_logic(DOP_ZEI_q='1' and VVCNT_q(0) /= VDIS_START(0)
	 and VVCNT_q /= "00000000000" and (unsigned(VHCNT_q) < unsigned(std_logic_vector(unsigned(HDIS_END) - 1))))) or (to_std_logic(DOP_ZEI_q='1' and
	 VVCNT_q(0) = VDIS_START(0) and VVCNT_q /= "00000000000" and
	 (unsigned(VHCNT_q) > unsigned(std_logic_vector(unsigned(HDIS_END) - 2)))));

--  DOPPELZEILENFIFO LÃƒâ€“SCHEN AM ENDE DER DOPPELZEILE UND BEI MAIN FIFO START
   dop_fifo_clr_d <= (inter_zei_q and hsync_START_q) or SYNC_PIX_q;

--    rand_links[]    =  HBE[]                                    &  acp_video_on
--                     #  21                                       & !acp_video_on &  ATARI_SYNC &  VCNTRL2
--                     #  42                                       & !acp_video_on &  ATARI_SYNC & !VCNTRL2
--                     #  HBE[] * (0, MULF[5..1])                  & !acp_video_on & !ATARI_SYNC;          --
    rand_links <= HBE_q when acp_video_on else
                  12d"21" when not acp_video_on and atari_sync and vcntrl(2) else
                  12d"42" when not acp_video_on and atari_sync and not(vcntrl(2)) else
                  std_logic_vector(resize(unsigned(hbe) * unsigned(mulf(5 downto 1)), 12)) when not acp_video_on and not atari_sync else
                  (others => '0');

                  /* rand_links <= (HBE_q and sizeit(acp_video_on, 12)) or
                  (std_logic_vector(to_unsigned(21, 12)) and sizeit(not acp_video_on and atari_sync and vcntrl(2), 12)) or
                  (std_logic_vector(to_unsigned(42, 12)) and sizeit(not acp_video_on and atari_sync and not vcntrl(2), 12)) or
                  (std_logic_vector(unsigned(hbe) * unsigned(mulf(5 downto 1))) and sizeit(not acp_video_on and not atari_sync, 12));  */

--	hdis_start[] 	=  HDB[] 									&  acp_video_on
--					#  rand_links[] + 1							& !acp_video_on;						--  
    hdis_start <= (HDB_q and sizeIt(acp_video_on, 12)) or ((std_logic_vector(unsigned(rand_links) + 1)) and sizeIt(not acp_video_on,12));
    hdis_end <= (hde_q and sizeIt(acp_video_on, 12)) or
               ((std_logic_vector(unsigned(rand_links) + unsigned(hdis_len))) and sizeIt(not acp_video_on,12)); 
    rand_rechts <= (HBB_q and sizeIt(acp_video_on,12)) or
	              ((std_logic_vector(unsigned(hdis_end) + 1)) and sizeIt(not acp_video_on, 12));

    hs_start <= hss_q when acp_video_on else
                atari_hl(11 downto 0) when not(acp_video_on) and atari_sync and vcntrl(2) else
                atari_hh(11 downto 0) when not(acp_video_on) and atari_sync and not vcntrl(2) else
                std_logic_vector(resize(unsigned(hht) + 1 + unsigned(hss) * unsigned(mulf(5 downto 1)), 12)) when not acp_video_on and not atari_sync else
                (others => '0');
            
--    hs_start[]      =  HSS[]                                    &  acp_video_on
--                     #  atari_hl[11..0]                          & !acp_video_on &  ATARI_SYNC &  VCNTRL2
--                     #  atari_hh[11..0]                          & !acp_video_on &  ATARI_SYNC & !VCNTRL2
--                     # (HHT[] + 1 + HSS[]) * (0, MULF[5..1])     & !acp_video_on & !ATARI_SYNC;          --
--  
    h_total <= hht_q when acp_video_on else
               atari_hl(27 downto 16) when not acp_video_on and atari_sync and vcntrl(2) else
               atari_hh(27 downto 16) when not acp_video_on and atari_sync and not vcntrl(2) else
               std_logic_vector(resize((unsigned(hht) + 2) * unsigned(mulf), 12)) when not acp_video_on and not atari_sync else
               (others => '0');
               
--    h_total[]       =  HHT[]                                    &  acp_video_on
--                     #  atari_hl[27..16]                         & !acp_video_on &  ATARI_SYNC &  VCNTRL2
--                     #  atari_hh[27..16]                         & !acp_video_on &  ATARI_SYNC & !VCNTRL2
--                     # (HHT[] + 2) * (0, MULF[])                 & !acp_video_on & !ATARI_SYNC;          --
    rand_OBEN <= (VBE_q and sizeIt(acp_video_on,11)) or ("00000011111" and
	 sizeIt(not acp_video_on,11) and sizeIt(ATARI_SYNC,11)) or
	 (std_logic_vector'('0' & VBE_q(10 downto 1)) and sizeIt(not
	 acp_video_on,11) and sizeIt(not ATARI_SYNC,11));
    
                  
    VDIS_START <= (VDB_q and sizeIt(acp_video_on,11)) or 
                  ("00000100000" and sizeIt(not acp_video_on,11) and sizeIt(ATARI_SYNC,11)) or
                  ((std_logic_vector(unsigned(std_logic_vector('0' & VDB_q(10 downto 1))) + 1)) and sizeIt(not acp_video_on,11) and sizeIt(not ATARI_SYNC,11));
                 
    VDIS_end <= (VDE_q and sizeIt(acp_video_on,11)) or
                ("00110101111" and sizeIt(not acp_video_on,11) and sizeIt(ATARI_SYNC, 11) and sizeIt(st_video,11)) or
                ("00111111111" and sizeIt(not acp_video_on,11) and sizeIt(ATARI_SYNC,11) and sizeIt(not st_video,11)) or
                (std_logic_vector'('0' & VDE_q(10 downto 1)) and sizeIt(not acp_video_on,11) and sizeIt(not ATARI_SYNC,11));
                
    border_bottom <= (VBB_q and sizeIt(acp_video_on,11)) or
	 ((std_logic_vector(unsigned(VDIS_end) + 1)) and sizeIt(not acp_video_on,11) and sizeIt(ATARI_SYNC,11)) or
	 ((std_logic_vector(unsigned(std_logic_vector('0' & VBB_q(10 downto 1))) + 1)) and sizeIt(not acp_video_on,11) and sizeIt(not ATARI_SYNC,11));
     
    VS_START <= (VSS_q and sizeIt(acp_video_on,11)) or (atari_vl_q(10 downto 0)
	 and sizeIt(not acp_video_on,11) and sizeIt(ATARI_SYNC,11) and
	 sizeIt(vcntrl_q(2),11)) or (atari_vh_q(10 downto 0) and sizeIt(not
	 acp_video_on,11) and sizeIt(ATARI_SYNC,11) and sizeIt(not
	 vcntrl_q(2),11)) or (std_logic_vector'('0' & VSS_q(10 downto 1)) and
	 sizeIt(not acp_video_on,11) and sizeIt(not ATARI_SYNC,11));
    V_TOTAL <= (VFT_q and sizeIt(acp_video_on,11)) or (atari_vl_q(26 downto 16)
	 and sizeIt(not acp_video_on,11) and sizeIt(ATARI_SYNC,11) and
	 sizeIt(vcntrl_q(2),11)) or (atari_vh_q(26 downto 16) and sizeIt(not
	 acp_video_on,11) and sizeIt(ATARI_SYNC,11) and sizeIt(not
	 vcntrl_q(2),11)) or (std_logic_vector'('0' & VFT_q(10 downto 1)) and
	 sizeIt(not acp_video_on,11) and sizeIt(not ATARI_SYNC,11));

    --  ZÃƒâ€žHLER
    last_d <= to_std_logic(vhcnt_q = (std_logic_vector(unsigned(h_total) - 2)));

    vhcnt_d <= (std_logic_vector(unsigned(vhcnt_q) + 1)) and sizeIt(not last_q,12);

    vvcnt0_ena_ctrl <= last_q;
    vvcnt_d <= (std_logic_vector(unsigned(vvcnt_q) + 1)) and sizeIt(to_std_logic(vvcnt_q /= (std_logic_vector(unsigned(V_TOTAL) - 1))), 11);

    --  DISPLAY ON OFF
    --  1 ZEILE DAVOR ON OFF
    dpo_zl_d <= to_std_logic((unsigned(vvcnt_q) > unsigned(std_logic_vector(unsigned(rand_OBEN) - 1))) and (unsigned(vvcnt_q) < unsigned(std_logic_vector(unsigned(border_bottom) - 1))));

    --  AM ZEILENendE ÃƒÅ“BERNEHMEN
    dpo_zl_ena <= last_q;

    --  BESSER EINZELN WEGEN TIMING
    dpo_on_d <= to_std_logic(vhcnt_q = rand_links);
    DPO_OFF_d <= to_std_logic(vhcnt_q = (std_logic_vector(unsigned(rand_rechts) - 1)));
    disp_on_d <= (disp_on_q and (not DPO_OFF_q)) or (dpo_on_q and dpo_zl_q);

    --  DATENTRANSFER ON OFF
    
    
    --  BESSER EINZELN WEGEN TIMING
    vco_on_d <= to_std_logic(vhcnt_q = (std_logic_vector(unsigned(hdis_start) - 1)));
    VCO_OFF_d <= to_std_logic(vhcnt_q = hdis_end);

    
    --  AM ZEILENendE ÃƒÅ“BERNEHMEN
    VCO_ZL_ena <= last_q;

    --  1 ZEILE DAVOR ON OFF
    VCO_ZL_d <= to_std_logic((unsigned(vvcnt_q) >= unsigned(std_logic_vector(unsigned(VDIS_START) - 1))) and (unsigned(vvcnt_q) < unsigned(VDIS_end)));

    VDTRON_d <= (VDTRON_q and (not VCO_OFF_q)) or (vco_on_q and VCO_ZL_q);

    --  VERZÃƒâ€“GERUNG UND SYNC

    hsync_START_d <= to_std_logic(VHCNT_q = (std_logic_vector(unsigned(HS_START) - 3)));

    hsync_I_d <= (HSY_LEN_q and sizeIt(hsync_START_q,8)) or
                ((std_logic_vector(unsigned(hsync_I_q) - 1)) and
	 sizeIt(not hsync_START_q,8) and sizeIt(to_std_logic(hsync_I_q /=
	 "00000000"),8));

     vsync_START_ena <= LAST_q;

    --  start am ende der Zeile vor dem vsync
    vsync_START_d <= to_std_logic(VVCNT_q = (std_logic_vector(unsigned(VS_START) - 3)));

    --  start am ende der Zeile vor dem vsync
    vsync_I0_ena_ctrl <= LAST_q;

    --  3 zeilen vsync length
    --  runterzÃ¤hlen bis 0
    vsync_I_d <= 3x"3" when vsync_START_q = '1' else
                 std_logic_vector(unsigned(vsync_I_q) - 1) when vsync_START_q = '0' and vsync_I_q /= 3x"0" else
                 (others => '0');
                 
    -- vsync_I_d <= ("011" and sizeIt(vsync_START_q,3)) or
	--  ((std_logic_vector(unsigned(vsync_I_q) - 1)) and sizeIt(not vsync_START_q,3) and sizeIt(to_std_logic(vsync_I_q /= "000"),3));
   
    (verz2_d(1), verz1_d(1), VERZ0_d(1)) <= std_logic_vector'(verz2_q(0) & verz1_q(0) & VERZ0_q(0));
    (verz2_d(2), verz1_d(2), VERZ0_d(2)) <= std_logic_vector'(verz2_q(1) & verz1_q(1) & VERZ0_q(1));
    (verz2_d(3), verz1_d(3), VERZ0_d(3)) <= std_logic_vector'(verz2_q(2) & verz1_q(2) & VERZ0_q(2));
    (verz2_d(4), verz1_d(4), VERZ0_d(4)) <= std_logic_vector'(verz2_q(3) & verz1_q(3) & VERZ0_q(3));
    (verz2_d(5), verz1_d(5), VERZ0_d(5)) <= std_logic_vector'(verz2_q(4) & verz1_q(4) & VERZ0_q(4));
    (verz2_d(6), verz1_d(6), VERZ0_d(6)) <= std_logic_vector'(verz2_q(5) & verz1_q(5) & VERZ0_q(5));
    (verz2_d(7), verz1_d(7), VERZ0_d(7)) <= std_logic_vector'(verz2_q(6) & verz1_q(6) & VERZ0_q(6));
    (verz2_d(8), verz1_d(8), VERZ0_d(8)) <= std_logic_vector'(verz2_q(7) & verz1_q(7) & VERZ0_q(7));
    (verz2_d(9), verz1_d(9), VERZ0_d(9)) <= std_logic_vector'(verz2_q(8) & verz1_q(8) & VERZ0_q(8));
    VERZ0_d(0) <= disp_on_q;

    --   VERZ[1][0] = hsync_I[] != 0;
    --  NUR MÃƒâ€“GLICH WENN BEIDE
    VERZ1_d(0) <= (to_std_logic((((not acp_vctr_q(15)) or (not VCO_q(6)))='1')
	 and hsync_I_q /= "00000000")) or (to_std_logic((acp_vctr_q(15) and
	 VCO_q(6))='1' and hsync_I_q = "00000000"));

    --  NUR MÃƒâ€“GLICH WENN BEIDE
    VERZ2_d(0) <= (to_std_logic((((not acp_vctr_q(15)) or (not VCO_q(5)))='1')
	 and vsync_I_q /= "000")) or (to_std_logic((acp_vctr_q(15) and
	 VCO_q(5))='1' and vsync_I_q = "000"));

    --  nBLANK =  VERZ[0][8];
    nblank_d <= verz0_q(8);
    
    --  nBLANK_d <= disp_on_q;

    --  hsync  =  VERZ[1][9];
    --  NUR MÃƒâ€“GLICH WENN BEIDE
    hsync_d <= (to_std_logic((((not acp_vctr_q(15)) or (not VCO_q(6)))='1') and
	 hsync_I_q /= "00000000")) or (to_std_logic((acp_vctr_q(15) and
	 VCO_q(6))='1' and hsync_I_q = "00000000"));

    --  vsync  =  VERZ[2][9];
    --  NUR MÃƒâ€“GLICH WENN BEIDE
    vsync_d <= (to_std_logic((((not acp_vctr_q(15)) or (not VCO_q(5)))='1') and
	 vsync_I_q /= "000")) or (to_std_logic((acp_vctr_q(15) and
	 VCO_q(5))='1' and vsync_I_q = "000"));
    nSYNC <= gnd;

    --  randFARBE MACHEN ------------------------------------
    rand_d(0) <= disp_on_q and (not VDTRON_q) and acp_vctr_q(25);
    rand_d(1) <= rand_q(0);
    rand_d(2) <= rand_q(1);
    rand_d(3) <= rand_q(2);
    rand_d(4) <= rand_q(3);
    rand_d(5) <= rand_q(4);
    rand_d(6) <= rand_q(5);
    
    --  rand_ON = rand[6];
    rand_on <= rand(6);
    -- rand_ON <= disp_on_q and (not VDTRON_q) and acp_vctr_q(25);

    -- --------------------------------------------------------
    clr_fifo_ena <= LAST_q;

    --  IN LETZTER ZEILE LÃƒâ€“SCHEN
    clr_fifo_d <= to_std_logic(VVCNT_q = (std_logic_vector(unsigned(V_TOTAL) - 2)));
    START_ZEILE_ena <= LAST_q;

    --  ZEILE 1
    START_ZEILE_d <= to_std_logic(vvcnt_q = "00000000000");

    --  SUB PIXEL ZÃƒâ€žHLER SYNCHRONISIEREN
    SYNC_PIX_d <= to_std_logic(vhcnt_q = "000000000011") and START_ZEILE_q;

    --  SUB PIXEL ZÃƒâ€žHLER SYNCHRONISIEREN
    SYNC_PIX1_d <= to_std_logic(vhcnt_q = "000000000101") and START_ZEILE_q;

    --  SUB PIXEL ZÃƒâ€žHLER SYNCHRONISIEREN
    SYNC_PIX2_d <= to_std_logic(vhcnt_q = "000000000111") and START_ZEILE_q;

    sub_pixel_cnt0_ena_ctrl <= VDTRON_q or SYNC_PIX_q;

    -- count up if display on sonst clear bei sync pix
    sub_pixel_cnt_d <= (std_logic_vector(unsigned(sub_pixel_cnt_q) + 1)) and sizeIt(not SYNC_PIX_q,7);

    --  3 CLOCK ZUSÃƒâ€žTZLICH FÃƒÅ“R FIFO SHIFT DATAOUT UND SHIFT RIGTH POSITION
    fifo_rde_d <= (((to_std_logic(SUB_PIXEL_CNT_q = "0000001") and color1) or
	 (to_std_logic(SUB_PIXEL_CNT_q(5 downto 0) = "000001") and color2) or
	 (to_std_logic(SUB_PIXEL_CNT_q(4 downto 0) = "00001") and color4_i) or
	 (to_std_logic(SUB_PIXEL_CNT_q(3 downto 0) = "0001") and color8) or
	 (to_std_logic(SUB_PIXEL_CNT_q(2 downto 0) = "001") and color16) or
	 (to_std_logic(SUB_PIXEL_CNT_q(1 downto 0) = "01") and color24)) and
	 VDTRON_q) or SYNC_PIX_q or SYNC_PIX1_q or SYNC_PIX2_q;

    clut_mux_av0_d <= sub_pixel_cnt_q(3 downto 0);
    clut_mux_av1_d <= clut_mux_av0_q;
    clut_mux_adr_d <= clut_mux_av1_q;


    -- Assignments added to explicitly combine the
    -- effects of multiple drivers in the source
    color16 <= color16_1 or color16_2;
    color4_i <= COLOR4_1 or COLOR4_2;
    color4 <= color4_i;
    color1 <= color1_1 or color1_2 or color1_3;
    color8 <= color8_1 or color8_2;

    -- Define power signal(s)
    gnd <= '0';
end ARCHITECTURE rtl;
