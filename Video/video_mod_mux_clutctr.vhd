-- Xilinx XPort Language Converter, Version 4.1 (110)
-- 
-- AHDL Design Source: VIDEO_MOD_MUX_CLUTCTR.tdf
-- VHDL Design Output: VIDEO_MOD_MUX_CLUTCTR.vhd
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
      CLK33M, CLK25M, BLITTER_RUN, CLK_VIDEO: in std_logic;
      VR_D: in std_logic_vector(8 downto 0);
      VR_BUSY: in std_logic;
      COLOR8, ACP_CLUT_RD, COLOR1, FALCON_CLUT_RDH, FALCON_CLUT_RDL: buffer
	    std_logic;
      FALCON_CLUT_WR: buffer std_logic_vector(3 downto 0);
      ST_CLUT_RD: buffer std_logic;
      ST_CLUT_WR: buffer std_logic_vector(1 downto 0);
      CLUT_MUX_ADR: buffer std_logic_vector(3 downto 0);
      HSYNC, VSYNC, nBLANK, nSYNC, nPD_VGA, FIFO_RDE, COLOR2, COLOR4,
	    PIXEL_CLK: buffer std_logic;
      CLUT_OFF: buffer std_logic_vector(3 downto 0);
      BLITTER_ON: buffer std_logic;
      VIDEO_RAM_CTR: buffer std_logic_vector(15 downto 0);
      VIDEO_MOD_TA: buffer std_logic;
      BORDER_COLOR: buffer std_logic_vector(23 downto 0);
      CCSEL: buffer std_logic_vector(2 downto 0);
      ACP_CLUT_WR: buffer std_logic_vector(3 downto 0);
      INTER_ZEI, DOP_FIFO_CLR, VIDEO_RECONFIG, VR_WR, VR_RD, CLR_FIFO: buffer
	    std_logic;
      FB_AD: inout std_logic_vector(31 downto 0)
   );
end VIDEO_MOD_MUX_CLUTCTR;


architecture VIDEO_MOD_MUX_CLUTCTR_behav of VIDEO_MOD_MUX_CLUTCTR is

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
   signal VR_DOUT: std_logic_vector(8 downto 0);
   signal VR_DOUT_d: std_logic_vector(8 downto 0);
   signal VR_DOUT_q: std_logic_vector(8 downto 0);
   signal VR_FRQ: std_logic_vector(7 downto 0);
   signal VR_FRQ_d: std_logic_vector(7 downto 0);
   signal VR_FRQ_q: std_logic_vector(7 downto 0);
   signal FB_B: std_logic_vector(3 downto 0);
   signal FB_16B: std_logic_vector(1 downto 0);
   signal ST_SHIFT_MODE: std_logic_vector(1 downto 0);
   signal ST_SHIFT_MODE_d: std_logic_vector(1 downto 0);
   signal ST_SHIFT_MODE_q: std_logic_vector(1 downto 0);
   signal FALCON_SHIFT_MODE: std_logic_vector(10 downto 0);
   signal FALCON_SHIFT_MODE_d: std_logic_vector(10 downto 0);
   signal FALCON_SHIFT_MODE_q: std_logic_vector(10 downto 0);
   signal CLUT_MUX_ADR_d: std_logic_vector(3 downto 0);
   signal CLUT_MUX_ADR_q: std_logic_vector(3 downto 0);
   signal CLUT_MUX_AV1: std_logic_vector(3 downto 0);
   signal CLUT_MUX_AV1_d: std_logic_vector(3 downto 0);
   signal CLUT_MUX_AV1_q: std_logic_vector(3 downto 0);
   signal CLUT_MUX_AV0: std_logic_vector(3 downto 0);
   signal CLUT_MUX_AV0_d: std_logic_vector(3 downto 0);
   signal CLUT_MUX_AV0_q: std_logic_vector(3 downto 0);
   signal ACP_VCTR: std_logic_vector(31 downto 0);
   signal ACP_VCTR_d: std_logic_vector(31 downto 0);
   signal ACP_VCTR_q: std_logic_vector(31 downto 0);
   signal BORDER_COLOR_d: std_logic_vector(23 downto 0);
   signal BORDER_COLOR_q: std_logic_vector(23 downto 0);
   signal SYS_CTR: std_logic_vector(6 downto 0);
   signal SYS_CTR_d: std_logic_vector(6 downto 0);
   signal SYS_CTR_q: std_logic_vector(6 downto 0);
   signal LOF: std_logic_vector(15 downto 0);
   signal LOF_d: std_logic_vector(15 downto 0);
   signal LOF_q: std_logic_vector(15 downto 0);
   signal LWD: std_logic_vector(15 downto 0);
   signal LWD_d: std_logic_vector(15 downto 0);
   signal LWD_q: std_logic_vector(15 downto 0);
   signal HSYNC_I: std_logic_vector(7 downto 0);
   signal HSYNC_I_d: std_logic_vector(7 downto 0);
   signal HSYNC_I_q: std_logic_vector(7 downto 0);
   signal HSY_LEN: std_logic_vector(7 downto 0);
   signal HSY_LEN_d: std_logic_vector(7 downto 0);
   signal HSY_LEN_q: std_logic_vector(7 downto 0);
   signal VSYNC_I: std_logic_vector(2 downto 0);
   signal VSYNC_I_d: std_logic_vector(2 downto 0);
   signal VSYNC_I_q: std_logic_vector(2 downto 0);
   signal VHCNT: std_logic_vector(11 downto 0);
   signal VHCNT_d: std_logic_vector(11 downto 0);
   signal VHCNT_q: std_logic_vector(11 downto 0);
   signal SUB_PIXEL_CNT: std_logic_vector(6 downto 0);
   signal SUB_PIXEL_CNT_d: std_logic_vector(6 downto 0);
   signal SUB_PIXEL_CNT_q: std_logic_vector(6 downto 0);
   signal VVCNT: std_logic_vector(10 downto 0);
   signal VVCNT_d: std_logic_vector(10 downto 0);
   signal VVCNT_q: std_logic_vector(10 downto 0);
   signal VERZ2: std_logic_vector(9 downto 0);
   signal VERZ2_d: std_logic_vector(9 downto 0);
   signal VERZ2_q: std_logic_vector(9 downto 0);
   signal VERZ1: std_logic_vector(9 downto 0);
   signal VERZ1_d: std_logic_vector(9 downto 0);
   signal VERZ1_q: std_logic_vector(9 downto 0);
   signal VERZ0: std_logic_vector(9 downto 0);
   signal VERZ0_d: std_logic_vector(9 downto 0);
   signal VERZ0_q: std_logic_vector(9 downto 0);
   signal RAND: std_logic_vector(6 downto 0);
   signal RAND_d: std_logic_vector(6 downto 0);
   signal RAND_q: std_logic_vector(6 downto 0);
   signal CCSEL_d: std_logic_vector(2 downto 0);
   signal CCSEL_q: std_logic_vector(2 downto 0);
   signal ATARI_HH: std_logic_vector(31 downto 0);
   signal ATARI_HH_d: std_logic_vector(31 downto 0);
   signal ATARI_HH_q: std_logic_vector(31 downto 0);
   signal ATARI_VH: std_logic_vector(31 downto 0);
   signal ATARI_VH_d: std_logic_vector(31 downto 0);
   signal ATARI_VH_q: std_logic_vector(31 downto 0);
   signal ATARI_HL: std_logic_vector(31 downto 0);
   signal ATARI_HL_d: std_logic_vector(31 downto 0);
   signal ATARI_HL_q: std_logic_vector(31 downto 0);
   signal ATARI_VL: std_logic_vector(31 downto 0);
   signal ATARI_VL_d: std_logic_vector(31 downto 0);
   signal ATARI_VL_q: std_logic_vector(31 downto 0);
   signal RAND_LINKS: std_logic_vector(11 downto 0);
   signal HDIS_START: std_logic_vector(11 downto 0);
   signal HDIS_END: std_logic_vector(11 downto 0);
   signal RAND_RECHTS: std_logic_vector(11 downto 0);
   signal HS_START: std_logic_vector(11 downto 0);
   signal H_TOTAL: std_logic_vector(11 downto 0);
   signal HDIS_LEN: std_logic_vector(11 downto 0);
   signal MULF: std_logic_vector(5 downto 0);
   signal HHT: std_logic_vector(11 downto 0);
   signal HHT_d: std_logic_vector(11 downto 0);
   signal HHT_q: std_logic_vector(11 downto 0);
   signal HBE: std_logic_vector(11 downto 0);
   signal HBE_d: std_logic_vector(11 downto 0);
   signal HBE_q: std_logic_vector(11 downto 0);
   signal HDB: std_logic_vector(11 downto 0);
   signal HDB_d: std_logic_vector(11 downto 0);
   signal HDB_q: std_logic_vector(11 downto 0);
   signal HDE: std_logic_vector(11 downto 0);
   signal HDE_d: std_logic_vector(11 downto 0);
   signal HDE_q: std_logic_vector(11 downto 0);
   signal HBB: std_logic_vector(11 downto 0);
   signal HBB_d: std_logic_vector(11 downto 0);
   signal HBB_q: std_logic_vector(11 downto 0);
   signal HSS: std_logic_vector(11 downto 0);
   signal HSS_d: std_logic_vector(11 downto 0);
   signal HSS_q: std_logic_vector(11 downto 0);
   signal RAND_OBEN: std_logic_vector(10 downto 0);
   signal VDIS_START: std_logic_vector(10 downto 0);
   signal VDIS_END: std_logic_vector(10 downto 0);
   signal RAND_UNTEN: std_logic_vector(10 downto 0);
   signal VS_START: std_logic_vector(10 downto 0);
   signal V_TOTAL: std_logic_vector(10 downto 0);
   signal VBE: std_logic_vector(10 downto 0);
   signal VBE_d: std_logic_vector(10 downto 0);
   signal VBE_q: std_logic_vector(10 downto 0);
   signal VDB: std_logic_vector(10 downto 0);
   signal VDB_d: std_logic_vector(10 downto 0);
   signal VDB_q: std_logic_vector(10 downto 0);
   signal VDE: std_logic_vector(10 downto 0);
   signal VDE_d: std_logic_vector(10 downto 0);
   signal VDE_q: std_logic_vector(10 downto 0);
   signal VBB: std_logic_vector(10 downto 0);
   signal VBB_d: std_logic_vector(10 downto 0);
   signal VBB_q: std_logic_vector(10 downto 0);
   signal VSS: std_logic_vector(10 downto 0);
   signal VSS_d: std_logic_vector(10 downto 0);
   signal VSS_q: std_logic_vector(10 downto 0);
   signal VFT: std_logic_vector(10 downto 0);
   signal VFT_d: std_logic_vector(10 downto 0);
   signal VFT_q: std_logic_vector(10 downto 0);
   signal VCO: std_logic_vector(8 downto 0);
   signal VCO_d: std_logic_vector(8 downto 0);
   signal VCO_ena: std_logic_vector(8 downto 0);
   signal VCO_q: std_logic_vector(8 downto 0);
   signal VCNTRL: std_logic_vector(3 downto 0);
   signal VCNTRL_d: std_logic_vector(3 downto 0);
   signal VCNTRL_q: std_logic_vector(3 downto 0);
   signal u0_data: std_logic_vector(15 downto 0);
   signal u0_tridata: std_logic_vector(15 downto 0);
   signal u1_data: std_logic_vector(15 downto 0);
   signal u1_tridata: std_logic_vector(15 downto 0);
   signal ST_SHIFT_MODE0_clk_ctrl, ST_SHIFT_MODE0_ena_ctrl,
	 FALCON_SHIFT_MODE0_clk_ctrl, FALCON_SHIFT_MODE8_ena_ctrl,
	 FALCON_SHIFT_MODE0_ena_ctrl, ACP_VCTR0_clk_ctrl, ACP_VCTR24_ena_ctrl,
	 ACP_VCTR16_ena_ctrl, ACP_VCTR8_ena_ctrl, ACP_VCTR0_ena_ctrl,
	 ATARI_HH0_clk_ctrl, ATARI_HH24_ena_ctrl, ATARI_HH16_ena_ctrl,
	 ATARI_HH8_ena_ctrl, ATARI_HH0_ena_ctrl, ATARI_VH0_clk_ctrl,
	 ATARI_VH24_ena_ctrl, ATARI_VH16_ena_ctrl, ATARI_VH8_ena_ctrl,
	 ATARI_VH0_ena_ctrl, ATARI_HL0_clk_ctrl, ATARI_HL24_ena_ctrl,
	 ATARI_HL16_ena_ctrl, ATARI_HL8_ena_ctrl, ATARI_HL0_ena_ctrl,
	 ATARI_VL0_clk_ctrl, ATARI_VL24_ena_ctrl, ATARI_VL16_ena_ctrl,
	 ATARI_VL8_ena_ctrl, ATARI_VL0_ena_ctrl, VR_DOUT0_clk_ctrl,
	 VR_DOUT0_ena_ctrl, VR_FRQ0_clk_ctrl, VR_FRQ0_ena_ctrl,
	 ACP_VCTR6_ena_ctrl, CCSEL0_clk_ctrl, BORDER_COLOR0_clk_ctrl,
	 BORDER_COLOR16_ena_ctrl, BORDER_COLOR8_ena_ctrl,
	 BORDER_COLOR0_ena_ctrl, SYS_CTR0_clk_ctrl, SYS_CTR0_ena_ctrl,
	 LOF0_clk_ctrl, LOF8_ena_ctrl, LOF0_ena_ctrl, LWD0_clk_ctrl,
	 LWD8_ena_ctrl, LWD0_ena_ctrl, HHT0_clk_ctrl, HHT8_ena_ctrl,
	 HHT0_ena_ctrl, HBE0_clk_ctrl, HBE8_ena_ctrl, HBE0_ena_ctrl,
	 HDB0_clk_ctrl, HDB8_ena_ctrl, HDB0_ena_ctrl, HDE0_clk_ctrl,
	 HDE8_ena_ctrl, HDE0_ena_ctrl, HBB0_clk_ctrl, HBB8_ena_ctrl,
	 HBB0_ena_ctrl, HSS0_clk_ctrl, HSS8_ena_ctrl, HSS0_ena_ctrl,
	 VBE0_clk_ctrl, VBE8_ena_ctrl, VBE0_ena_ctrl, VDB0_clk_ctrl,
	 VDB8_ena_ctrl, VDB0_ena_ctrl, VDE0_clk_ctrl, VDE8_ena_ctrl,
	 VDE0_ena_ctrl, VBB0_clk_ctrl, VBB8_ena_ctrl, VBB0_ena_ctrl,
	 VSS0_clk_ctrl, VSS8_ena_ctrl, VSS0_ena_ctrl, VFT0_clk_ctrl,
	 VFT8_ena_ctrl, VFT0_ena_ctrl, VCO0_clk_ctrl, VCO0_ena_ctrl,
	 VCNTRL0_clk_ctrl, VCNTRL0_ena_ctrl, HSY_LEN0_clk_ctrl,
	 VHCNT0_clk_ctrl, VVCNT0_clk_ctrl, VVCNT0_ena_ctrl, HSYNC_I0_clk_ctrl,
	 VSYNC_I0_clk_ctrl, VSYNC_I0_ena_ctrl, VERZ2_0_clk_ctrl,
	 VERZ1_0_clk_ctrl, VERZ0_0_clk_ctrl, RAND0_clk_ctrl,
	 SUB_PIXEL_CNT0_clk_ctrl, SUB_PIXEL_CNT0_ena_ctrl,
	 CLUT_MUX_ADR0_clk_ctrl, CLUT_MUX_AV1_0_clk_ctrl,
	 CLUT_MUX_AV0_0_clk_ctrl, COLOR8_2, COLOR8_1, COLOR1_3, COLOR1_2,
	 COLOR1_1, COLOR4_2, COLOR4_1, COLOR16_2, COLOR16_1, gnd, u1_enabledt,
	 u0_enabledt, VCNTRL_CS, VCO_CS, VFT_CS, VSS_CS, VBB_CS, VDE_CS,
	 VDB_CS, VBE_CS, DOP_FIFO_CLR_q, DOP_FIFO_CLR_clk, DOP_FIFO_CLR_d,
	 DOP_ZEI_q, DOP_ZEI_clk, DOP_ZEI_d, DOP_ZEI, INTER_ZEI_q,
	 INTER_ZEI_clk, INTER_ZEI_d, ST_VIDEO, FALCON_VIDEO, HSS_CS, HBB_CS,
	 HDE_CS, HDB_CS, HBE_CS, HHT_CS, ATARI_VL_CS, ATARI_HL_CS, ATARI_VH_CS,
	 ATARI_HH_CS, ATARI_SYNC, COLOR24, COLOR16, SYNC_PIX2_q, SYNC_PIX2_clk,
	 SYNC_PIX2_d, SYNC_PIX2, SYNC_PIX1_q, SYNC_PIX1_clk, SYNC_PIX1_d,
	 SYNC_PIX1, SYNC_PIX_q, SYNC_PIX_clk, SYNC_PIX_d, SYNC_PIX,
	 START_ZEILE_q, START_ZEILE_ena, START_ZEILE_clk, START_ZEILE_d,
	 START_ZEILE, CLR_FIFO_q, CLR_FIFO_ena, CLR_FIFO_clk, CLR_FIFO_d,
	 FIFO_RDE_q, FIFO_RDE_clk, FIFO_RDE_d, RAND_ON, VCO_OFF_q, VCO_OFF_clk,
	 VCO_OFF_d, VCO_OFF, VCO_ON_q, VCO_ON_clk, VCO_ON_d, VCO_ON, VCO_ZL_q,
	 VCO_ZL_ena, VCO_ZL_clk, VCO_ZL_d, VCO_ZL, VDTRON_q, VDTRON_clk,
	 VDTRON_d, VDTRON, DPO_OFF_q, DPO_OFF_clk, DPO_OFF_d, DPO_OFF,
	 DPO_ON_q, DPO_ON_clk, DPO_ON_d, DPO_ON, DPO_ZL_q, DPO_ZL_ena,
	 DPO_ZL_clk, DPO_ZL_d, DPO_ZL, DISP_ON_q, DISP_ON_clk, DISP_ON_d,
	 DISP_ON, nBLANK_q, nBLANK_clk, nBLANK_d, VSYNC_START_q,
	 VSYNC_START_ena, VSYNC_START_clk, VSYNC_START_d, VSYNC_START, VSYNC_q,
	 VSYNC_clk, VSYNC_d, LAST_q, LAST_clk, LAST_d, LAST, HSYNC_START_q,
	 HSYNC_START_clk, HSYNC_START_d, HSYNC_START, HSYNC_q, HSYNC_clk,
	 HSYNC_d, CLUT_TA_q, CLUT_TA_clk, CLUT_TA_d, CLUT_TA, LWD_CS, LOF_CS,
	 SYS_CTR_CS, ACP_VIDEO_ON, BORDER_COLOR_CS, ACP_VCTR_CS,
	 FALCON_SHIFT_MODE_CS, ST_SHIFT_MODE_CS, ST_CLUT, ST_CLUT_CS,
	 FALCON_CLUT, FALCON_CLUT_CS, VIDEO_RECONFIG_q, VIDEO_RECONFIG_clk,
	 VIDEO_RECONFIG_d, VIDEO_PLL_RECONFIG_CS, VR_WR_q, VR_WR_clk, VR_WR_d,
	 VIDEO_PLL_CONFIG_CS, ACP_CLUT, ACP_CLUT_CS, CLK13M_q, CLK13M_clk,
	 CLK13M_d, CLK13M, CLK17M_q, CLK17M_clk, CLK17M_d, CLK17M: std_logic;

-- Sub Module Interface Section


   component lpm_bustri_WORD
      Port (
	 data: in std_logic_vector(15 downto 0);
	 enabledt: in std_logic;
	 tridata: buffer std_logic_vector(15 downto 0)
      );
   end component;

   Function to_std_logic(X: in Boolean) return Std_Logic is
   variable ret : std_logic;
   begin
   if x then ret := '1';  else ret := '0'; end if;
   return ret;
   end to_std_logic;


   -- sizeIt replicates a value to an array of specific length.
   Function sizeIt(a: std_Logic; len: integer) return std_logic_vector is
      variable rep: std_logic_vector( len-1 downto 0);
   begin for i in rep'range loop rep(i) := a;  end loop; return rep;
   end sizeIt;
begin

-- Sub Module Section
   u0: lpm_bustri_WORD port map (data=>u0_data, enabledt=>u0_enabledt,
	 tridata=>u0_tridata);
   u1: lpm_bustri_WORD port map (data=>u1_data, enabledt=>u1_enabledt,
	 tridata=>u1_tridata);

-- Register Section

   CLUT_MUX_ADR <= CLUT_MUX_ADR_q;
   process (CLUT_MUX_ADR0_clk_ctrl) begin
      if CLUT_MUX_ADR0_clk_ctrl'event and CLUT_MUX_ADR0_clk_ctrl='1' then
	 CLUT_MUX_ADR_q <= CLUT_MUX_ADR_d;
      end if;
   end process;

   HSYNC <= HSYNC_q;
   process (HSYNC_clk) begin
      if HSYNC_clk'event and HSYNC_clk='1' then
	 HSYNC_q <= HSYNC_d;
      end if;
   end process;

   VSYNC <= VSYNC_q;
   process (VSYNC_clk) begin
      if VSYNC_clk'event and VSYNC_clk='1' then
	 VSYNC_q <= VSYNC_d;
      end if;
   end process;

   nBLANK <= nBLANK_q;
   process (nBLANK_clk) begin
      if nBLANK_clk'event and nBLANK_clk='1' then
	 nBLANK_q <= nBLANK_d;
      end if;
   end process;

   FIFO_RDE <= FIFO_RDE_q;
   process (FIFO_RDE_clk) begin
      if FIFO_RDE_clk'event and FIFO_RDE_clk='1' then
	 FIFO_RDE_q <= FIFO_RDE_d;
      end if;
   end process;

   BORDER_COLOR(23 downto 16) <= BORDER_COLOR_q(23 downto 16);
   process (BORDER_COLOR0_clk_ctrl) begin
      if BORDER_COLOR0_clk_ctrl'event and BORDER_COLOR0_clk_ctrl='1' then
	 if BORDER_COLOR16_ena_ctrl='1' then
	    (BORDER_COLOR_q(23), BORDER_COLOR_q(22), BORDER_COLOR_q(21),
		  BORDER_COLOR_q(20), BORDER_COLOR_q(19), BORDER_COLOR_q(18),
		  BORDER_COLOR_q(17), BORDER_COLOR_q(16)) <= BORDER_COLOR_d(23
		  downto 16);
	 end if;
      end if;
   end process;

   BORDER_COLOR(15 downto 8) <= BORDER_COLOR_q(15 downto 8);
   process (BORDER_COLOR0_clk_ctrl) begin
      if BORDER_COLOR0_clk_ctrl'event and BORDER_COLOR0_clk_ctrl='1' then
	 if BORDER_COLOR8_ena_ctrl='1' then
	    (BORDER_COLOR_q(15), BORDER_COLOR_q(14), BORDER_COLOR_q(13),
		  BORDER_COLOR_q(12), BORDER_COLOR_q(11), BORDER_COLOR_q(10),
		  BORDER_COLOR_q(9), BORDER_COLOR_q(8)) <= BORDER_COLOR_d(15
		  downto 8);
	 end if;
      end if;
   end process;

   BORDER_COLOR(7 downto 0) <= BORDER_COLOR_q(7 downto 0);
   process (BORDER_COLOR0_clk_ctrl) begin
      if BORDER_COLOR0_clk_ctrl'event and BORDER_COLOR0_clk_ctrl='1' then
	 if BORDER_COLOR0_ena_ctrl='1' then
	    (BORDER_COLOR_q(7), BORDER_COLOR_q(6), BORDER_COLOR_q(5),
		  BORDER_COLOR_q(4), BORDER_COLOR_q(3), BORDER_COLOR_q(2),
		  BORDER_COLOR_q(1), BORDER_COLOR_q(0)) <= BORDER_COLOR_d(7
		  downto 0);
	 end if;
      end if;
   end process;

   CCSEL <= CCSEL_q;
   process (CCSEL0_clk_ctrl) begin
      if CCSEL0_clk_ctrl'event and CCSEL0_clk_ctrl='1' then
	 CCSEL_q <= CCSEL_d;
      end if;
   end process;

   INTER_ZEI <= INTER_ZEI_q;
   process (INTER_ZEI_clk) begin
      if INTER_ZEI_clk'event and INTER_ZEI_clk='1' then
	 INTER_ZEI_q <= INTER_ZEI_d;
      end if;
   end process;

   DOP_FIFO_CLR <= DOP_FIFO_CLR_q;
   process (DOP_FIFO_CLR_clk) begin
      if DOP_FIFO_CLR_clk'event and DOP_FIFO_CLR_clk='1' then
	 DOP_FIFO_CLR_q <= DOP_FIFO_CLR_d;
      end if;
   end process;

   VIDEO_RECONFIG <= VIDEO_RECONFIG_q;
   process (VIDEO_RECONFIG_clk) begin
      if VIDEO_RECONFIG_clk'event and VIDEO_RECONFIG_clk='1' then
	 VIDEO_RECONFIG_q <= VIDEO_RECONFIG_d;
      end if;
   end process;

   VR_WR <= VR_WR_q;
   process (VR_WR_clk) begin
      if VR_WR_clk'event and VR_WR_clk='1' then
	 VR_WR_q <= VR_WR_d;
      end if;
   end process;

   CLR_FIFO <= CLR_FIFO_q;
   process (CLR_FIFO_clk) begin
      if CLR_FIFO_clk'event and CLR_FIFO_clk='1' then
	 if CLR_FIFO_ena='1' then
	    CLR_FIFO_q <= CLR_FIFO_d;
	 end if;
      end if;
   end process;

   process (CLK17M_clk) begin
      if CLK17M_clk'event and CLK17M_clk='1' then
	 CLK17M_q <= CLK17M_d;
      end if;
   end process;

   process (CLK13M_clk) begin
      if CLK13M_clk'event and CLK13M_clk='1' then
	 CLK13M_q <= CLK13M_d;
      end if;
   end process;

   process (VR_DOUT0_clk_ctrl) begin
      if VR_DOUT0_clk_ctrl'event and VR_DOUT0_clk_ctrl='1' then
	 if VR_DOUT0_ena_ctrl='1' then
	    VR_DOUT_q <= VR_DOUT_d;
	 end if;
      end if;
   end process;

   process (VR_FRQ0_clk_ctrl) begin
      if VR_FRQ0_clk_ctrl'event and VR_FRQ0_clk_ctrl='1' then
	 if VR_FRQ0_ena_ctrl='1' then
	    VR_FRQ_q <= VR_FRQ_d;
	 end if;
      end if;
   end process;

   process (ST_SHIFT_MODE0_clk_ctrl) begin
      if ST_SHIFT_MODE0_clk_ctrl'event and ST_SHIFT_MODE0_clk_ctrl='1' then
	 if ST_SHIFT_MODE0_ena_ctrl='1' then
	    ST_SHIFT_MODE_q <= ST_SHIFT_MODE_d;
	 end if;
      end if;
   end process;

   process (FALCON_SHIFT_MODE0_clk_ctrl) begin
      if FALCON_SHIFT_MODE0_clk_ctrl'event and FALCON_SHIFT_MODE0_clk_ctrl='1'
	    then
	 if FALCON_SHIFT_MODE8_ena_ctrl='1' then
	    (FALCON_SHIFT_MODE_q(10), FALCON_SHIFT_MODE_q(9),
		  FALCON_SHIFT_MODE_q(8)) <= FALCON_SHIFT_MODE_d(10 downto 8);
	 end if;
      end if;
   end process;

   process (FALCON_SHIFT_MODE0_clk_ctrl) begin
      if FALCON_SHIFT_MODE0_clk_ctrl'event and FALCON_SHIFT_MODE0_clk_ctrl='1'
	    then
	 if FALCON_SHIFT_MODE0_ena_ctrl='1' then
	    (FALCON_SHIFT_MODE_q(7), FALCON_SHIFT_MODE_q(6),
		  FALCON_SHIFT_MODE_q(5), FALCON_SHIFT_MODE_q(4),
		  FALCON_SHIFT_MODE_q(3), FALCON_SHIFT_MODE_q(2),
		  FALCON_SHIFT_MODE_q(1), FALCON_SHIFT_MODE_q(0)) <=
		  FALCON_SHIFT_MODE_d(7 downto 0);
	 end if;
      end if;
   end process;

   process (CLUT_MUX_AV1_0_clk_ctrl) begin
      if CLUT_MUX_AV1_0_clk_ctrl'event and CLUT_MUX_AV1_0_clk_ctrl='1' then
	 CLUT_MUX_AV1_q <= CLUT_MUX_AV1_d;
      end if;
   end process;

   process (CLUT_MUX_AV0_0_clk_ctrl) begin
      if CLUT_MUX_AV0_0_clk_ctrl'event and CLUT_MUX_AV0_0_clk_ctrl='1' then
	 CLUT_MUX_AV0_q <= CLUT_MUX_AV0_d;
      end if;
   end process;

   process (ACP_VCTR0_clk_ctrl) begin
      if ACP_VCTR0_clk_ctrl'event and ACP_VCTR0_clk_ctrl='1' then
	 if ACP_VCTR24_ena_ctrl='1' then
	    (ACP_VCTR_q(31), ACP_VCTR_q(30), ACP_VCTR_q(29), ACP_VCTR_q(28),
		  ACP_VCTR_q(27), ACP_VCTR_q(26), ACP_VCTR_q(25),
		  ACP_VCTR_q(24)) <= ACP_VCTR_d(31 downto 24);
	 end if;
      end if;
   end process;

   process (ACP_VCTR0_clk_ctrl) begin
      if ACP_VCTR0_clk_ctrl'event and ACP_VCTR0_clk_ctrl='1' then
	 if ACP_VCTR16_ena_ctrl='1' then
	    (ACP_VCTR_q(23), ACP_VCTR_q(22), ACP_VCTR_q(21), ACP_VCTR_q(20),
		  ACP_VCTR_q(19), ACP_VCTR_q(18), ACP_VCTR_q(17),
		  ACP_VCTR_q(16)) <= ACP_VCTR_d(23 downto 16);
	 end if;
      end if;
   end process;

   process (ACP_VCTR0_clk_ctrl) begin
      if ACP_VCTR0_clk_ctrl'event and ACP_VCTR0_clk_ctrl='1' then
	 if ACP_VCTR8_ena_ctrl='1' then
	    (ACP_VCTR_q(15), ACP_VCTR_q(14), ACP_VCTR_q(13), ACP_VCTR_q(12),
		  ACP_VCTR_q(11), ACP_VCTR_q(10), ACP_VCTR_q(9), ACP_VCTR_q(8))
		  <= ACP_VCTR_d(15 downto 8);
	 end if;
      end if;
   end process;

   process (ACP_VCTR0_clk_ctrl) begin
      if ACP_VCTR0_clk_ctrl'event and ACP_VCTR0_clk_ctrl='1' then
	 if ACP_VCTR6_ena_ctrl='1' then
	    (ACP_VCTR_q(7), ACP_VCTR_q(6)) <= ACP_VCTR_d(7 downto 6);
	 end if;
      end if;
   end process;

   process (ACP_VCTR0_clk_ctrl) begin
      if ACP_VCTR0_clk_ctrl'event and ACP_VCTR0_clk_ctrl='1' then
	 if ACP_VCTR0_ena_ctrl='1' then
	    (ACP_VCTR_q(5), ACP_VCTR_q(4), ACP_VCTR_q(3), ACP_VCTR_q(2),
		  ACP_VCTR_q(1), ACP_VCTR_q(0)) <= ACP_VCTR_d(5 downto 0);
	 end if;
      end if;
   end process;

   process (SYS_CTR0_clk_ctrl) begin
      if SYS_CTR0_clk_ctrl'event and SYS_CTR0_clk_ctrl='1' then
	 if SYS_CTR0_ena_ctrl='1' then
	    SYS_CTR_q <= SYS_CTR_d;
	 end if;
      end if;
   end process;

   process (LOF0_clk_ctrl) begin
      if LOF0_clk_ctrl'event and LOF0_clk_ctrl='1' then
	 if LOF8_ena_ctrl='1' then
	    (LOF_q(15), LOF_q(14), LOF_q(13), LOF_q(12), LOF_q(11), LOF_q(10),
		  LOF_q(9), LOF_q(8)) <= LOF_d(15 downto 8);
	 end if;
      end if;
   end process;

   process (LOF0_clk_ctrl) begin
      if LOF0_clk_ctrl'event and LOF0_clk_ctrl='1' then
	 if LOF0_ena_ctrl='1' then
	    (LOF_q(7), LOF_q(6), LOF_q(5), LOF_q(4), LOF_q(3), LOF_q(2),
		  LOF_q(1), LOF_q(0)) <= LOF_d(7 downto 0);
	 end if;
      end if;
   end process;

   process (LWD0_clk_ctrl) begin
      if LWD0_clk_ctrl'event and LWD0_clk_ctrl='1' then
	 if LWD8_ena_ctrl='1' then
	    (LWD_q(15), LWD_q(14), LWD_q(13), LWD_q(12), LWD_q(11), LWD_q(10),
		  LWD_q(9), LWD_q(8)) <= LWD_d(15 downto 8);
	 end if;
      end if;
   end process;

   process (LWD0_clk_ctrl) begin
      if LWD0_clk_ctrl'event and LWD0_clk_ctrl='1' then
	 if LWD0_ena_ctrl='1' then
	    (LWD_q(7), LWD_q(6), LWD_q(5), LWD_q(4), LWD_q(3), LWD_q(2),
		  LWD_q(1), LWD_q(0)) <= LWD_d(7 downto 0);
	 end if;
      end if;
   end process;

   process (CLUT_TA_clk) begin
      if CLUT_TA_clk'event and CLUT_TA_clk='1' then
	 CLUT_TA_q <= CLUT_TA_d;
      end if;
   end process;

   process (HSYNC_I0_clk_ctrl) begin
      if HSYNC_I0_clk_ctrl'event and HSYNC_I0_clk_ctrl='1' then
	 HSYNC_I_q <= HSYNC_I_d;
      end if;
   end process;

   process (HSY_LEN0_clk_ctrl) begin
      if HSY_LEN0_clk_ctrl'event and HSY_LEN0_clk_ctrl='1' then
	 HSY_LEN_q <= HSY_LEN_d;
      end if;
   end process;

   process (HSYNC_START_clk) begin
      if HSYNC_START_clk'event and HSYNC_START_clk='1' then
	 HSYNC_START_q <= HSYNC_START_d;
      end if;
   end process;

   process (LAST_clk) begin
      if LAST_clk'event and LAST_clk='1' then
	 LAST_q <= LAST_d;
      end if;
   end process;

   process (VSYNC_START_clk) begin
      if VSYNC_START_clk'event and VSYNC_START_clk='1' then
	 if VSYNC_START_ena='1' then
	    VSYNC_START_q <= VSYNC_START_d;
	 end if;
      end if;
   end process;

   process (VSYNC_I0_clk_ctrl) begin
      if VSYNC_I0_clk_ctrl'event and VSYNC_I0_clk_ctrl='1' then
	 if VSYNC_I0_ena_ctrl='1' then
	    VSYNC_I_q <= VSYNC_I_d;
	 end if;
      end if;
   end process;

   process (DISP_ON_clk) begin
      if DISP_ON_clk'event and DISP_ON_clk='1' then
	 DISP_ON_q <= DISP_ON_d;
      end if;
   end process;

   process (DPO_ZL_clk) begin
      if DPO_ZL_clk'event and DPO_ZL_clk='1' then
	 if DPO_ZL_ena='1' then
	    DPO_ZL_q <= DPO_ZL_d;
	 end if;
      end if;
   end process;

   process (DPO_ON_clk) begin
      if DPO_ON_clk'event and DPO_ON_clk='1' then
	 DPO_ON_q <= DPO_ON_d;
      end if;
   end process;

   process (DPO_OFF_clk) begin
      if DPO_OFF_clk'event and DPO_OFF_clk='1' then
	 DPO_OFF_q <= DPO_OFF_d;
      end if;
   end process;

   process (VDTRON_clk) begin
      if VDTRON_clk'event and VDTRON_clk='1' then
	 VDTRON_q <= VDTRON_d;
      end if;
   end process;

   process (VCO_ZL_clk) begin
      if VCO_ZL_clk'event and VCO_ZL_clk='1' then
	 if VCO_ZL_ena='1' then
	    VCO_ZL_q <= VCO_ZL_d;
	 end if;
      end if;
   end process;

   process (VCO_ON_clk) begin
      if VCO_ON_clk'event and VCO_ON_clk='1' then
	 VCO_ON_q <= VCO_ON_d;
      end if;
   end process;

   process (VCO_OFF_clk) begin
      if VCO_OFF_clk'event and VCO_OFF_clk='1' then
	 VCO_OFF_q <= VCO_OFF_d;
      end if;
   end process;

   process (VHCNT0_clk_ctrl) begin
      if VHCNT0_clk_ctrl'event and VHCNT0_clk_ctrl='1' then
	 VHCNT_q <= VHCNT_d;
      end if;
   end process;

   process (SUB_PIXEL_CNT0_clk_ctrl) begin
      if SUB_PIXEL_CNT0_clk_ctrl'event and SUB_PIXEL_CNT0_clk_ctrl='1' then
	 if SUB_PIXEL_CNT0_ena_ctrl='1' then
	    SUB_PIXEL_CNT_q <= SUB_PIXEL_CNT_d;
	 end if;
      end if;
   end process;

   process (VVCNT0_clk_ctrl) begin
      if VVCNT0_clk_ctrl'event and VVCNT0_clk_ctrl='1' then
	 if VVCNT0_ena_ctrl='1' then
	    VVCNT_q <= VVCNT_d;
	 end if;
      end if;
   end process;

   process (VERZ2_0_clk_ctrl) begin
      if VERZ2_0_clk_ctrl'event and VERZ2_0_clk_ctrl='1' then
	 VERZ2_q <= VERZ2_d;
      end if;
   end process;

   process (VERZ1_0_clk_ctrl) begin
      if VERZ1_0_clk_ctrl'event and VERZ1_0_clk_ctrl='1' then
	 VERZ1_q <= VERZ1_d;
      end if;
   end process;

   process (VERZ0_0_clk_ctrl) begin
      if VERZ0_0_clk_ctrl'event and VERZ0_0_clk_ctrl='1' then
	 VERZ0_q <= VERZ0_d;
      end if;
   end process;

   process (RAND0_clk_ctrl) begin
      if RAND0_clk_ctrl'event and RAND0_clk_ctrl='1' then
	 RAND_q <= RAND_d;
      end if;
   end process;

   process (START_ZEILE_clk) begin
      if START_ZEILE_clk'event and START_ZEILE_clk='1' then
	 if START_ZEILE_ena='1' then
	    START_ZEILE_q <= START_ZEILE_d;
	 end if;
      end if;
   end process;

   process (SYNC_PIX_clk) begin
      if SYNC_PIX_clk'event and SYNC_PIX_clk='1' then
	 SYNC_PIX_q <= SYNC_PIX_d;
      end if;
   end process;

   process (SYNC_PIX1_clk) begin
      if SYNC_PIX1_clk'event and SYNC_PIX1_clk='1' then
	 SYNC_PIX1_q <= SYNC_PIX1_d;
      end if;
   end process;

   process (SYNC_PIX2_clk) begin
      if SYNC_PIX2_clk'event and SYNC_PIX2_clk='1' then
	 SYNC_PIX2_q <= SYNC_PIX2_d;
      end if;
   end process;

   process (ATARI_HH0_clk_ctrl) begin
      if ATARI_HH0_clk_ctrl'event and ATARI_HH0_clk_ctrl='1' then
	 if ATARI_HH24_ena_ctrl='1' then
	    (ATARI_HH_q(31), ATARI_HH_q(30), ATARI_HH_q(29), ATARI_HH_q(28),
		  ATARI_HH_q(27), ATARI_HH_q(26), ATARI_HH_q(25),
		  ATARI_HH_q(24)) <= ATARI_HH_d(31 downto 24);
	 end if;
      end if;
   end process;

   process (ATARI_HH0_clk_ctrl) begin
      if ATARI_HH0_clk_ctrl'event and ATARI_HH0_clk_ctrl='1' then
	 if ATARI_HH16_ena_ctrl='1' then
	    (ATARI_HH_q(23), ATARI_HH_q(22), ATARI_HH_q(21), ATARI_HH_q(20),
		  ATARI_HH_q(19), ATARI_HH_q(18), ATARI_HH_q(17),
		  ATARI_HH_q(16)) <= ATARI_HH_d(23 downto 16);
	 end if;
      end if;
   end process;

   process (ATARI_HH0_clk_ctrl) begin
      if ATARI_HH0_clk_ctrl'event and ATARI_HH0_clk_ctrl='1' then
	 if ATARI_HH8_ena_ctrl='1' then
	    (ATARI_HH_q(15), ATARI_HH_q(14), ATARI_HH_q(13), ATARI_HH_q(12),
		  ATARI_HH_q(11), ATARI_HH_q(10), ATARI_HH_q(9), ATARI_HH_q(8))
		  <= ATARI_HH_d(15 downto 8);
	 end if;
      end if;
   end process;

   process (ATARI_HH0_clk_ctrl) begin
      if ATARI_HH0_clk_ctrl'event and ATARI_HH0_clk_ctrl='1' then
	 if ATARI_HH0_ena_ctrl='1' then
	    (ATARI_HH_q(7), ATARI_HH_q(6), ATARI_HH_q(5), ATARI_HH_q(4),
		  ATARI_HH_q(3), ATARI_HH_q(2), ATARI_HH_q(1), ATARI_HH_q(0))
		  <= ATARI_HH_d(7 downto 0);
	 end if;
      end if;
   end process;

   process (ATARI_VH0_clk_ctrl) begin
      if ATARI_VH0_clk_ctrl'event and ATARI_VH0_clk_ctrl='1' then
	 if ATARI_VH24_ena_ctrl='1' then
	    (ATARI_VH_q(31), ATARI_VH_q(30), ATARI_VH_q(29), ATARI_VH_q(28),
		  ATARI_VH_q(27), ATARI_VH_q(26), ATARI_VH_q(25),
		  ATARI_VH_q(24)) <= ATARI_VH_d(31 downto 24);
	 end if;
      end if;
   end process;

   process (ATARI_VH0_clk_ctrl) begin
      if ATARI_VH0_clk_ctrl'event and ATARI_VH0_clk_ctrl='1' then
	 if ATARI_VH16_ena_ctrl='1' then
	    (ATARI_VH_q(23), ATARI_VH_q(22), ATARI_VH_q(21), ATARI_VH_q(20),
		  ATARI_VH_q(19), ATARI_VH_q(18), ATARI_VH_q(17),
		  ATARI_VH_q(16)) <= ATARI_VH_d(23 downto 16);
	 end if;
      end if;
   end process;

   process (ATARI_VH0_clk_ctrl) begin
      if ATARI_VH0_clk_ctrl'event and ATARI_VH0_clk_ctrl='1' then
	 if ATARI_VH8_ena_ctrl='1' then
	    (ATARI_VH_q(15), ATARI_VH_q(14), ATARI_VH_q(13), ATARI_VH_q(12),
		  ATARI_VH_q(11), ATARI_VH_q(10), ATARI_VH_q(9), ATARI_VH_q(8))
		  <= ATARI_VH_d(15 downto 8);
	 end if;
      end if;
   end process;

   process (ATARI_VH0_clk_ctrl) begin
      if ATARI_VH0_clk_ctrl'event and ATARI_VH0_clk_ctrl='1' then
	 if ATARI_VH0_ena_ctrl='1' then
	    (ATARI_VH_q(7), ATARI_VH_q(6), ATARI_VH_q(5), ATARI_VH_q(4),
		  ATARI_VH_q(3), ATARI_VH_q(2), ATARI_VH_q(1), ATARI_VH_q(0))
		  <= ATARI_VH_d(7 downto 0);
	 end if;
      end if;
   end process;

   process (ATARI_HL0_clk_ctrl) begin
      if ATARI_HL0_clk_ctrl'event and ATARI_HL0_clk_ctrl='1' then
	 if ATARI_HL24_ena_ctrl='1' then
	    (ATARI_HL_q(31), ATARI_HL_q(30), ATARI_HL_q(29), ATARI_HL_q(28),
		  ATARI_HL_q(27), ATARI_HL_q(26), ATARI_HL_q(25),
		  ATARI_HL_q(24)) <= ATARI_HL_d(31 downto 24);
	 end if;
      end if;
   end process;

   process (ATARI_HL0_clk_ctrl) begin
      if ATARI_HL0_clk_ctrl'event and ATARI_HL0_clk_ctrl='1' then
	 if ATARI_HL16_ena_ctrl='1' then
	    (ATARI_HL_q(23), ATARI_HL_q(22), ATARI_HL_q(21), ATARI_HL_q(20),
		  ATARI_HL_q(19), ATARI_HL_q(18), ATARI_HL_q(17),
		  ATARI_HL_q(16)) <= ATARI_HL_d(23 downto 16);
	 end if;
      end if;
   end process;

   process (ATARI_HL0_clk_ctrl) begin
      if ATARI_HL0_clk_ctrl'event and ATARI_HL0_clk_ctrl='1' then
	 if ATARI_HL8_ena_ctrl='1' then
	    (ATARI_HL_q(15), ATARI_HL_q(14), ATARI_HL_q(13), ATARI_HL_q(12),
		  ATARI_HL_q(11), ATARI_HL_q(10), ATARI_HL_q(9), ATARI_HL_q(8))
		  <= ATARI_HL_d(15 downto 8);
	 end if;
      end if;
   end process;

   process (ATARI_HL0_clk_ctrl) begin
      if ATARI_HL0_clk_ctrl'event and ATARI_HL0_clk_ctrl='1' then
	 if ATARI_HL0_ena_ctrl='1' then
	    (ATARI_HL_q(7), ATARI_HL_q(6), ATARI_HL_q(5), ATARI_HL_q(4),
		  ATARI_HL_q(3), ATARI_HL_q(2), ATARI_HL_q(1), ATARI_HL_q(0))
		  <= ATARI_HL_d(7 downto 0);
	 end if;
      end if;
   end process;

   process (ATARI_VL0_clk_ctrl) begin
      if ATARI_VL0_clk_ctrl'event and ATARI_VL0_clk_ctrl='1' then
	 if ATARI_VL24_ena_ctrl='1' then
	    (ATARI_VL_q(31), ATARI_VL_q(30), ATARI_VL_q(29), ATARI_VL_q(28),
		  ATARI_VL_q(27), ATARI_VL_q(26), ATARI_VL_q(25),
		  ATARI_VL_q(24)) <= ATARI_VL_d(31 downto 24);
	 end if;
      end if;
   end process;

   process (ATARI_VL0_clk_ctrl) begin
      if ATARI_VL0_clk_ctrl'event and ATARI_VL0_clk_ctrl='1' then
	 if ATARI_VL16_ena_ctrl='1' then
	    (ATARI_VL_q(23), ATARI_VL_q(22), ATARI_VL_q(21), ATARI_VL_q(20),
		  ATARI_VL_q(19), ATARI_VL_q(18), ATARI_VL_q(17),
		  ATARI_VL_q(16)) <= ATARI_VL_d(23 downto 16);
	 end if;
      end if;
   end process;

   process (ATARI_VL0_clk_ctrl) begin
      if ATARI_VL0_clk_ctrl'event and ATARI_VL0_clk_ctrl='1' then
	 if ATARI_VL8_ena_ctrl='1' then
	    (ATARI_VL_q(15), ATARI_VL_q(14), ATARI_VL_q(13), ATARI_VL_q(12),
		  ATARI_VL_q(11), ATARI_VL_q(10), ATARI_VL_q(9), ATARI_VL_q(8))
		  <= ATARI_VL_d(15 downto 8);
	 end if;
      end if;
   end process;

   process (ATARI_VL0_clk_ctrl) begin
      if ATARI_VL0_clk_ctrl'event and ATARI_VL0_clk_ctrl='1' then
	 if ATARI_VL0_ena_ctrl='1' then
	    (ATARI_VL_q(7), ATARI_VL_q(6), ATARI_VL_q(5), ATARI_VL_q(4),
		  ATARI_VL_q(3), ATARI_VL_q(2), ATARI_VL_q(1), ATARI_VL_q(0))
		  <= ATARI_VL_d(7 downto 0);
	 end if;
      end if;
   end process;

   process (HHT0_clk_ctrl) begin
      if HHT0_clk_ctrl'event and HHT0_clk_ctrl='1' then
	 if HHT8_ena_ctrl='1' then
	    (HHT_q(11), HHT_q(10), HHT_q(9), HHT_q(8)) <= HHT_d(11 downto 8);
	 end if;
      end if;
   end process;

   process (HHT0_clk_ctrl) begin
      if HHT0_clk_ctrl'event and HHT0_clk_ctrl='1' then
	 if HHT0_ena_ctrl='1' then
	    (HHT_q(7), HHT_q(6), HHT_q(5), HHT_q(4), HHT_q(3), HHT_q(2),
		  HHT_q(1), HHT_q(0)) <= HHT_d(7 downto 0);
	 end if;
      end if;
   end process;

   process (HBE0_clk_ctrl) begin
      if HBE0_clk_ctrl'event and HBE0_clk_ctrl='1' then
	 if HBE8_ena_ctrl='1' then
	    (HBE_q(11), HBE_q(10), HBE_q(9), HBE_q(8)) <= HBE_d(11 downto 8);
	 end if;
      end if;
   end process;

   process (HBE0_clk_ctrl) begin
      if HBE0_clk_ctrl'event and HBE0_clk_ctrl='1' then
	 if HBE0_ena_ctrl='1' then
	    (HBE_q(7), HBE_q(6), HBE_q(5), HBE_q(4), HBE_q(3), HBE_q(2),
		  HBE_q(1), HBE_q(0)) <= HBE_d(7 downto 0);
	 end if;
      end if;
   end process;

   process (HDB0_clk_ctrl) begin
      if HDB0_clk_ctrl'event and HDB0_clk_ctrl='1' then
	 if HDB8_ena_ctrl='1' then
	    (HDB_q(11), HDB_q(10), HDB_q(9), HDB_q(8)) <= HDB_d(11 downto 8);
	 end if;
      end if;
   end process;

   process (HDB0_clk_ctrl) begin
      if HDB0_clk_ctrl'event and HDB0_clk_ctrl='1' then
	 if HDB0_ena_ctrl='1' then
	    (HDB_q(7), HDB_q(6), HDB_q(5), HDB_q(4), HDB_q(3), HDB_q(2),
		  HDB_q(1), HDB_q(0)) <= HDB_d(7 downto 0);
	 end if;
      end if;
   end process;

   process (HDE0_clk_ctrl) begin
      if HDE0_clk_ctrl'event and HDE0_clk_ctrl='1' then
	 if HDE8_ena_ctrl='1' then
	    (HDE_q(11), HDE_q(10), HDE_q(9), HDE_q(8)) <= HDE_d(11 downto 8);
	 end if;
      end if;
   end process;

   process (HDE0_clk_ctrl) begin
      if HDE0_clk_ctrl'event and HDE0_clk_ctrl='1' then
	 if HDE0_ena_ctrl='1' then
	    (HDE_q(7), HDE_q(6), HDE_q(5), HDE_q(4), HDE_q(3), HDE_q(2),
		  HDE_q(1), HDE_q(0)) <= HDE_d(7 downto 0);
	 end if;
      end if;
   end process;

   process (HBB0_clk_ctrl) begin
      if HBB0_clk_ctrl'event and HBB0_clk_ctrl='1' then
	 if HBB8_ena_ctrl='1' then
	    (HBB_q(11), HBB_q(10), HBB_q(9), HBB_q(8)) <= HBB_d(11 downto 8);
	 end if;
      end if;
   end process;

   process (HBB0_clk_ctrl) begin
      if HBB0_clk_ctrl'event and HBB0_clk_ctrl='1' then
	 if HBB0_ena_ctrl='1' then
	    (HBB_q(7), HBB_q(6), HBB_q(5), HBB_q(4), HBB_q(3), HBB_q(2),
		  HBB_q(1), HBB_q(0)) <= HBB_d(7 downto 0);
	 end if;
      end if;
   end process;

   process (HSS0_clk_ctrl) begin
      if HSS0_clk_ctrl'event and HSS0_clk_ctrl='1' then
	 if HSS8_ena_ctrl='1' then
	    (HSS_q(11), HSS_q(10), HSS_q(9), HSS_q(8)) <= HSS_d(11 downto 8);
	 end if;
      end if;
   end process;

   process (HSS0_clk_ctrl) begin
      if HSS0_clk_ctrl'event and HSS0_clk_ctrl='1' then
	 if HSS0_ena_ctrl='1' then
	    (HSS_q(7), HSS_q(6), HSS_q(5), HSS_q(4), HSS_q(3), HSS_q(2),
		  HSS_q(1), HSS_q(0)) <= HSS_d(7 downto 0);
	 end if;
      end if;
   end process;

   process (DOP_ZEI_clk) begin
      if DOP_ZEI_clk'event and DOP_ZEI_clk='1' then
	 DOP_ZEI_q <= DOP_ZEI_d;
      end if;
   end process;

   process (VBE0_clk_ctrl) begin
      if VBE0_clk_ctrl'event and VBE0_clk_ctrl='1' then
	 if VBE8_ena_ctrl='1' then
	    (VBE_q(10), VBE_q(9), VBE_q(8)) <= VBE_d(10 downto 8);
	 end if;
      end if;
   end process;

   process (VBE0_clk_ctrl) begin
      if VBE0_clk_ctrl'event and VBE0_clk_ctrl='1' then
	 if VBE0_ena_ctrl='1' then
	    (VBE_q(7), VBE_q(6), VBE_q(5), VBE_q(4), VBE_q(3), VBE_q(2),
		  VBE_q(1), VBE_q(0)) <= VBE_d(7 downto 0);
	 end if;
      end if;
   end process;

   process (VDB0_clk_ctrl) begin
      if VDB0_clk_ctrl'event and VDB0_clk_ctrl='1' then
	 if VDB8_ena_ctrl='1' then
	    (VDB_q(10), VDB_q(9), VDB_q(8)) <= VDB_d(10 downto 8);
	 end if;
      end if;
   end process;

   process (VDB0_clk_ctrl) begin
      if VDB0_clk_ctrl'event and VDB0_clk_ctrl='1' then
	 if VDB0_ena_ctrl='1' then
	    (VDB_q(7), VDB_q(6), VDB_q(5), VDB_q(4), VDB_q(3), VDB_q(2),
		  VDB_q(1), VDB_q(0)) <= VDB_d(7 downto 0);
	 end if;
      end if;
   end process;

   process (VDE0_clk_ctrl) begin
      if VDE0_clk_ctrl'event and VDE0_clk_ctrl='1' then
	 if VDE8_ena_ctrl='1' then
	    (VDE_q(10), VDE_q(9), VDE_q(8)) <= VDE_d(10 downto 8);
	 end if;
      end if;
   end process;

   process (VDE0_clk_ctrl) begin
      if VDE0_clk_ctrl'event and VDE0_clk_ctrl='1' then
	 if VDE0_ena_ctrl='1' then
	    (VDE_q(7), VDE_q(6), VDE_q(5), VDE_q(4), VDE_q(3), VDE_q(2),
		  VDE_q(1), VDE_q(0)) <= VDE_d(7 downto 0);
	 end if;
      end if;
   end process;

   process (VBB0_clk_ctrl) begin
      if VBB0_clk_ctrl'event and VBB0_clk_ctrl='1' then
	 if VBB8_ena_ctrl='1' then
	    (VBB_q(10), VBB_q(9), VBB_q(8)) <= VBB_d(10 downto 8);
	 end if;
      end if;
   end process;

   process (VBB0_clk_ctrl) begin
      if VBB0_clk_ctrl'event and VBB0_clk_ctrl='1' then
	 if VBB0_ena_ctrl='1' then
	    (VBB_q(7), VBB_q(6), VBB_q(5), VBB_q(4), VBB_q(3), VBB_q(2),
		  VBB_q(1), VBB_q(0)) <= VBB_d(7 downto 0);
	 end if;
      end if;
   end process;

   process (VSS0_clk_ctrl) begin
      if VSS0_clk_ctrl'event and VSS0_clk_ctrl='1' then
	 if VSS8_ena_ctrl='1' then
	    (VSS_q(10), VSS_q(9), VSS_q(8)) <= VSS_d(10 downto 8);
	 end if;
      end if;
   end process;

   process (VSS0_clk_ctrl) begin
      if VSS0_clk_ctrl'event and VSS0_clk_ctrl='1' then
	 if VSS0_ena_ctrl='1' then
	    (VSS_q(7), VSS_q(6), VSS_q(5), VSS_q(4), VSS_q(3), VSS_q(2),
		  VSS_q(1), VSS_q(0)) <= VSS_d(7 downto 0);
	 end if;
      end if;
   end process;

   process (VFT0_clk_ctrl) begin
      if VFT0_clk_ctrl'event and VFT0_clk_ctrl='1' then
	 if VFT8_ena_ctrl='1' then
	    (VFT_q(10), VFT_q(9), VFT_q(8)) <= VFT_d(10 downto 8);
	 end if;
      end if;
   end process;

   process (VFT0_clk_ctrl) begin
      if VFT0_clk_ctrl'event and VFT0_clk_ctrl='1' then
	 if VFT0_ena_ctrl='1' then
	    (VFT_q(7), VFT_q(6), VFT_q(5), VFT_q(4), VFT_q(3), VFT_q(2),
		  VFT_q(1), VFT_q(0)) <= VFT_d(7 downto 0);
	 end if;
      end if;
   end process;

   process (VCO0_clk_ctrl) begin
      if VCO0_clk_ctrl'event and VCO0_clk_ctrl='1' then
	 if VCO_ena(8)='1' then
	    VCO_q(8) <= VCO_d(8);
	 end if;
      end if;
   end process;

   process (VCO0_clk_ctrl) begin
      if VCO0_clk_ctrl'event and VCO0_clk_ctrl='1' then
	 if VCO0_ena_ctrl='1' then
	    (VCO_q(7), VCO_q(6), VCO_q(5), VCO_q(4), VCO_q(3), VCO_q(2),
		  VCO_q(1), VCO_q(0)) <= VCO_d(7 downto 0);
	 end if;
      end if;
   end process;

   process (VCNTRL0_clk_ctrl) begin
      if VCNTRL0_clk_ctrl'event and VCNTRL0_clk_ctrl='1' then
	 if VCNTRL0_ena_ctrl='1' then
	    VCNTRL_q <= VCNTRL_d;
	 end if;
      end if;
   end process;

-- Start of original equations

--  BYT SELECT 32 BIT
--  ADR==0
   FB_B(0) <= to_std_logic(FB_ADR(1 downto 0) = "00");

--  ADR==1
--  HIGH WORD
--  LONG UND LINE
   FB_B(1) <= to_std_logic(FB_ADR(1 downto 0) = "01") or (FB_SIZE1 and (not
	 FB_SIZE0) and (not FB_ADR(1))) or (FB_SIZE1 and FB_SIZE0) or ((not
	 FB_SIZE1) and (not FB_SIZE0));

--  ADR==2
--  LONG UND LINE
   FB_B(2) <= to_std_logic(FB_ADR(1 downto 0) = "10") or (FB_SIZE1 and
	 FB_SIZE0) or ((not FB_SIZE1) and (not FB_SIZE0));

--  ADR==3
--  LOW WORD
--  LONG UND LINE
   FB_B(3) <= to_std_logic(FB_ADR(1 downto 0) = "11") or (FB_SIZE1 and (not
	 FB_SIZE0) and FB_ADR(1)) or (FB_SIZE1 and FB_SIZE0) or ((not FB_SIZE1)
	 and (not FB_SIZE0));

--  BYT SELECT 16 BIT
--  ADR==0
   FB_16B(0) <= to_std_logic(FB_ADR(0) = '0');

--  ADR==1
--  NOT BYT
   FB_16B(1) <= to_std_logic(FB_ADR(0) = '1') or (not ((not FB_SIZE1) and
	 FB_SIZE0));

--  ACP CLUT --
--  0-3FF/1024
   ACP_CLUT_CS <= to_std_logic(((not nFB_CS2)='1') and FB_ADR(27 downto 10) =
	 "000000000000000000");
   ACP_CLUT_RD <= ACP_CLUT_CS and (not nFB_OE);
   ACP_CLUT_WR <= FB_B and sizeIt(ACP_CLUT_CS,4) and sizeIt(not nFB_WR,4);
   CLUT_TA_clk <= MAIN_CLK;
   CLUT_TA_d <= (ACP_CLUT_CS or FALCON_CLUT_CS or ST_CLUT_CS) and (not
	 VIDEO_MOD_TA);

-- FALCON CLUT --
--  $F9800/$400
   FALCON_CLUT_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 downto 10)
	 = "1111100110");

--  HIGH WORD
   FALCON_CLUT_RDH <= FALCON_CLUT_CS and (not nFB_OE) and (not FB_ADR(1));

--  LOW WORD
   FALCON_CLUT_RDL <= FALCON_CLUT_CS and (not nFB_OE) and FB_ADR(1);
   FALCON_CLUT_WR(1 downto 0) <= FB_16B and std_logic_vector'((not FB_ADR(1)) &
	 (not FB_ADR(1))) and std_logic_vector'(FALCON_CLUT_CS &
	 FALCON_CLUT_CS) and std_logic_vector'((not nFB_WR) & (not nFB_WR));
   FALCON_CLUT_WR(3 downto 2) <= FB_16B and std_logic_vector'(FB_ADR(1) &
	 FB_ADR(1)) and std_logic_vector'(FALCON_CLUT_CS & FALCON_CLUT_CS) and
	 std_logic_vector'((not nFB_WR) & (not nFB_WR));

--  ST CLUT --
--  $F8240/$20
   ST_CLUT_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 downto 5) =
	 "111110000010010");
   ST_CLUT_RD <= ST_CLUT_CS and (not nFB_OE);
   ST_CLUT_WR <= FB_16B and std_logic_vector'(ST_CLUT_CS & ST_CLUT_CS) and
	 std_logic_vector'((not nFB_WR) & (not nFB_WR));

--  ST SHIFT MODE
   ST_SHIFT_MODE0_clk_ctrl <= MAIN_CLK;

--  $F8260/2
   ST_SHIFT_MODE_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 downto 1)
	 = "1111100000100110000");
   ST_SHIFT_MODE_d <= FB_AD(25 downto 24);
   ST_SHIFT_MODE0_ena_ctrl <= ST_SHIFT_MODE_CS and (not nFB_WR) and FB_B(0);

--  MONO
   COLOR1_1 <= to_std_logic(ST_SHIFT_MODE_q = "10") and (not COLOR8) and
	 ST_VIDEO and (not ACP_VIDEO_ON);

--  4 FARBEN
   COLOR2 <= to_std_logic(ST_SHIFT_MODE_q = "01") and (not COLOR8) and ST_VIDEO
	 and (not ACP_VIDEO_ON);

--  16 FARBEN
   COLOR4_1 <= to_std_logic(ST_SHIFT_MODE_q = "00") and (not COLOR8) and
	 ST_VIDEO and (not ACP_VIDEO_ON);

--  FALCON SHIFT MODE
   FALCON_SHIFT_MODE0_clk_ctrl <= MAIN_CLK;

--  $F8266/2
   FALCON_SHIFT_MODE_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19
	 downto 1) = "1111100000100110011");
   FALCON_SHIFT_MODE_d <= FB_AD(26 downto 16);
   FALCON_SHIFT_MODE8_ena_ctrl <= FALCON_SHIFT_MODE_CS and (not nFB_WR) and
	 FB_B(2);
   FALCON_SHIFT_MODE0_ena_ctrl <= FALCON_SHIFT_MODE_CS and (not nFB_WR) and
	 FB_B(3);
   CLUT_OFF <= FALCON_SHIFT_MODE_q(3 downto 0) and sizeIt(COLOR4,4);
   COLOR1_2 <= FALCON_SHIFT_MODE_q(10) and (not COLOR16) and (not COLOR8) and
	 FALCON_VIDEO and (not ACP_VIDEO_ON);
   COLOR8_1 <= FALCON_SHIFT_MODE_q(4) and (not COLOR16) and FALCON_VIDEO and
	 (not ACP_VIDEO_ON);
   COLOR16_1 <= FALCON_SHIFT_MODE_q(8) and FALCON_VIDEO and (not ACP_VIDEO_ON);
   COLOR4_2 <= (not COLOR1) and (not COLOR16) and (not COLOR8) and FALCON_VIDEO
	 and (not ACP_VIDEO_ON);

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
   ACP_VCTR0_clk_ctrl <= MAIN_CLK;

--  $400/4
   ACP_VCTR_CS <= to_std_logic(((not nFB_CS2)='1') and FB_ADR(27 downto 2) =
	 "00000000000000000100000000");
   ACP_VCTR_d(31 downto 8) <= FB_AD(31 downto 8);
   ACP_VCTR_d(5 downto 0) <= FB_AD(5 downto 0);
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
   ATARI_HH0_clk_ctrl <= MAIN_CLK;

--  $410/4
   ATARI_HH_CS <= to_std_logic(((not nFB_CS2)='1') and FB_ADR(27 downto 2) =
	 "00000000000000000100000100");
   ATARI_HH_d <= FB_AD;
   ATARI_HH24_ena_ctrl <= ATARI_HH_CS and FB_B(0) and (not nFB_WR);
   ATARI_HH16_ena_ctrl <= ATARI_HH_CS and FB_B(1) and (not nFB_WR);
   ATARI_HH8_ena_ctrl <= ATARI_HH_CS and FB_B(2) and (not nFB_WR);
   ATARI_HH0_ena_ctrl <= ATARI_HH_CS and FB_B(3) and (not nFB_WR);

--  VERTIKAL TIMING 640x480
   ATARI_VH0_clk_ctrl <= MAIN_CLK;

--  $414/4
   ATARI_VH_CS <= to_std_logic(((not nFB_CS2)='1') and FB_ADR(27 downto 2) =
	 "00000000000000000100000101");
   ATARI_VH_d <= FB_AD;
   ATARI_VH24_ena_ctrl <= ATARI_VH_CS and FB_B(0) and (not nFB_WR);
   ATARI_VH16_ena_ctrl <= ATARI_VH_CS and FB_B(1) and (not nFB_WR);
   ATARI_VH8_ena_ctrl <= ATARI_VH_CS and FB_B(2) and (not nFB_WR);
   ATARI_VH0_ena_ctrl <= ATARI_VH_CS and FB_B(3) and (not nFB_WR);

--  HORIZONTAL TIMING 320x240
   ATARI_HL0_clk_ctrl <= MAIN_CLK;

--  $418/4
   ATARI_HL_CS <= to_std_logic(((not nFB_CS2)='1') and FB_ADR(27 downto 2) =
	 "00000000000000000100000110");
   ATARI_HL_d <= FB_AD;
   ATARI_HL24_ena_ctrl <= ATARI_HL_CS and FB_B(0) and (not nFB_WR);
   ATARI_HL16_ena_ctrl <= ATARI_HL_CS and FB_B(1) and (not nFB_WR);
   ATARI_HL8_ena_ctrl <= ATARI_HL_CS and FB_B(2) and (not nFB_WR);
   ATARI_HL0_ena_ctrl <= ATARI_HL_CS and FB_B(3) and (not nFB_WR);

--  VERTIKAL TIMING 320x240
   ATARI_VL0_clk_ctrl <= MAIN_CLK;

--  $41C/4
   ATARI_VL_CS <= to_std_logic(((not nFB_CS2)='1') and FB_ADR(27 downto 2) =
	 "00000000000000000100000111");
   ATARI_VL_d <= FB_AD;
   ATARI_VL24_ena_ctrl <= ATARI_VL_CS and FB_B(0) and (not nFB_WR);
   ATARI_VL16_ena_ctrl <= ATARI_VL_CS and FB_B(1) and (not nFB_WR);
   ATARI_VL8_ena_ctrl <= ATARI_VL_CS and FB_B(2) and (not nFB_WR);
   ATARI_VL0_ena_ctrl <= ATARI_VL_CS and FB_B(3) and (not nFB_WR);

--  VIDEO PLL CONFIG
--  $(F)000'0600-7FF ->6/2 WORD RESP LONG ONLY
   VIDEO_PLL_CONFIG_CS <= to_std_logic(((not nFB_CS2)='1') and FB_ADR(27 downto
	 9) = "0000000000000000011") and FB_B(0) and FB_B(1);
   VR_WR_clk <= MAIN_CLK;
   VR_WR_d <= VIDEO_PLL_CONFIG_CS and (not nFB_WR) and (not VR_BUSY) and (not
	 VR_WR_q);
   VR_RD <= VIDEO_PLL_CONFIG_CS and nFB_WR and (not VR_BUSY);
   VR_DOUT0_clk_ctrl <= MAIN_CLK;
   VR_DOUT0_ena_ctrl <= not VR_BUSY;
   VR_DOUT_d <= VR_D;
   VR_FRQ0_clk_ctrl <= MAIN_CLK;
   VR_FRQ0_ena_ctrl <= to_std_logic(VR_WR_q='1' and FB_ADR(8 downto 0) =
	 "000000100");
   VR_FRQ_d <= FB_AD(23 downto 16);

--  VIDEO PLL RECONFIG
--  $(F)000'0800
   VIDEO_PLL_RECONFIG_CS <= to_std_logic(((not nFB_CS2)='1') and FB_ADR(27
	 downto 0) = "0000000000000000100000000000") and FB_B(0);
   VIDEO_RECONFIG_clk <= MAIN_CLK;
   VIDEO_RECONFIG_d <= VIDEO_PLL_RECONFIG_CS and (not nFB_WR) and (not VR_BUSY)
	 and (not VIDEO_RECONFIG_q);

-- ----------------------------------------------------------------------------------------------------------------------
   VIDEO_RAM_CTR <= ACP_VCTR_q(31 downto 16);

-- ------------ COLOR MODE IM ACP SETZEN
   COLOR1_3 <= ACP_VCTR_q(5) and (not ACP_VCTR_q(4)) and (not ACP_VCTR_q(3))
	 and (not ACP_VCTR_q(2)) and ACP_VIDEO_ON;
   COLOR8_2 <= ACP_VCTR_q(4) and (not ACP_VCTR_q(3)) and (not ACP_VCTR_q(2))
	 and ACP_VIDEO_ON;
   COLOR16_2 <= ACP_VCTR_q(3) and (not ACP_VCTR_q(2)) and ACP_VIDEO_ON;
   COLOR24 <= ACP_VCTR_q(2) and ACP_VIDEO_ON;
   ACP_CLUT <= (ACP_VIDEO_ON and (COLOR1 or COLOR8)) or (ST_VIDEO and COLOR1);

--  ST ODER FALCON SHIFT MODE SETZEN WENN WRITE X..SHIFT REGISTER
   ACP_VCTR_d(7) <= FALCON_SHIFT_MODE_CS and (not nFB_WR) and (not
	 ACP_VIDEO_ON);
   ACP_VCTR_d(6) <= ST_SHIFT_MODE_CS and (not nFB_WR) and (not ACP_VIDEO_ON);
   ACP_VCTR6_ena_ctrl <= (FALCON_SHIFT_MODE_CS and (not nFB_WR)) or
	 (ST_SHIFT_MODE_CS and (not nFB_WR)) or (ACP_VCTR_CS and FB_B(3) and
	 (not nFB_WR) and FB_AD(0));
   FALCON_VIDEO <= ACP_VCTR_q(7);
   FALCON_CLUT <= FALCON_VIDEO and (not ACP_VIDEO_ON) and (not COLOR16);
   ST_VIDEO <= ACP_VCTR_q(6);
   ST_CLUT <= ST_VIDEO and (not ACP_VIDEO_ON) and (not FALCON_CLUT) and (not
	 COLOR1);
   CCSEL0_clk_ctrl <= PIXEL_CLK;

--  ONLY FOR INFORMATION
   CCSEL_d <= ("000" and sizeIt(ST_CLUT,3)) or ("001" and
	 sizeIt(FALCON_CLUT,3)) or ("100" and sizeIt(ACP_CLUT,3)) or ("101" and
	 sizeIt(COLOR16,3)) or ("110" and sizeIt(COLOR24,3)) or ("111" and
	 sizeIt(RAND_ON,3));

--  DIVERSE (VIDEO)-REGISTER ----------------------------
--  RANDFARBE
   BORDER_COLOR0_clk_ctrl <= MAIN_CLK;

--  $404/4
   BORDER_COLOR_CS <= to_std_logic(((not nFB_CS2)='1') and FB_ADR(27 downto 2)
	 = "00000000000000000100000001");
   BORDER_COLOR_d <= FB_AD(23 downto 0);
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
   SYS_CTR_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 downto 1) =
	 "1111100000000000011");
   SYS_CTR0_clk_ctrl <= MAIN_CLK;
   SYS_CTR_d <= FB_AD(22 downto 16);
   SYS_CTR0_ena_ctrl <= SYS_CTR_CS and (not nFB_WR) and FB_B(3);
   BLITTER_ON <= not SYS_CTR_q(3);

--  LOF
--  $820E/2
   LOF_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 downto 1) =
	 "1111100000100000111");
   LOF0_clk_ctrl <= MAIN_CLK;
   LOF_d <= FB_AD(31 downto 16);
   LOF8_ena_ctrl <= LOF_CS and (not nFB_WR) and FB_B(2);
   LOF0_ena_ctrl <= LOF_CS and (not nFB_WR) and FB_B(3);

--  LWD
--  $8210/2
   LWD_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 downto 1) =
	 "1111100000100001000");
   LWD0_clk_ctrl <= MAIN_CLK;
   LWD_d <= FB_AD(31 downto 16);
   LWD8_ena_ctrl <= LWD_CS and (not nFB_WR) and FB_B(0);
   LWD0_ena_ctrl <= LWD_CS and (not nFB_WR) and FB_B(1);

--  HORIZONTAL
--  HHT
--  $8282/2
   HHT_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 downto 1) =
	 "1111100000101000001");
   HHT0_clk_ctrl <= MAIN_CLK;
   HHT_d <= FB_AD(27 downto 16);
   HHT8_ena_ctrl <= HHT_CS and (not nFB_WR) and FB_B(2);
   HHT0_ena_ctrl <= HHT_CS and (not nFB_WR) and FB_B(3);

--  HBE
--  $8286/2
   HBE_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 downto 1) =
	 "1111100000101000011");
   HBE0_clk_ctrl <= MAIN_CLK;
   HBE_d <= FB_AD(27 downto 16);
   HBE8_ena_ctrl <= HBE_CS and (not nFB_WR) and FB_B(2);
   HBE0_ena_ctrl <= HBE_CS and (not nFB_WR) and FB_B(3);

--  HDB
--  $8288/2
   HDB_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 downto 1) =
	 "1111100000101000100");
   HDB0_clk_ctrl <= MAIN_CLK;
   HDB_d <= FB_AD(27 downto 16);
   HDB8_ena_ctrl <= HDB_CS and (not nFB_WR) and FB_B(0);
   HDB0_ena_ctrl <= HDB_CS and (not nFB_WR) and FB_B(1);

--  HDE
--  $828A/2
   HDE_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 downto 1) =
	 "1111100000101000101");
   HDE0_clk_ctrl <= MAIN_CLK;
   HDE_d <= FB_AD(27 downto 16);
   HDE8_ena_ctrl <= HDE_CS and (not nFB_WR) and FB_B(2);
   HDE0_ena_ctrl <= HDE_CS and (not nFB_WR) and FB_B(3);

--  HBB
--  $8284/2
   HBB_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 downto 1) =
	 "1111100000101000010");
   HBB0_clk_ctrl <= MAIN_CLK;
   HBB_d <= FB_AD(27 downto 16);
   HBB8_ena_ctrl <= HBB_CS and (not nFB_WR) and FB_B(0);
   HBB0_ena_ctrl <= HBB_CS and (not nFB_WR) and FB_B(1);

--  HSS
--  Videl HSYNC start register $828C / 2
   HSS_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 downto 1) =
	 "1111100000101000110");
   HSS0_clk_ctrl <= MAIN_CLK;
   HSS_d <= FB_AD(27 downto 16);
   HSS8_ena_ctrl <= HSS_CS and (not nFB_WR) and FB_B(0);
   HSS0_ena_ctrl <= HSS_CS and (not nFB_WR) and FB_B(1);

--  VERTIKAL
--  VBE
--  $82A6/2
   VBE_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 downto 1) =
	 "1111100000101010011");
   VBE0_clk_ctrl <= MAIN_CLK;
   VBE_d <= FB_AD(26 downto 16);
   VBE8_ena_ctrl <= VBE_CS and (not nFB_WR) and FB_B(2);
   VBE0_ena_ctrl <= VBE_CS and (not nFB_WR) and FB_B(3);

--  VDB
--  $82A8/2
   VDB_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 downto 1) =
	 "1111100000101010100");
   VDB0_clk_ctrl <= MAIN_CLK;
   VDB_d <= FB_AD(26 downto 16);
   VDB8_ena_ctrl <= VDB_CS and (not nFB_WR) and FB_B(0);
   VDB0_ena_ctrl <= VDB_CS and (not nFB_WR) and FB_B(1);

--  VDE
--  $82AA/2
   VDE_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 downto 1) =
	 "1111100000101010101");
   VDE0_clk_ctrl <= MAIN_CLK;
   VDE_d <= FB_AD(26 downto 16);
   VDE8_ena_ctrl <= VDE_CS and (not nFB_WR) and FB_B(2);
   VDE0_ena_ctrl <= VDE_CS and (not nFB_WR) and FB_B(3);

--  VBB
--  $82A4/2
   VBB_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 downto 1) =
	 "1111100000101010010");
   VBB0_clk_ctrl <= MAIN_CLK;
   VBB_d <= FB_AD(26 downto 16);
   VBB8_ena_ctrl <= VBB_CS and (not nFB_WR) and FB_B(0);
   VBB0_ena_ctrl <= VBB_CS and (not nFB_WR) and FB_B(1);

--  VSS
--  $82AC/2
   VSS_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 downto 1) =
	 "1111100000101010110");
   VSS0_clk_ctrl <= MAIN_CLK;
   VSS_d <= FB_AD(26 downto 16);
   VSS8_ena_ctrl <= VSS_CS and (not nFB_WR) and FB_B(0);
   VSS0_ena_ctrl <= VSS_CS and (not nFB_WR) and FB_B(1);

--  VFT
--  $82A2/2
   VFT_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 downto 1) =
	 "1111100000101010001");
   VFT0_clk_ctrl <= MAIN_CLK;
   VFT_d <= FB_AD(26 downto 16);
   VFT8_ena_ctrl <= VFT_CS and (not nFB_WR) and FB_B(2);
   VFT0_ena_ctrl <= VFT_CS and (not nFB_WR) and FB_B(3);

--  VCO
--  $82C0 / 2 Falcon clock control register VCO
   VCO_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 downto 1) =
	 "1111100000101100000");
   VCO0_clk_ctrl <= MAIN_CLK;
   VCO_d <= FB_AD(24 downto 16);
   VCO_ena(8) <= VCO_CS and (not nFB_WR) and FB_B(0);
   VCO0_ena_ctrl <= VCO_CS and (not nFB_WR) and FB_B(1);

--  VCNTRL
--  $82C2 / 2 Falcon resolution control register VCNTRL
   VCNTRL_CS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 downto 1) =
	 "1111100000101100001");
   VCNTRL0_clk_ctrl <= MAIN_CLK;
   VCNTRL_d <= FB_AD(19 downto 16);
   VCNTRL0_ena_ctrl <= VCNTRL_CS and (not nFB_WR) and FB_B(3);

-- - REGISTER OUT
--  low word register access
   u0_data <= (sizeIt(ST_SHIFT_MODE_CS,16) and std_logic_vector'("000000" &
	 ST_SHIFT_MODE_q & "00000000")) or (sizeIt(FALCON_SHIFT_MODE_CS,16) and
	 std_logic_vector'("00000" & FALCON_SHIFT_MODE_q)) or
	 (sizeIt(SYS_CTR_CS,16) and std_logic_vector'("100000000" & SYS_CTR_q(6
	 downto 4) & (not BLITTER_RUN) & SYS_CTR_q(2 downto 0))) or
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
	 (sizeIt(VCNTRL_CS,16) and std_logic_vector'("000000000000" &
	 VCNTRL_q)) or (sizeIt(ACP_VCTR_CS,16) and ACP_VCTR_q(31 downto 16)) or
	 (sizeIt(ATARI_HH_CS,16) and ATARI_HH_q(31 downto 16)) or
	 (sizeIt(ATARI_VH_CS,16) and ATARI_VH_q(31 downto 16)) or
	 (sizeIt(ATARI_HL_CS,16) and ATARI_HL_q(31 downto 16)) or
	 (sizeIt(ATARI_VL_CS,16) and ATARI_VL_q(31 downto 16)) or
	 (sizeIt(BORDER_COLOR_CS,16) and std_logic_vector'("00000000" &
	 BORDER_COLOR_q(23 downto 16))) or (sizeIt(VIDEO_PLL_CONFIG_CS,16) and
	 std_logic_vector'("0000000" & VR_DOUT_q)) or
	 (sizeIt(VIDEO_PLL_RECONFIG_CS,16) and std_logic_vector'(VR_BUSY &
	 "0000" & VR_WR_q & VR_RD & VIDEO_RECONFIG_q & "11111010"));
   u0_enabledt <= (ST_SHIFT_MODE_CS or FALCON_SHIFT_MODE_CS or ACP_VCTR_CS or
	 BORDER_COLOR_CS or SYS_CTR_CS or LOF_CS or LWD_CS or HBE_CS or HDB_CS
	 or HDE_CS or HBB_CS or HSS_CS or HHT_CS or ATARI_HH_CS or ATARI_VH_CS
	 or ATARI_HL_CS or ATARI_VL_CS or VIDEO_PLL_CONFIG_CS or
	 VIDEO_PLL_RECONFIG_CS or VBE_CS or VDB_CS or VDE_CS or VBB_CS or
	 VSS_CS or VFT_CS or VCO_CS or VCNTRL_CS) and (not nFB_OE);
   FB_AD(31 downto 16) <= u0_tridata;

--  high word register access
   u1_data <= (sizeIt(ACP_VCTR_CS,16) and ACP_VCTR_q(15 downto 0)) or
	 (sizeIt(ATARI_HH_CS,16) and ATARI_HH_q(15 downto 0)) or
	 (sizeIt(ATARI_VH_CS,16) and ATARI_VH_q(15 downto 0)) or
	 (sizeIt(ATARI_HL_CS,16) and ATARI_HL_q(15 downto 0)) or
	 (sizeIt(ATARI_VL_CS,16) and ATARI_VL_q(15 downto 0)) or
	 (sizeIt(BORDER_COLOR_CS,16) and BORDER_COLOR_q(15 downto 0));
   u1_enabledt <= (ACP_VCTR_CS or BORDER_COLOR_CS or ATARI_HH_CS or ATARI_VH_CS
	 or ATARI_HL_CS or ATARI_VL_CS) and (not nFB_OE);
   FB_AD(15 downto 0) <= u1_tridata;
   VIDEO_MOD_TA <= CLUT_TA_q or ST_SHIFT_MODE_CS or FALCON_SHIFT_MODE_CS or
	 ACP_VCTR_CS or SYS_CTR_CS or LOF_CS or LWD_CS or HBE_CS or HDB_CS or
	 HDE_CS or HBB_CS or HSS_CS or HHT_CS or ATARI_HH_CS or ATARI_VH_CS or
	 ATARI_HL_CS or ATARI_VL_CS or VBE_CS or VDB_CS or VDE_CS or VBB_CS or
	 VSS_CS or VFT_CS or VCO_CS or VCNTRL_CS;

--  VIDEO AUSGABE SETZEN
   CLK17M_clk <= CLK33M;
   CLK17M_d <= not CLK17M_q;
   CLK13M_clk <= CLK25M;
   CLK13M_d <= not CLK13M_q;

--  320 pixels, 32 MHz,
--  320 pixels, 25.175 MHz,
--  640 pixels, 32 MHz, VGA monitor
--  640 pixels, 25.175 MHz, VGA monitor
   PIXEL_CLK <= (CLK13M_q and (not ACP_VIDEO_ON) and (FALCON_VIDEO or ST_VIDEO)
	 and ((VCNTRL_q(2) and VCO_q(2)) or VCO_q(0))) or (CLK17M_q and (not
	 ACP_VIDEO_ON) and (FALCON_VIDEO or ST_VIDEO) and ((VCNTRL_q(2) and
	 (not VCO_q(2))) or VCO_q(0))) or (CLK25M and (not ACP_VIDEO_ON) and
	 (FALCON_VIDEO or ST_VIDEO) and (not VCNTRL_q(2)) and VCO_q(2) and (not
	 VCO_q(0))) or (CLK33M and (not ACP_VIDEO_ON) and (FALCON_VIDEO or
	 ST_VIDEO) and (not VCNTRL_q(2)) and (not VCO_q(2)) and (not VCO_q(0)))
	 or (to_std_logic((CLK25M and ACP_VIDEO_ON)='1' and ACP_VCTR_q(9 downto
	 8) = "00")) or (to_std_logic((CLK33M and ACP_VIDEO_ON)='1' and
	 ACP_VCTR_q(9 downto 8) = "01")) or (CLK_VIDEO and ACP_VIDEO_ON and
	 ACP_VCTR_q(9));

-- ------------------------------------------------------------
--  HORIZONTALE SYNC LÄNGE in PIXEL_CLK
-- --------------------------------------------------------------
--  HSY_LEN[].CLK = MAIN_CLK;
--  check if this is better (mfro)
   HSY_LEN0_clk_ctrl <= PIXEL_CLK;

--  320 pixels, 32 MHz, RGB
--  320 pixels, 25.175 MHz, VGA
--  640 pixels, 32 MHz, RGB
--  640 pixels, 25.175 MHz, VGA
--  hsync pulse length in pixeln = frequenz / = 500ns
   HSY_LEN_d <= ("00001110" and sizeIt(not ACP_VIDEO_ON,8) and
	 (sizeIt(FALCON_VIDEO,8) or sizeIt(ST_VIDEO,8)) and
	 ((sizeIt(VCNTRL_q(2),8) and sizeIt(VCO_q(2),8)) or
	 sizeIt(VCO_q(0),8))) or ("00010000" and sizeIt(not ACP_VIDEO_ON,8) and
	 (sizeIt(FALCON_VIDEO,8) or sizeIt(ST_VIDEO,8)) and
	 ((sizeIt(VCNTRL_q(2),8) and sizeIt(not VCO_q(2),8)) or
	 sizeIt(VCO_q(0),8))) or ("00011100" and sizeIt(not ACP_VIDEO_ON,8) and
	 (sizeIt(FALCON_VIDEO,8) or sizeIt(ST_VIDEO,8)) and sizeIt(not
	 VCNTRL_q(2),8) and sizeIt(VCO_q(2),8) and sizeIt(not VCO_q(0),8)) or
	 ("00100000" and sizeIt(not ACP_VIDEO_ON,8) and (sizeIt(FALCON_VIDEO,8)
	 or sizeIt(ST_VIDEO,8)) and sizeIt(not VCNTRL_q(2),8) and sizeIt(not
	 VCO_q(2),8) and sizeIt(not VCO_q(0),8)) or ("00011100" and
	 sizeIt(ACP_VIDEO_ON,8) and sizeIt(to_std_logic(ACP_VCTR_q(9 downto 8)
	 = "00"),8)) or ("00100000" and sizeIt(ACP_VIDEO_ON,8) and
	 sizeIt(to_std_logic(ACP_VCTR_q(9 downto 8) = "01"),8)) or
	 ((std_logic_vector(to_unsigned(16, HSY_LEN_d'LENGTH) + unsigned(std_logic_vector('0' & VR_FRQ_q(7 downto 1))))) and sizeIt(ACP_VIDEO_ON,8) and sizeIt(ACP_VCTR_q(9),8));

--  MULTIPLIKATIONS FAKTOR
   MULF <= ("000010" and sizeIt(not ST_VIDEO,6) and sizeIt(VCNTRL_q(2),6)) or
	 ("000100" and sizeIt(not ST_VIDEO,6) and sizeIt(not VCNTRL_q(2),6)) or
	 ("010000" and sizeIt(ST_VIDEO,6) and sizeIt(VCNTRL_q(2),6)) or
	 ("100000" and sizeIt(ST_VIDEO,6) and sizeIt(not VCNTRL_q(2),6));

--  BREITE IN PIXELN
   HDIS_LEN <= ("000101000000" and sizeIt(VCNTRL_q(2),12)) or ("001010000000"
	 and sizeIt(not VCNTRL_q(2),12));

--  DOPPELZEILENMODUS
   DOP_ZEI_clk <= MAIN_CLK;

--  ZEILENVERDOPPELUNG EIN AUS
   DOP_ZEI_d <= VCNTRL_q(0) and (FALCON_VIDEO or ST_VIDEO);
   INTER_ZEI_clk <= PIXEL_CLK;

--  EINSCHIEBEZEILE AUF "DOPPEL" ZEILEN UND ZEILE NULL WEGEN SYNC
--  EINSCHIEBEZEILE AUF "NORMAL" ZEILEN UND ZEILE NULL WEGEN SYNC
   INTER_ZEI_d <= (to_std_logic(DOP_ZEI_q='1' and VVCNT_q(0) /= VDIS_START(0)
	 and VVCNT_q /= "00000000000" and (unsigned(VHCNT_q) < unsigned(std_logic_vector(unsigned(HDIS_END) - 1))))) or (to_std_logic(DOP_ZEI_q='1' and
	 VVCNT_q(0) = VDIS_START(0) and VVCNT_q /= "00000000000" and
	 (unsigned(VHCNT_q) > unsigned(std_logic_vector(unsigned(HDIS_END) - 2)))));
   DOP_FIFO_CLR_clk <= PIXEL_CLK;

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

   hs_start <= hss WHEN acp_video_on ELSE
               atari_hl(11 DOWNTO 0) WHEN not(acp_video_on) and atari_sync and vcntrl(2) ELSE
               atari_hh(11 DOWNTO 0) WHEN not(acp_video_on) and atari_sync and not vcntrl(2) ELSE
               std_logic_vector(resize(unsigned(hht) + 1 + unsigned(hss) * unsigned(mulf(5 DOWNTO 1)), 12)) WHEN not acp_video_on and not atari_sync;
            
--    HS_START[]      =  HSS[]                                    &  ACP_VIDEO_ON
--                     #  ATARI_HL[11..0]                          & !ACP_VIDEO_ON &  ATARI_SYNC &  VCNTRL2
--                     #  ATARI_HH[11..0]                          & !ACP_VIDEO_ON &  ATARI_SYNC & !VCNTRL2
--                     # (HHT[] + 1 + HSS[]) * (0, MULF[5..1])     & !ACP_VIDEO_ON & !ATARI_SYNC;          --
--  
    h_total <= hht WHEN acp_video_on ELSE
               atari_hl(27 DOWNTO 16) WHEN not acp_video_on and atari_sync and vcntrl(2) ELSE
               atari_hh(27 DOWNTO 16) WHEN not acp_video_on and atari_sync and not vcntrl(2) ELSE
               std_logic_vector(resize((unsigned(hht) + 2) * unsigned(mulf), 12)) WHEN not acp_video_on and not atari_sync;
               
--    H_TOTAL[]       =  HHT[]                                    &  ACP_VIDEO_ON
--                     #  ATARI_HL[27..16]                         & !ACP_VIDEO_ON &  ATARI_SYNC &  VCNTRL2
--                     #  ATARI_HH[27..16]                         & !ACP_VIDEO_ON &  ATARI_SYNC & !VCNTRL2
--                     # (HHT[] + 2) * (0, MULF[])                 & !ACP_VIDEO_ON & !ATARI_SYNC;          --
   RAND_OBEN <= (VBE_q and sizeIt(ACP_VIDEO_ON,11)) or ("00000011111" and
	 sizeIt(not ACP_VIDEO_ON,11) and sizeIt(ATARI_SYNC,11)) or
	 (std_logic_vector'('0' & VBE_q(10 downto 1)) and sizeIt(not
	 ACP_VIDEO_ON,11) and sizeIt(not ATARI_SYNC,11));
   VDIS_START <= (VDB_q and sizeIt(ACP_VIDEO_ON,11)) or 
                 ("00000100000" and sizeIt(not ACP_VIDEO_ON,11) and sizeIt(ATARI_SYNC,11)) or
                 ((std_logic_vector(unsigned(std_logic_vector('0' & VDB_q(10 downto 1))) + 1)) and sizeIt(not ACP_VIDEO_ON,11) and sizeIt(not ATARI_SYNC,11));
                 
   VDIS_END <= (VDE_q and sizeIt(ACP_VIDEO_ON,11)) or ("00110101111" and
	 sizeIt(not ACP_VIDEO_ON,11) and sizeIt(ATARI_SYNC,11) and
	 sizeIt(ST_VIDEO,11)) or ("00111111111" and sizeIt(not ACP_VIDEO_ON,11)
	 and sizeIt(ATARI_SYNC,11) and sizeIt(not ST_VIDEO,11)) or
	 (std_logic_vector'('0' & VDE_q(10 downto 1)) and sizeIt(not
	 ACP_VIDEO_ON,11) and sizeIt(not ATARI_SYNC,11));
   RAND_UNTEN <= (VBB_q and sizeIt(ACP_VIDEO_ON,11)) or
	 ((std_logic_vector(unsigned(VDIS_END) + 1)) and sizeIt(not ACP_VIDEO_ON,11) and sizeIt(ATARI_SYNC,11)) or
	 ((std_logic_vector(unsigned(std_logic_vector('0' & VBB_q(10 downto 1))) + 1)) and sizeIt(not ACP_VIDEO_ON,11) and sizeIt(not ATARI_SYNC,11));
     
   VS_START <= (VSS_q and sizeIt(ACP_VIDEO_ON,11)) or (ATARI_VL_q(10 downto 0)
	 and sizeIt(not ACP_VIDEO_ON,11) and sizeIt(ATARI_SYNC,11) and
	 sizeIt(VCNTRL_q(2),11)) or (ATARI_VH_q(10 downto 0) and sizeIt(not
	 ACP_VIDEO_ON,11) and sizeIt(ATARI_SYNC,11) and sizeIt(not
	 VCNTRL_q(2),11)) or (std_logic_vector'('0' & VSS_q(10 downto 1)) and
	 sizeIt(not ACP_VIDEO_ON,11) and sizeIt(not ATARI_SYNC,11));
   V_TOTAL <= (VFT_q and sizeIt(ACP_VIDEO_ON,11)) or (ATARI_VL_q(26 downto 16)
	 and sizeIt(not ACP_VIDEO_ON,11) and sizeIt(ATARI_SYNC,11) and
	 sizeIt(VCNTRL_q(2),11)) or (ATARI_VH_q(26 downto 16) and sizeIt(not
	 ACP_VIDEO_ON,11) and sizeIt(ATARI_SYNC,11) and sizeIt(not
	 VCNTRL_q(2),11)) or (std_logic_vector'('0' & VFT_q(10 downto 1)) and
	 sizeIt(not ACP_VIDEO_ON,11) and sizeIt(not ATARI_SYNC,11));

--  ZÄHLER
   LAST_clk <= PIXEL_CLK;
   LAST_d <= to_std_logic(VHCNT_q = (std_logic_vector(unsigned(H_TOTAL) - 2)));
   VHCNT0_clk_ctrl <= PIXEL_CLK;
   VHCNT_d <= (std_logic_vector(unsigned(VHCNT_q) + 1)) and sizeIt(not LAST_q,12);
   VVCNT0_clk_ctrl <= PIXEL_CLK;
   VVCNT0_ena_ctrl <= LAST_q;
   VVCNT_d <= (std_logic_vector(unsigned(VVCNT_q) + 1)) and sizeIt(to_std_logic(VVCNT_q /= (std_logic_vector(unsigned(V_TOTAL) - 1))), 11);

--  DISPLAY ON OFF
   DPO_ZL_clk <= PIXEL_CLK;

--  1 ZEILE DAVOR ON OFF
   DPO_ZL_d <= to_std_logic((unsigned(VVCNT_q) > unsigned(std_logic_vector(unsigned(RAND_OBEN) - 1))) and (unsigned(VVCNT_q) < unsigned(std_logic_vector(unsigned(RAND_UNTEN) - 1))));

--  AM ZEILENENDE ÜBERNEHMEN
   DPO_ZL_ena <= LAST_q;
   DPO_ON_clk <= PIXEL_CLK;

--  BESSER EINZELN WEGEN TIMING
   DPO_ON_d <= to_std_logic(VHCNT_q = RAND_LINKS);
   DPO_OFF_clk <= PIXEL_CLK;
   DPO_OFF_d <= to_std_logic(VHCNT_q = (std_logic_vector(unsigned(RAND_RECHTS) - 1)));
   DISP_ON_clk <= PIXEL_CLK;
   DISP_ON_d <= (DISP_ON_q and (not DPO_OFF_q)) or (DPO_ON_q and DPO_ZL_q);

--  DATENTRANSFER ON OFF
   VCO_ON_clk <= PIXEL_CLK;

--  BESSER EINZELN WEGEN TIMING
   VCO_ON_d <= to_std_logic(VHCNT_q = (std_logic_vector(unsigned(HDIS_START) - 1)));
   VCO_OFF_clk <= PIXEL_CLK;
   VCO_OFF_d <= to_std_logic(VHCNT_q = HDIS_END);
   VCO_ZL_clk <= PIXEL_CLK;

--  AM ZEILENENDE ÜBERNEHMEN
   VCO_ZL_ena <= LAST_q;

--  1 ZEILE DAVOR ON OFF
   VCO_ZL_d <= to_std_logic((unsigned(VVCNT_q) >= unsigned(std_logic_vector(unsigned(VDIS_START) - 1))) and (unsigned(VVCNT_q) < unsigned(VDIS_END)));
   VDTRON_clk <= PIXEL_CLK;
   VDTRON_d <= (VDTRON_q and (not VCO_OFF_q)) or (VCO_ON_q and VCO_ZL_q);

--  VERZÖGERUNG UND SYNC
   HSYNC_START_clk <= PIXEL_CLK;
   HSYNC_START_d <= to_std_logic(VHCNT_q = (std_logic_vector(unsigned(HS_START) - 3)));
   HSYNC_I0_clk_ctrl <= PIXEL_CLK;
   HSYNC_I_d <= (HSY_LEN_q and sizeIt(HSYNC_START_q,8)) or
                ((std_logic_vector(unsigned(HSYNC_I_q) - 1)) and
	 sizeIt(not HSYNC_START_q,8) and sizeIt(to_std_logic(HSYNC_I_q /=
	 "00000000"),8));
   VSYNC_START_clk <= PIXEL_CLK;
   VSYNC_START_ena <= LAST_q;

--  start am ende der Zeile vor dem vsync
   VSYNC_START_d <= to_std_logic(VVCNT_q = (std_logic_vector(unsigned(VS_START) - 3)));
   VSYNC_I0_clk_ctrl <= PIXEL_CLK;

--  start am ende der Zeile vor dem vsync
   VSYNC_I0_ena_ctrl <= LAST_q;

--  3 zeilen vsync length
--  runterzählen bis 0
   VSYNC_I_d <= ("011" and sizeIt(VSYNC_START_q,3)) or
	 ((std_logic_vector(unsigned(VSYNC_I_q) - 1)) and sizeIt(not VSYNC_START_q,3) and sizeIt(to_std_logic(VSYNC_I_q /= "000"),3));
   VERZ2_0_clk_ctrl <= PIXEL_CLK;
   VERZ1_0_clk_ctrl <= PIXEL_CLK;
   VERZ0_0_clk_ctrl <= PIXEL_CLK;
   
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
   nBLANK_clk <= PIXEL_CLK;

--  nBLANK =  VERZ[0][8];
   nBLANK_d <= DISP_ON_q;
   HSYNC_clk <= PIXEL_CLK;

--  HSYNC  =  VERZ[1][9];
--  NUR MÖGLICH WENN BEIDE
   HSYNC_d <= (to_std_logic((((not ACP_VCTR_q(15)) or (not VCO_q(6)))='1') and
	 HSYNC_I_q /= "00000000")) or (to_std_logic((ACP_VCTR_q(15) and
	 VCO_q(6))='1' and HSYNC_I_q = "00000000"));
   VSYNC_clk <= PIXEL_CLK;

--  VSYNC  =  VERZ[2][9];
--  NUR MÖGLICH WENN BEIDE
   VSYNC_d <= (to_std_logic((((not ACP_VCTR_q(15)) or (not VCO_q(5)))='1') and
	 VSYNC_I_q /= "000")) or (to_std_logic((ACP_VCTR_q(15) and
	 VCO_q(5))='1' and VSYNC_I_q = "000"));
   nSYNC <= gnd;

--  RANDFARBE MACHEN ------------------------------------
   RAND0_clk_ctrl <= PIXEL_CLK;
   RAND_d(0) <= DISP_ON_q and (not VDTRON_q) and ACP_VCTR_q(25);
   RAND_d(1) <= RAND_q(0);
   RAND_d(2) <= RAND_q(1);
   RAND_d(3) <= RAND_q(2);
   RAND_d(4) <= RAND_q(3);
   RAND_d(5) <= RAND_q(4);
   RAND_d(6) <= RAND_q(5);

--  RAND_ON = RAND[6];
   RAND_ON <= DISP_ON_q and (not VDTRON_q) and ACP_VCTR_q(25);

-- --------------------------------------------------------
   CLR_FIFO_clk <= PIXEL_CLK;
   CLR_FIFO_ena <= LAST_q;

--  IN LETZTER ZEILE LÖSCHEN
   CLR_FIFO_d <= to_std_logic(VVCNT_q = (std_logic_vector(unsigned(V_TOTAL) - 2)));
   START_ZEILE_clk <= PIXEL_CLK;
   START_ZEILE_ena <= LAST_q;

--  ZEILE 1
   START_ZEILE_d <= to_std_logic(VVCNT_q = "00000000000");
   SYNC_PIX_clk <= PIXEL_CLK;

--  SUB PIXEL ZÄHLER SYNCHRONISIEREN
   SYNC_PIX_d <= to_std_logic(VHCNT_q = "000000000011") and START_ZEILE_q;
   SYNC_PIX1_clk <= PIXEL_CLK;

--  SUB PIXEL ZÄHLER SYNCHRONISIEREN
   SYNC_PIX1_d <= to_std_logic(VHCNT_q = "000000000101") and START_ZEILE_q;
   SYNC_PIX2_clk <= PIXEL_CLK;

--  SUB PIXEL ZÄHLER SYNCHRONISIEREN
   SYNC_PIX2_d <= to_std_logic(VHCNT_q = "000000000111") and START_ZEILE_q;
   SUB_PIXEL_CNT0_clk_ctrl <= PIXEL_CLK;
   SUB_PIXEL_CNT0_ena_ctrl <= VDTRON_q or SYNC_PIX_q;

-- count up if display on sonst clear bei sync pix
   SUB_PIXEL_CNT_d <= (std_logic_vector(unsigned(SUB_PIXEL_CNT_q) + 1)) and sizeIt(not SYNC_PIX_q,7);
   FIFO_RDE_clk <= PIXEL_CLK;

--  3 CLOCK ZUSÄTZLICH FÜR FIFO SHIFT DATAOUT UND SHIFT RIGTH POSITION
   FIFO_RDE_d <= (((to_std_logic(SUB_PIXEL_CNT_q = "0000001") and COLOR1) or
	 (to_std_logic(SUB_PIXEL_CNT_q(5 downto 0) = "000001") and COLOR2) or
	 (to_std_logic(SUB_PIXEL_CNT_q(4 downto 0) = "00001") and COLOR4) or
	 (to_std_logic(SUB_PIXEL_CNT_q(3 downto 0) = "0001") and COLOR8) or
	 (to_std_logic(SUB_PIXEL_CNT_q(2 downto 0) = "001") and COLOR16) or
	 (to_std_logic(SUB_PIXEL_CNT_q(1 downto 0) = "01") and COLOR24)) and
	 VDTRON_q) or SYNC_PIX_q or SYNC_PIX1_q or SYNC_PIX2_q;
   CLUT_MUX_ADR0_clk_ctrl <= PIXEL_CLK;
   CLUT_MUX_AV1_0_clk_ctrl <= PIXEL_CLK;
   CLUT_MUX_AV0_0_clk_ctrl <= PIXEL_CLK;
   CLUT_MUX_AV0_d <= SUB_PIXEL_CNT_q(3 downto 0);
   CLUT_MUX_AV1_d <= CLUT_MUX_AV0_q;
   CLUT_MUX_ADR_d <= CLUT_MUX_AV1_q;


-- Assignments added to explicitly combine the
-- effects of multiple drivers in the source
   COLOR16 <= COLOR16_1 or COLOR16_2;
   COLOR4 <= COLOR4_1 or COLOR4_2;
   COLOR1 <= COLOR1_1 or COLOR1_2 or COLOR1_3;
   COLOR8 <= COLOR8_1 or COLOR8_2;

-- Define power signal(s)
   gnd <= '0';
end VIDEO_MOD_MUX_CLUTCTR_behav;
