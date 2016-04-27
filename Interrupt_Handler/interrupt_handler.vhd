-- Xilinx XPort Language Converter, Version 4.1 (110)
-- 
-- AHDL Design Source: interrupt_handler.tdf
-- VHDL Design Output: interrupt_handler.vhd
-- Created 11-Jan-2016 01:42 PM
--
-- Copyright (c) 2016, Xilinx, Inc.  All Rights Reserved.
-- Xilinx Inc makes no warranty, expressed or implied, with respect to
-- the operation and/or functionality of the converted output files.
-- 

-- INTERRUPT HANDLER UND C1287


-- Some names could not be written out to VHDL as they were
-- in the source, and have been changed:
--
-- AHDL           VHDL
-- ====           ====
-- WERTE0_.q      WERTE0_q
-- WERTE0_.ena    WERTE0_ena
-- WERTE0_.prn    WERTE0_prn
-- WERTE0_.clrn   WERTE0_clrn
-- WERTE0_.clk    WERTE0_clk
-- WERTE0_.d      WERTE0_d
-- WERTE0_        WERTE0
-- WERTE1_.q      WERTE1_q
-- WERTE1_.ena    WERTE1_ena
-- WERTE1_.prn    WERTE1_prn
-- WERTE1_.clrn   WERTE1_clrn
-- WERTE1_.clk    WERTE1_clk
-- WERTE1_.d      WERTE1_d
-- WERTE1_        WERTE1
-- WERTE2_.q      WERTE2_q
-- WERTE2_.ena    WERTE2_ena
-- WERTE2_.prn    WERTE2_prn
-- WERTE2_.clrn   WERTE2_clrn
-- WERTE2_.clk    WERTE2_clk
-- WERTE2_.d      WERTE2_d
-- WERTE2_        WERTE2
-- WERTE3_.q      WERTE3_q
-- WERTE3_.ena    WERTE3_ena
-- WERTE3_.prn    WERTE3_prn
-- WERTE3_.clrn   WERTE3_clrn
-- WERTE3_.clk    WERTE3_clk
-- WERTE3_.d      WERTE3_d
-- WERTE3_        WERTE3
-- WERTE4_.q      WERTE4_q
-- WERTE4_.ena    WERTE4_ena
-- WERTE4_.prn    WERTE4_prn
-- WERTE4_.clrn   WERTE4_clrn
-- WERTE4_.clk    WERTE4_clk
-- WERTE4_.d      WERTE4_d
-- WERTE4_        WERTE4
-- WERTE5_.q      WERTE5_q
-- WERTE5_.ena    WERTE5_ena
-- WERTE5_.prn    WERTE5_prn
-- WERTE5_.clrn   WERTE5_clrn
-- WERTE5_.clk    WERTE5_clk
-- WERTE5_.d      WERTE5_d
-- WERTE5_        WERTE5
-- WERTE6_.q      WERTE6_q
-- WERTE6_.ena    WERTE6_ena
-- WERTE6_.prn    WERTE6_prn
-- WERTE6_.clrn   WERTE6_clrn
-- WERTE6_.clk    WERTE6_clk
-- WERTE6_.d      WERTE6_d
-- WERTE6_        WERTE6
-- WERTE7_.q      WERTE7_q
-- WERTE7_.ena    WERTE7_ena
-- WERTE7_.prn    WERTE7_prn
-- WERTE7_.clrn   WERTE7_clrn
-- WERTE7_.clk    WERTE7_clk
-- WERTE7_.d      WERTE7_d
-- WERTE7_        WERTE7
-- INT_LA0_.q     INT_LA0_q
-- INT_LA0_.prn   INT_LA0_prn
-- INT_LA0_.clrn  INT_LA0_clrn
-- INT_LA0_.clk   INT_LA0_clk
-- INT_LA0_.d     INT_LA0_d
-- INT_LA0_       INT_LA0
-- INT_LA1_.q     INT_LA1_q
-- INT_LA1_.prn   INT_LA1_prn
-- INT_LA1_.clrn  INT_LA1_clrn
-- INT_LA1_.clk   INT_LA1_clk
-- INT_LA1_.d     INT_LA1_d
-- INT_LA1_       INT_LA1
-- INT_LA2_.q     INT_LA2_q
-- INT_LA2_.prn   INT_LA2_prn
-- INT_LA2_.clrn  INT_LA2_clrn
-- INT_LA2_.clk   INT_LA2_clk
-- INT_LA2_.d     INT_LA2_d
-- INT_LA2_       INT_LA2
-- INT_LA3_.q     INT_LA3_q
-- INT_LA3_.prn   INT_LA3_prn
-- INT_LA3_.clrn  INT_LA3_clrn
-- INT_LA3_.clk   INT_LA3_clk
-- INT_LA3_.d     INT_LA3_d
-- INT_LA3_       INT_LA3
-- INT_LA4_.q     INT_LA4_q
-- INT_LA4_.prn   INT_LA4_prn
-- INT_LA4_.clrn  INT_LA4_clrn
-- INT_LA4_.clk   INT_LA4_clk
-- INT_LA4_.d     INT_LA4_d
-- INT_LA4_       INT_LA4
-- INT_LA5_.q     INT_LA5_q
-- INT_LA5_.prn   INT_LA5_prn
-- INT_LA5_.clrn  INT_LA5_clrn
-- INT_LA5_.clk   INT_LA5_clk
-- INT_LA5_.d     INT_LA5_d
-- INT_LA5_       INT_LA5
-- INT_LA6_.q     INT_LA6_q
-- INT_LA6_.prn   INT_LA6_prn
-- INT_LA6_.clrn  INT_LA6_clrn
-- INT_LA6_.clk   INT_LA6_clk
-- INT_LA6_.d     INT_LA6_d
-- INT_LA6_       INT_LA6
-- INT_LA7_.q     INT_LA7_q
-- INT_LA7_.prn   INT_LA7_prn
-- INT_LA7_.clrn  INT_LA7_clrn
-- INT_LA7_.clk   INT_LA7_clk
-- INT_LA7_.d     INT_LA7_d
-- INT_LA7_       INT_LA7
-- INT_LA8_.q     INT_LA8_q
-- INT_LA8_.prn   INT_LA8_prn
-- INT_LA8_.clrn  INT_LA8_clrn
-- INT_LA8_.clk   INT_LA8_clk
-- INT_LA8_.d     INT_LA8_d
-- INT_LA8_       INT_LA8
-- INT_LA9_.q     INT_LA9_q
-- INT_LA9_.prn   INT_LA9_prn
-- INT_LA9_.clrn  INT_LA9_clrn
-- INT_LA9_.clk   INT_LA9_clk
-- INT_LA9_.d     INT_LA9_d
-- INT_LA9_       INT_LA9


--  CREATED BY FREDI ASCHWANDEN
--   Parameters Statement (optional)
--  {{ALTERA_PARAMETERS_BEGIN}} DO NOT REMOVE THIS LINE!
--  {{ALTERA_PARAMETERS_END}} DO NOT REMOVE THIS LINE!
--   Subdesign Section
LIBRARY ieee;
   USE IEEE.std_logic_1164.all;
   USE IEEE.std_logic_arith.all;

LIBRARY work;

ENTITY interrupt_handler IS
    PORT
    (
        MAIN_CLK        : IN std_logic;
        nFB_WR          : IN std_logic;
        nFB_CS1         : IN std_logic;
        nFB_CS2         : IN std_logic;
        FB_SIZE0        : IN std_logic;
        FB_SIZE1        : IN std_logic;
        FB_ADR          : IN std_logic_vector(31 DOWNTO 0);
        PIC_INT         : IN std_logic;
        E0_INT          : IN std_logic;
        DVI_INT         : IN std_logic;
        nPCI_INTA       : IN std_logic;
        nPCI_INTB       : IN std_logic;
        nPCI_INTC       : IN std_logic;
        nPCI_INTD       : IN std_logic;
        nMFP_INT        : IN std_logic;
        nFB_OE          : IN std_logic;
        DSP_INT         : IN std_logic;
        VSYNC           : IN std_logic;
        HSYNC           : IN std_logic;
        DMA_DRQ         : IN std_logic;
        nRSTO           : IN std_logic;
        nIRQ            : BUFFER std_logic_vector(7 DOWNTO 2);
        INT_HANDLER_TA  : BUFFER std_logic;
        ACP_CONF        : BUFFER std_logic_vector(31 DOWNTO 0);
        TIN0            : BUFFER std_logic;
        FB_AD           : INOUT std_logic_vector(31 DOWNTO 0)
   );
END interrupt_handler;


ARCHITECTURE rtl OF interrupt_handler IS
--  WERTE REGISTER 0-63
   SIGNAL FB_B              : std_logic_vector(3 DOWNTO 0);
   SIGNAL INT_CTR           : std_logic_vector(31 DOWNTO 0);
   SIGNAL INT_CTR_d         : std_logic_vector(31 DOWNTO 0);
   SIGNAL INT_CTR_q         : std_logic_vector(31 DOWNTO 0);
   
   SIGNAL INT_LATCH         : std_logic_vector(31 DOWNTO 0);
   SIGNAL INT_LATCH_d       : std_logic_vector(31 DOWNTO 0);
   SIGNAL INT_LATCH_clrn    : std_logic_vector(31 DOWNTO 0);
   SIGNAL INT_LATCH_q       : std_logic_vector(31 DOWNTO 0);
   SIGNAL INT_LATCH_clk     : std_logic_vector(31 DOWNTO 0);
   
   SIGNAL INT_CLEAR         : std_logic_vector(31 DOWNTO 0);
   SIGNAL INT_CLEAR_d       : std_logic_vector(31 DOWNTO 0);
   SIGNAL INT_CLEAR_q       : std_logic_vector(31 DOWNTO 0);
   
   SIGNAL INT_IN            : std_logic_vector(31 DOWNTO 0);
   SIGNAL INT_ENA           : std_logic_vector(31 DOWNTO 0);
   SIGNAL INT_ENA_d         : std_logic_vector(31 DOWNTO 0);
   SIGNAL INT_ENA_q         : std_logic_vector(31 DOWNTO 0);
   SIGNAL INT_L             : std_logic_vector(9 DOWNTO 0);
   SIGNAL INT_L_d           : std_logic_vector(9 DOWNTO 0);
   SIGNAL INT_L_q           : std_logic_vector(9 DOWNTO 0);
   SIGNAL INT_LA9           : std_logic_vector(3 DOWNTO 0);
   SIGNAL INT_LA9_d         : std_logic_vector(3 DOWNTO 0);
   SIGNAL INT_LA9_q         : std_logic_vector(3 DOWNTO 0);
   SIGNAL INT_LA8           : std_logic_vector(3 DOWNTO 0);
   SIGNAL INT_LA8_d         : std_logic_vector(3 DOWNTO 0);
   SIGNAL INT_LA8_q         : std_logic_vector(3 DOWNTO 0);
   SIGNAL INT_LA7           : std_logic_vector(3 DOWNTO 0);
   SIGNAL INT_LA7_d: std_logic_vector(3 DOWNTO 0);
   SIGNAL INT_LA7_q: std_logic_vector(3 DOWNTO 0);
   SIGNAL INT_LA6: std_logic_vector(3 DOWNTO 0);
   SIGNAL INT_LA6_d: std_logic_vector(3 DOWNTO 0);
   SIGNAL INT_LA6_q: std_logic_vector(3 DOWNTO 0);
   SIGNAL INT_LA5: std_logic_vector(3 DOWNTO 0);
   SIGNAL INT_LA5_d: std_logic_vector(3 DOWNTO 0);
   SIGNAL INT_LA5_q: std_logic_vector(3 DOWNTO 0);
   SIGNAL INT_LA4: std_logic_vector(3 DOWNTO 0);
   SIGNAL INT_LA4_d: std_logic_vector(3 DOWNTO 0);
   SIGNAL INT_LA4_q: std_logic_vector(3 DOWNTO 0);
   SIGNAL INT_LA3: std_logic_vector(3 DOWNTO 0);
   SIGNAL INT_LA3_d: std_logic_vector(3 DOWNTO 0);
   SIGNAL INT_LA3_q: std_logic_vector(3 DOWNTO 0);
   SIGNAL INT_LA2: std_logic_vector(3 DOWNTO 0);
   SIGNAL INT_LA2_d: std_logic_vector(3 DOWNTO 0);
   SIGNAL INT_LA2_q: std_logic_vector(3 DOWNTO 0);
   SIGNAL INT_LA1: std_logic_vector(3 DOWNTO 0);
   SIGNAL INT_LA1_d: std_logic_vector(3 DOWNTO 0);
   SIGNAL INT_LA1_q: std_logic_vector(3 DOWNTO 0);
   SIGNAL INT_LA0: std_logic_vector(3 DOWNTO 0);
   SIGNAL INT_LA0_d: std_logic_vector(3 DOWNTO 0);
   SIGNAL INT_LA0_q: std_logic_vector(3 DOWNTO 0);
   
   SIGNAL ACP_CONF_d: std_logic_vector(31 DOWNTO 0);
   SIGNAL ACP_CONF_q: std_logic_vector(31 DOWNTO 0);
   
   SIGNAL RTC_ADR: std_logic_vector(5 DOWNTO 0);
   SIGNAL RTC_ADR_d: std_logic_vector(5 DOWNTO 0);
   SIGNAL RTC_ADR_q: std_logic_vector(5 DOWNTO 0);
   
   SIGNAL ACHTELSEKUNDEN: std_logic_vector(2 DOWNTO 0);
   SIGNAL ACHTELSEKUNDEN_d: std_logic_vector(2 DOWNTO 0);
   SIGNAL ACHTELSEKUNDEN_q: std_logic_vector(2 DOWNTO 0);
   
   SIGNAL WERTE7: std_logic_vector(63 DOWNTO 0);
   SIGNAL WERTE7_d: std_logic_vector(63 DOWNTO 0);
   SIGNAL WERTE7_ena: std_logic_vector(63 DOWNTO 0);
   SIGNAL WERTE7_q: std_logic_vector(63 DOWNTO 0);
   SIGNAL WERTE6: std_logic_vector(63 DOWNTO 0);
   SIGNAL WERTE6_d: std_logic_vector(63 DOWNTO 0);
   SIGNAL WERTE6_clrn: std_logic_vector(63 DOWNTO 0);
   SIGNAL WERTE6_ena: std_logic_vector(63 DOWNTO 0);
   SIGNAL WERTE6_q: std_logic_vector(63 DOWNTO 0);
   SIGNAL WERTE5: std_logic_vector(63 DOWNTO 0);
   SIGNAL WERTE5_d: std_logic_vector(63 DOWNTO 0);
   SIGNAL WERTE5_ena: std_logic_vector(63 DOWNTO 0);
   SIGNAL WERTE5_q: std_logic_vector(63 DOWNTO 0);
   SIGNAL WERTE4: std_logic_vector(63 DOWNTO 0);
   SIGNAL WERTE4_d: std_logic_vector(63 DOWNTO 0);
   SIGNAL WERTE4_ena: std_logic_vector(63 DOWNTO 0);
   SIGNAL WERTE4_q: std_logic_vector(63 DOWNTO 0);
   SIGNAL WERTE3: std_logic_vector(63 DOWNTO 0);
   SIGNAL WERTE3_d: std_logic_vector(63 DOWNTO 0);
   SIGNAL WERTE3_ena: std_logic_vector(63 DOWNTO 0);
   SIGNAL WERTE3_q: std_logic_vector(63 DOWNTO 0);
   SIGNAL WERTE2: std_logic_vector(63 DOWNTO 0);
   SIGNAL WERTE2_d: std_logic_vector(63 DOWNTO 0);
   SIGNAL WERTE2_ena: std_logic_vector(63 DOWNTO 0);
   SIGNAL WERTE2_q: std_logic_vector(63 DOWNTO 0);
   SIGNAL WERTE1: std_logic_vector(63 DOWNTO 0);
   SIGNAL WERTE1_d: std_logic_vector(63 DOWNTO 0);
   SIGNAL WERTE1_ena: std_logic_vector(63 DOWNTO 0);
   SIGNAL WERTE1_q: std_logic_vector(63 DOWNTO 0);
   SIGNAL WERTE0: std_logic_vector(63 DOWNTO 0);
   SIGNAL WERTE0_d: std_logic_vector(63 DOWNTO 0);
   SIGNAL WERTE0_ena: std_logic_vector(63 DOWNTO 0);
   SIGNAL WERTE0_q: std_logic_vector(63 DOWNTO 0);
   
   SIGNAL PIC_INT_SYNC: std_logic_vector(2 DOWNTO 0);
   SIGNAL PIC_INT_SYNC_d: std_logic_vector(2 DOWNTO 0);
   SIGNAL PIC_INT_SYNC_q: std_logic_vector(2 DOWNTO 0);
   
   SIGNAL ANZAHL_TAGE_DES_MONATS: std_logic_vector(7 DOWNTO 0);
   
   SIGNAL u0_data: std_logic_vector(7 DOWNTO 0);
   SIGNAL u0_tridata: std_logic_vector(7 DOWNTO 0);
   
   SIGNAL u1_data: std_logic_vector(7 DOWNTO 0);
   SIGNAL u1_tridata: std_logic_vector(7 DOWNTO 0);
   
   SIGNAL u2_data: std_logic_vector(7 DOWNTO 0);
   SIGNAL u2_tridata: std_logic_vector(7 DOWNTO 0);
   
   SIGNAL u3_data: std_logic_vector(7 DOWNTO 0);
   SIGNAL u3_tridata: std_logic_vector(7 DOWNTO 0);
   
   SIGNAL INT_LATCH0_clk_1, INT_LATCH1_clk_1, INT_LATCH2_clk_1,
	 INT_LATCH3_clk_1, INT_LATCH4_clk_1, INT_LATCH5_clk_1,
	 INT_LATCH6_clk_1, INT_LATCH7_clk_1, INT_LATCH8_clk_1,
	 INT_LATCH9_clk_1, INT_CTR0_clk_ctrl, INT_CTR24_ena_ctrl,
	 INT_CTR16_ena_ctrl, INT_CTR8_ena_ctrl, INT_CTR0_ena_ctrl,
	 INT_ENA0_clk_ctrl, INT_ENA0_clrn_ctrl, INT_ENA24_ena_ctrl,
	 INT_ENA16_ena_ctrl, INT_ENA8_ena_ctrl, INT_ENA0_ena_ctrl,
	 INT_CLEAR0_clk_ctrl, INT_L0_clk_ctrl, INT_L0_clrn_ctrl,
	 INT_LA9_0_clk_ctrl, INT_LA8_0_clk_ctrl, INT_LA7_0_clk_ctrl,
	 INT_LA6_0_clk_ctrl, INT_LA5_0_clk_ctrl, INT_LA4_0_clk_ctrl,
	 INT_LA3_0_clk_ctrl, INT_LA2_0_clk_ctrl, INT_LA1_0_clk_ctrl,
	 INT_LA0_0_clk_ctrl, INT_LA0_0_clrn_ctrl, INT_LA1_0_clrn_ctrl,
	 INT_LA2_0_clrn_ctrl, INT_LA3_0_clrn_ctrl, INT_LA4_0_clrn_ctrl,
	 INT_LA5_0_clrn_ctrl, INT_LA6_0_clrn_ctrl, INT_LA7_0_clrn_ctrl,
	 INT_LA8_0_clrn_ctrl, INT_LA9_0_clrn_ctrl, ACP_CONF0_clk_ctrl,
	 ACP_CONF24_ena_ctrl, ACP_CONF16_ena_ctrl, ACP_CONF8_ena_ctrl,
	 ACP_CONF0_ena_ctrl, RTC_ADR0_clk_ctrl, RTC_ADR0_ena_ctrl,
	 WERTE7_0_clk_ctrl, WERTE6_0_clk_ctrl, WERTE5_0_clk_ctrl,
	 WERTE4_0_clk_ctrl, WERTE3_0_clk_ctrl, WERTE2_0_clk_ctrl,
	 WERTE1_0_clk_ctrl, WERTE0_0_clk_ctrl, WERTE0_1_ena_ctrl,
	 WERTE0_3_ena_ctrl, WERTE0_5_ena_ctrl, WERTE0_10_ena_ctrl,
	 WERTE0_11_ena_ctrl, WERTE0_12_ena_ctrl, WERTE0_14_ena_ctrl,
	 WERTE0_15_ena_ctrl, WERTE0_16_ena_ctrl, WERTE0_17_ena_ctrl,
	 WERTE0_18_ena_ctrl, WERTE0_19_ena_ctrl, WERTE0_20_ena_ctrl,
	 WERTE0_21_ena_ctrl, WERTE0_22_ena_ctrl, WERTE0_23_ena_ctrl,
	 WERTE0_24_ena_ctrl, WERTE0_25_ena_ctrl, WERTE0_26_ena_ctrl,
	 WERTE0_27_ena_ctrl, WERTE0_28_ena_ctrl, WERTE0_29_ena_ctrl,
	 WERTE0_30_ena_ctrl, WERTE0_31_ena_ctrl, WERTE0_32_ena_ctrl,
	 WERTE0_33_ena_ctrl, WERTE0_34_ena_ctrl, WERTE0_35_ena_ctrl,
	 WERTE0_36_ena_ctrl, WERTE0_37_ena_ctrl, WERTE0_38_ena_ctrl,
	 WERTE0_39_ena_ctrl, WERTE0_40_ena_ctrl, WERTE0_41_ena_ctrl,
	 WERTE0_42_ena_ctrl, WERTE0_43_ena_ctrl, WERTE0_44_ena_ctrl,
	 WERTE0_45_ena_ctrl, WERTE0_46_ena_ctrl, WERTE0_47_ena_ctrl,
	 WERTE0_48_ena_ctrl, WERTE0_49_ena_ctrl, WERTE0_50_ena_ctrl,
	 WERTE0_51_ena_ctrl, WERTE0_52_ena_ctrl, WERTE0_53_ena_ctrl,
	 WERTE0_54_ena_ctrl, WERTE0_55_ena_ctrl, WERTE0_56_ena_ctrl,
	 WERTE0_57_ena_ctrl, WERTE0_58_ena_ctrl, WERTE0_59_ena_ctrl,
	 WERTE0_60_ena_ctrl, WERTE0_61_ena_ctrl, WERTE0_62_ena_ctrl,
	 WERTE0_63_ena_ctrl, PIC_INT_SYNC0_clk_ctrl, ACHTELSEKUNDEN0_clk_ctrl,
	 ACHTELSEKUNDEN0_ena_ctrl, WERTE7_13_d_2, WERTE7_13_d_1, WERTE7_9_d_2,
	 WERTE7_9_d_1, WERTE7_8_d_2, WERTE7_8_d_1, WERTE7_7_d_2, WERTE7_7_d_1,
	 WERTE7_6_d_2, WERTE7_6_d_1, WERTE7_4_d_2, WERTE7_4_d_1, WERTE7_2_d_2,
	 WERTE7_2_d_1, WERTE7_0_d_2, WERTE7_0_d_1, WERTE7_9_ena_2,
	 WERTE7_9_ena_1, WERTE7_8_ena_2, WERTE7_8_ena_1, WERTE7_7_ena_2,
	 WERTE7_7_ena_1, WERTE7_6_ena_2, WERTE7_6_ena_1, WERTE7_4_ena_2,
	 WERTE7_4_ena_1, WERTE7_2_ena_2, WERTE7_2_ena_1, WERTE7_0_ena_2,
	 WERTE7_0_ena_1, WERTE6_9_d_2, WERTE6_9_d_1, WERTE6_8_d_2,
	 WERTE6_8_d_1, WERTE6_7_d_2, WERTE6_7_d_1, WERTE6_6_d_2, WERTE6_6_d_1,
	 WERTE6_4_d_2, WERTE6_4_d_1, WERTE6_2_d_2, WERTE6_2_d_1, WERTE6_0_d_2,
	 WERTE6_0_d_1, WERTE6_9_ena_2, WERTE6_9_ena_1, WERTE6_8_ena_2,
	 WERTE6_8_ena_1, WERTE6_7_ena_2, WERTE6_7_ena_1, WERTE6_6_ena_2,
	 WERTE6_6_ena_1, WERTE6_4_ena_2, WERTE6_4_ena_1, WERTE6_2_ena_2,
	 WERTE6_2_ena_1, WERTE6_0_ena_2, WERTE6_0_ena_1, WERTE5_9_d_2,
	 WERTE5_9_d_1, WERTE5_8_d_2, WERTE5_8_d_1, WERTE5_7_d_2, WERTE5_7_d_1,
	 WERTE5_6_d_2, WERTE5_6_d_1, WERTE5_4_d_2, WERTE5_4_d_1, WERTE5_2_d_2,
	 WERTE5_2_d_1, WERTE5_0_d_2, WERTE5_0_d_1, WERTE5_9_ena_2,
	 WERTE5_9_ena_1, WERTE5_8_ena_2, WERTE5_8_ena_1, WERTE5_7_ena_2,
	 WERTE5_7_ena_1, WERTE5_6_ena_2, WERTE5_6_ena_1, WERTE5_4_ena_2,
	 WERTE5_4_ena_1, WERTE5_2_ena_2, WERTE5_2_ena_1, WERTE5_0_ena_2,
	 WERTE5_0_ena_1, WERTE4_9_d_2, WERTE4_9_d_1, WERTE4_8_d_2,
	 WERTE4_8_d_1, WERTE4_7_d_2, WERTE4_7_d_1, WERTE4_6_d_2, WERTE4_6_d_1,
	 WERTE4_4_d_2, WERTE4_4_d_1, WERTE4_2_d_2, WERTE4_2_d_1, WERTE4_0_d_2,
	 WERTE4_0_d_1, WERTE4_9_ena_2, WERTE4_9_ena_1, WERTE4_8_ena_2,
	 WERTE4_8_ena_1, WERTE4_7_ena_2, WERTE4_7_ena_1, WERTE4_6_ena_2,
	 WERTE4_6_ena_1, WERTE4_4_ena_2, WERTE4_4_ena_1, WERTE4_2_ena_2,
	 WERTE4_2_ena_1, WERTE4_0_ena_2, WERTE4_0_ena_1, WERTE3_9_d_2,
	 WERTE3_9_d_1, WERTE3_8_d_2, WERTE3_8_d_1, WERTE3_7_d_2, WERTE3_7_d_1,
	 WERTE3_6_d_2, WERTE3_6_d_1, WERTE3_4_d_2, WERTE3_4_d_1, WERTE3_2_d_2,
	 WERTE3_2_d_1, WERTE3_0_d_2, WERTE3_0_d_1, WERTE3_9_ena_2,
	 WERTE3_9_ena_1, WERTE3_8_ena_2, WERTE3_8_ena_1, WERTE3_7_ena_2,
	 WERTE3_7_ena_1, WERTE3_6_ena_2, WERTE3_6_ena_1, WERTE3_4_ena_2,
	 WERTE3_4_ena_1, WERTE3_2_ena_2, WERTE3_2_ena_1, WERTE3_0_ena_2,
	 WERTE3_0_ena_1, WERTE2_11_d_2, WERTE2_11_d_1, WERTE2_9_d_2,
	 WERTE2_9_d_1, WERTE2_8_d_2, WERTE2_8_d_1, WERTE2_7_d_2, WERTE2_7_d_1,
	 WERTE2_6_d_2, WERTE2_6_d_1, WERTE2_4_d_2, WERTE2_4_d_1, WERTE2_2_d_2,
	 WERTE2_2_d_1, WERTE2_0_d_2, WERTE2_0_d_1, WERTE2_9_ena_2,
	 WERTE2_9_ena_1, WERTE2_8_ena_2, WERTE2_8_ena_1, WERTE2_7_ena_2,
	 WERTE2_7_ena_1, WERTE2_6_ena_2, WERTE2_6_ena_1, WERTE2_4_ena_2,
	 WERTE2_4_ena_1, WERTE2_2_ena_2, WERTE2_2_ena_1, WERTE2_0_ena_2,
	 WERTE2_0_ena_1, WERTE1_11_d_2, WERTE1_11_d_1, WERTE1_9_d_2,
	 WERTE1_9_d_1, WERTE1_8_d_2, WERTE1_8_d_1, WERTE1_7_d_2, WERTE1_7_d_1,
	 WERTE1_6_d_2, WERTE1_6_d_1, WERTE1_4_d_2, WERTE1_4_d_1, WERTE1_2_d_2,
	 WERTE1_2_d_1, WERTE1_0_d_2, WERTE1_0_d_1, WERTE1_9_ena_2,
	 WERTE1_9_ena_1, WERTE1_8_ena_2, WERTE1_8_ena_1, WERTE1_7_ena_2,
	 WERTE1_7_ena_1, WERTE1_6_ena_2, WERTE1_6_ena_1, WERTE1_4_ena_2,
	 WERTE1_4_ena_1, WERTE1_2_ena_2, WERTE1_2_ena_1, WERTE1_0_ena_2,
	 WERTE1_0_ena_1, WERTE0_13_d_2, WERTE0_13_d_1, WERTE0_11_d_2,
	 WERTE0_11_d_1, WERTE0_9_d_2, WERTE0_9_d_1, WERTE0_8_d_2, WERTE0_8_d_1,
	 WERTE0_7_d_2, WERTE0_7_d_1, WERTE0_6_d_2, WERTE0_6_d_1, WERTE0_4_d_2,
	 WERTE0_4_d_1, WERTE0_2_d_2, WERTE0_2_d_1, WERTE0_0_d_2, WERTE0_0_d_1,
	 WERTE0_13_ena_2, WERTE0_13_ena_1, WERTE0_9_ena_2, WERTE0_9_ena_1,
	 WERTE0_8_ena_2, WERTE0_8_ena_1, WERTE0_7_ena_2, WERTE0_7_ena_1,
	 WERTE0_6_ena_2, WERTE0_6_ena_1, WERTE0_4_ena_2, WERTE0_4_ena_1,
	 WERTE0_2_ena_2, WERTE0_2_ena_1, WERTE0_0_ena_2, WERTE0_0_ena_1,
	 UPDATE_ON_2, UPDATE_ON_1, u3_enabledt, u2_enabledt, u1_enabledt,
	 u0_enabledt, vcc, gnd, UPDATE_ON, INC_JAHR, INC_MONAT, SOMMERZEIT,
	 WINTERZEIT, INC_TAG, INC_STD, INC_MIN, INC_SEC, UHR_DS, UHR_AS,
	 PSEUDO_BUS_ERROR, ACP_CONF_CS,
	 INT_CTR_CS: std_logic;
    signal INT_ENA_CS   : std_logic := '0';
    signal INT_CLEAR_CS : std_logic := '0';
    signal INT_LATCH_CS : std_logic := '0';
    
    FUNCTION to_std_logic(X: IN boolean) RETURN std_logic IS
        VARIABLE ret : std_logic;
    BEGIN
        IF x THEN
            ret := '1';
        ELSE
            ret := '0';
        END IF;
        RETURN ret;
    END to_std_logic;


   -- sizeIt replicates a value to an array of specific length.
    FUNCTION sizeIt(a: std_logic; len: integer) RETURN std_logic_vector IS
        VARIABLE rep: std_logic_vector( len - 1 DOWNTO 0);
    BEGIN
        FOR i IN rep'RANGE LOOP
            rep(i) := a;
        END loop;
        RETURN rep;
    END sizeit;
BEGIN

-- Sub Module Section
    u0: work.lpm_bustri_BYT
        PORT MAP
        (
            data => u0_data,
            enabledt => u0_enabledt,
            tridata => u0_tridata
        );
   
    u1: work.lpm_bustri_BYT 
        PORT MAP
        (
            data => u1_data,
            enabledt => u1_enabledt,
            tridata => u1_tridata
        );
   
    u2: work.lpm_bustri_BYT
        PORT MAP
        (
            data => u2_data,
            enabledt => u2_enabledt,
            tridata => u2_tridata
        );
   
    u3: work.lpm_bustri_BYT
        PORT MAP
        (
            data => u3_data,
            enabledt => u3_enabledt,
            tridata => u3_tridata
        );

-- Register Section

    ACP_CONF(31 DOWNTO 24) <= ACP_CONF_q(31 DOWNTO 24);
    
    PROCESS (ACP_CONF0_clk_ctrl)
    BEGIN
        IF ACP_CONF0_clk_ctrl'event and ACP_CONF0_clk_ctrl='1' THEN
            IF ACP_CONF24_ena_ctrl='1' THEN
                (ACP_CONF_q(31), ACP_CONF_q(30), ACP_CONF_q(29), ACP_CONF_q(28),
                ACP_CONF_q(27), ACP_CONF_q(26), ACP_CONF_q(25),
                ACP_CONF_q(24)) <= ACP_CONF_d(31 DOWNTO 24);
            END IF;
        END IF;
    END PROCESS;

    ACP_CONF(23 DOWNTO 16) <= ACP_CONF_q(23 DOWNTO 16);
    
    PROCESS (ACP_CONF0_clk_ctrl)
    BEGIN
        IF ACP_CONF0_clk_ctrl'event and ACP_CONF0_clk_ctrl='1' THEN
            IF ACP_CONF16_ena_ctrl='1' THEN
                (ACP_CONF_q(23), ACP_CONF_q(22), ACP_CONF_q(21), ACP_CONF_q(20),
                ACP_CONF_q(19), ACP_CONF_q(18), ACP_CONF_q(17),
                ACP_CONF_q(16)) <= ACP_CONF_d(23 DOWNTO 16);
            END IF;
        END IF;
    END PROCESS;

    ACP_CONF(15 DOWNTO 8) <= ACP_CONF_q(15 DOWNTO 8);
   
    PROCESS (ACP_CONF0_clk_ctrl)
    BEGIN
        IF ACP_CONF0_clk_ctrl'event and ACP_CONF0_clk_ctrl='1' THEN
            IF ACP_CONF8_ena_ctrl='1' THEN
                (ACP_CONF_q(15), ACP_CONF_q(14), ACP_CONF_q(13), ACP_CONF_q(12),
                ACP_CONF_q(11), ACP_CONF_q(10), ACP_CONF_q(9), ACP_CONF_q(8))
                <= ACP_CONF_d(15 DOWNTO 8);
            END IF;
        END IF;
    END PROCESS;

    ACP_CONF(7 DOWNTO 0) <= ACP_CONF_q(7 DOWNTO 0);
    
    PROCESS (ACP_CONF0_clk_ctrl)
    BEGIN
        IF ACP_CONF0_clk_ctrl'event and ACP_CONF0_clk_ctrl='1' THEN
            IF ACP_CONF0_ena_ctrl='1' THEN
                (ACP_CONF_q(7), ACP_CONF_q(6), ACP_CONF_q(5), ACP_CONF_q(4),
                ACP_CONF_q(3), ACP_CONF_q(2), ACP_CONF_q(1), ACP_CONF_q(0))
                <= ACP_CONF_d(7 DOWNTO 0);
            END IF;
        END IF;
    END PROCESS;

    PROCESS (INT_CTR0_clk_ctrl) BEGIN
      IF INT_CTR0_clk_ctrl'event and INT_CTR0_clk_ctrl='1' THEN
	 IF INT_CTR24_ena_ctrl='1' THEN
	    (INT_CTR_q(31), INT_CTR_q(30), INT_CTR_q(29), INT_CTR_q(28),
		  INT_CTR_q(27), INT_CTR_q(26), INT_CTR_q(25), INT_CTR_q(24))
		  <= INT_CTR_d(31 DOWNTO 24);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (INT_CTR0_clk_ctrl) BEGIN
      IF INT_CTR0_clk_ctrl'event and INT_CTR0_clk_ctrl='1' THEN
	 IF INT_CTR16_ena_ctrl='1' THEN
	    (INT_CTR_q(23), INT_CTR_q(22), INT_CTR_q(21), INT_CTR_q(20),
		  INT_CTR_q(19), INT_CTR_q(18), INT_CTR_q(17), INT_CTR_q(16))
		  <= INT_CTR_d(23 DOWNTO 16);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (INT_CTR0_clk_ctrl) BEGIN
      IF INT_CTR0_clk_ctrl'event and INT_CTR0_clk_ctrl='1' THEN
	 IF INT_CTR8_ena_ctrl='1' THEN
	    (INT_CTR_q(15), INT_CTR_q(14), INT_CTR_q(13), INT_CTR_q(12),
		  INT_CTR_q(11), INT_CTR_q(10), INT_CTR_q(9), INT_CTR_q(8)) <=
		  INT_CTR_d(15 DOWNTO 8);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (INT_CTR0_clk_ctrl) BEGIN
      IF INT_CTR0_clk_ctrl'event and INT_CTR0_clk_ctrl='1' THEN
	 IF INT_CTR0_ena_ctrl='1' THEN
	    (INT_CTR_q(7), INT_CTR_q(6), INT_CTR_q(5), INT_CTR_q(4),
		  INT_CTR_q(3), INT_CTR_q(2), INT_CTR_q(1), INT_CTR_q(0)) <=
		  INT_CTR_d(7 DOWNTO 0);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (INT_LATCH_clk, INT_LATCH_clrn) BEGIN
      IF INT_LATCH_clrn(31)='0' THEN
	 INT_LATCH_q(31) <= '0';
      ELSIF INT_LATCH_clk(31)'event and INT_LATCH_clk(31)='1' THEN
	 INT_LATCH_q(31) <= INT_LATCH_d(31);
      END IF;
   END PROCESS;

   PROCESS (INT_LATCH_clk, INT_LATCH_clrn) BEGIN
      IF INT_LATCH_clrn(30)='0' THEN
	 INT_LATCH_q(30) <= '0';
      ELSIF INT_LATCH_clk(30)'event and INT_LATCH_clk(30)='1' THEN
	 INT_LATCH_q(30) <= INT_LATCH_d(30);
      END IF;
   END PROCESS;

   PROCESS (INT_LATCH_clk, INT_LATCH_clrn) BEGIN
      IF INT_LATCH_clrn(29)='0' THEN
	 INT_LATCH_q(29) <= '0';
      ELSIF INT_LATCH_clk(29)'event and INT_LATCH_clk(29)='1' THEN
	 INT_LATCH_q(29) <= INT_LATCH_d(29);
      END IF;
   END PROCESS;

   PROCESS (INT_LATCH_clk, INT_LATCH_clrn) BEGIN
      IF INT_LATCH_clrn(28)='0' THEN
	 INT_LATCH_q(28) <= '0';
      ELSIF INT_LATCH_clk(28)'event and INT_LATCH_clk(28)='1' THEN
	 INT_LATCH_q(28) <= INT_LATCH_d(28);
      END IF;
   END PROCESS;

   PROCESS (INT_LATCH_clk, INT_LATCH_clrn) BEGIN
      IF INT_LATCH_clrn(27)='0' THEN
	 INT_LATCH_q(27) <= '0';
      ELSIF INT_LATCH_clk(27)'event and INT_LATCH_clk(27)='1' THEN
	 INT_LATCH_q(27) <= INT_LATCH_d(27);
      END IF;
   END PROCESS;

   PROCESS (INT_LATCH_clk, INT_LATCH_clrn) BEGIN
      IF INT_LATCH_clrn(26)='0' THEN
	 INT_LATCH_q(26) <= '0';
      ELSIF INT_LATCH_clk(26)'event and INT_LATCH_clk(26)='1' THEN
	 INT_LATCH_q(26) <= INT_LATCH_d(26);
      END IF;
   END PROCESS;

   PROCESS (INT_LATCH_clk, INT_LATCH_clrn) BEGIN
      IF INT_LATCH_clrn(25)='0' THEN
	 INT_LATCH_q(25) <= '0';
      ELSIF INT_LATCH_clk(25)'event and INT_LATCH_clk(25)='1' THEN
	 INT_LATCH_q(25) <= INT_LATCH_d(25);
      END IF;
   END PROCESS;

   PROCESS (INT_LATCH_clk, INT_LATCH_clrn) BEGIN
      IF INT_LATCH_clrn(24)='0' THEN
	 INT_LATCH_q(24) <= '0';
      ELSIF INT_LATCH_clk(24)'event and INT_LATCH_clk(24)='1' THEN
	 INT_LATCH_q(24) <= INT_LATCH_d(24);
      END IF;
   END PROCESS;

   PROCESS (INT_LATCH_clk, INT_LATCH_clrn) BEGIN
      IF INT_LATCH_clrn(23)='0' THEN
	 INT_LATCH_q(23) <= '0';
      ELSIF INT_LATCH_clk(23)'event and INT_LATCH_clk(23)='1' THEN
	 INT_LATCH_q(23) <= INT_LATCH_d(23);
      END IF;
   END PROCESS;

   PROCESS (INT_LATCH_clk, INT_LATCH_clrn) BEGIN
      IF INT_LATCH_clrn(22)='0' THEN
	 INT_LATCH_q(22) <= '0';
      ELSIF INT_LATCH_clk(22)'event and INT_LATCH_clk(22)='1' THEN
	 INT_LATCH_q(22) <= INT_LATCH_d(22);
      END IF;
   END PROCESS;

   PROCESS (INT_LATCH_clk, INT_LATCH_clrn) BEGIN
      IF INT_LATCH_clrn(21)='0' THEN
	 INT_LATCH_q(21) <= '0';
      ELSIF INT_LATCH_clk(21)'event and INT_LATCH_clk(21)='1' THEN
	 INT_LATCH_q(21) <= INT_LATCH_d(21);
      END IF;
   END PROCESS;

   PROCESS (INT_LATCH_clk, INT_LATCH_clrn) BEGIN
      IF INT_LATCH_clrn(20)='0' THEN
	 INT_LATCH_q(20) <= '0';
      ELSIF INT_LATCH_clk(20)'event and INT_LATCH_clk(20)='1' THEN
	 INT_LATCH_q(20) <= INT_LATCH_d(20);
      END IF;
   END PROCESS;

   PROCESS (INT_LATCH_clk, INT_LATCH_clrn) BEGIN
      IF INT_LATCH_clrn(19)='0' THEN
	 INT_LATCH_q(19) <= '0';
      ELSIF INT_LATCH_clk(19)'event and INT_LATCH_clk(19)='1' THEN
	 INT_LATCH_q(19) <= INT_LATCH_d(19);
      END IF;
   END PROCESS;

   PROCESS (INT_LATCH_clk, INT_LATCH_clrn) BEGIN
      IF INT_LATCH_clrn(18)='0' THEN
	 INT_LATCH_q(18) <= '0';
      ELSIF INT_LATCH_clk(18)'event and INT_LATCH_clk(18)='1' THEN
	 INT_LATCH_q(18) <= INT_LATCH_d(18);
      END IF;
   END PROCESS;

   PROCESS (INT_LATCH_clk, INT_LATCH_clrn) BEGIN
      IF INT_LATCH_clrn(17)='0' THEN
	 INT_LATCH_q(17) <= '0';
      ELSIF INT_LATCH_clk(17)'event and INT_LATCH_clk(17)='1' THEN
	 INT_LATCH_q(17) <= INT_LATCH_d(17);
      END IF;
   END PROCESS;

   PROCESS (INT_LATCH_clk, INT_LATCH_clrn) BEGIN
      IF INT_LATCH_clrn(16)='0' THEN
	 INT_LATCH_q(16) <= '0';
      ELSIF INT_LATCH_clk(16)'event and INT_LATCH_clk(16)='1' THEN
	 INT_LATCH_q(16) <= INT_LATCH_d(16);
      END IF;
   END PROCESS;

   PROCESS (INT_LATCH_clk, INT_LATCH_clrn) BEGIN
      IF INT_LATCH_clrn(15)='0' THEN
	 INT_LATCH_q(15) <= '0';
      ELSIF INT_LATCH_clk(15)'event and INT_LATCH_clk(15)='1' THEN
	 INT_LATCH_q(15) <= INT_LATCH_d(15);
      END IF;
   END PROCESS;

   PROCESS (INT_LATCH_clk, INT_LATCH_clrn) BEGIN
      IF INT_LATCH_clrn(14)='0' THEN
	 INT_LATCH_q(14) <= '0';
      ELSIF INT_LATCH_clk(14)'event and INT_LATCH_clk(14)='1' THEN
	 INT_LATCH_q(14) <= INT_LATCH_d(14);
      END IF;
   END PROCESS;

   PROCESS (INT_LATCH_clk, INT_LATCH_clrn) BEGIN
      IF INT_LATCH_clrn(13)='0' THEN
	 INT_LATCH_q(13) <= '0';
      ELSIF INT_LATCH_clk(13)'event and INT_LATCH_clk(13)='1' THEN
	 INT_LATCH_q(13) <= INT_LATCH_d(13);
      END IF;
   END PROCESS;

   PROCESS (INT_LATCH_clk, INT_LATCH_clrn) BEGIN
      IF INT_LATCH_clrn(12)='0' THEN
	 INT_LATCH_q(12) <= '0';
      ELSIF INT_LATCH_clk(12)'event and INT_LATCH_clk(12)='1' THEN
	 INT_LATCH_q(12) <= INT_LATCH_d(12);
      END IF;
   END PROCESS;

   PROCESS (INT_LATCH_clk, INT_LATCH_clrn) BEGIN
      IF INT_LATCH_clrn(11)='0' THEN
	 INT_LATCH_q(11) <= '0';
      ELSIF INT_LATCH_clk(11)'event and INT_LATCH_clk(11)='1' THEN
	 INT_LATCH_q(11) <= INT_LATCH_d(11);
      END IF;
   END PROCESS;

   PROCESS (INT_LATCH_clk, INT_LATCH_clrn) BEGIN
      IF INT_LATCH_clrn(10)='0' THEN
	 INT_LATCH_q(10) <= '0';
      ELSIF INT_LATCH_clk(10)'event and INT_LATCH_clk(10)='1' THEN
	 INT_LATCH_q(10) <= INT_LATCH_d(10);
      END IF;
   END PROCESS;

   PROCESS (INT_LATCH9_clk_1, INT_LATCH_clrn) BEGIN
      IF INT_LATCH_clrn(9)='0' THEN
	 INT_LATCH_q(9) <= '0';
      ELSIF INT_LATCH9_clk_1'event and INT_LATCH9_clk_1='1' THEN
	 INT_LATCH_q(9) <= INT_LATCH_d(9);
      END IF;
   END PROCESS;

   PROCESS (INT_LATCH8_clk_1, INT_LATCH_clrn) BEGIN
      IF INT_LATCH_clrn(8)='0' THEN
	 INT_LATCH_q(8) <= '0';
      ELSIF INT_LATCH8_clk_1'event and INT_LATCH8_clk_1='1' THEN
	 INT_LATCH_q(8) <= INT_LATCH_d(8);
      END IF;
   END PROCESS;

   PROCESS (INT_LATCH7_clk_1, INT_LATCH_clrn) BEGIN
      IF INT_LATCH_clrn(7)='0' THEN
	 INT_LATCH_q(7) <= '0';
      ELSIF INT_LATCH7_clk_1'event and INT_LATCH7_clk_1='1' THEN
	 INT_LATCH_q(7) <= INT_LATCH_d(7);
      END IF;
   END PROCESS;

   PROCESS (INT_LATCH6_clk_1, INT_LATCH_clrn) BEGIN
      IF INT_LATCH_clrn(6)='0' THEN
	 INT_LATCH_q(6) <= '0';
      ELSIF INT_LATCH6_clk_1'event and INT_LATCH6_clk_1='1' THEN
	 INT_LATCH_q(6) <= INT_LATCH_d(6);
      END IF;
   END PROCESS;

   PROCESS (INT_LATCH5_clk_1, INT_LATCH_clrn) BEGIN
      IF INT_LATCH_clrn(5)='0' THEN
	 INT_LATCH_q(5) <= '0';
      ELSIF INT_LATCH5_clk_1'event and INT_LATCH5_clk_1='1' THEN
	 INT_LATCH_q(5) <= INT_LATCH_d(5);
      END IF;
   END PROCESS;

   PROCESS (INT_LATCH4_clk_1, INT_LATCH_clrn) BEGIN
      IF INT_LATCH_clrn(4)='0' THEN
	 INT_LATCH_q(4) <= '0';
      ELSIF INT_LATCH4_clk_1'event and INT_LATCH4_clk_1='1' THEN
	 INT_LATCH_q(4) <= INT_LATCH_d(4);
      END IF;
   END PROCESS;

   PROCESS (INT_LATCH3_clk_1, INT_LATCH_clrn) BEGIN
      IF INT_LATCH_clrn(3)='0' THEN
	 INT_LATCH_q(3) <= '0';
      ELSIF INT_LATCH3_clk_1'event and INT_LATCH3_clk_1='1' THEN
	 INT_LATCH_q(3) <= INT_LATCH_d(3);
      END IF;
   END PROCESS;

   PROCESS (INT_LATCH2_clk_1, INT_LATCH_clrn) BEGIN
      IF INT_LATCH_clrn(2)='0' THEN
	 INT_LATCH_q(2) <= '0';
      ELSIF INT_LATCH2_clk_1'event and INT_LATCH2_clk_1='1' THEN
	 INT_LATCH_q(2) <= INT_LATCH_d(2);
      END IF;
   END PROCESS;

   PROCESS (INT_LATCH1_clk_1, INT_LATCH_clrn) BEGIN
      IF INT_LATCH_clrn(1)='0' THEN
	 INT_LATCH_q(1) <= '0';
      ELSIF INT_LATCH1_clk_1'event and INT_LATCH1_clk_1='1' THEN
	 INT_LATCH_q(1) <= INT_LATCH_d(1);
      END IF;
   END PROCESS;

    PROCESS (INT_LATCH0_clk_1, INT_LATCH_clrn)
    BEGIN
        IF INT_LATCH_clrn(0)='0' THEN
            INT_LATCH_q(0) <= '0';
        ELSIF INT_LATCH0_clk_1'event and INT_LATCH0_clk_1='1' THEN
            INT_LATCH_q(0) <= INT_LATCH_d(0);
        END IF;
    END PROCESS;

    PROCESS (INT_CLEAR0_clk_ctrl)
    BEGIN
        IF INT_CLEAR0_clk_ctrl'event and INT_CLEAR0_clk_ctrl='1' THEN
            INT_CLEAR_q <= INT_CLEAR_d;
        END IF;
    END PROCESS;

    PROCESS (INT_ENA0_clk_ctrl, INT_ENA0_clrn_ctrl)
    BEGIN
        IF INT_ENA0_clrn_ctrl='0' THEN
            (INT_ENA_q(31), INT_ENA_q(30), INT_ENA_q(29), INT_ENA_q(28),
                    INT_ENA_q(27), INT_ENA_q(26), INT_ENA_q(25), INT_ENA_q(24)) <= std_logic_vector'("00000000");
        ELSIF INT_ENA0_clk_ctrl'event and INT_ENA0_clk_ctrl='1' THEN
            IF INT_ENA24_ena_ctrl='1' THEN
                (INT_ENA_q(31), INT_ENA_q(30), INT_ENA_q(29), INT_ENA_q(28), INT_ENA_q(27), INT_ENA_q(26), INT_ENA_q(25), INT_ENA_q(24)) <= INT_ENA_d(31 DOWNTO 24);
            END IF;
        END IF;
    END PROCESS;

    PROCESS (INT_ENA0_clk_ctrl, INT_ENA0_clrn_ctrl) BEGIN
        IF INT_ENA0_clrn_ctrl='0' THEN
            (INT_ENA_q(23), INT_ENA_q(22), INT_ENA_q(21), INT_ENA_q(20), INT_ENA_q(19), INT_ENA_q(18), INT_ENA_q(17), INT_ENA_q(16)) <= std_logic_vector'("00000000");
        ELSIF INT_ENA0_clk_ctrl'event and INT_ENA0_clk_ctrl='1' THEN
            IF INT_ENA16_ena_ctrl='1' THEN
                (INT_ENA_q(23), INT_ENA_q(22), INT_ENA_q(21), INT_ENA_q(20), INT_ENA_q(19), INT_ENA_q(18), INT_ENA_q(17), INT_ENA_q(16)) <= INT_ENA_d(23 DOWNTO 16);
            END IF;
        END IF;
    END PROCESS;

    PROCESS (INT_ENA0_clk_ctrl, INT_ENA0_clrn_ctrl) BEGIN
        IF INT_ENA0_clrn_ctrl='0' THEN
            (INT_ENA_q(15), INT_ENA_q(14), INT_ENA_q(13), INT_ENA_q(12), INT_ENA_q(11), INT_ENA_q(10), INT_ENA_q(9), INT_ENA_q(8)) <= std_logic_vector'("00000000");
        ELSIF INT_ENA0_clk_ctrl'event and INT_ENA0_clk_ctrl='1' THEN
            IF INT_ENA8_ena_ctrl='1' THEN
                (INT_ENA_q(15), INT_ENA_q(14), INT_ENA_q(13), INT_ENA_q(12), INT_ENA_q(11), INT_ENA_q(10), INT_ENA_q(9), INT_ENA_q(8)) <=  INT_ENA_d(15 DOWNTO 8);
            END IF;
        END IF;
    END PROCESS;

    PROCESS (INT_ENA0_clk_ctrl, INT_ENA0_clrn_ctrl) BEGIN
        IF INT_ENA0_clrn_ctrl='0' THEN
            (INT_ENA_q(7), INT_ENA_q(6), INT_ENA_q(5), INT_ENA_q(4), INT_ENA_q(3), INT_ENA_q(2), INT_ENA_q(1), INT_ENA_q(0)) <= std_logic_vector'("00000000");
        ELSIF INT_ENA0_clk_ctrl'event and INT_ENA0_clk_ctrl='1' THEN
            IF INT_ENA0_ena_ctrl='1' THEN
                (INT_ENA_q(7), INT_ENA_q(6), INT_ENA_q(5), INT_ENA_q(4), INT_ENA_q(3), INT_ENA_q(2), INT_ENA_q(1), INT_ENA_q(0)) <= INT_ENA_d(7 DOWNTO 0);
            END IF;
        END IF;
    END PROCESS;

    PROCESS (INT_L0_clk_ctrl, INT_L0_clrn_ctrl) BEGIN
        IF INT_L0_clrn_ctrl='0' THEN
            INT_L_q <= std_logic_vector'("0000000000");
        ELSIF INT_L0_clk_ctrl'event and INT_L0_clk_ctrl='1' THEN
            INT_L_q <= INT_L_d;
        END IF;
    END PROCESS;

    PROCESS (INT_LA9_0_clk_ctrl, INT_LA9_0_clrn_ctrl) BEGIN
        IF INT_LA9_0_clrn_ctrl='0' THEN
            INT_LA9_q <= std_logic_vector'("0000");
        ELSIF INT_LA9_0_clk_ctrl'event and INT_LA9_0_clk_ctrl='1' THEN
            INT_LA9_q <= INT_LA9_d;
        END IF;
    END PROCESS;

    PROCESS (INT_LA8_0_clk_ctrl, INT_LA8_0_clrn_ctrl) BEGIN
        IF INT_LA8_0_clrn_ctrl='0' THEN
            INT_LA8_q <= std_logic_vector'("0000");
        ELSIF INT_LA8_0_clk_ctrl'event and INT_LA8_0_clk_ctrl='1' THEN
            INT_LA8_q <= INT_LA8_d;
        END IF;
    END PROCESS;

    PROCESS (INT_LA7_0_clk_ctrl, INT_LA7_0_clrn_ctrl) BEGIN
        IF INT_LA7_0_clrn_ctrl='0' THEN
            INT_LA7_q <= std_logic_vector'("0000");
        ELSIF INT_LA7_0_clk_ctrl'event and INT_LA7_0_clk_ctrl='1' THEN
            INT_LA7_q <= INT_LA7_d;
        END IF;
    END PROCESS;

    PROCESS (INT_LA6_0_clk_ctrl, INT_LA6_0_clrn_ctrl) BEGIN
        IF INT_LA6_0_clrn_ctrl='0' THEN
            INT_LA6_q <= std_logic_vector'("0000");
        ELSIF INT_LA6_0_clk_ctrl'event and INT_LA6_0_clk_ctrl='1' THEN
            INT_LA6_q <= INT_LA6_d;
        END IF;
    END PROCESS;

    PROCESS (INT_LA5_0_clk_ctrl, INT_LA5_0_clrn_ctrl) BEGIN
        IF INT_LA5_0_clrn_ctrl='0' THEN
            INT_LA5_q <= std_logic_vector'("0000");
        ELSIF INT_LA5_0_clk_ctrl'event and INT_LA5_0_clk_ctrl='1' THEN
            INT_LA5_q <= INT_LA5_d;
        END IF;
    END PROCESS;

    PROCESS (INT_LA4_0_clk_ctrl, INT_LA4_0_clrn_ctrl) BEGIN
        IF INT_LA4_0_clrn_ctrl='0' THEN
            INT_LA4_q <= std_logic_vector'("0000");
        ELSIF INT_LA4_0_clk_ctrl'event and INT_LA4_0_clk_ctrl='1' THEN
            INT_LA4_q <= INT_LA4_d;
        END IF;
    END PROCESS;

    PROCESS (INT_LA3_0_clk_ctrl, INT_LA3_0_clrn_ctrl) BEGIN
        IF INT_LA3_0_clrn_ctrl='0' THEN
            INT_LA3_q <= std_logic_vector'("0000");
        ELSIF INT_LA3_0_clk_ctrl'event and INT_LA3_0_clk_ctrl='1' THEN
            INT_LA3_q <= INT_LA3_d;
        END IF;
    END PROCESS;

    PROCESS (INT_LA2_0_clk_ctrl, INT_LA2_0_clrn_ctrl) BEGIN
        IF INT_LA2_0_clrn_ctrl='0' THEN
            INT_LA2_q <= std_logic_vector'("0000");
        ELSIF INT_LA2_0_clk_ctrl'event and INT_LA2_0_clk_ctrl='1' THEN
            INT_LA2_q <= INT_LA2_d;
        END IF;
    END PROCESS;

    PROCESS (INT_LA1_0_clk_ctrl, INT_LA1_0_clrn_ctrl) BEGIN
      IF INT_LA1_0_clrn_ctrl='0' THEN
	 INT_LA1_q <= std_logic_vector'("0000");
      ELSIF INT_LA1_0_clk_ctrl'event and INT_LA1_0_clk_ctrl='1' THEN
	 INT_LA1_q <= INT_LA1_d;
      END IF;
   END PROCESS;

   PROCESS (INT_LA0_0_clk_ctrl, INT_LA0_0_clrn_ctrl) BEGIN
      IF INT_LA0_0_clrn_ctrl='0' THEN
	 INT_LA0_q <= std_logic_vector'("0000");
      ELSIF INT_LA0_0_clk_ctrl'event and INT_LA0_0_clk_ctrl='1' THEN
	 INT_LA0_q <= INT_LA0_d;
      END IF;
   END PROCESS;

   PROCESS (RTC_ADR0_clk_ctrl) BEGIN
      IF RTC_ADR0_clk_ctrl'event and RTC_ADR0_clk_ctrl='1' THEN
	 IF RTC_ADR0_ena_ctrl='1' THEN
	    RTC_ADR_q <= RTC_ADR_d;
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (ACHTELSEKUNDEN0_clk_ctrl) BEGIN
      IF ACHTELSEKUNDEN0_clk_ctrl'event and ACHTELSEKUNDEN0_clk_ctrl='1' THEN
	 IF ACHTELSEKUNDEN0_ena_ctrl='1' THEN
	    ACHTELSEKUNDEN_q <= ACHTELSEKUNDEN_d;
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_63_ena_ctrl='1' THEN
	    WERTE7_q(63) <= WERTE7_d(63);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_62_ena_ctrl='1' THEN
	    WERTE7_q(62) <= WERTE7_d(62);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_61_ena_ctrl='1' THEN
	    WERTE7_q(61) <= WERTE7_d(61);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_60_ena_ctrl='1' THEN
	    WERTE7_q(60) <= WERTE7_d(60);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_59_ena_ctrl='1' THEN
	    WERTE7_q(59) <= WERTE7_d(59);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_58_ena_ctrl='1' THEN
	    WERTE7_q(58) <= WERTE7_d(58);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_57_ena_ctrl='1' THEN
	    WERTE7_q(57) <= WERTE7_d(57);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_56_ena_ctrl='1' THEN
	    WERTE7_q(56) <= WERTE7_d(56);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_55_ena_ctrl='1' THEN
	    WERTE7_q(55) <= WERTE7_d(55);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_54_ena_ctrl='1' THEN
	    WERTE7_q(54) <= WERTE7_d(54);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_53_ena_ctrl='1' THEN
	    WERTE7_q(53) <= WERTE7_d(53);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_52_ena_ctrl='1' THEN
	    WERTE7_q(52) <= WERTE7_d(52);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_51_ena_ctrl='1' THEN
	    WERTE7_q(51) <= WERTE7_d(51);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_50_ena_ctrl='1' THEN
	    WERTE7_q(50) <= WERTE7_d(50);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_49_ena_ctrl='1' THEN
	    WERTE7_q(49) <= WERTE7_d(49);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_48_ena_ctrl='1' THEN
	    WERTE7_q(48) <= WERTE7_d(48);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_47_ena_ctrl='1' THEN
	    WERTE7_q(47) <= WERTE7_d(47);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_46_ena_ctrl='1' THEN
	    WERTE7_q(46) <= WERTE7_d(46);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_45_ena_ctrl='1' THEN
	    WERTE7_q(45) <= WERTE7_d(45);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_44_ena_ctrl='1' THEN
	    WERTE7_q(44) <= WERTE7_d(44);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_43_ena_ctrl='1' THEN
	    WERTE7_q(43) <= WERTE7_d(43);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_42_ena_ctrl='1' THEN
	    WERTE7_q(42) <= WERTE7_d(42);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_41_ena_ctrl='1' THEN
	    WERTE7_q(41) <= WERTE7_d(41);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_40_ena_ctrl='1' THEN
	    WERTE7_q(40) <= WERTE7_d(40);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_39_ena_ctrl='1' THEN
	    WERTE7_q(39) <= WERTE7_d(39);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_38_ena_ctrl='1' THEN
	    WERTE7_q(38) <= WERTE7_d(38);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_37_ena_ctrl='1' THEN
	    WERTE7_q(37) <= WERTE7_d(37);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_36_ena_ctrl='1' THEN
	    WERTE7_q(36) <= WERTE7_d(36);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_35_ena_ctrl='1' THEN
	    WERTE7_q(35) <= WERTE7_d(35);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_34_ena_ctrl='1' THEN
	    WERTE7_q(34) <= WERTE7_d(34);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_33_ena_ctrl='1' THEN
	    WERTE7_q(33) <= WERTE7_d(33);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_32_ena_ctrl='1' THEN
	    WERTE7_q(32) <= WERTE7_d(32);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_31_ena_ctrl='1' THEN
	    WERTE7_q(31) <= WERTE7_d(31);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_30_ena_ctrl='1' THEN
	    WERTE7_q(30) <= WERTE7_d(30);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_29_ena_ctrl='1' THEN
	    WERTE7_q(29) <= WERTE7_d(29);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_28_ena_ctrl='1' THEN
	    WERTE7_q(28) <= WERTE7_d(28);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_27_ena_ctrl='1' THEN
	    WERTE7_q(27) <= WERTE7_d(27);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_26_ena_ctrl='1' THEN
	    WERTE7_q(26) <= WERTE7_d(26);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_25_ena_ctrl='1' THEN
	    WERTE7_q(25) <= WERTE7_d(25);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_24_ena_ctrl='1' THEN
	    WERTE7_q(24) <= WERTE7_d(24);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_23_ena_ctrl='1' THEN
	    WERTE7_q(23) <= WERTE7_d(23);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_22_ena_ctrl='1' THEN
	    WERTE7_q(22) <= WERTE7_d(22);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_21_ena_ctrl='1' THEN
	    WERTE7_q(21) <= WERTE7_d(21);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_20_ena_ctrl='1' THEN
	    WERTE7_q(20) <= WERTE7_d(20);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_19_ena_ctrl='1' THEN
	    WERTE7_q(19) <= WERTE7_d(19);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_18_ena_ctrl='1' THEN
	    WERTE7_q(18) <= WERTE7_d(18);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_17_ena_ctrl='1' THEN
	    WERTE7_q(17) <= WERTE7_d(17);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_16_ena_ctrl='1' THEN
	    WERTE7_q(16) <= WERTE7_d(16);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_15_ena_ctrl='1' THEN
	    WERTE7_q(15) <= WERTE7_d(15);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_14_ena_ctrl='1' THEN
	    WERTE7_q(14) <= WERTE7_d(14);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE7_ena(13)='1' THEN
	    WERTE7_q(13) <= WERTE7_d(13);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_12_ena_ctrl='1' THEN
	    WERTE7_q(12) <= WERTE7_d(12);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_11_ena_ctrl='1' THEN
	    WERTE7_q(11) <= WERTE7_d(11);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_10_ena_ctrl='1' THEN
	    WERTE7_q(10) <= WERTE7_d(10);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE7_ena(9)='1' THEN
	    WERTE7_q(9) <= WERTE7_d(9);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE7_ena(8)='1' THEN
	    WERTE7_q(8) <= WERTE7_d(8);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE7_ena(7)='1' THEN
	    WERTE7_q(7) <= WERTE7_d(7);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE7_ena(6)='1' THEN
	    WERTE7_q(6) <= WERTE7_d(6);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_5_ena_ctrl='1' THEN
	    WERTE7_q(5) <= WERTE7_d(5);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE7_ena(4)='1' THEN
	    WERTE7_q(4) <= WERTE7_d(4);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_3_ena_ctrl='1' THEN
	    WERTE7_q(3) <= WERTE7_d(3);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE7_ena(2)='1' THEN
	    WERTE7_q(2) <= WERTE7_d(2);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE0_1_ena_ctrl='1' THEN
	    WERTE7_q(1) <= WERTE7_d(1);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE7_0_clk_ctrl) BEGIN
      IF WERTE7_0_clk_ctrl'event and WERTE7_0_clk_ctrl='1' THEN
	 IF WERTE7_ena(0)='1' THEN
	    WERTE7_q(0) <= WERTE7_d(0);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_63_ena_ctrl='1' THEN
	    WERTE6_q(63) <= WERTE6_d(63);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_62_ena_ctrl='1' THEN
	    WERTE6_q(62) <= WERTE6_d(62);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_61_ena_ctrl='1' THEN
	    WERTE6_q(61) <= WERTE6_d(61);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_60_ena_ctrl='1' THEN
	    WERTE6_q(60) <= WERTE6_d(60);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_59_ena_ctrl='1' THEN
	    WERTE6_q(59) <= WERTE6_d(59);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_58_ena_ctrl='1' THEN
	    WERTE6_q(58) <= WERTE6_d(58);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_57_ena_ctrl='1' THEN
	    WERTE6_q(57) <= WERTE6_d(57);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_56_ena_ctrl='1' THEN
	    WERTE6_q(56) <= WERTE6_d(56);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_55_ena_ctrl='1' THEN
	    WERTE6_q(55) <= WERTE6_d(55);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_54_ena_ctrl='1' THEN
	    WERTE6_q(54) <= WERTE6_d(54);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_53_ena_ctrl='1' THEN
	    WERTE6_q(53) <= WERTE6_d(53);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_52_ena_ctrl='1' THEN
	    WERTE6_q(52) <= WERTE6_d(52);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_51_ena_ctrl='1' THEN
	    WERTE6_q(51) <= WERTE6_d(51);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_50_ena_ctrl='1' THEN
	    WERTE6_q(50) <= WERTE6_d(50);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_49_ena_ctrl='1' THEN
	    WERTE6_q(49) <= WERTE6_d(49);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_48_ena_ctrl='1' THEN
	    WERTE6_q(48) <= WERTE6_d(48);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_47_ena_ctrl='1' THEN
	    WERTE6_q(47) <= WERTE6_d(47);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_46_ena_ctrl='1' THEN
	    WERTE6_q(46) <= WERTE6_d(46);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_45_ena_ctrl='1' THEN
	    WERTE6_q(45) <= WERTE6_d(45);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_44_ena_ctrl='1' THEN
	    WERTE6_q(44) <= WERTE6_d(44);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_43_ena_ctrl='1' THEN
	    WERTE6_q(43) <= WERTE6_d(43);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_42_ena_ctrl='1' THEN
	    WERTE6_q(42) <= WERTE6_d(42);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_41_ena_ctrl='1' THEN
	    WERTE6_q(41) <= WERTE6_d(41);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_40_ena_ctrl='1' THEN
	    WERTE6_q(40) <= WERTE6_d(40);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_39_ena_ctrl='1' THEN
	    WERTE6_q(39) <= WERTE6_d(39);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_38_ena_ctrl='1' THEN
	    WERTE6_q(38) <= WERTE6_d(38);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_37_ena_ctrl='1' THEN
	    WERTE6_q(37) <= WERTE6_d(37);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_36_ena_ctrl='1' THEN
	    WERTE6_q(36) <= WERTE6_d(36);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_35_ena_ctrl='1' THEN
	    WERTE6_q(35) <= WERTE6_d(35);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_34_ena_ctrl='1' THEN
	    WERTE6_q(34) <= WERTE6_d(34);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_33_ena_ctrl='1' THEN
	    WERTE6_q(33) <= WERTE6_d(33);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_32_ena_ctrl='1' THEN
	    WERTE6_q(32) <= WERTE6_d(32);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_31_ena_ctrl='1' THEN
	    WERTE6_q(31) <= WERTE6_d(31);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_30_ena_ctrl='1' THEN
	    WERTE6_q(30) <= WERTE6_d(30);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_29_ena_ctrl='1' THEN
	    WERTE6_q(29) <= WERTE6_d(29);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_28_ena_ctrl='1' THEN
	    WERTE6_q(28) <= WERTE6_d(28);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_27_ena_ctrl='1' THEN
	    WERTE6_q(27) <= WERTE6_d(27);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_26_ena_ctrl='1' THEN
	    WERTE6_q(26) <= WERTE6_d(26);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_25_ena_ctrl='1' THEN
	    WERTE6_q(25) <= WERTE6_d(25);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_24_ena_ctrl='1' THEN
	    WERTE6_q(24) <= WERTE6_d(24);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_23_ena_ctrl='1' THEN
	    WERTE6_q(23) <= WERTE6_d(23);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_22_ena_ctrl='1' THEN
	    WERTE6_q(22) <= WERTE6_d(22);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_21_ena_ctrl='1' THEN
	    WERTE6_q(21) <= WERTE6_d(21);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_20_ena_ctrl='1' THEN
	    WERTE6_q(20) <= WERTE6_d(20);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_19_ena_ctrl='1' THEN
	    WERTE6_q(19) <= WERTE6_d(19);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_18_ena_ctrl='1' THEN
	    WERTE6_q(18) <= WERTE6_d(18);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_17_ena_ctrl='1' THEN
	    WERTE6_q(17) <= WERTE6_d(17);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_16_ena_ctrl='1' THEN
	    WERTE6_q(16) <= WERTE6_d(16);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_15_ena_ctrl='1' THEN
	    WERTE6_q(15) <= WERTE6_d(15);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_14_ena_ctrl='1' THEN
	    WERTE6_q(14) <= WERTE6_d(14);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE6_ena(13)='1' THEN
	    WERTE6_q(13) <= WERTE6_d(13);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_12_ena_ctrl='1' THEN
	    WERTE6_q(12) <= WERTE6_d(12);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_11_ena_ctrl='1' THEN
	    WERTE6_q(11) <= WERTE6_d(11);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl, WERTE6_clrn) BEGIN
      IF WERTE6_clrn(10)='0' THEN
	 WERTE6_q(10) <= '0';
      ELSIF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_10_ena_ctrl='1' THEN
	    WERTE6_q(10) <= WERTE6_d(10);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE6_ena(9)='1' THEN
	    WERTE6_q(9) <= WERTE6_d(9);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE6_ena(8)='1' THEN
	    WERTE6_q(8) <= WERTE6_d(8);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE6_ena(7)='1' THEN
	    WERTE6_q(7) <= WERTE6_d(7);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE6_ena(6)='1' THEN
	    WERTE6_q(6) <= WERTE6_d(6);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_5_ena_ctrl='1' THEN
	    WERTE6_q(5) <= WERTE6_d(5);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE6_ena(4)='1' THEN
	    WERTE6_q(4) <= WERTE6_d(4);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_3_ena_ctrl='1' THEN
	    WERTE6_q(3) <= WERTE6_d(3);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE6_ena(2)='1' THEN
	    WERTE6_q(2) <= WERTE6_d(2);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE0_1_ena_ctrl='1' THEN
	    WERTE6_q(1) <= WERTE6_d(1);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE6_0_clk_ctrl) BEGIN
      IF WERTE6_0_clk_ctrl'event and WERTE6_0_clk_ctrl='1' THEN
	 IF WERTE6_ena(0)='1' THEN
	    WERTE6_q(0) <= WERTE6_d(0);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_63_ena_ctrl='1' THEN
	    WERTE5_q(63) <= WERTE5_d(63);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_62_ena_ctrl='1' THEN
	    WERTE5_q(62) <= WERTE5_d(62);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_61_ena_ctrl='1' THEN
	    WERTE5_q(61) <= WERTE5_d(61);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_60_ena_ctrl='1' THEN
	    WERTE5_q(60) <= WERTE5_d(60);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_59_ena_ctrl='1' THEN
	    WERTE5_q(59) <= WERTE5_d(59);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_58_ena_ctrl='1' THEN
	    WERTE5_q(58) <= WERTE5_d(58);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_57_ena_ctrl='1' THEN
	    WERTE5_q(57) <= WERTE5_d(57);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_56_ena_ctrl='1' THEN
	    WERTE5_q(56) <= WERTE5_d(56);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_55_ena_ctrl='1' THEN
	    WERTE5_q(55) <= WERTE5_d(55);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_54_ena_ctrl='1' THEN
	    WERTE5_q(54) <= WERTE5_d(54);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_53_ena_ctrl='1' THEN
	    WERTE5_q(53) <= WERTE5_d(53);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_52_ena_ctrl='1' THEN
	    WERTE5_q(52) <= WERTE5_d(52);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_51_ena_ctrl='1' THEN
	    WERTE5_q(51) <= WERTE5_d(51);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_50_ena_ctrl='1' THEN
	    WERTE5_q(50) <= WERTE5_d(50);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_49_ena_ctrl='1' THEN
	    WERTE5_q(49) <= WERTE5_d(49);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_48_ena_ctrl='1' THEN
	    WERTE5_q(48) <= WERTE5_d(48);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_47_ena_ctrl='1' THEN
	    WERTE5_q(47) <= WERTE5_d(47);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_46_ena_ctrl='1' THEN
	    WERTE5_q(46) <= WERTE5_d(46);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_45_ena_ctrl='1' THEN
	    WERTE5_q(45) <= WERTE5_d(45);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_44_ena_ctrl='1' THEN
	    WERTE5_q(44) <= WERTE5_d(44);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_43_ena_ctrl='1' THEN
	    WERTE5_q(43) <= WERTE5_d(43);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_42_ena_ctrl='1' THEN
	    WERTE5_q(42) <= WERTE5_d(42);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_41_ena_ctrl='1' THEN
	    WERTE5_q(41) <= WERTE5_d(41);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_40_ena_ctrl='1' THEN
	    WERTE5_q(40) <= WERTE5_d(40);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_39_ena_ctrl='1' THEN
	    WERTE5_q(39) <= WERTE5_d(39);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_38_ena_ctrl='1' THEN
	    WERTE5_q(38) <= WERTE5_d(38);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_37_ena_ctrl='1' THEN
	    WERTE5_q(37) <= WERTE5_d(37);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_36_ena_ctrl='1' THEN
	    WERTE5_q(36) <= WERTE5_d(36);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_35_ena_ctrl='1' THEN
	    WERTE5_q(35) <= WERTE5_d(35);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_34_ena_ctrl='1' THEN
	    WERTE5_q(34) <= WERTE5_d(34);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_33_ena_ctrl='1' THEN
	    WERTE5_q(33) <= WERTE5_d(33);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_32_ena_ctrl='1' THEN
	    WERTE5_q(32) <= WERTE5_d(32);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_31_ena_ctrl='1' THEN
	    WERTE5_q(31) <= WERTE5_d(31);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_30_ena_ctrl='1' THEN
	    WERTE5_q(30) <= WERTE5_d(30);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_29_ena_ctrl='1' THEN
	    WERTE5_q(29) <= WERTE5_d(29);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_28_ena_ctrl='1' THEN
	    WERTE5_q(28) <= WERTE5_d(28);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_27_ena_ctrl='1' THEN
	    WERTE5_q(27) <= WERTE5_d(27);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_26_ena_ctrl='1' THEN
	    WERTE5_q(26) <= WERTE5_d(26);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_25_ena_ctrl='1' THEN
	    WERTE5_q(25) <= WERTE5_d(25);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_24_ena_ctrl='1' THEN
	    WERTE5_q(24) <= WERTE5_d(24);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_23_ena_ctrl='1' THEN
	    WERTE5_q(23) <= WERTE5_d(23);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_22_ena_ctrl='1' THEN
	    WERTE5_q(22) <= WERTE5_d(22);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_21_ena_ctrl='1' THEN
	    WERTE5_q(21) <= WERTE5_d(21);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_20_ena_ctrl='1' THEN
	    WERTE5_q(20) <= WERTE5_d(20);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_19_ena_ctrl='1' THEN
	    WERTE5_q(19) <= WERTE5_d(19);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_18_ena_ctrl='1' THEN
	    WERTE5_q(18) <= WERTE5_d(18);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_17_ena_ctrl='1' THEN
	    WERTE5_q(17) <= WERTE5_d(17);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_16_ena_ctrl='1' THEN
	    WERTE5_q(16) <= WERTE5_d(16);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_15_ena_ctrl='1' THEN
	    WERTE5_q(15) <= WERTE5_d(15);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_14_ena_ctrl='1' THEN
	    WERTE5_q(14) <= WERTE5_d(14);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE5_ena(13)='1' THEN
	    WERTE5_q(13) <= WERTE5_d(13);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_12_ena_ctrl='1' THEN
	    WERTE5_q(12) <= WERTE5_d(12);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_11_ena_ctrl='1' THEN
	    WERTE5_q(11) <= WERTE5_d(11);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_10_ena_ctrl='1' THEN
	    WERTE5_q(10) <= WERTE5_d(10);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE5_ena(9)='1' THEN
	    WERTE5_q(9) <= WERTE5_d(9);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE5_ena(8)='1' THEN
	    WERTE5_q(8) <= WERTE5_d(8);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE5_ena(7)='1' THEN
	    WERTE5_q(7) <= WERTE5_d(7);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE5_ena(6)='1' THEN
	    WERTE5_q(6) <= WERTE5_d(6);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_5_ena_ctrl='1' THEN
	    WERTE5_q(5) <= WERTE5_d(5);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE5_ena(4)='1' THEN
	    WERTE5_q(4) <= WERTE5_d(4);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_3_ena_ctrl='1' THEN
	    WERTE5_q(3) <= WERTE5_d(3);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE5_ena(2)='1' THEN
	    WERTE5_q(2) <= WERTE5_d(2);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE0_1_ena_ctrl='1' THEN
	    WERTE5_q(1) <= WERTE5_d(1);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE5_0_clk_ctrl) BEGIN
      IF WERTE5_0_clk_ctrl'event and WERTE5_0_clk_ctrl='1' THEN
	 IF WERTE5_ena(0)='1' THEN
	    WERTE5_q(0) <= WERTE5_d(0);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_63_ena_ctrl='1' THEN
	    WERTE4_q(63) <= WERTE4_d(63);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_62_ena_ctrl='1' THEN
	    WERTE4_q(62) <= WERTE4_d(62);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_61_ena_ctrl='1' THEN
	    WERTE4_q(61) <= WERTE4_d(61);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_60_ena_ctrl='1' THEN
	    WERTE4_q(60) <= WERTE4_d(60);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_59_ena_ctrl='1' THEN
	    WERTE4_q(59) <= WERTE4_d(59);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_58_ena_ctrl='1' THEN
	    WERTE4_q(58) <= WERTE4_d(58);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_57_ena_ctrl='1' THEN
	    WERTE4_q(57) <= WERTE4_d(57);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_56_ena_ctrl='1' THEN
	    WERTE4_q(56) <= WERTE4_d(56);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_55_ena_ctrl='1' THEN
	    WERTE4_q(55) <= WERTE4_d(55);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_54_ena_ctrl='1' THEN
	    WERTE4_q(54) <= WERTE4_d(54);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_53_ena_ctrl='1' THEN
	    WERTE4_q(53) <= WERTE4_d(53);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_52_ena_ctrl='1' THEN
	    WERTE4_q(52) <= WERTE4_d(52);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_51_ena_ctrl='1' THEN
	    WERTE4_q(51) <= WERTE4_d(51);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_50_ena_ctrl='1' THEN
	    WERTE4_q(50) <= WERTE4_d(50);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_49_ena_ctrl='1' THEN
	    WERTE4_q(49) <= WERTE4_d(49);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_48_ena_ctrl='1' THEN
	    WERTE4_q(48) <= WERTE4_d(48);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_47_ena_ctrl='1' THEN
	    WERTE4_q(47) <= WERTE4_d(47);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_46_ena_ctrl='1' THEN
	    WERTE4_q(46) <= WERTE4_d(46);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_45_ena_ctrl='1' THEN
	    WERTE4_q(45) <= WERTE4_d(45);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_44_ena_ctrl='1' THEN
	    WERTE4_q(44) <= WERTE4_d(44);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_43_ena_ctrl='1' THEN
	    WERTE4_q(43) <= WERTE4_d(43);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_42_ena_ctrl='1' THEN
	    WERTE4_q(42) <= WERTE4_d(42);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_41_ena_ctrl='1' THEN
	    WERTE4_q(41) <= WERTE4_d(41);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_40_ena_ctrl='1' THEN
	    WERTE4_q(40) <= WERTE4_d(40);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_39_ena_ctrl='1' THEN
	    WERTE4_q(39) <= WERTE4_d(39);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_38_ena_ctrl='1' THEN
	    WERTE4_q(38) <= WERTE4_d(38);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_37_ena_ctrl='1' THEN
	    WERTE4_q(37) <= WERTE4_d(37);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_36_ena_ctrl='1' THEN
	    WERTE4_q(36) <= WERTE4_d(36);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_35_ena_ctrl='1' THEN
	    WERTE4_q(35) <= WERTE4_d(35);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_34_ena_ctrl='1' THEN
	    WERTE4_q(34) <= WERTE4_d(34);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_33_ena_ctrl='1' THEN
	    WERTE4_q(33) <= WERTE4_d(33);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_32_ena_ctrl='1' THEN
	    WERTE4_q(32) <= WERTE4_d(32);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_31_ena_ctrl='1' THEN
	    WERTE4_q(31) <= WERTE4_d(31);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_30_ena_ctrl='1' THEN
	    WERTE4_q(30) <= WERTE4_d(30);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_29_ena_ctrl='1' THEN
	    WERTE4_q(29) <= WERTE4_d(29);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_28_ena_ctrl='1' THEN
	    WERTE4_q(28) <= WERTE4_d(28);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_27_ena_ctrl='1' THEN
	    WERTE4_q(27) <= WERTE4_d(27);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_26_ena_ctrl='1' THEN
	    WERTE4_q(26) <= WERTE4_d(26);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_25_ena_ctrl='1' THEN
	    WERTE4_q(25) <= WERTE4_d(25);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_24_ena_ctrl='1' THEN
	    WERTE4_q(24) <= WERTE4_d(24);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_23_ena_ctrl='1' THEN
	    WERTE4_q(23) <= WERTE4_d(23);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_22_ena_ctrl='1' THEN
	    WERTE4_q(22) <= WERTE4_d(22);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_21_ena_ctrl='1' THEN
	    WERTE4_q(21) <= WERTE4_d(21);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_20_ena_ctrl='1' THEN
	    WERTE4_q(20) <= WERTE4_d(20);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_19_ena_ctrl='1' THEN
	    WERTE4_q(19) <= WERTE4_d(19);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_18_ena_ctrl='1' THEN
	    WERTE4_q(18) <= WERTE4_d(18);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_17_ena_ctrl='1' THEN
	    WERTE4_q(17) <= WERTE4_d(17);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_16_ena_ctrl='1' THEN
	    WERTE4_q(16) <= WERTE4_d(16);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_15_ena_ctrl='1' THEN
	    WERTE4_q(15) <= WERTE4_d(15);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_14_ena_ctrl='1' THEN
	    WERTE4_q(14) <= WERTE4_d(14);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE4_ena(13)='1' THEN
	    WERTE4_q(13) <= WERTE4_d(13);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_12_ena_ctrl='1' THEN
	    WERTE4_q(12) <= WERTE4_d(12);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_11_ena_ctrl='1' THEN
	    WERTE4_q(11) <= WERTE4_d(11);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_10_ena_ctrl='1' THEN
	    WERTE4_q(10) <= WERTE4_d(10);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE4_ena(9)='1' THEN
	    WERTE4_q(9) <= WERTE4_d(9);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE4_ena(8)='1' THEN
	    WERTE4_q(8) <= WERTE4_d(8);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE4_ena(7)='1' THEN
	    WERTE4_q(7) <= WERTE4_d(7);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE4_ena(6)='1' THEN
	    WERTE4_q(6) <= WERTE4_d(6);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_5_ena_ctrl='1' THEN
	    WERTE4_q(5) <= WERTE4_d(5);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE4_ena(4)='1' THEN
	    WERTE4_q(4) <= WERTE4_d(4);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_3_ena_ctrl='1' THEN
	    WERTE4_q(3) <= WERTE4_d(3);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE4_ena(2)='1' THEN
	    WERTE4_q(2) <= WERTE4_d(2);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE0_1_ena_ctrl='1' THEN
	    WERTE4_q(1) <= WERTE4_d(1);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE4_0_clk_ctrl) BEGIN
      IF WERTE4_0_clk_ctrl'event and WERTE4_0_clk_ctrl='1' THEN
	 IF WERTE4_ena(0)='1' THEN
	    WERTE4_q(0) <= WERTE4_d(0);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_63_ena_ctrl='1' THEN
	    WERTE3_q(63) <= WERTE3_d(63);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_62_ena_ctrl='1' THEN
	    WERTE3_q(62) <= WERTE3_d(62);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_61_ena_ctrl='1' THEN
	    WERTE3_q(61) <= WERTE3_d(61);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_60_ena_ctrl='1' THEN
	    WERTE3_q(60) <= WERTE3_d(60);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_59_ena_ctrl='1' THEN
	    WERTE3_q(59) <= WERTE3_d(59);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_58_ena_ctrl='1' THEN
	    WERTE3_q(58) <= WERTE3_d(58);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_57_ena_ctrl='1' THEN
	    WERTE3_q(57) <= WERTE3_d(57);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_56_ena_ctrl='1' THEN
	    WERTE3_q(56) <= WERTE3_d(56);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_55_ena_ctrl='1' THEN
	    WERTE3_q(55) <= WERTE3_d(55);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_54_ena_ctrl='1' THEN
	    WERTE3_q(54) <= WERTE3_d(54);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_53_ena_ctrl='1' THEN
	    WERTE3_q(53) <= WERTE3_d(53);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_52_ena_ctrl='1' THEN
	    WERTE3_q(52) <= WERTE3_d(52);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_51_ena_ctrl='1' THEN
	    WERTE3_q(51) <= WERTE3_d(51);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_50_ena_ctrl='1' THEN
	    WERTE3_q(50) <= WERTE3_d(50);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_49_ena_ctrl='1' THEN
	    WERTE3_q(49) <= WERTE3_d(49);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_48_ena_ctrl='1' THEN
	    WERTE3_q(48) <= WERTE3_d(48);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_47_ena_ctrl='1' THEN
	    WERTE3_q(47) <= WERTE3_d(47);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_46_ena_ctrl='1' THEN
	    WERTE3_q(46) <= WERTE3_d(46);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_45_ena_ctrl='1' THEN
	    WERTE3_q(45) <= WERTE3_d(45);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_44_ena_ctrl='1' THEN
	    WERTE3_q(44) <= WERTE3_d(44);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_43_ena_ctrl='1' THEN
	    WERTE3_q(43) <= WERTE3_d(43);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_42_ena_ctrl='1' THEN
	    WERTE3_q(42) <= WERTE3_d(42);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_41_ena_ctrl='1' THEN
	    WERTE3_q(41) <= WERTE3_d(41);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_40_ena_ctrl='1' THEN
	    WERTE3_q(40) <= WERTE3_d(40);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_39_ena_ctrl='1' THEN
	    WERTE3_q(39) <= WERTE3_d(39);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_38_ena_ctrl='1' THEN
	    WERTE3_q(38) <= WERTE3_d(38);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_37_ena_ctrl='1' THEN
	    WERTE3_q(37) <= WERTE3_d(37);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_36_ena_ctrl='1' THEN
	    WERTE3_q(36) <= WERTE3_d(36);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_35_ena_ctrl='1' THEN
	    WERTE3_q(35) <= WERTE3_d(35);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_34_ena_ctrl='1' THEN
	    WERTE3_q(34) <= WERTE3_d(34);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_33_ena_ctrl='1' THEN
	    WERTE3_q(33) <= WERTE3_d(33);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_32_ena_ctrl='1' THEN
	    WERTE3_q(32) <= WERTE3_d(32);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_31_ena_ctrl='1' THEN
	    WERTE3_q(31) <= WERTE3_d(31);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_30_ena_ctrl='1' THEN
	    WERTE3_q(30) <= WERTE3_d(30);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_29_ena_ctrl='1' THEN
	    WERTE3_q(29) <= WERTE3_d(29);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_28_ena_ctrl='1' THEN
	    WERTE3_q(28) <= WERTE3_d(28);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_27_ena_ctrl='1' THEN
	    WERTE3_q(27) <= WERTE3_d(27);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_26_ena_ctrl='1' THEN
	    WERTE3_q(26) <= WERTE3_d(26);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_25_ena_ctrl='1' THEN
	    WERTE3_q(25) <= WERTE3_d(25);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_24_ena_ctrl='1' THEN
	    WERTE3_q(24) <= WERTE3_d(24);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_23_ena_ctrl='1' THEN
	    WERTE3_q(23) <= WERTE3_d(23);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_22_ena_ctrl='1' THEN
	    WERTE3_q(22) <= WERTE3_d(22);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_21_ena_ctrl='1' THEN
	    WERTE3_q(21) <= WERTE3_d(21);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_20_ena_ctrl='1' THEN
	    WERTE3_q(20) <= WERTE3_d(20);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_19_ena_ctrl='1' THEN
	    WERTE3_q(19) <= WERTE3_d(19);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_18_ena_ctrl='1' THEN
	    WERTE3_q(18) <= WERTE3_d(18);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_17_ena_ctrl='1' THEN
	    WERTE3_q(17) <= WERTE3_d(17);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_16_ena_ctrl='1' THEN
	    WERTE3_q(16) <= WERTE3_d(16);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_15_ena_ctrl='1' THEN
	    WERTE3_q(15) <= WERTE3_d(15);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_14_ena_ctrl='1' THEN
	    WERTE3_q(14) <= WERTE3_d(14);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE3_ena(13)='1' THEN
	    WERTE3_q(13) <= WERTE3_d(13);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_12_ena_ctrl='1' THEN
	    WERTE3_q(12) <= WERTE3_d(12);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_11_ena_ctrl='1' THEN
	    WERTE3_q(11) <= WERTE3_d(11);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_10_ena_ctrl='1' THEN
	    WERTE3_q(10) <= WERTE3_d(10);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE3_ena(9)='1' THEN
	    WERTE3_q(9) <= WERTE3_d(9);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE3_ena(8)='1' THEN
	    WERTE3_q(8) <= WERTE3_d(8);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE3_ena(7)='1' THEN
	    WERTE3_q(7) <= WERTE3_d(7);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE3_ena(6)='1' THEN
	    WERTE3_q(6) <= WERTE3_d(6);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_5_ena_ctrl='1' THEN
	    WERTE3_q(5) <= WERTE3_d(5);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE3_ena(4)='1' THEN
	    WERTE3_q(4) <= WERTE3_d(4);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_3_ena_ctrl='1' THEN
	    WERTE3_q(3) <= WERTE3_d(3);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE3_ena(2)='1' THEN
	    WERTE3_q(2) <= WERTE3_d(2);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE0_1_ena_ctrl='1' THEN
	    WERTE3_q(1) <= WERTE3_d(1);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE3_0_clk_ctrl) BEGIN
      IF WERTE3_0_clk_ctrl'event and WERTE3_0_clk_ctrl='1' THEN
	 IF WERTE3_ena(0)='1' THEN
	    WERTE3_q(0) <= WERTE3_d(0);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_63_ena_ctrl='1' THEN
	    WERTE2_q(63) <= WERTE2_d(63);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_62_ena_ctrl='1' THEN
	    WERTE2_q(62) <= WERTE2_d(62);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_61_ena_ctrl='1' THEN
	    WERTE2_q(61) <= WERTE2_d(61);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_60_ena_ctrl='1' THEN
	    WERTE2_q(60) <= WERTE2_d(60);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_59_ena_ctrl='1' THEN
	    WERTE2_q(59) <= WERTE2_d(59);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_58_ena_ctrl='1' THEN
	    WERTE2_q(58) <= WERTE2_d(58);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_57_ena_ctrl='1' THEN
	    WERTE2_q(57) <= WERTE2_d(57);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_56_ena_ctrl='1' THEN
	    WERTE2_q(56) <= WERTE2_d(56);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_55_ena_ctrl='1' THEN
	    WERTE2_q(55) <= WERTE2_d(55);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_54_ena_ctrl='1' THEN
	    WERTE2_q(54) <= WERTE2_d(54);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_53_ena_ctrl='1' THEN
	    WERTE2_q(53) <= WERTE2_d(53);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_52_ena_ctrl='1' THEN
	    WERTE2_q(52) <= WERTE2_d(52);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_51_ena_ctrl='1' THEN
	    WERTE2_q(51) <= WERTE2_d(51);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_50_ena_ctrl='1' THEN
	    WERTE2_q(50) <= WERTE2_d(50);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_49_ena_ctrl='1' THEN
	    WERTE2_q(49) <= WERTE2_d(49);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_48_ena_ctrl='1' THEN
	    WERTE2_q(48) <= WERTE2_d(48);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_47_ena_ctrl='1' THEN
	    WERTE2_q(47) <= WERTE2_d(47);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_46_ena_ctrl='1' THEN
	    WERTE2_q(46) <= WERTE2_d(46);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_45_ena_ctrl='1' THEN
	    WERTE2_q(45) <= WERTE2_d(45);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_44_ena_ctrl='1' THEN
	    WERTE2_q(44) <= WERTE2_d(44);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_43_ena_ctrl='1' THEN
	    WERTE2_q(43) <= WERTE2_d(43);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_42_ena_ctrl='1' THEN
	    WERTE2_q(42) <= WERTE2_d(42);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_41_ena_ctrl='1' THEN
	    WERTE2_q(41) <= WERTE2_d(41);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_40_ena_ctrl='1' THEN
	    WERTE2_q(40) <= WERTE2_d(40);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_39_ena_ctrl='1' THEN
	    WERTE2_q(39) <= WERTE2_d(39);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_38_ena_ctrl='1' THEN
	    WERTE2_q(38) <= WERTE2_d(38);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_37_ena_ctrl='1' THEN
	    WERTE2_q(37) <= WERTE2_d(37);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_36_ena_ctrl='1' THEN
	    WERTE2_q(36) <= WERTE2_d(36);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_35_ena_ctrl='1' THEN
	    WERTE2_q(35) <= WERTE2_d(35);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_34_ena_ctrl='1' THEN
	    WERTE2_q(34) <= WERTE2_d(34);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_33_ena_ctrl='1' THEN
	    WERTE2_q(33) <= WERTE2_d(33);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_32_ena_ctrl='1' THEN
	    WERTE2_q(32) <= WERTE2_d(32);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_31_ena_ctrl='1' THEN
	    WERTE2_q(31) <= WERTE2_d(31);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_30_ena_ctrl='1' THEN
	    WERTE2_q(30) <= WERTE2_d(30);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_29_ena_ctrl='1' THEN
	    WERTE2_q(29) <= WERTE2_d(29);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_28_ena_ctrl='1' THEN
	    WERTE2_q(28) <= WERTE2_d(28);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_27_ena_ctrl='1' THEN
	    WERTE2_q(27) <= WERTE2_d(27);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_26_ena_ctrl='1' THEN
	    WERTE2_q(26) <= WERTE2_d(26);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_25_ena_ctrl='1' THEN
	    WERTE2_q(25) <= WERTE2_d(25);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_24_ena_ctrl='1' THEN
	    WERTE2_q(24) <= WERTE2_d(24);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_23_ena_ctrl='1' THEN
	    WERTE2_q(23) <= WERTE2_d(23);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_22_ena_ctrl='1' THEN
	    WERTE2_q(22) <= WERTE2_d(22);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_21_ena_ctrl='1' THEN
	    WERTE2_q(21) <= WERTE2_d(21);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_20_ena_ctrl='1' THEN
	    WERTE2_q(20) <= WERTE2_d(20);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_19_ena_ctrl='1' THEN
	    WERTE2_q(19) <= WERTE2_d(19);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_18_ena_ctrl='1' THEN
	    WERTE2_q(18) <= WERTE2_d(18);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_17_ena_ctrl='1' THEN
	    WERTE2_q(17) <= WERTE2_d(17);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_16_ena_ctrl='1' THEN
	    WERTE2_q(16) <= WERTE2_d(16);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_15_ena_ctrl='1' THEN
	    WERTE2_q(15) <= WERTE2_d(15);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_14_ena_ctrl='1' THEN
	    WERTE2_q(14) <= WERTE2_d(14);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE2_ena(13)='1' THEN
	    WERTE2_q(13) <= WERTE2_d(13);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_12_ena_ctrl='1' THEN
	    WERTE2_q(12) <= WERTE2_d(12);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_11_ena_ctrl='1' THEN
	    WERTE2_q(11) <= WERTE2_d(11);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_10_ena_ctrl='1' THEN
	    WERTE2_q(10) <= WERTE2_d(10);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE2_ena(9)='1' THEN
	    WERTE2_q(9) <= WERTE2_d(9);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE2_ena(8)='1' THEN
	    WERTE2_q(8) <= WERTE2_d(8);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE2_ena(7)='1' THEN
	    WERTE2_q(7) <= WERTE2_d(7);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE2_ena(6)='1' THEN
	    WERTE2_q(6) <= WERTE2_d(6);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_5_ena_ctrl='1' THEN
	    WERTE2_q(5) <= WERTE2_d(5);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE2_ena(4)='1' THEN
	    WERTE2_q(4) <= WERTE2_d(4);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_3_ena_ctrl='1' THEN
	    WERTE2_q(3) <= WERTE2_d(3);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE2_ena(2)='1' THEN
	    WERTE2_q(2) <= WERTE2_d(2);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE0_1_ena_ctrl='1' THEN
	    WERTE2_q(1) <= WERTE2_d(1);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE2_0_clk_ctrl) BEGIN
      IF WERTE2_0_clk_ctrl'event and WERTE2_0_clk_ctrl='1' THEN
	 IF WERTE2_ena(0)='1' THEN
	    WERTE2_q(0) <= WERTE2_d(0);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_63_ena_ctrl='1' THEN
	    WERTE1_q(63) <= WERTE1_d(63);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_62_ena_ctrl='1' THEN
	    WERTE1_q(62) <= WERTE1_d(62);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_61_ena_ctrl='1' THEN
	    WERTE1_q(61) <= WERTE1_d(61);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_60_ena_ctrl='1' THEN
	    WERTE1_q(60) <= WERTE1_d(60);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_59_ena_ctrl='1' THEN
	    WERTE1_q(59) <= WERTE1_d(59);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_58_ena_ctrl='1' THEN
	    WERTE1_q(58) <= WERTE1_d(58);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_57_ena_ctrl='1' THEN
	    WERTE1_q(57) <= WERTE1_d(57);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_56_ena_ctrl='1' THEN
	    WERTE1_q(56) <= WERTE1_d(56);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_55_ena_ctrl='1' THEN
	    WERTE1_q(55) <= WERTE1_d(55);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_54_ena_ctrl='1' THEN
	    WERTE1_q(54) <= WERTE1_d(54);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_53_ena_ctrl='1' THEN
	    WERTE1_q(53) <= WERTE1_d(53);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_52_ena_ctrl='1' THEN
	    WERTE1_q(52) <= WERTE1_d(52);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_51_ena_ctrl='1' THEN
	    WERTE1_q(51) <= WERTE1_d(51);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_50_ena_ctrl='1' THEN
	    WERTE1_q(50) <= WERTE1_d(50);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_49_ena_ctrl='1' THEN
	    WERTE1_q(49) <= WERTE1_d(49);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_48_ena_ctrl='1' THEN
	    WERTE1_q(48) <= WERTE1_d(48);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_47_ena_ctrl='1' THEN
	    WERTE1_q(47) <= WERTE1_d(47);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_46_ena_ctrl='1' THEN
	    WERTE1_q(46) <= WERTE1_d(46);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_45_ena_ctrl='1' THEN
	    WERTE1_q(45) <= WERTE1_d(45);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_44_ena_ctrl='1' THEN
	    WERTE1_q(44) <= WERTE1_d(44);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_43_ena_ctrl='1' THEN
	    WERTE1_q(43) <= WERTE1_d(43);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_42_ena_ctrl='1' THEN
	    WERTE1_q(42) <= WERTE1_d(42);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_41_ena_ctrl='1' THEN
	    WERTE1_q(41) <= WERTE1_d(41);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_40_ena_ctrl='1' THEN
	    WERTE1_q(40) <= WERTE1_d(40);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_39_ena_ctrl='1' THEN
	    WERTE1_q(39) <= WERTE1_d(39);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_38_ena_ctrl='1' THEN
	    WERTE1_q(38) <= WERTE1_d(38);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_37_ena_ctrl='1' THEN
	    WERTE1_q(37) <= WERTE1_d(37);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_36_ena_ctrl='1' THEN
	    WERTE1_q(36) <= WERTE1_d(36);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_35_ena_ctrl='1' THEN
	    WERTE1_q(35) <= WERTE1_d(35);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_34_ena_ctrl='1' THEN
	    WERTE1_q(34) <= WERTE1_d(34);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_33_ena_ctrl='1' THEN
	    WERTE1_q(33) <= WERTE1_d(33);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_32_ena_ctrl='1' THEN
	    WERTE1_q(32) <= WERTE1_d(32);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_31_ena_ctrl='1' THEN
	    WERTE1_q(31) <= WERTE1_d(31);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_30_ena_ctrl='1' THEN
	    WERTE1_q(30) <= WERTE1_d(30);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_29_ena_ctrl='1' THEN
	    WERTE1_q(29) <= WERTE1_d(29);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_28_ena_ctrl='1' THEN
	    WERTE1_q(28) <= WERTE1_d(28);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_27_ena_ctrl='1' THEN
	    WERTE1_q(27) <= WERTE1_d(27);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_26_ena_ctrl='1' THEN
	    WERTE1_q(26) <= WERTE1_d(26);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_25_ena_ctrl='1' THEN
	    WERTE1_q(25) <= WERTE1_d(25);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_24_ena_ctrl='1' THEN
	    WERTE1_q(24) <= WERTE1_d(24);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_23_ena_ctrl='1' THEN
	    WERTE1_q(23) <= WERTE1_d(23);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_22_ena_ctrl='1' THEN
	    WERTE1_q(22) <= WERTE1_d(22);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_21_ena_ctrl='1' THEN
	    WERTE1_q(21) <= WERTE1_d(21);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_20_ena_ctrl='1' THEN
	    WERTE1_q(20) <= WERTE1_d(20);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_19_ena_ctrl='1' THEN
	    WERTE1_q(19) <= WERTE1_d(19);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_18_ena_ctrl='1' THEN
	    WERTE1_q(18) <= WERTE1_d(18);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_17_ena_ctrl='1' THEN
	    WERTE1_q(17) <= WERTE1_d(17);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_16_ena_ctrl='1' THEN
	    WERTE1_q(16) <= WERTE1_d(16);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_15_ena_ctrl='1' THEN
	    WERTE1_q(15) <= WERTE1_d(15);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_14_ena_ctrl='1' THEN
	    WERTE1_q(14) <= WERTE1_d(14);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE1_ena(13)='1' THEN
	    WERTE1_q(13) <= WERTE1_d(13);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_12_ena_ctrl='1' THEN
	    WERTE1_q(12) <= WERTE1_d(12);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_11_ena_ctrl='1' THEN
	    WERTE1_q(11) <= WERTE1_d(11);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_10_ena_ctrl='1' THEN
	    WERTE1_q(10) <= WERTE1_d(10);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE1_ena(9)='1' THEN
	    WERTE1_q(9) <= WERTE1_d(9);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE1_ena(8)='1' THEN
	    WERTE1_q(8) <= WERTE1_d(8);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE1_ena(7)='1' THEN
	    WERTE1_q(7) <= WERTE1_d(7);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE1_ena(6)='1' THEN
	    WERTE1_q(6) <= WERTE1_d(6);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_5_ena_ctrl='1' THEN
	    WERTE1_q(5) <= WERTE1_d(5);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE1_ena(4)='1' THEN
	    WERTE1_q(4) <= WERTE1_d(4);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_3_ena_ctrl='1' THEN
	    WERTE1_q(3) <= WERTE1_d(3);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE1_ena(2)='1' THEN
	    WERTE1_q(2) <= WERTE1_d(2);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE0_1_ena_ctrl='1' THEN
	    WERTE1_q(1) <= WERTE1_d(1);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE1_0_clk_ctrl) BEGIN
      IF WERTE1_0_clk_ctrl'event and WERTE1_0_clk_ctrl='1' THEN
	 IF WERTE1_ena(0)='1' THEN
	    WERTE1_q(0) <= WERTE1_d(0);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_63_ena_ctrl='1' THEN
	    WERTE0_q(63) <= WERTE0_d(63);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_62_ena_ctrl='1' THEN
	    WERTE0_q(62) <= WERTE0_d(62);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_61_ena_ctrl='1' THEN
	    WERTE0_q(61) <= WERTE0_d(61);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_60_ena_ctrl='1' THEN
	    WERTE0_q(60) <= WERTE0_d(60);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_59_ena_ctrl='1' THEN
	    WERTE0_q(59) <= WERTE0_d(59);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_58_ena_ctrl='1' THEN
	    WERTE0_q(58) <= WERTE0_d(58);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_57_ena_ctrl='1' THEN
	    WERTE0_q(57) <= WERTE0_d(57);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_56_ena_ctrl='1' THEN
	    WERTE0_q(56) <= WERTE0_d(56);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_55_ena_ctrl='1' THEN
	    WERTE0_q(55) <= WERTE0_d(55);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_54_ena_ctrl='1' THEN
	    WERTE0_q(54) <= WERTE0_d(54);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_53_ena_ctrl='1' THEN
	    WERTE0_q(53) <= WERTE0_d(53);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_52_ena_ctrl='1' THEN
	    WERTE0_q(52) <= WERTE0_d(52);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_51_ena_ctrl='1' THEN
	    WERTE0_q(51) <= WERTE0_d(51);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_50_ena_ctrl='1' THEN
	    WERTE0_q(50) <= WERTE0_d(50);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_49_ena_ctrl='1' THEN
	    WERTE0_q(49) <= WERTE0_d(49);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_48_ena_ctrl='1' THEN
	    WERTE0_q(48) <= WERTE0_d(48);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_47_ena_ctrl='1' THEN
	    WERTE0_q(47) <= WERTE0_d(47);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_46_ena_ctrl='1' THEN
	    WERTE0_q(46) <= WERTE0_d(46);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_45_ena_ctrl='1' THEN
	    WERTE0_q(45) <= WERTE0_d(45);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_44_ena_ctrl='1' THEN
	    WERTE0_q(44) <= WERTE0_d(44);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_43_ena_ctrl='1' THEN
	    WERTE0_q(43) <= WERTE0_d(43);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_42_ena_ctrl='1' THEN
	    WERTE0_q(42) <= WERTE0_d(42);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_41_ena_ctrl='1' THEN
	    WERTE0_q(41) <= WERTE0_d(41);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_40_ena_ctrl='1' THEN
	    WERTE0_q(40) <= WERTE0_d(40);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_39_ena_ctrl='1' THEN
	    WERTE0_q(39) <= WERTE0_d(39);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_38_ena_ctrl='1' THEN
	    WERTE0_q(38) <= WERTE0_d(38);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_37_ena_ctrl='1' THEN
	    WERTE0_q(37) <= WERTE0_d(37);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_36_ena_ctrl='1' THEN
	    WERTE0_q(36) <= WERTE0_d(36);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_35_ena_ctrl='1' THEN
	    WERTE0_q(35) <= WERTE0_d(35);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_34_ena_ctrl='1' THEN
	    WERTE0_q(34) <= WERTE0_d(34);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_33_ena_ctrl='1' THEN
	    WERTE0_q(33) <= WERTE0_d(33);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_32_ena_ctrl='1' THEN
	    WERTE0_q(32) <= WERTE0_d(32);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_31_ena_ctrl='1' THEN
	    WERTE0_q(31) <= WERTE0_d(31);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_30_ena_ctrl='1' THEN
	    WERTE0_q(30) <= WERTE0_d(30);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_29_ena_ctrl='1' THEN
	    WERTE0_q(29) <= WERTE0_d(29);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_28_ena_ctrl='1' THEN
	    WERTE0_q(28) <= WERTE0_d(28);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_27_ena_ctrl='1' THEN
	    WERTE0_q(27) <= WERTE0_d(27);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_26_ena_ctrl='1' THEN
	    WERTE0_q(26) <= WERTE0_d(26);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_25_ena_ctrl='1' THEN
	    WERTE0_q(25) <= WERTE0_d(25);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_24_ena_ctrl='1' THEN
	    WERTE0_q(24) <= WERTE0_d(24);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_23_ena_ctrl='1' THEN
	    WERTE0_q(23) <= WERTE0_d(23);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_22_ena_ctrl='1' THEN
	    WERTE0_q(22) <= WERTE0_d(22);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_21_ena_ctrl='1' THEN
	    WERTE0_q(21) <= WERTE0_d(21);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_20_ena_ctrl='1' THEN
	    WERTE0_q(20) <= WERTE0_d(20);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_19_ena_ctrl='1' THEN
	    WERTE0_q(19) <= WERTE0_d(19);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_18_ena_ctrl='1' THEN
	    WERTE0_q(18) <= WERTE0_d(18);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_17_ena_ctrl='1' THEN
	    WERTE0_q(17) <= WERTE0_d(17);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_16_ena_ctrl='1' THEN
	    WERTE0_q(16) <= WERTE0_d(16);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_15_ena_ctrl='1' THEN
	    WERTE0_q(15) <= WERTE0_d(15);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_14_ena_ctrl='1' THEN
	    WERTE0_q(14) <= WERTE0_d(14);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_ena(13)='1' THEN
	    WERTE0_q(13) <= WERTE0_d(13);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_12_ena_ctrl='1' THEN
	    WERTE0_q(12) <= WERTE0_d(12);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_11_ena_ctrl='1' THEN
	    WERTE0_q(11) <= WERTE0_d(11);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_10_ena_ctrl='1' THEN
	    WERTE0_q(10) <= WERTE0_d(10);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_ena(9)='1' THEN
	    WERTE0_q(9) <= WERTE0_d(9);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_ena(8)='1' THEN
	    WERTE0_q(8) <= WERTE0_d(8);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_ena(7)='1' THEN
	    WERTE0_q(7) <= WERTE0_d(7);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_ena(6)='1' THEN
	    WERTE0_q(6) <= WERTE0_d(6);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_5_ena_ctrl='1' THEN
	    WERTE0_q(5) <= WERTE0_d(5);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_ena(4)='1' THEN
	    WERTE0_q(4) <= WERTE0_d(4);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_3_ena_ctrl='1' THEN
	    WERTE0_q(3) <= WERTE0_d(3);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_ena(2)='1' THEN
	    WERTE0_q(2) <= WERTE0_d(2);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_1_ena_ctrl='1' THEN
	    WERTE0_q(1) <= WERTE0_d(1);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (WERTE0_0_clk_ctrl) BEGIN
      IF WERTE0_0_clk_ctrl'event and WERTE0_0_clk_ctrl='1' THEN
	 IF WERTE0_ena(0)='1' THEN
	    WERTE0_q(0) <= WERTE0_d(0);
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (PIC_INT_SYNC0_clk_ctrl) BEGIN
      IF PIC_INT_SYNC0_clk_ctrl'event and PIC_INT_SYNC0_clk_ctrl='1' THEN
	 PIC_INT_SYNC_q <= PIC_INT_SYNC_d;
      END IF;
   END PROCESS;

-- Start of original equations

--  BYT SELECT
--  HWORD
--  HHBYT
--  LONG UND LINE
   FB_B(0) <= (FB_SIZE1 and (not FB_SIZE0) and (not FB_ADR(1))) or ((not
	 FB_SIZE1) and FB_SIZE0 and (not FB_ADR(1)) and (not FB_ADR(0))) or
	 ((not FB_SIZE1) and (not FB_SIZE0)) or (FB_SIZE1 and FB_SIZE0);

--  HWORD
--  HLBYT
--  LONG UND LINE
   FB_B(1) <= (FB_SIZE1 and (not FB_SIZE0) and (not FB_ADR(1))) or ((not
	 FB_SIZE1) and FB_SIZE0 and (not FB_ADR(1)) and FB_ADR(0)) or ((not
	 FB_SIZE1) and (not FB_SIZE0)) or (FB_SIZE1 and FB_SIZE0);

--  LWORD
--  LHBYT
--  LONG UND LINE
   FB_B(2) <= (FB_SIZE1 and (not FB_SIZE0) and FB_ADR(1)) or ((not FB_SIZE1)
	 and FB_SIZE0 and FB_ADR(1) and (not FB_ADR(0))) or ((not FB_SIZE1) and
	 (not FB_SIZE0)) or (FB_SIZE1 and FB_SIZE0);

--  LWORD
--  LLBYT
--  LONG UND LINE
   FB_B(3) <= (FB_SIZE1 and (not FB_SIZE0) and FB_ADR(1)) or ((not FB_SIZE1)
	 and FB_SIZE0 and FB_ADR(1) and FB_ADR(0)) or ((not FB_SIZE1) and (not
	 FB_SIZE0)) or (FB_SIZE1 and FB_SIZE0);

--  INTERRUPT CONTROL REGISTER: BIT0=INT5 AUSLÖSEN, 1=INT7 AUSLÖSEN
   INT_CTR0_clk_ctrl <= MAIN_CLK;

--  $10000/4
   INT_CTR_CS <= '1' when nFB_CS2 = '0' and FB_ADR(27 downto 2) = 26x"4000" else '0';
   INT_CTR_d <= FB_AD;
   INT_CTR24_ena_ctrl <= INT_CTR_CS and FB_B(0) and (not nFB_WR);
   INT_CTR16_ena_ctrl <= INT_CTR_CS and FB_B(1) and (not nFB_WR);
   INT_CTR8_ena_ctrl <= INT_CTR_CS and FB_B(2) and (not nFB_WR);
   INT_CTR0_ena_ctrl <= INT_CTR_CS and FB_B(3) and (not nFB_WR);

--  INTERRUPT ENABLE REGISTER BIT31=INT7,30=INT6,29=INT5,28=INT4,27=INT3,26=INT2
   INT_ENA0_clk_ctrl <= MAIN_CLK;
   INT_ENA0_clrn_ctrl <= nRSTO;

--  $10004/4
    int_ena_cs <= '1' when nFB_CS2 = '0' and FB_ADR(27 downto 2) = 26x"4001";
    
    -- INT_ENA_CS <= to_std_logic(((not nFB_CS2)='1') and FB_ADR(27 DOWNTO 2) =
    -- "00000000000100000000000001");
   INT_ENA_d <= FB_AD;
   INT_ENA24_ena_ctrl <= INT_ENA_CS and FB_B(0) and (not nFB_WR);
   INT_ENA16_ena_ctrl <= INT_ENA_CS and FB_B(1) and (not nFB_WR);
   INT_ENA8_ena_ctrl <= INT_ENA_CS and FB_B(2) and (not nFB_WR);
   INT_ENA0_ena_ctrl <= INT_ENA_CS and FB_B(3) and (not nFB_WR);

--  INTERRUPT CLEAR REGISTER WRITE ONLY 1=INTERRUPT CLEAR
   INT_CLEAR0_clk_ctrl <= MAIN_CLK;

--  $10008/4
    int_clear_cs <= '1' when nFB_CS2 = '0' and FB_ADR(27 downto 2) = 26x"4002" else '0';
    -- INT_CLEAR_CS <= to_std_logic(((not nFB_CS2)='1') and FB_ADR(27 DOWNTO 2) = "00000000000100000000000010");
   INT_CLEAR_d(31 DOWNTO 24) <= FB_AD(31 DOWNTO 24) and sizeIt(INT_CLEAR_CS,8)
	 and sizeIt(FB_B(0),8) and sizeIt(not nFB_WR,8);
   INT_CLEAR_d(23 DOWNTO 16) <= FB_AD(23 DOWNTO 16) and sizeIt(INT_CLEAR_CS,8)
	 and sizeIt(FB_B(1),8) and sizeIt(not nFB_WR,8);
   INT_CLEAR_d(15 DOWNTO 8) <= FB_AD(15 DOWNTO 8) and sizeIt(INT_CLEAR_CS,8)
	 and sizeIt(FB_B(2),8) and sizeIt(not nFB_WR,8);
   INT_CLEAR_d(7 DOWNTO 0) <= FB_AD(7 DOWNTO 0) and sizeIt(INT_CLEAR_CS,8) and
	 sizeIt(FB_B(3),8) and sizeIt(not nFB_WR,8);

--  INTERRUPT LATCH REGISTER READ ONLY
--  $1000C/4

    int_latch_cs <= '1' when nFB_CS2 = '0' and FB_ADR(27 downto 2) = 26x"4003";
    -- INT_LATCH_CS <= to_std_logic(((not nFB_CS2)='1') and FB_ADR(27 DOWNTO 2) =
	--  "00000000000100000000000011");

--  INTERRUPT
   nIRQ(2) <= not (HSYNC and INT_ENA_q(26));
   nIRQ(3) <= not (INT_CTR_q(0) and INT_ENA_q(27));
   nIRQ(4) <= not (VSYNC and INT_ENA_q(28));
   nIRQ(5) <= not (to_std_logic(INT_LATCH_q /=
	 "00000000000000000000000000000000") and INT_ENA_q(29));
   nIRQ(6) <= not ((not nMFP_INT) and INT_ENA_q(30));
   nIRQ(7) <= not (PSEUDO_BUS_ERROR and INT_ENA_q(31));

--  SCC
--  VME
--                               #  FB_ADR[19..4]==H"F920"           -- PADDLE
--                               #  FB_ADR[19..4]==H"F921"           -- PADDLE
--                               #  FB_ADR[19..4]==H"F922"           -- PADDLE
--  MFP2
--  MFP2
--  MFP2
--  MFP2
--  TT SCSI
--  ST UHR
--  ST UHR
--                               #  FB_ADR[19..4]==H"F890"           -- DMA SOUND
--                               #  FB_ADR[19..4]==H"F891"           -- DMA SOUND
--                               #  FB_ADR[19..4]==H"F892"           -- DMA SOUND
   PSEUDO_BUS_ERROR <= (not nFB_CS1) and (to_std_logic(FB_ADR(19 DOWNTO 4) =
	 "1111100011001000" or FB_ADR(19 DOWNTO 4) = "1111100011100000" or
	 FB_ADR(19 DOWNTO 4) = "1111111110101000" or FB_ADR(19 DOWNTO 4) =
	 "1111111110101001" or FB_ADR(19 DOWNTO 4) = "1111111110101010" or
	 FB_ADR(19 DOWNTO 4) = "1111111110101000" or FB_ADR(19 DOWNTO 8) =
	 "111110000111" or FB_ADR(19 DOWNTO 4) = "1111111111000010" or
	 FB_ADR(19 DOWNTO 4) = "1111111111000011"));

--  IF VIDEO ADR CHANGE
--  WRITE VIDEO BASE ADR HIGH 0xFFFF8201/2
   TIN0 <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 DOWNTO 1) =
	 "1111100000100000000") and (not nFB_WR);

--  INTERRUPT LATCH
   INT_L0_clk_ctrl <= MAIN_CLK;
   INT_L0_clrn_ctrl <= nRSTO;
   INT_L_d(0) <= PIC_INT and INT_ENA_q(0);
   INT_L_d(1) <= E0_INT and INT_ENA_q(1);
   INT_L_d(2) <= DVI_INT and INT_ENA_q(2);
   INT_L_d(3) <= (not nPCI_INTA) and INT_ENA_q(3);
   INT_L_d(4) <= (not nPCI_INTB) and INT_ENA_q(4);
   INT_L_d(5) <= (not nPCI_INTC) and INT_ENA_q(5);
   INT_L_d(6) <= (not nPCI_INTD) and INT_ENA_q(6);
   INT_L_d(7) <= DSP_INT and INT_ENA_q(7);
   INT_L_d(8) <= VSYNC and INT_ENA_q(8);
   INT_L_d(9) <= HSYNC and INT_ENA_q(9);
   INT_LA9_0_clk_ctrl <= MAIN_CLK;
   INT_LA8_0_clk_ctrl <= MAIN_CLK;
   INT_LA7_0_clk_ctrl <= MAIN_CLK;
   INT_LA6_0_clk_ctrl <= MAIN_CLK;
   INT_LA5_0_clk_ctrl <= MAIN_CLK;
   INT_LA4_0_clk_ctrl <= MAIN_CLK;
   INT_LA3_0_clk_ctrl <= MAIN_CLK;
   INT_LA2_0_clk_ctrl <= MAIN_CLK;
   INT_LA1_0_clk_ctrl <= MAIN_CLK;
   INT_LA0_0_clk_ctrl <= MAIN_CLK;
   INT_LATCH_d <= "11111111111111111111111111111111";
   INT_LATCH_clrn <= (not INT_CLEAR_q) and sizeIt(nRSTO,32);
   INT_LA0_0_clrn_ctrl <= INT_ENA_q(0) and nRSTO;
   INT_LA0_d <= ((std_logic_vector'(unsigned(INT_LA0_q) + unsigned'("0001")))
	 and sizeIt(INT_L_q(0),4) and sizeIt(to_std_logic((unsigned(INT_LA0_q)
	 < unsigned'("0111"))),4)) or ((std_logic_vector'(unsigned(INT_LA0_q) -
	 unsigned'("0001"))) and sizeIt(not INT_L_q(0),4) and
	 sizeIt(to_std_logic((unsigned(INT_LA0_q) > unsigned'("1000"))),4)) or
	 ("1111" and sizeIt(INT_L_q(0),4) and
	 sizeIt(to_std_logic((unsigned(INT_LA0_q) > unsigned'("0110"))),4)) or
	 ("0000" and sizeIt(not INT_L_q(0),4) and
	 sizeIt(to_std_logic((unsigned(INT_LA0_q) < unsigned'("1001"))),4));
   INT_LATCH0_clk_1 <= INT_LA0_q(3);
   INT_LA1_0_clrn_ctrl <= INT_ENA_q(1) and nRSTO;
   INT_LA1_d <= ((std_logic_vector'(unsigned(INT_LA1_q) + unsigned'("0001")))
	 and sizeIt(INT_L_q(1),4) and sizeIt(to_std_logic((unsigned(INT_LA1_q)
	 < unsigned'("0111"))),4)) or ((std_logic_vector'(unsigned(INT_LA1_q) -
	 unsigned'("0001"))) and sizeIt(not INT_L_q(1),4) and
	 sizeIt(to_std_logic((unsigned(INT_LA1_q) > unsigned'("1000"))),4)) or
	 ("1111" and sizeIt(INT_L_q(1),4) and
	 sizeIt(to_std_logic((unsigned(INT_LA1_q) > unsigned'("0110"))),4)) or
	 ("0000" and sizeIt(not INT_L_q(1),4) and
	 sizeIt(to_std_logic((unsigned(INT_LA1_q) < unsigned'("1001"))),4));
   INT_LATCH1_clk_1 <= INT_LA1_q(3);
   INT_LA2_0_clrn_ctrl <= INT_ENA_q(2) and nRSTO;
   INT_LA2_d <= ((std_logic_vector'(unsigned(INT_LA2_q) + unsigned'("0001")))
	 and sizeIt(INT_L_q(2),4) and sizeIt(to_std_logic((unsigned(INT_LA2_q)
	 < unsigned'("0111"))),4)) or ((std_logic_vector'(unsigned(INT_LA2_q) -
	 unsigned'("0001"))) and sizeIt(not INT_L_q(2),4) and
	 sizeIt(to_std_logic((unsigned(INT_LA2_q) > unsigned'("1000"))),4)) or
	 ("1111" and sizeIt(INT_L_q(2),4) and
	 sizeIt(to_std_logic((unsigned(INT_LA2_q) > unsigned'("0110"))),4)) or
	 ("0000" and sizeIt(not INT_L_q(2),4) and
	 sizeIt(to_std_logic((unsigned(INT_LA2_q) < unsigned'("1001"))),4));
   INT_LATCH2_clk_1 <= INT_LA2_q(3);
   INT_LA3_0_clrn_ctrl <= INT_ENA_q(3) and nRSTO;
   INT_LA3_d <= ((std_logic_vector'(unsigned(INT_LA3_q) + unsigned'("0001")))
	 and sizeIt(INT_L_q(3),4) and sizeIt(to_std_logic((unsigned(INT_LA3_q)
	 < unsigned'("0111"))),4)) or ((std_logic_vector'(unsigned(INT_LA3_q) -
	 unsigned'("0001"))) and sizeIt(not INT_L_q(3),4) and
	 sizeIt(to_std_logic((unsigned(INT_LA3_q) > unsigned'("1000"))),4)) or
	 ("1111" and sizeIt(INT_L_q(3),4) and
	 sizeIt(to_std_logic((unsigned(INT_LA3_q) > unsigned'("0110"))),4)) or
	 ("0000" and sizeIt(not INT_L_q(3),4) and
	 sizeIt(to_std_logic((unsigned(INT_LA3_q) < unsigned'("1001"))),4));
   INT_LATCH3_clk_1 <= INT_LA3_q(3);
   INT_LA4_0_clrn_ctrl <= INT_ENA_q(4) and nRSTO;
   INT_LA4_d <= ((std_logic_vector'(unsigned(INT_LA4_q) + unsigned'("0001")))
	 and sizeIt(INT_L_q(4),4) and sizeIt(to_std_logic((unsigned(INT_LA4_q)
	 < unsigned'("0111"))),4)) or ((std_logic_vector'(unsigned(INT_LA4_q) -
	 unsigned'("0001"))) and sizeIt(not INT_L_q(4),4) and
	 sizeIt(to_std_logic((unsigned(INT_LA4_q) > unsigned'("1000"))),4)) or
	 ("1111" and sizeIt(INT_L_q(4),4) and
	 sizeIt(to_std_logic((unsigned(INT_LA4_q) > unsigned'("0110"))),4)) or
	 ("0000" and sizeIt(not INT_L_q(4),4) and
	 sizeIt(to_std_logic((unsigned(INT_LA4_q) < unsigned'("1001"))),4));
   INT_LATCH4_clk_1 <= INT_LA4_q(3);
   INT_LA5_0_clrn_ctrl <= INT_ENA_q(5) and nRSTO;
   INT_LA5_d <= ((std_logic_vector'(unsigned(INT_LA5_q) + unsigned'("0001")))
	 and sizeIt(INT_L_q(5),4) and sizeIt(to_std_logic((unsigned(INT_LA5_q)
	 < unsigned'("0111"))),4)) or ((std_logic_vector'(unsigned(INT_LA5_q) -
	 unsigned'("0001"))) and sizeIt(not INT_L_q(5),4) and
	 sizeIt(to_std_logic((unsigned(INT_LA5_q) > unsigned'("1000"))),4)) or
	 ("1111" and sizeIt(INT_L_q(5),4) and
	 sizeIt(to_std_logic((unsigned(INT_LA5_q) > unsigned'("0110"))),4)) or
	 ("0000" and sizeIt(not INT_L_q(5),4) and
	 sizeIt(to_std_logic((unsigned(INT_LA5_q) < unsigned'("1001"))),4));
   INT_LATCH5_clk_1 <= INT_LA5_q(3);
   INT_LA6_0_clrn_ctrl <= INT_ENA_q(6) and nRSTO;
   INT_LA6_d <= ((std_logic_vector'(unsigned(INT_LA6_q) + unsigned'("0001")))
	 and sizeIt(INT_L_q(6),4) and sizeIt(to_std_logic((unsigned(INT_LA6_q)
	 < unsigned'("0111"))),4)) or ((std_logic_vector'(unsigned(INT_LA6_q) -
	 unsigned'("0001"))) and sizeIt(not INT_L_q(6),4) and
	 sizeIt(to_std_logic((unsigned(INT_LA6_q) > unsigned'("1000"))),4)) or
	 ("1111" and sizeIt(INT_L_q(6),4) and
	 sizeIt(to_std_logic((unsigned(INT_LA6_q) > unsigned'("0110"))),4)) or
	 ("0000" and sizeIt(not INT_L_q(6),4) and
	 sizeIt(to_std_logic((unsigned(INT_LA6_q) < unsigned'("1001"))),4));
   INT_LATCH6_clk_1 <= INT_LA6_q(3);
   INT_LA7_0_clrn_ctrl <= INT_ENA_q(7) and nRSTO;
   INT_LA7_d <= ((std_logic_vector'(unsigned(INT_LA7_q) + unsigned'("0001")))
	 and sizeIt(INT_L_q(7),4) and sizeIt(to_std_logic((unsigned(INT_LA7_q)
	 < unsigned'("0111"))),4)) or ((std_logic_vector'(unsigned(INT_LA7_q) -
	 unsigned'("0001"))) and sizeIt(not INT_L_q(7),4) and
	 sizeIt(to_std_logic((unsigned(INT_LA7_q) > unsigned'("1000"))),4)) or
	 ("1111" and sizeIt(INT_L_q(7),4) and
	 sizeIt(to_std_logic((unsigned(INT_LA7_q) > unsigned'("0110"))),4)) or
	 ("0000" and sizeIt(not INT_L_q(7),4) and
	 sizeIt(to_std_logic((unsigned(INT_LA7_q) < unsigned'("1001"))),4));
   INT_LATCH7_clk_1 <= INT_LA7_q(3);
   INT_LA8_0_clrn_ctrl <= INT_ENA_q(8) and nRSTO;
   INT_LA8_d <= ((std_logic_vector'(unsigned(INT_LA8_q) + unsigned'("0001")))
	 and sizeIt(INT_L_q(8),4) and sizeIt(to_std_logic((unsigned(INT_LA8_q)
	 < unsigned'("0111"))),4)) or ((std_logic_vector'(unsigned(INT_LA8_q) -
	 unsigned'("0001"))) and sizeIt(not INT_L_q(8),4) and
	 sizeIt(to_std_logic((unsigned(INT_LA8_q) > unsigned'("1000"))),4)) or
	 ("1111" and sizeIt(INT_L_q(8),4) and
	 sizeIt(to_std_logic((unsigned(INT_LA8_q) > unsigned'("0110"))),4)) or
	 ("0000" and sizeIt(not INT_L_q(8),4) and
	 sizeIt(to_std_logic((unsigned(INT_LA8_q) < unsigned'("1001"))),4));
   INT_LATCH8_clk_1 <= INT_LA8_q(3);
   INT_LA9_0_clrn_ctrl <= INT_ENA_q(9) and nRSTO;
   INT_LA9_d <= ((std_logic_vector'(unsigned(INT_LA9_q) + unsigned'("0001")))
	 and sizeIt(INT_L_q(9),4) and sizeIt(to_std_logic((unsigned(INT_LA9_q)
	 < unsigned'("0111"))),4)) or ((std_logic_vector'(unsigned(INT_LA9_q) -
	 unsigned'("0001"))) and sizeIt(not INT_L_q(9),4) and
	 sizeIt(to_std_logic((unsigned(INT_LA9_q) > unsigned'("1000"))),4)) or
	 ("1111" and sizeIt(INT_L_q(9),4) and
	 sizeIt(to_std_logic((unsigned(INT_LA9_q) > unsigned'("0110"))),4)) or
	 ("0000" and sizeIt(not INT_L_q(9),4) and
	 sizeIt(to_std_logic((unsigned(INT_LA9_q) < unsigned'("1001"))),4));
   INT_LATCH9_clk_1 <= INT_LA9_q(3);

    --  INT_IN
    INT_IN(0) <= PIC_INT;
    INT_IN(1) <= E0_INT;
    INT_IN(2) <= DVI_INT;
    INT_IN(3) <= not nPCI_INTA;
    INT_IN(4) <= not nPCI_INTB;
    INT_IN(5) <= not nPCI_INTC;
    INT_IN(6) <= not nPCI_INTD;
    INT_IN(7) <= DSP_INT;
    INT_IN(8) <= VSYNC;
    INT_IN(9) <= HSYNC;
    INT_IN(25 DOWNTO 10) <= "0000000000000000";
    INT_IN(26) <= HSYNC;
    INT_IN(27) <= INT_CTR_q(0);
    INT_IN(28) <= VSYNC;
    INT_IN(29) <= to_std_logic(INT_LATCH_q /= "00000000000000000000000000000000");
    INT_IN(30) <= not nMFP_INT;
    INT_IN(31) <= DMA_DRQ;

    -- ***************************************************************************************
    --  ACP CONFIG REGISTER: BIT 31-> 0=CF 1=IDE
    ACP_CONF0_clk_ctrl <= MAIN_CLK;

    --  $4'0000/4
    ACP_CONF_CS <= to_std_logic(((not nFB_CS2)='1') and FB_ADR(27 DOWNTO 2) = "00000000010000000000000000");
    ACP_CONF_d <= FB_AD;
    ACP_CONF24_ena_ctrl <= ACP_CONF_CS and FB_B(0) and (not nFB_WR);
    ACP_CONF16_ena_ctrl <= ACP_CONF_CS and FB_B(1) and (not nFB_WR);
    ACP_CONF8_ena_ctrl <= ACP_CONF_CS and FB_B(2) and (not nFB_WR);
    ACP_CONF0_ena_ctrl <= ACP_CONF_CS and FB_B(3) and (not nFB_WR);

    -- ***************************************************************************************
    -- ------------------------------------------------------------
    --  C1287   0=SEK 2=MIN 4=STD 6=WOCHENTAG 7=TAG 8=MONAT 9=JAHR
    -- --------------------------------------------------------
    RTC_ADR0_clk_ctrl <= MAIN_CLK;
    RTC_ADR_d <= FB_AD(21 DOWNTO 16);

    --  FFFF8961
    UHR_AS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 DOWNTO 1) = "1111100010010110000") and FB_B(1);

    --  FFFF8963
    UHR_DS <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 DOWNTO 1) = "1111100010010110001") and FB_B(3);
    RTC_ADR0_ena_ctrl <= UHR_AS and (not nFB_WR);
    WERTE7_0_clk_ctrl <= MAIN_CLK;
    WERTE6_0_clk_ctrl <= MAIN_CLK;
    WERTE5_0_clk_ctrl <= MAIN_CLK;
    WERTE4_0_clk_ctrl <= MAIN_CLK;
    WERTE3_0_clk_ctrl <= MAIN_CLK;
    WERTE2_0_clk_ctrl <= MAIN_CLK;
    WERTE1_0_clk_ctrl <= MAIN_CLK;
    WERTE0_0_clk_ctrl <= MAIN_CLK;
   
    (WERTE7_0_d_1, WERTE6_0_d_1, WERTE5_0_d_1, WERTE4_0_d_1, WERTE3_0_d_1,
	 WERTE2_0_d_1, WERTE1_0_d_1, WERTE0_0_d_1) <= FB_AD(23 DOWNTO 16) and
	 sizeIt(to_std_logic(RTC_ADR_q = "000000"),8) and sizeIt(UHR_DS,8) and
	 sizeIt(not nFB_WR,8);
   
    (WERTE7_d(1), WERTE6_d(1), WERTE5_d(1), WERTE4_d(1), WERTE3_d(1),
	 WERTE2_d(1), WERTE1_d(1), WERTE0_d(1)) <= FB_AD(23 DOWNTO 16);
    
    (WERTE7_2_d_1, WERTE6_2_d_1, WERTE5_2_d_1, WERTE4_2_d_1, WERTE3_2_d_1,
	 WERTE2_2_d_1, WERTE1_2_d_1, WERTE0_2_d_1) <= FB_AD(23 DOWNTO 16) and
	 sizeIt(to_std_logic(RTC_ADR_q = "000010"),8) and sizeIt(UHR_DS,8) and
	 sizeIt(not nFB_WR,8);

    (WERTE7_d(3), WERTE6_d(3), WERTE5_d(3), WERTE4_d(3), WERTE3_d(3),
	 WERTE2_d(3), WERTE1_d(3), WERTE0_d(3)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_4_d_1, WERTE6_4_d_1, WERTE5_4_d_1, WERTE4_4_d_1, WERTE3_4_d_1,
	 WERTE2_4_d_1, WERTE1_4_d_1, WERTE0_4_d_1) <= FB_AD(23 DOWNTO 16) and
	 sizeIt(to_std_logic(RTC_ADR_q = "000100"),8) and sizeIt(UHR_DS,8) and
	 sizeIt(not nFB_WR,8);
   
    (WERTE7_d(5), WERTE6_d(5), WERTE5_d(5), WERTE4_d(5), WERTE3_d(5),
	 WERTE2_d(5), WERTE1_d(5), WERTE0_d(5)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_6_d_1, WERTE6_6_d_1, WERTE5_6_d_1, WERTE4_6_d_1, WERTE3_6_d_1,
	 WERTE2_6_d_1, WERTE1_6_d_1, WERTE0_6_d_1) <= FB_AD(23 DOWNTO 16) and
	 sizeIt(to_std_logic(RTC_ADR_q = "000110"),8) and sizeIt(UHR_DS,8) and
	 sizeIt(not nFB_WR,8);
    
    (WERTE7_7_d_1, WERTE6_7_d_1, WERTE5_7_d_1, WERTE4_7_d_1, WERTE3_7_d_1,
	 WERTE2_7_d_1, WERTE1_7_d_1, WERTE0_7_d_1) <= FB_AD(23 DOWNTO 16) and
	 sizeIt(to_std_logic(RTC_ADR_q = "000111"),8) and sizeIt(UHR_DS,8) and
	 sizeIt(not nFB_WR,8);
    
    (WERTE7_8_d_1, WERTE6_8_d_1, WERTE5_8_d_1, WERTE4_8_d_1, WERTE3_8_d_1,
	 WERTE2_8_d_1, WERTE1_8_d_1, WERTE0_8_d_1) <= FB_AD(23 DOWNTO 16) and
	 sizeIt(to_std_logic(RTC_ADR_q = "001000"),8) and sizeIt(UHR_DS,8) and
	 sizeIt(not nFB_WR,8);
   
    (WERTE7_9_d_1, WERTE6_9_d_1, WERTE5_9_d_1, WERTE4_9_d_1, WERTE3_9_d_1,
	 WERTE2_9_d_1, WERTE1_9_d_1, WERTE0_9_d_1) <= FB_AD(23 DOWNTO 16) and
	 sizeIt(to_std_logic(RTC_ADR_q = "001001"),8) and sizeIt(UHR_DS,8) and
	 sizeIt(not nFB_WR,8);
    
    (WERTE7_d(10), WERTE6_d(10), WERTE5_d(10), WERTE4_d(10), WERTE3_d(10),
	 WERTE2_d(10), WERTE1_d(10), WERTE0_d(10)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(11), WERTE6_d(11), WERTE5_d(11), WERTE4_d(11), WERTE3_d(11),
	 WERTE2_11_d_1, WERTE1_11_d_1, WERTE0_11_d_1) <= FB_AD(23 DOWNTO 16);
    
    (WERTE7_d(12), WERTE6_d(12), WERTE5_d(12), WERTE4_d(12), WERTE3_d(12),
	 WERTE2_d(12), WERTE1_d(12), WERTE0_d(12)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_13_d_1, WERTE6_d(13), WERTE5_d(13), WERTE4_d(13), WERTE3_d(13),
	 WERTE2_d(13), WERTE1_d(13), WERTE0_13_d_1) <= FB_AD(23 DOWNTO 16);
    
    (WERTE7_d(14), WERTE6_d(14), WERTE5_d(14), WERTE4_d(14), WERTE3_d(14),
	 WERTE2_d(14), WERTE1_d(14), WERTE0_d(14)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(15), WERTE6_d(15), WERTE5_d(15), WERTE4_d(15), WERTE3_d(15),
	 WERTE2_d(15), WERTE1_d(15), WERTE0_d(15)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(16), WERTE6_d(16), WERTE5_d(16), WERTE4_d(16), WERTE3_d(16),
	 WERTE2_d(16), WERTE1_d(16), WERTE0_d(16)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(17), WERTE6_d(17), WERTE5_d(17), WERTE4_d(17), WERTE3_d(17),
	 WERTE2_d(17), WERTE1_d(17), WERTE0_d(17)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(18), WERTE6_d(18), WERTE5_d(18), WERTE4_d(18), WERTE3_d(18),
	 WERTE2_d(18), WERTE1_d(18), WERTE0_d(18)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(19), WERTE6_d(19), WERTE5_d(19), WERTE4_d(19), WERTE3_d(19),
	 WERTE2_d(19), WERTE1_d(19), WERTE0_d(19)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(20), WERTE6_d(20), WERTE5_d(20), WERTE4_d(20), WERTE3_d(20),
	 WERTE2_d(20), WERTE1_d(20), WERTE0_d(20)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(21), WERTE6_d(21), WERTE5_d(21), WERTE4_d(21), WERTE3_d(21),
	 WERTE2_d(21), WERTE1_d(21), WERTE0_d(21)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(22), WERTE6_d(22), WERTE5_d(22), WERTE4_d(22), WERTE3_d(22),
	 WERTE2_d(22), WERTE1_d(22), WERTE0_d(22)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(23), WERTE6_d(23), WERTE5_d(23), WERTE4_d(23), WERTE3_d(23),
	 WERTE2_d(23), WERTE1_d(23), WERTE0_d(23)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(24), WERTE6_d(24), WERTE5_d(24), WERTE4_d(24), WERTE3_d(24),
	 WERTE2_d(24), WERTE1_d(24), WERTE0_d(24)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(25), WERTE6_d(25), WERTE5_d(25), WERTE4_d(25), WERTE3_d(25),
	 WERTE2_d(25), WERTE1_d(25), WERTE0_d(25)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(26), WERTE6_d(26), WERTE5_d(26), WERTE4_d(26), WERTE3_d(26),
	 WERTE2_d(26), WERTE1_d(26), WERTE0_d(26)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(27), WERTE6_d(27), WERTE5_d(27), WERTE4_d(27), WERTE3_d(27),
	 WERTE2_d(27), WERTE1_d(27), WERTE0_d(27)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(28), WERTE6_d(28), WERTE5_d(28), WERTE4_d(28), WERTE3_d(28),
	 WERTE2_d(28), WERTE1_d(28), WERTE0_d(28)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(29), WERTE6_d(29), WERTE5_d(29), WERTE4_d(29), WERTE3_d(29),
	 WERTE2_d(29), WERTE1_d(29), WERTE0_d(29)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(30), WERTE6_d(30), WERTE5_d(30), WERTE4_d(30), WERTE3_d(30),
	 WERTE2_d(30), WERTE1_d(30), WERTE0_d(30)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(31), WERTE6_d(31), WERTE5_d(31), WERTE4_d(31), WERTE3_d(31),
	 WERTE2_d(31), WERTE1_d(31), WERTE0_d(31)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(32), WERTE6_d(32), WERTE5_d(32), WERTE4_d(32), WERTE3_d(32),
	 WERTE2_d(32), WERTE1_d(32), WERTE0_d(32)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(33), WERTE6_d(33), WERTE5_d(33), WERTE4_d(33), WERTE3_d(33),
	 WERTE2_d(33), WERTE1_d(33), WERTE0_d(33)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(34), WERTE6_d(34), WERTE5_d(34), WERTE4_d(34), WERTE3_d(34),
	 WERTE2_d(34), WERTE1_d(34), WERTE0_d(34)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(35), WERTE6_d(35), WERTE5_d(35), WERTE4_d(35), WERTE3_d(35),
        WERTE2_d(35), WERTE1_d(35), WERTE0_d(35)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(36), WERTE6_d(36), WERTE5_d(36), WERTE4_d(36), WERTE3_d(36),
	 WERTE2_d(36), WERTE1_d(36), WERTE0_d(36)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(37), WERTE6_d(37), WERTE5_d(37), WERTE4_d(37), WERTE3_d(37),
	 WERTE2_d(37), WERTE1_d(37), WERTE0_d(37)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(38), WERTE6_d(38), WERTE5_d(38), WERTE4_d(38), WERTE3_d(38),
	 WERTE2_d(38), WERTE1_d(38), WERTE0_d(38)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(39), WERTE6_d(39), WERTE5_d(39), WERTE4_d(39), WERTE3_d(39),
	 WERTE2_d(39), WERTE1_d(39), WERTE0_d(39)) <= FB_AD(23 DOWNTO 16);
    
    (WERTE7_d(40), WERTE6_d(40), WERTE5_d(40), WERTE4_d(40), WERTE3_d(40),
	 WERTE2_d(40), WERTE1_d(40), WERTE0_d(40)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(41), WERTE6_d(41), WERTE5_d(41), WERTE4_d(41), WERTE3_d(41),
	 WERTE2_d(41), WERTE1_d(41), WERTE0_d(41)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(42), WERTE6_d(42), WERTE5_d(42), WERTE4_d(42), WERTE3_d(42),
	 WERTE2_d(42), WERTE1_d(42), WERTE0_d(42)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(43), WERTE6_d(43), WERTE5_d(43), WERTE4_d(43), WERTE3_d(43),
	 WERTE2_d(43), WERTE1_d(43), WERTE0_d(43)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(44), WERTE6_d(44), WERTE5_d(44), WERTE4_d(44), WERTE3_d(44),
	 WERTE2_d(44), WERTE1_d(44), WERTE0_d(44)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(45), WERTE6_d(45), WERTE5_d(45), WERTE4_d(45), WERTE3_d(45),
	 WERTE2_d(45), WERTE1_d(45), WERTE0_d(45)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(46), WERTE6_d(46), WERTE5_d(46), WERTE4_d(46), WERTE3_d(46),
	 WERTE2_d(46), WERTE1_d(46), WERTE0_d(46)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(47), WERTE6_d(47), WERTE5_d(47), WERTE4_d(47), WERTE3_d(47),
	 WERTE2_d(47), WERTE1_d(47), WERTE0_d(47)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(48), WERTE6_d(48), WERTE5_d(48), WERTE4_d(48), WERTE3_d(48),
	 WERTE2_d(48), WERTE1_d(48), WERTE0_d(48)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(49), WERTE6_d(49), WERTE5_d(49), WERTE4_d(49), WERTE3_d(49),
	 WERTE2_d(49), WERTE1_d(49), WERTE0_d(49)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(50), WERTE6_d(50), WERTE5_d(50), WERTE4_d(50), WERTE3_d(50),
	 WERTE2_d(50), WERTE1_d(50), WERTE0_d(50)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(51), WERTE6_d(51), WERTE5_d(51), WERTE4_d(51), WERTE3_d(51),
	 WERTE2_d(51), WERTE1_d(51), WERTE0_d(51)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(52), WERTE6_d(52), WERTE5_d(52), WERTE4_d(52), WERTE3_d(52),
	 WERTE2_d(52), WERTE1_d(52), WERTE0_d(52)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(53), WERTE6_d(53), WERTE5_d(53), WERTE4_d(53), WERTE3_d(53),
	 WERTE2_d(53), WERTE1_d(53), WERTE0_d(53)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(54), WERTE6_d(54), WERTE5_d(54), WERTE4_d(54), WERTE3_d(54),
	 WERTE2_d(54), WERTE1_d(54), WERTE0_d(54)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(55), WERTE6_d(55), WERTE5_d(55), WERTE4_d(55), WERTE3_d(55),
	 WERTE2_d(55), WERTE1_d(55), WERTE0_d(55)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(56), WERTE6_d(56), WERTE5_d(56), WERTE4_d(56), WERTE3_d(56),
	 WERTE2_d(56), WERTE1_d(56), WERTE0_d(56)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(57), WERTE6_d(57), WERTE5_d(57), WERTE4_d(57), WERTE3_d(57),
	 WERTE2_d(57), WERTE1_d(57), WERTE0_d(57)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(58), WERTE6_d(58), WERTE5_d(58), WERTE4_d(58), WERTE3_d(58),
	 WERTE2_d(58), WERTE1_d(58), WERTE0_d(58)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(59), WERTE6_d(59), WERTE5_d(59), WERTE4_d(59), WERTE3_d(59),
	 WERTE2_d(59), WERTE1_d(59), WERTE0_d(59)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(60), WERTE6_d(60), WERTE5_d(60), WERTE4_d(60), WERTE3_d(60),
	 WERTE2_d(60), WERTE1_d(60), WERTE0_d(60)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(61), WERTE6_d(61), WERTE5_d(61), WERTE4_d(61), WERTE3_d(61),
	 WERTE2_d(61), WERTE1_d(61), WERTE0_d(61)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(62), WERTE6_d(62), WERTE5_d(62), WERTE4_d(62), WERTE3_d(62),
	 WERTE2_d(62), WERTE1_d(62), WERTE0_d(62)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_d(63), WERTE6_d(63), WERTE5_d(63), WERTE4_d(63), WERTE3_d(63),
	 WERTE2_d(63), WERTE1_d(63), WERTE0_d(63)) <= FB_AD(23 DOWNTO 16);
   
    (WERTE7_0_ena_1, WERTE6_0_ena_1, WERTE5_0_ena_1, WERTE4_0_ena_1,
	 WERTE3_0_ena_1, WERTE2_0_ena_1, WERTE1_0_ena_1, WERTE0_0_ena_1) <=
	 sizeIt(to_std_logic(RTC_ADR_q = "000000"),8) and sizeIt(UHR_DS,8) and
	 sizeIt(not nFB_WR,8);
   
    WERTE0_1_ena_ctrl <= to_std_logic(RTC_ADR_q = "000001") and UHR_DS and (not
	 nFB_WR);
   
    (WERTE7_2_ena_1, WERTE6_2_ena_1, WERTE5_2_ena_1, WERTE4_2_ena_1,
	 WERTE3_2_ena_1, WERTE2_2_ena_1, WERTE1_2_ena_1, WERTE0_2_ena_1) <=
	 sizeIt(to_std_logic(RTC_ADR_q = "000010"),8) and sizeIt(UHR_DS,8) and
	 sizeIt(not nFB_WR,8);
   
    WERTE0_3_ena_ctrl <= to_std_logic(RTC_ADR_q = "000011") and UHR_DS and (not
	 nFB_WR);
   
    (WERTE7_4_ena_1, WERTE6_4_ena_1, WERTE5_4_ena_1, WERTE4_4_ena_1,
	 WERTE3_4_ena_1, WERTE2_4_ena_1, WERTE1_4_ena_1, WERTE0_4_ena_1) <=
	 sizeIt(to_std_logic(RTC_ADR_q = "000100"),8) and sizeIt(UHR_DS,8) and
	 sizeIt(not nFB_WR,8);
   
    WERTE0_5_ena_ctrl <= to_std_logic(RTC_ADR_q = "000101") and UHR_DS and (not
	 nFB_WR);
   
    (WERTE7_6_ena_1, WERTE6_6_ena_1, WERTE5_6_ena_1, WERTE4_6_ena_1,
	 WERTE3_6_ena_1, WERTE2_6_ena_1, WERTE1_6_ena_1, WERTE0_6_ena_1) <=
	 sizeIt(to_std_logic(RTC_ADR_q = "000110"),8) and sizeIt(UHR_DS,8) and
	 sizeIt(not nFB_WR,8);
   
    (WERTE7_7_ena_1, WERTE6_7_ena_1, WERTE5_7_ena_1, WERTE4_7_ena_1,
	 WERTE3_7_ena_1, WERTE2_7_ena_1, WERTE1_7_ena_1, WERTE0_7_ena_1) <=
	 sizeIt(to_std_logic(RTC_ADR_q = "000111"),8) and sizeIt(UHR_DS,8) and
	 sizeIt(not nFB_WR,8);
   
    (WERTE7_8_ena_1, WERTE6_8_ena_1, WERTE5_8_ena_1, WERTE4_8_ena_1,
	 WERTE3_8_ena_1, WERTE2_8_ena_1, WERTE1_8_ena_1, WERTE0_8_ena_1) <=
	 sizeIt(to_std_logic(RTC_ADR_q = "001000"),8) and sizeIt(UHR_DS,8) and
	 sizeIt(not nFB_WR,8);
   
    (WERTE7_9_ena_1, WERTE6_9_ena_1, WERTE5_9_ena_1, WERTE4_9_ena_1,
	 WERTE3_9_ena_1, WERTE2_9_ena_1, WERTE1_9_ena_1, WERTE0_9_ena_1) <=
	 sizeIt(to_std_logic(RTC_ADR_q = "001001"),8) and sizeIt(UHR_DS,8) and
	 sizeIt(not nFB_WR,8);
   
    WERTE0_10_ena_ctrl <= to_std_logic(RTC_ADR_q = "001010") and UHR_DS and (not
	 nFB_WR);
   
    WERTE0_11_ena_ctrl <= to_std_logic(RTC_ADR_q = "001011") and UHR_DS and (not
	 nFB_WR);
   
    WERTE0_12_ena_ctrl <= to_std_logic(RTC_ADR_q = "001100") and UHR_DS and (not
	 nFB_WR);
   
    (WERTE7_ena(13), WERTE6_ena(13), WERTE5_ena(13), WERTE4_ena(13),
	 WERTE3_ena(13), WERTE2_ena(13), WERTE1_ena(13), WERTE0_13_ena_1) <=
	 sizeIt(to_std_logic(RTC_ADR_q = "001101"),8) and sizeIt(UHR_DS,8) and
	 sizeIt(not nFB_WR,8);
   
    WERTE0_14_ena_ctrl <= to_std_logic(RTC_ADR_q = "001110") and UHR_DS and (not
	 nFB_WR);
   
    WERTE0_15_ena_ctrl <= to_std_logic(RTC_ADR_q = "001111") and UHR_DS and (not
	 nFB_WR);
   
    WERTE0_16_ena_ctrl <= to_std_logic(RTC_ADR_q = "010000") and UHR_DS and (not
	 nFB_WR);
   
    WERTE0_17_ena_ctrl <= to_std_logic(RTC_ADR_q = "010001") and UHR_DS and (not
	 nFB_WR);
   
    WERTE0_18_ena_ctrl <= to_std_logic(RTC_ADR_q = "010010") and UHR_DS and (not
	 nFB_WR);
   
    WERTE0_19_ena_ctrl <= to_std_logic(RTC_ADR_q = "010011") and UHR_DS and (not
	 nFB_WR);
   
    WERTE0_20_ena_ctrl <= to_std_logic(RTC_ADR_q = "010100") and UHR_DS and (not
	 nFB_WR);
   
    WERTE0_21_ena_ctrl <= to_std_logic(RTC_ADR_q = "010101") and UHR_DS and (not
	 nFB_WR);
   WERTE0_22_ena_ctrl <= to_std_logic(RTC_ADR_q = "010110") and UHR_DS and (not
	 nFB_WR);
   WERTE0_23_ena_ctrl <= to_std_logic(RTC_ADR_q = "010111") and UHR_DS and (not
	 nFB_WR);
   WERTE0_24_ena_ctrl <= to_std_logic(RTC_ADR_q = "011000") and UHR_DS and (not
	 nFB_WR);
   WERTE0_25_ena_ctrl <= to_std_logic(RTC_ADR_q = "011001") and UHR_DS and (not
	 nFB_WR);
   WERTE0_26_ena_ctrl <= to_std_logic(RTC_ADR_q = "011010") and UHR_DS and (not
	 nFB_WR);
   WERTE0_27_ena_ctrl <= to_std_logic(RTC_ADR_q = "011011") and UHR_DS and (not
	 nFB_WR);
   WERTE0_28_ena_ctrl <= to_std_logic(RTC_ADR_q = "011100") and UHR_DS and (not
	 nFB_WR);
   WERTE0_29_ena_ctrl <= to_std_logic(RTC_ADR_q = "011101") and UHR_DS and (not
	 nFB_WR);
   WERTE0_30_ena_ctrl <= to_std_logic(RTC_ADR_q = "011110") and UHR_DS and (not
	 nFB_WR);
   WERTE0_31_ena_ctrl <= to_std_logic(RTC_ADR_q = "011111") and UHR_DS and (not
	 nFB_WR);
   WERTE0_32_ena_ctrl <= to_std_logic(RTC_ADR_q = "100000") and UHR_DS and (not
	 nFB_WR);
   WERTE0_33_ena_ctrl <= to_std_logic(RTC_ADR_q = "100001") and UHR_DS and (not
	 nFB_WR);
   WERTE0_34_ena_ctrl <= to_std_logic(RTC_ADR_q = "100010") and UHR_DS and (not
	 nFB_WR);
   WERTE0_35_ena_ctrl <= to_std_logic(RTC_ADR_q = "100011") and UHR_DS and (not
	 nFB_WR);
   WERTE0_36_ena_ctrl <= to_std_logic(RTC_ADR_q = "100100") and UHR_DS and (not
	 nFB_WR);
   WERTE0_37_ena_ctrl <= to_std_logic(RTC_ADR_q = "100101") and UHR_DS and (not
	 nFB_WR);
   WERTE0_38_ena_ctrl <= to_std_logic(RTC_ADR_q = "100110") and UHR_DS and (not
	 nFB_WR);
   WERTE0_39_ena_ctrl <= to_std_logic(RTC_ADR_q = "100111") and UHR_DS and (not
	 nFB_WR);
   WERTE0_40_ena_ctrl <= to_std_logic(RTC_ADR_q = "101000") and UHR_DS and (not
	 nFB_WR);
   WERTE0_41_ena_ctrl <= to_std_logic(RTC_ADR_q = "101001") and UHR_DS and (not
	 nFB_WR);
   WERTE0_42_ena_ctrl <= to_std_logic(RTC_ADR_q = "101010") and UHR_DS and (not
	 nFB_WR);
   WERTE0_43_ena_ctrl <= to_std_logic(RTC_ADR_q = "101011") and UHR_DS and (not
	 nFB_WR);
   WERTE0_44_ena_ctrl <= to_std_logic(RTC_ADR_q = "101100") and UHR_DS and (not
	 nFB_WR);
   WERTE0_45_ena_ctrl <= to_std_logic(RTC_ADR_q = "101101") and UHR_DS and (not
	 nFB_WR);
   WERTE0_46_ena_ctrl <= to_std_logic(RTC_ADR_q = "101110") and UHR_DS and (not
	 nFB_WR);
   WERTE0_47_ena_ctrl <= to_std_logic(RTC_ADR_q = "101111") and UHR_DS and (not
	 nFB_WR);
   WERTE0_48_ena_ctrl <= to_std_logic(RTC_ADR_q = "110000") and UHR_DS and (not
	 nFB_WR);
   WERTE0_49_ena_ctrl <= to_std_logic(RTC_ADR_q = "110001") and UHR_DS and (not
	 nFB_WR);
   WERTE0_50_ena_ctrl <= to_std_logic(RTC_ADR_q = "110010") and UHR_DS and (not
	 nFB_WR);
   WERTE0_51_ena_ctrl <= to_std_logic(RTC_ADR_q = "110011") and UHR_DS and (not
	 nFB_WR);
   WERTE0_52_ena_ctrl <= to_std_logic(RTC_ADR_q = "110100") and UHR_DS and (not
	 nFB_WR);
   WERTE0_53_ena_ctrl <= to_std_logic(RTC_ADR_q = "110101") and UHR_DS and (not
	 nFB_WR);
   WERTE0_54_ena_ctrl <= to_std_logic(RTC_ADR_q = "110110") and UHR_DS and (not
	 nFB_WR);
   WERTE0_55_ena_ctrl <= to_std_logic(RTC_ADR_q = "110111") and UHR_DS and (not
	 nFB_WR);
   WERTE0_56_ena_ctrl <= to_std_logic(RTC_ADR_q = "111000") and UHR_DS and (not
	 nFB_WR);
   WERTE0_57_ena_ctrl <= to_std_logic(RTC_ADR_q = "111001") and UHR_DS and (not
	 nFB_WR);
   WERTE0_58_ena_ctrl <= to_std_logic(RTC_ADR_q = "111010") and UHR_DS and (not
	 nFB_WR);
   WERTE0_59_ena_ctrl <= to_std_logic(RTC_ADR_q = "111011") and UHR_DS and (not
	 nFB_WR);
   WERTE0_60_ena_ctrl <= to_std_logic(RTC_ADR_q = "111100") and UHR_DS and (not
	 nFB_WR);
   WERTE0_61_ena_ctrl <= to_std_logic(RTC_ADR_q = "111101") and UHR_DS and (not
	 nFB_WR);
   WERTE0_62_ena_ctrl <= to_std_logic(RTC_ADR_q = "111110") and UHR_DS and (not
	 nFB_WR);
   WERTE0_63_ena_ctrl <= to_std_logic(RTC_ADR_q = "111111") and UHR_DS and (not
	 nFB_WR);
   
    PIC_INT_SYNC0_clk_ctrl <= MAIN_CLK;
    PIC_INT_SYNC_d(0) <= PIC_INT;
    PIC_INT_SYNC_d(1) <= PIC_INT_SYNC_q(0);
    PIC_INT_SYNC_d(2) <= (not PIC_INT_SYNC_q(1)) and PIC_INT_SYNC_q(0);
    UPDATE_ON_1 <= not WERTE7_q(11);

    --  KEIN UIP
    WERTE6_clrn(10) <= gnd;


    --  UPDATE ON OFF
    UPDATE_ON_2 <= not WERTE7_q(11);

    --  IMMER BINARY
    WERTE2_11_d_2 <= vcc;

    --  IMMER 24H FORMAT
    WERTE1_11_d_2 <= vcc;

    --  IMMER SOMMERZEITKORREKTUR
    WERTE0_11_d_2 <= vcc;

    --  IMMER RICHTIG
    WERTE7_13_d_2 <= vcc;

    --  SOMMER WINTERZEIT: BIT 0 IM REGISTER D IST DIE INFORMATION OB SOMMERZEIT IST (BRAUCHT MAN F�R R�CKSCHALTUNG)
    -- LETZTER SONNTAG IM APRIL
    SOMMERZEIT <= to_std_logic(std_logic_vector'(WERTE7_q(6) & WERTE6_q(6) &
	 WERTE5_q(6) & WERTE4_q(6) & WERTE3_q(6) & WERTE2_q(6) & WERTE1_q(6) &
	 WERTE0_q(6)) = "00000001" and std_logic_vector'(WERTE7_q(4) &
	 WERTE6_q(4) & WERTE5_q(4) & WERTE4_q(4) & WERTE3_q(4) & WERTE2_q(4) &
	 WERTE1_q(4) & WERTE0_q(4)) = "00000001" and
	 std_logic_vector'(WERTE7_q(8) & WERTE6_q(8) & WERTE5_q(8) &
	 WERTE4_q(8) & WERTE3_q(8) & WERTE2_q(8) & WERTE1_q(8) & WERTE0_q(8)) =
	 "00000100" and (unsigned(std_logic_vector'(WERTE7_q(7) & WERTE6_q(7) &
	 WERTE5_q(7) & WERTE4_q(7) & WERTE3_q(7) & WERTE2_q(7) & WERTE1_q(7) &
	 WERTE0_q(7))) > unsigned'("00010111")));
   WERTE0_13_d_2 <= SOMMERZEIT;
   WERTE0_13_ena_2 <= INC_STD and (SOMMERZEIT or WINTERZEIT);

-- LETZTER SONNTAG IM OKTOBER
   WINTERZEIT <= to_std_logic(std_logic_vector'(WERTE7_q(6) & WERTE6_q(6) &
	 WERTE5_q(6) & WERTE4_q(6) & WERTE3_q(6) & WERTE2_q(6) & WERTE1_q(6) &
	 WERTE0_q(6)) = "00000001" and std_logic_vector'(WERTE7_q(4) &
	 WERTE6_q(4) & WERTE5_q(4) & WERTE4_q(4) & WERTE3_q(4) & WERTE2_q(4) &
	 WERTE1_q(4) & WERTE0_q(4)) = "00000001" and
	 std_logic_vector'(WERTE7_q(8) & WERTE6_q(8) & WERTE5_q(8) &
	 WERTE4_q(8) & WERTE3_q(8) & WERTE2_q(8) & WERTE1_q(8) & WERTE0_q(8)) =
	 "00001010" and (unsigned(std_logic_vector'(WERTE7_q(7) & WERTE6_q(7) &
	 WERTE5_q(7) & WERTE4_q(7) & WERTE3_q(7) & WERTE2_q(7) & WERTE1_q(7) &
	 WERTE0_q(7))) > unsigned'("00011000"))) and WERTE0_q(13);

--  ACHTELSEKUNDEN
   ACHTELSEKUNDEN0_clk_ctrl <= MAIN_CLK;
   ACHTELSEKUNDEN_d <= std_logic_vector'(unsigned(ACHTELSEKUNDEN_q) +
	 unsigned'("001"));
   ACHTELSEKUNDEN0_ena_ctrl <= PIC_INT_SYNC_q(2) and UPDATE_ON;

--  SEKUNDEN
   INC_SEC <= to_std_logic(ACHTELSEKUNDEN_q = "111") and PIC_INT_SYNC_q(2) and
	 UPDATE_ON;

--  SEKUNDEN Z�HLEN BIS 59
   (WERTE7_0_d_2, WERTE6_0_d_2, WERTE5_0_d_2, WERTE4_0_d_2, WERTE3_0_d_2,
	 WERTE2_0_d_2, WERTE1_0_d_2, WERTE0_0_d_2) <=
	 (std_logic_vector'(unsigned(std_logic_vector'(WERTE7_q(0) &
	 WERTE6_q(0) & WERTE5_q(0) & WERTE4_q(0) & WERTE3_q(0) & WERTE2_q(0) &
	 WERTE1_q(0) & WERTE0_q(0))) + unsigned'("00000001"))) and
	 sizeIt(to_std_logic(std_logic_vector'(WERTE7_q(0) & WERTE6_q(0) &
	 WERTE5_q(0) & WERTE4_q(0) & WERTE3_q(0) & WERTE2_q(0) & WERTE1_q(0) &
	 WERTE0_q(0)) /= "00111011"),8) and (not (sizeIt(to_std_logic(RTC_ADR_q
	 = "000000"),8) and sizeIt(UHR_DS,8) and sizeIt(not nFB_WR,8)));
   (WERTE7_0_ena_2, WERTE6_0_ena_2, WERTE5_0_ena_2, WERTE4_0_ena_2,
	 WERTE3_0_ena_2, WERTE2_0_ena_2, WERTE1_0_ena_2, WERTE0_0_ena_2) <=
	 sizeIt(INC_SEC,8) and (not (sizeIt(to_std_logic(RTC_ADR_q =
	 "000000"),8) and sizeIt(UHR_DS,8) and sizeIt(not nFB_WR,8)));

--  MINUTEN
   INC_MIN <= to_std_logic(INC_SEC='1' and std_logic_vector'(WERTE7_q(0) &
	 WERTE6_q(0) & WERTE5_q(0) & WERTE4_q(0) & WERTE3_q(0) & WERTE2_q(0) &
	 WERTE1_q(0) & WERTE0_q(0)) = "00111011");

--  MINUTEN Z�HLEN BIS 59
   (WERTE7_2_d_2, WERTE6_2_d_2, WERTE5_2_d_2, WERTE4_2_d_2, WERTE3_2_d_2,
	 WERTE2_2_d_2, WERTE1_2_d_2, WERTE0_2_d_2) <=
	 (std_logic_vector'(unsigned(std_logic_vector'(WERTE7_q(2) &
	 WERTE6_q(2) & WERTE5_q(2) & WERTE4_q(2) & WERTE3_q(2) & WERTE2_q(2) &
	 WERTE1_q(2) & WERTE0_q(2))) + unsigned'("00000001"))) and
	 sizeIt(to_std_logic(std_logic_vector'(WERTE7_q(2) & WERTE6_q(2) &
	 WERTE5_q(2) & WERTE4_q(2) & WERTE3_q(2) & WERTE2_q(2) & WERTE1_q(2) &
	 WERTE0_q(2)) /= "00111011"),8) and (not (sizeIt(to_std_logic(RTC_ADR_q
	 = "000010"),8) and sizeIt(UHR_DS,8) and sizeIt(not nFB_WR,8)));
   (WERTE7_2_ena_2, WERTE6_2_ena_2, WERTE5_2_ena_2, WERTE4_2_ena_2,
	 WERTE3_2_ena_2, WERTE2_2_ena_2, WERTE1_2_ena_2, WERTE0_2_ena_2) <=
	 sizeIt(INC_MIN,8) and (not (sizeIt(to_std_logic(RTC_ADR_q =
	 "000010"),8) and sizeIt(UHR_DS,8) and sizeIt(not nFB_WR,8)));

--  STUNDEN
   INC_STD <= to_std_logic(INC_MIN='1' and std_logic_vector'(WERTE7_q(2) &
	 WERTE6_q(2) & WERTE5_q(2) & WERTE4_q(2) & WERTE3_q(2) & WERTE2_q(2) &
	 WERTE1_q(2) & WERTE0_q(2)) = "00111011");

--  STUNDEN Z�HLEN BIS 23
   (WERTE7_4_d_2, WERTE6_4_d_2, WERTE5_4_d_2, WERTE4_4_d_2, WERTE3_4_d_2,
	 WERTE2_4_d_2, WERTE1_4_d_2, WERTE0_4_d_2) <=
	 (std_logic_vector'((unsigned(std_logic_vector'(WERTE7_q(4) &
	 WERTE6_q(4) & WERTE5_q(4) & WERTE4_q(4) & WERTE3_q(4) & WERTE2_q(4) &
	 WERTE1_q(4) & WERTE0_q(4))) + unsigned'("00000001")) +
	 unsigned("00000001" and sizeIt(SOMMERZEIT,8)))) and
	 sizeIt(to_std_logic(std_logic_vector'(WERTE7_q(4) & WERTE6_q(4) &
	 WERTE5_q(4) & WERTE4_q(4) & WERTE3_q(4) & WERTE2_q(4) & WERTE1_q(4) &
	 WERTE0_q(4)) /= "00010111"),8) and (not (sizeIt(to_std_logic(RTC_ADR_q
	 = "000100"),8) and sizeIt(UHR_DS,8) and sizeIt(not nFB_WR,8)));

--  EINE STUNDE AUSLASSEN WENN WINTERZEITUMSCHALTUNG UND NOCH SOMMERZEIT
   (WERTE7_4_ena_2, WERTE6_4_ena_2, WERTE5_4_ena_2, WERTE4_4_ena_2,
	 WERTE3_4_ena_2, WERTE2_4_ena_2, WERTE1_4_ena_2, WERTE0_4_ena_2) <=
	 sizeIt(INC_STD,8) and (not (sizeIt(WINTERZEIT,8) and
	 sizeIt(WERTE0_q(12),8))) and (not (sizeIt(to_std_logic(RTC_ADR_q =
	 "000100"),8) and sizeIt(UHR_DS,8) and sizeIt(not nFB_WR,8)));

--  WOCHENTAG UND TAG
   INC_TAG <= to_std_logic(INC_STD='1' and std_logic_vector'(WERTE7_q(2) &
	 WERTE6_q(2) & WERTE5_q(2) & WERTE4_q(2) & WERTE3_q(2) & WERTE2_q(2) &
	 WERTE1_q(2) & WERTE0_q(2)) = "00010111");

--  WOCHENTAG Z�HLEN BIS 7
--  DANN BEI 1 WEITER
   (WERTE7_6_d_2, WERTE6_6_d_2, WERTE5_6_d_2, WERTE4_6_d_2, WERTE3_6_d_2,
	 WERTE2_6_d_2, WERTE1_6_d_2, WERTE0_6_d_2) <=
	 ((std_logic_vector'(unsigned(std_logic_vector'(WERTE7_q(6) &
	 WERTE6_q(6) & WERTE5_q(6) & WERTE4_q(6) & WERTE3_q(6) & WERTE2_q(6) &
	 WERTE1_q(6) & WERTE0_q(6))) + unsigned'("00000001"))) and
	 sizeIt(to_std_logic(std_logic_vector'(WERTE7_q(6) & WERTE6_q(6) &
	 WERTE5_q(6) & WERTE4_q(6) & WERTE3_q(6) & WERTE2_q(6) & WERTE1_q(6) &
	 WERTE0_q(6)) /= "00000111"),8) and (not (sizeIt(to_std_logic(RTC_ADR_q
	 = "000110"),8) and sizeIt(UHR_DS,8) and sizeIt(not nFB_WR,8)))) or
	 ("00000001" and sizeIt(to_std_logic(std_logic_vector'(WERTE7_q(6) &
	 WERTE6_q(6) & WERTE5_q(6) & WERTE4_q(6) & WERTE3_q(6) & WERTE2_q(6) &
	 WERTE1_q(6) & WERTE0_q(6)) = "00000111"),8) and (not
	 (sizeIt(to_std_logic(RTC_ADR_q = "000110"),8) and sizeIt(UHR_DS,8) and
	 sizeIt(not nFB_WR,8))));
   (WERTE7_6_ena_2, WERTE6_6_ena_2, WERTE5_6_ena_2, WERTE4_6_ena_2,
	 WERTE3_6_ena_2, WERTE2_6_ena_2, WERTE1_6_ena_2, WERTE0_6_ena_2) <=
	 sizeIt(INC_TAG,8) and (not (sizeIt(to_std_logic(RTC_ADR_q =
	 "000110"),8) and sizeIt(UHR_DS,8) and sizeIt(not nFB_WR,8)));
   ANZAHL_TAGE_DES_MONATS <= ("00011111" and
	 (sizeIt(to_std_logic(std_logic_vector'(WERTE7_q(8) & WERTE6_q(8) &
	 WERTE5_q(8) & WERTE4_q(8) & WERTE3_q(8) & WERTE2_q(8) & WERTE1_q(8) &
	 WERTE0_q(8)) = "00000001"),8) or
	 sizeIt(to_std_logic(std_logic_vector'(WERTE7_q(8) & WERTE6_q(8) &
	 WERTE5_q(8) & WERTE4_q(8) & WERTE3_q(8) & WERTE2_q(8) & WERTE1_q(8) &
	 WERTE0_q(8)) = "00000011"),8) or
	 sizeIt(to_std_logic(std_logic_vector'(WERTE7_q(8) & WERTE6_q(8) &
	 WERTE5_q(8) & WERTE4_q(8) & WERTE3_q(8) & WERTE2_q(8) & WERTE1_q(8) &
	 WERTE0_q(8)) = "00000101"),8) or
	 sizeIt(to_std_logic(std_logic_vector'(WERTE7_q(8) & WERTE6_q(8) &
	 WERTE5_q(8) & WERTE4_q(8) & WERTE3_q(8) & WERTE2_q(8) & WERTE1_q(8) &
	 WERTE0_q(8)) = "00000111"),8) or
	 sizeIt(to_std_logic(std_logic_vector'(WERTE7_q(8) & WERTE6_q(8) &
	 WERTE5_q(8) & WERTE4_q(8) & WERTE3_q(8) & WERTE2_q(8) & WERTE1_q(8) &
	 WERTE0_q(8)) = "00001000"),8) or
	 sizeIt(to_std_logic(std_logic_vector'(WERTE7_q(8) & WERTE6_q(8) &
	 WERTE5_q(8) & WERTE4_q(8) & WERTE3_q(8) & WERTE2_q(8) & WERTE1_q(8) &
	 WERTE0_q(8)) = "00001010"),8) or
	 sizeIt(to_std_logic(std_logic_vector'(WERTE7_q(8) & WERTE6_q(8) &
	 WERTE5_q(8) & WERTE4_q(8) & WERTE3_q(8) & WERTE2_q(8) & WERTE1_q(8) &
	 WERTE0_q(8)) = "00001100"),8))) or ("00011110" and
	 (sizeIt(to_std_logic(std_logic_vector'(WERTE7_q(8) & WERTE6_q(8) &
	 WERTE5_q(8) & WERTE4_q(8) & WERTE3_q(8) & WERTE2_q(8) & WERTE1_q(8) &
	 WERTE0_q(8)) = "00000100"),8) or
	 sizeIt(to_std_logic(std_logic_vector'(WERTE7_q(8) & WERTE6_q(8) &
	 WERTE5_q(8) & WERTE4_q(8) & WERTE3_q(8) & WERTE2_q(8) & WERTE1_q(8) &
	 WERTE0_q(8)) = "00000110"),8) or
	 sizeIt(to_std_logic(std_logic_vector'(WERTE7_q(8) & WERTE6_q(8) &
	 WERTE5_q(8) & WERTE4_q(8) & WERTE3_q(8) & WERTE2_q(8) & WERTE1_q(8) &
	 WERTE0_q(8)) = "00001001"),8) or
	 sizeIt(to_std_logic(std_logic_vector'(WERTE7_q(8) & WERTE6_q(8) &
	 WERTE5_q(8) & WERTE4_q(8) & WERTE3_q(8) & WERTE2_q(8) & WERTE1_q(8) &
	 WERTE0_q(8)) = "00001011"),8))) or ("00011101" and
	 sizeIt(to_std_logic(std_logic_vector'(WERTE7_q(8) & WERTE6_q(8) &
	 WERTE5_q(8) & WERTE4_q(8) & WERTE3_q(8) & WERTE2_q(8) & WERTE1_q(8) &
	 WERTE0_q(8)) = "00000010"),8) and
	 sizeIt(to_std_logic(std_logic_vector'(WERTE1_q(9) & WERTE0_q(9)) =
	 "00"),8)) or ("00011100" and
	 sizeIt(to_std_logic(std_logic_vector'(WERTE7_q(8) & WERTE6_q(8) &
	 WERTE5_q(8) & WERTE4_q(8) & WERTE3_q(8) & WERTE2_q(8) & WERTE1_q(8) &
	 WERTE0_q(8)) = "00000010"),8) and
	 sizeIt(to_std_logic(std_logic_vector'(WERTE1_q(9) & WERTE0_q(9)) /=
	 "00"),8));

--  TAG Z�HLEN BIS MONATSENDE
--  DANN BEI 1 WEITER
   (WERTE7_7_d_2, WERTE6_7_d_2, WERTE5_7_d_2, WERTE4_7_d_2, WERTE3_7_d_2,
	 WERTE2_7_d_2, WERTE1_7_d_2, WERTE0_7_d_2) <=
	 ((std_logic_vector'(unsigned(std_logic_vector'(WERTE7_q(7) &
	 WERTE6_q(7) & WERTE5_q(7) & WERTE4_q(7) & WERTE3_q(7) & WERTE2_q(7) &
	 WERTE1_q(7) & WERTE0_q(7))) + unsigned'("00000001"))) and
	 sizeIt(to_std_logic(std_logic_vector'(WERTE7_q(7) & WERTE6_q(7) &
	 WERTE5_q(7) & WERTE4_q(7) & WERTE3_q(7) & WERTE2_q(7) & WERTE1_q(7) &
	 WERTE0_q(7)) /= ANZAHL_TAGE_DES_MONATS),8) and (not
	 (sizeIt(to_std_logic(RTC_ADR_q = "000111"),8) and sizeIt(UHR_DS,8) and
	 sizeIt(not nFB_WR,8)))) or ("00000001" and
	 sizeIt(to_std_logic(std_logic_vector'(WERTE7_q(7) & WERTE6_q(7) &
	 WERTE5_q(7) & WERTE4_q(7) & WERTE3_q(7) & WERTE2_q(7) & WERTE1_q(7) &
	 WERTE0_q(7)) = ANZAHL_TAGE_DES_MONATS),8) and (not
	 (sizeIt(to_std_logic(RTC_ADR_q = "000111"),8) and sizeIt(UHR_DS,8) and
	 sizeIt(not nFB_WR,8))));
   (WERTE7_7_ena_2, WERTE6_7_ena_2, WERTE5_7_ena_2, WERTE4_7_ena_2,
	 WERTE3_7_ena_2, WERTE2_7_ena_2, WERTE1_7_ena_2, WERTE0_7_ena_2) <=
	 sizeIt(INC_TAG,8) and (not (sizeIt(to_std_logic(RTC_ADR_q =
	 "000111"),8) and sizeIt(UHR_DS,8) and sizeIt(not nFB_WR,8)));

--  MONATE
   INC_MONAT <= to_std_logic(INC_TAG='1' and std_logic_vector'(WERTE7_q(7) &
	 WERTE6_q(7) & WERTE5_q(7) & WERTE4_q(7) & WERTE3_q(7) & WERTE2_q(7) &
	 WERTE1_q(7) & WERTE0_q(7)) = ANZAHL_TAGE_DES_MONATS);

--  MONATE Z�HLEN BIS 12
--  DANN BEI 1 WEITER
   (WERTE7_8_d_2, WERTE6_8_d_2, WERTE5_8_d_2, WERTE4_8_d_2, WERTE3_8_d_2,
	 WERTE2_8_d_2, WERTE1_8_d_2, WERTE0_8_d_2) <=
	 ((std_logic_vector'(unsigned(std_logic_vector'(WERTE7_q(8) &
	 WERTE6_q(8) & WERTE5_q(8) & WERTE4_q(8) & WERTE3_q(8) & WERTE2_q(8) &
	 WERTE1_q(8) & WERTE0_q(8))) + unsigned'("00000001"))) and
	 sizeIt(to_std_logic(std_logic_vector'(WERTE7_q(8) & WERTE6_q(8) &
	 WERTE5_q(8) & WERTE4_q(8) & WERTE3_q(8) & WERTE2_q(8) & WERTE1_q(8) &
	 WERTE0_q(8)) /= "00001100"),8) and (not (sizeIt(to_std_logic(RTC_ADR_q
	 = "001000"),8) and sizeIt(UHR_DS,8) and sizeIt(not nFB_WR,8)))) or
	 ("00000001" and sizeIt(to_std_logic(std_logic_vector'(WERTE7_q(8) &
	 WERTE6_q(8) & WERTE5_q(8) & WERTE4_q(8) & WERTE3_q(8) & WERTE2_q(8) &
	 WERTE1_q(8) & WERTE0_q(8)) = "00001100"),8) and (not
	 (sizeIt(to_std_logic(RTC_ADR_q = "001000"),8) and sizeIt(UHR_DS,8) and
	 sizeIt(not nFB_WR,8))));
   (WERTE7_8_ena_2, WERTE6_8_ena_2, WERTE5_8_ena_2, WERTE4_8_ena_2,
	 WERTE3_8_ena_2, WERTE2_8_ena_2, WERTE1_8_ena_2, WERTE0_8_ena_2) <=
	 sizeIt(INC_MONAT,8) and (not (sizeIt(to_std_logic(RTC_ADR_q =
	 "001000"),8) and sizeIt(UHR_DS,8) and sizeIt(not nFB_WR,8)));

--  JAHR
   INC_JAHR <= to_std_logic(INC_MONAT='1' and std_logic_vector'(WERTE7_q(8) &
	 WERTE6_q(8) & WERTE5_q(8) & WERTE4_q(8) & WERTE3_q(8) & WERTE2_q(8) &
	 WERTE1_q(8) & WERTE0_q(8)) = "00001100");

--  JAHRE Z�HLEN BIS 99
   (WERTE7_9_d_2, WERTE6_9_d_2, WERTE5_9_d_2, WERTE4_9_d_2, WERTE3_9_d_2,
	 WERTE2_9_d_2, WERTE1_9_d_2, WERTE0_9_d_2) <=
	 (std_logic_vector'(unsigned(std_logic_vector'(WERTE7_q(9) &
	 WERTE6_q(9) & WERTE5_q(9) & WERTE4_q(9) & WERTE3_q(9) & WERTE2_q(9) &
	 WERTE1_q(9) & WERTE0_q(9))) + unsigned'("00000001"))) and
	 sizeIt(to_std_logic(std_logic_vector'(WERTE7_q(9) & WERTE6_q(9) &
	 WERTE5_q(9) & WERTE4_q(9) & WERTE3_q(9) & WERTE2_q(9) & WERTE1_q(9) &
	 WERTE0_q(9)) /= "01100011"),8) and (not (sizeIt(to_std_logic(RTC_ADR_q
	 = "001001"),8) and sizeIt(UHR_DS,8) and sizeIt(not nFB_WR,8)));
   (WERTE7_9_ena_2, WERTE6_9_ena_2, WERTE5_9_ena_2, WERTE4_9_ena_2,
	 WERTE3_9_ena_2, WERTE2_9_ena_2, WERTE1_9_ena_2, WERTE0_9_ena_2) <=
	 sizeIt(INC_JAHR,8) and (not (sizeIt(to_std_logic(RTC_ADR_q =
	 "001001"),8) and sizeIt(UHR_DS,8) and sizeIt(not nFB_WR,8)));

--  TRISTATE OUTPUT
   u0_data <= (sizeIt(INT_CTR_CS,8) and INT_CTR_q(31 DOWNTO 24)) or
	 (sizeIt(INT_ENA_CS,8) and INT_ENA_q(31 DOWNTO 24)) or
	 (sizeIt(INT_LATCH_CS,8) and INT_LATCH_q(31 DOWNTO 24)) or
	 (sizeIt(INT_CLEAR_CS,8) and INT_IN(31 DOWNTO 24)) or
	 (sizeIt(ACP_CONF_CS,8) and ACP_CONF_q(31 DOWNTO 24));
   u0_enabledt <= (INT_CTR_CS or INT_ENA_CS or INT_LATCH_CS or INT_CLEAR_CS or
	 ACP_CONF_CS) and (not nFB_OE);
   FB_AD(31 DOWNTO 24) <= u0_tridata;
   u1_data <= (std_logic_vector'(WERTE7_q(0) & WERTE6_q(0) & WERTE5_q(0) &
	 WERTE4_q(0) & WERTE3_q(0) & WERTE2_q(0) & WERTE1_q(0) & WERTE0_q(0))
	 and sizeIt(to_std_logic(RTC_ADR_q = "000000"),8) and sizeIt(UHR_DS,8))
	 or (std_logic_vector'(WERTE7_q(1) & WERTE6_q(1) & WERTE5_q(1) &
	 WERTE4_q(1) & WERTE3_q(1) & WERTE2_q(1) & WERTE1_q(1) & WERTE0_q(1))
	 and sizeIt(to_std_logic(RTC_ADR_q = "000001"),8) and sizeIt(UHR_DS,8))
	 or (std_logic_vector'(WERTE7_q(2) & WERTE6_q(2) & WERTE5_q(2) &
	 WERTE4_q(2) & WERTE3_q(2) & WERTE2_q(2) & WERTE1_q(2) & WERTE0_q(2))
	 and sizeIt(to_std_logic(RTC_ADR_q = "000010"),8) and sizeIt(UHR_DS,8))
	 or (std_logic_vector'(WERTE7_q(3) & WERTE6_q(3) & WERTE5_q(3) &
	 WERTE4_q(3) & WERTE3_q(3) & WERTE2_q(3) & WERTE1_q(3) & WERTE0_q(3))
	 and sizeIt(to_std_logic(RTC_ADR_q = "000011"),8) and sizeIt(UHR_DS,8))
	 or (std_logic_vector'(WERTE7_q(4) & WERTE6_q(4) & WERTE5_q(4) &
	 WERTE4_q(4) & WERTE3_q(4) & WERTE2_q(4) & WERTE1_q(4) & WERTE0_q(4))
	 and sizeIt(to_std_logic(RTC_ADR_q = "000100"),8) and sizeIt(UHR_DS,8))
	 or (std_logic_vector'(WERTE7_q(5) & WERTE6_q(5) & WERTE5_q(5) &
	 WERTE4_q(5) & WERTE3_q(5) & WERTE2_q(5) & WERTE1_q(5) & WERTE0_q(5))
	 and sizeIt(to_std_logic(RTC_ADR_q = "000101"),8) and sizeIt(UHR_DS,8))
	 or (std_logic_vector'(WERTE7_q(6) & WERTE6_q(6) & WERTE5_q(6) &
	 WERTE4_q(6) & WERTE3_q(6) & WERTE2_q(6) & WERTE1_q(6) & WERTE0_q(6))
	 and sizeIt(to_std_logic(RTC_ADR_q = "000110"),8) and sizeIt(UHR_DS,8))
	 or (std_logic_vector'(WERTE7_q(7) & WERTE6_q(7) & WERTE5_q(7) &
	 WERTE4_q(7) & WERTE3_q(7) & WERTE2_q(7) & WERTE1_q(7) & WERTE0_q(7))
	 and sizeIt(to_std_logic(RTC_ADR_q = "000111"),8) and sizeIt(UHR_DS,8))
	 or (std_logic_vector'(WERTE7_q(8) & WERTE6_q(8) & WERTE5_q(8) &
	 WERTE4_q(8) & WERTE3_q(8) & WERTE2_q(8) & WERTE1_q(8) & WERTE0_q(8))
	 and sizeIt(to_std_logic(RTC_ADR_q = "001000"),8) and sizeIt(UHR_DS,8))
	 or (std_logic_vector'(WERTE7_q(9) & WERTE6_q(9) & WERTE5_q(9) &
	 WERTE4_q(9) & WERTE3_q(9) & WERTE2_q(9) & WERTE1_q(9) & WERTE0_q(9))
	 and sizeIt(to_std_logic(RTC_ADR_q = "001001"),8) and sizeIt(UHR_DS,8))
	 or (std_logic_vector'(WERTE7_q(10) & WERTE6_q(10) & WERTE5_q(10) &
	 WERTE4_q(10) & WERTE3_q(10) & WERTE2_q(10) & WERTE1_q(10) &
	 WERTE0_q(10)) and sizeIt(to_std_logic(RTC_ADR_q = "001010"),8) and
	 sizeIt(UHR_DS,8)) or (std_logic_vector'(WERTE7_q(11) & WERTE6_q(11) &
	 WERTE5_q(11) & WERTE4_q(11) & WERTE3_q(11) & WERTE2_q(11) &
	 WERTE1_q(11) & WERTE0_q(11)) and sizeIt(to_std_logic(RTC_ADR_q =
	 "001011"),8) and sizeIt(UHR_DS,8)) or (std_logic_vector'(WERTE7_q(12)
	 & WERTE6_q(12) & WERTE5_q(12) & WERTE4_q(12) & WERTE3_q(12) &
	 WERTE2_q(12) & WERTE1_q(12) & WERTE0_q(12)) and
	 sizeIt(to_std_logic(RTC_ADR_q = "001100"),8) and sizeIt(UHR_DS,8)) or
	 (std_logic_vector'(WERTE7_q(13) & WERTE6_q(13) & WERTE5_q(13) &
	 WERTE4_q(13) & WERTE3_q(13) & WERTE2_q(13) & WERTE1_q(13) &
	 WERTE0_q(13)) and sizeIt(to_std_logic(RTC_ADR_q = "001101"),8) and
	 sizeIt(UHR_DS,8)) or (std_logic_vector'(WERTE7_q(14) & WERTE6_q(14) &
	 WERTE5_q(14) & WERTE4_q(14) & WERTE3_q(14) & WERTE2_q(14) &
	 WERTE1_q(14) & WERTE0_q(14)) and sizeIt(to_std_logic(RTC_ADR_q =
	 "001110"),8) and sizeIt(UHR_DS,8)) or (std_logic_vector'(WERTE7_q(15)
	 & WERTE6_q(15) & WERTE5_q(15) & WERTE4_q(15) & WERTE3_q(15) &
	 WERTE2_q(15) & WERTE1_q(15) & WERTE0_q(15)) and
	 sizeIt(to_std_logic(RTC_ADR_q = "001111"),8) and sizeIt(UHR_DS,8)) or
	 (std_logic_vector'(WERTE7_q(16) & WERTE6_q(16) & WERTE5_q(16) &
	 WERTE4_q(16) & WERTE3_q(16) & WERTE2_q(16) & WERTE1_q(16) &
	 WERTE0_q(16)) and sizeIt(to_std_logic(RTC_ADR_q = "010000"),8) and
	 sizeIt(UHR_DS,8)) or (std_logic_vector'(WERTE7_q(17) & WERTE6_q(17) &
	 WERTE5_q(17) & WERTE4_q(17) & WERTE3_q(17) & WERTE2_q(17) &
	 WERTE1_q(17) & WERTE0_q(17)) and sizeIt(to_std_logic(RTC_ADR_q =
	 "010001"),8) and sizeIt(UHR_DS,8)) or (std_logic_vector'(WERTE7_q(18)
	 & WERTE6_q(18) & WERTE5_q(18) & WERTE4_q(18) & WERTE3_q(18) &
	 WERTE2_q(18) & WERTE1_q(18) & WERTE0_q(18)) and
	 sizeIt(to_std_logic(RTC_ADR_q = "010010"),8) and sizeIt(UHR_DS,8)) or
	 (std_logic_vector'(WERTE7_q(19) & WERTE6_q(19) & WERTE5_q(19) &
	 WERTE4_q(19) & WERTE3_q(19) & WERTE2_q(19) & WERTE1_q(19) &
	 WERTE0_q(19)) and sizeIt(to_std_logic(RTC_ADR_q = "010011"),8) and
	 sizeIt(UHR_DS,8)) or (std_logic_vector'(WERTE7_q(20) & WERTE6_q(20) &
	 WERTE5_q(20) & WERTE4_q(20) & WERTE3_q(20) & WERTE2_q(20) &
	 WERTE1_q(20) & WERTE0_q(20)) and sizeIt(to_std_logic(RTC_ADR_q =
	 "010100"),8) and sizeIt(UHR_DS,8)) or (std_logic_vector'(WERTE7_q(21)
	 & WERTE6_q(21) & WERTE5_q(21) & WERTE4_q(21) & WERTE3_q(21) &
	 WERTE2_q(21) & WERTE1_q(21) & WERTE0_q(21)) and
	 sizeIt(to_std_logic(RTC_ADR_q = "010101"),8) and sizeIt(UHR_DS,8)) or
	 (std_logic_vector'(WERTE7_q(22) & WERTE6_q(22) & WERTE5_q(22) &
	 WERTE4_q(22) & WERTE3_q(22) & WERTE2_q(22) & WERTE1_q(22) &
	 WERTE0_q(22)) and sizeIt(to_std_logic(RTC_ADR_q = "010110"),8) and
	 sizeIt(UHR_DS,8)) or (std_logic_vector'(WERTE7_q(23) & WERTE6_q(23) &
	 WERTE5_q(23) & WERTE4_q(23) & WERTE3_q(23) & WERTE2_q(23) &
	 WERTE1_q(23) & WERTE0_q(23)) and sizeIt(to_std_logic(RTC_ADR_q =
	 "010111"),8) and sizeIt(UHR_DS,8)) or (std_logic_vector'(WERTE7_q(24)
	 & WERTE6_q(24) & WERTE5_q(24) & WERTE4_q(24) & WERTE3_q(24) &
	 WERTE2_q(24) & WERTE1_q(24) & WERTE0_q(24)) and
	 sizeIt(to_std_logic(RTC_ADR_q = "011000"),8) and sizeIt(UHR_DS,8)) or
	 (std_logic_vector'(WERTE7_q(25) & WERTE6_q(25) & WERTE5_q(25) &
	 WERTE4_q(25) & WERTE3_q(25) & WERTE2_q(25) & WERTE1_q(25) &
	 WERTE0_q(25)) and sizeIt(to_std_logic(RTC_ADR_q = "011001"),8) and
	 sizeIt(UHR_DS,8)) or (std_logic_vector'(WERTE7_q(26) & WERTE6_q(26) &
	 WERTE5_q(26) & WERTE4_q(26) & WERTE3_q(26) & WERTE2_q(26) &
	 WERTE1_q(26) & WERTE0_q(26)) and sizeIt(to_std_logic(RTC_ADR_q =
	 "011010"),8) and sizeIt(UHR_DS,8)) or (std_logic_vector'(WERTE7_q(27)
	 & WERTE6_q(27) & WERTE5_q(27) & WERTE4_q(27) & WERTE3_q(27) &
	 WERTE2_q(27) & WERTE1_q(27) & WERTE0_q(27)) and
	 sizeIt(to_std_logic(RTC_ADR_q = "011011"),8) and sizeIt(UHR_DS,8)) or
	 (std_logic_vector'(WERTE7_q(28) & WERTE6_q(28) & WERTE5_q(28) &
	 WERTE4_q(28) & WERTE3_q(28) & WERTE2_q(28) & WERTE1_q(28) &
	 WERTE0_q(28)) and sizeIt(to_std_logic(RTC_ADR_q = "011100"),8) and
	 sizeIt(UHR_DS,8)) or (std_logic_vector'(WERTE7_q(29) & WERTE6_q(29) &
	 WERTE5_q(29) & WERTE4_q(29) & WERTE3_q(29) & WERTE2_q(29) &
	 WERTE1_q(29) & WERTE0_q(29)) and sizeIt(to_std_logic(RTC_ADR_q =
	 "011101"),8) and sizeIt(UHR_DS,8)) or (std_logic_vector'(WERTE7_q(30)
	 & WERTE6_q(30) & WERTE5_q(30) & WERTE4_q(30) & WERTE3_q(30) &
	 WERTE2_q(30) & WERTE1_q(30) & WERTE0_q(30)) and
	 sizeIt(to_std_logic(RTC_ADR_q = "011110"),8) and sizeIt(UHR_DS,8)) or
	 (std_logic_vector'(WERTE7_q(31) & WERTE6_q(31) & WERTE5_q(31) &
	 WERTE4_q(31) & WERTE3_q(31) & WERTE2_q(31) & WERTE1_q(31) &
	 WERTE0_q(31)) and sizeIt(to_std_logic(RTC_ADR_q = "011111"),8) and
	 sizeIt(UHR_DS,8)) or (std_logic_vector'(WERTE7_q(32) & WERTE6_q(32) &
	 WERTE5_q(32) & WERTE4_q(32) & WERTE3_q(32) & WERTE2_q(32) &
	 WERTE1_q(32) & WERTE0_q(32)) and sizeIt(to_std_logic(RTC_ADR_q =
	 "100000"),8) and sizeIt(UHR_DS,8)) or (std_logic_vector'(WERTE7_q(33)
	 & WERTE6_q(33) & WERTE5_q(33) & WERTE4_q(33) & WERTE3_q(33) &
	 WERTE2_q(33) & WERTE1_q(33) & WERTE0_q(33)) and
	 sizeIt(to_std_logic(RTC_ADR_q = "100001"),8) and sizeIt(UHR_DS,8)) or
	 (std_logic_vector'(WERTE7_q(34) & WERTE6_q(34) & WERTE5_q(34) &
	 WERTE4_q(34) & WERTE3_q(34) & WERTE2_q(34) & WERTE1_q(34) &
	 WERTE0_q(34)) and sizeIt(to_std_logic(RTC_ADR_q = "100010"),8) and
	 sizeIt(UHR_DS,8)) or (std_logic_vector'(WERTE7_q(35) & WERTE6_q(35) &
	 WERTE5_q(35) & WERTE4_q(35) & WERTE3_q(35) & WERTE2_q(35) &
	 WERTE1_q(35) & WERTE0_q(35)) and sizeIt(to_std_logic(RTC_ADR_q =
	 "100011"),8) and sizeIt(UHR_DS,8)) or (std_logic_vector'(WERTE7_q(36)
	 & WERTE6_q(36) & WERTE5_q(36) & WERTE4_q(36) & WERTE3_q(36) &
	 WERTE2_q(36) & WERTE1_q(36) & WERTE0_q(36)) and
	 sizeIt(to_std_logic(RTC_ADR_q = "100100"),8) and sizeIt(UHR_DS,8)) or
	 (std_logic_vector'(WERTE7_q(37) & WERTE6_q(37) & WERTE5_q(37) &
	 WERTE4_q(37) & WERTE3_q(37) & WERTE2_q(37) & WERTE1_q(37) &
	 WERTE0_q(37)) and sizeIt(to_std_logic(RTC_ADR_q = "100101"),8) and
	 sizeIt(UHR_DS,8)) or (std_logic_vector'(WERTE7_q(38) & WERTE6_q(38) &
	 WERTE5_q(38) & WERTE4_q(38) & WERTE3_q(38) & WERTE2_q(38) &
	 WERTE1_q(38) & WERTE0_q(38)) and sizeIt(to_std_logic(RTC_ADR_q =
	 "100110"),8) and sizeIt(UHR_DS,8)) or (std_logic_vector'(WERTE7_q(39)
	 & WERTE6_q(39) & WERTE5_q(39) & WERTE4_q(39) & WERTE3_q(39) &
	 WERTE2_q(39) & WERTE1_q(39) & WERTE0_q(39)) and
	 sizeIt(to_std_logic(RTC_ADR_q = "100111"),8) and sizeIt(UHR_DS,8)) or
	 (std_logic_vector'(WERTE7_q(40) & WERTE6_q(40) & WERTE5_q(40) &
	 WERTE4_q(40) & WERTE3_q(40) & WERTE2_q(40) & WERTE1_q(40) &
	 WERTE0_q(40)) and sizeIt(to_std_logic(RTC_ADR_q = "101000"),8) and
	 sizeIt(UHR_DS,8)) or (std_logic_vector'(WERTE7_q(41) & WERTE6_q(41) &
	 WERTE5_q(41) & WERTE4_q(41) & WERTE3_q(41) & WERTE2_q(41) &
	 WERTE1_q(41) & WERTE0_q(41)) and sizeIt(to_std_logic(RTC_ADR_q =
	 "101001"),8) and sizeIt(UHR_DS,8)) or (std_logic_vector'(WERTE7_q(42)
	 & WERTE6_q(42) & WERTE5_q(42) & WERTE4_q(42) & WERTE3_q(42) &
	 WERTE2_q(42) & WERTE1_q(42) & WERTE0_q(42)) and
	 sizeIt(to_std_logic(RTC_ADR_q = "101010"),8) and sizeIt(UHR_DS,8)) or
	 (std_logic_vector'(WERTE7_q(43) & WERTE6_q(43) & WERTE5_q(43) &
	 WERTE4_q(43) & WERTE3_q(43) & WERTE2_q(43) & WERTE1_q(43) &
	 WERTE0_q(43)) and sizeIt(to_std_logic(RTC_ADR_q = "101011"),8) and
	 sizeIt(UHR_DS,8)) or (std_logic_vector'(WERTE7_q(44) & WERTE6_q(44) &
	 WERTE5_q(44) & WERTE4_q(44) & WERTE3_q(44) & WERTE2_q(44) &
	 WERTE1_q(44) & WERTE0_q(44)) and sizeIt(to_std_logic(RTC_ADR_q =
	 "101100"),8) and sizeIt(UHR_DS,8)) or (std_logic_vector'(WERTE7_q(45)
	 & WERTE6_q(45) & WERTE5_q(45) & WERTE4_q(45) & WERTE3_q(45) &
	 WERTE2_q(45) & WERTE1_q(45) & WERTE0_q(45)) and
	 sizeIt(to_std_logic(RTC_ADR_q = "101101"),8) and sizeIt(UHR_DS,8)) or
	 (std_logic_vector'(WERTE7_q(46) & WERTE6_q(46) & WERTE5_q(46) &
	 WERTE4_q(46) & WERTE3_q(46) & WERTE2_q(46) & WERTE1_q(46) &
	 WERTE0_q(46)) and sizeIt(to_std_logic(RTC_ADR_q = "101110"),8) and
	 sizeIt(UHR_DS,8)) or (std_logic_vector'(WERTE7_q(47) & WERTE6_q(47) &
	 WERTE5_q(47) & WERTE4_q(47) & WERTE3_q(47) & WERTE2_q(47) &
	 WERTE1_q(47) & WERTE0_q(47)) and sizeIt(to_std_logic(RTC_ADR_q =
	 "101111"),8) and sizeIt(UHR_DS,8)) or (std_logic_vector'(WERTE7_q(48)
	 & WERTE6_q(48) & WERTE5_q(48) & WERTE4_q(48) & WERTE3_q(48) &
	 WERTE2_q(48) & WERTE1_q(48) & WERTE0_q(48)) and
	 sizeIt(to_std_logic(RTC_ADR_q = "110000"),8) and sizeIt(UHR_DS,8)) or
	 (std_logic_vector'(WERTE7_q(49) & WERTE6_q(49) & WERTE5_q(49) &
	 WERTE4_q(49) & WERTE3_q(49) & WERTE2_q(49) & WERTE1_q(49) &
	 WERTE0_q(49)) and sizeIt(to_std_logic(RTC_ADR_q = "110001"),8) and
	 sizeIt(UHR_DS,8)) or (std_logic_vector'(WERTE7_q(50) & WERTE6_q(50) &
	 WERTE5_q(50) & WERTE4_q(50) & WERTE3_q(50) & WERTE2_q(50) &
	 WERTE1_q(50) & WERTE0_q(50)) and sizeIt(to_std_logic(RTC_ADR_q =
	 "110010"),8) and sizeIt(UHR_DS,8)) or (std_logic_vector'(WERTE7_q(51)
	 & WERTE6_q(51) & WERTE5_q(51) & WERTE4_q(51) & WERTE3_q(51) &
	 WERTE2_q(51) & WERTE1_q(51) & WERTE0_q(51)) and
	 sizeIt(to_std_logic(RTC_ADR_q = "110011"),8) and sizeIt(UHR_DS,8)) or
	 (std_logic_vector'(WERTE7_q(52) & WERTE6_q(52) & WERTE5_q(52) &
	 WERTE4_q(52) & WERTE3_q(52) & WERTE2_q(52) & WERTE1_q(52) &
	 WERTE0_q(52)) and sizeIt(to_std_logic(RTC_ADR_q = "110100"),8) and
	 sizeIt(UHR_DS,8)) or (std_logic_vector'(WERTE7_q(53) & WERTE6_q(53) &
	 WERTE5_q(53) & WERTE4_q(53) & WERTE3_q(53) & WERTE2_q(53) &
	 WERTE1_q(53) & WERTE0_q(53)) and sizeIt(to_std_logic(RTC_ADR_q =
	 "110101"),8) and sizeIt(UHR_DS,8)) or (std_logic_vector'(WERTE7_q(54)
	 & WERTE6_q(54) & WERTE5_q(54) & WERTE4_q(54) & WERTE3_q(54) &
	 WERTE2_q(54) & WERTE1_q(54) & WERTE0_q(54)) and
	 sizeIt(to_std_logic(RTC_ADR_q = "110110"),8) and sizeIt(UHR_DS,8)) or
	 (std_logic_vector'(WERTE7_q(55) & WERTE6_q(55) & WERTE5_q(55) &
	 WERTE4_q(55) & WERTE3_q(55) & WERTE2_q(55) & WERTE1_q(55) &
	 WERTE0_q(55)) and sizeIt(to_std_logic(RTC_ADR_q = "110111"),8) and
	 sizeIt(UHR_DS,8)) or (std_logic_vector'(WERTE7_q(56) & WERTE6_q(56) &
	 WERTE5_q(56) & WERTE4_q(56) & WERTE3_q(56) & WERTE2_q(56) &
	 WERTE1_q(56) & WERTE0_q(56)) and sizeIt(to_std_logic(RTC_ADR_q =
	 "111000"),8) and sizeIt(UHR_DS,8)) or (std_logic_vector'(WERTE7_q(57)
	 & WERTE6_q(57) & WERTE5_q(57) & WERTE4_q(57) & WERTE3_q(57) &
	 WERTE2_q(57) & WERTE1_q(57) & WERTE0_q(57)) and
	 sizeIt(to_std_logic(RTC_ADR_q = "111001"),8) and sizeIt(UHR_DS,8)) or
	 (std_logic_vector'(WERTE7_q(58) & WERTE6_q(58) & WERTE5_q(58) &
	 WERTE4_q(58) & WERTE3_q(58) & WERTE2_q(58) & WERTE1_q(58) &
	 WERTE0_q(58)) and sizeIt(to_std_logic(RTC_ADR_q = "111010"),8) and
	 sizeIt(UHR_DS,8)) or (std_logic_vector'(WERTE7_q(59) & WERTE6_q(59) &
	 WERTE5_q(59) & WERTE4_q(59) & WERTE3_q(59) & WERTE2_q(59) &
	 WERTE1_q(59) & WERTE0_q(59)) and sizeIt(to_std_logic(RTC_ADR_q =
	 "111011"),8) and sizeIt(UHR_DS,8)) or (std_logic_vector'(WERTE7_q(60)
	 & WERTE6_q(60) & WERTE5_q(60) & WERTE4_q(60) & WERTE3_q(60) &
	 WERTE2_q(60) & WERTE1_q(60) & WERTE0_q(60)) and
	 sizeIt(to_std_logic(RTC_ADR_q = "111100"),8) and sizeIt(UHR_DS,8)) or
	 (std_logic_vector'(WERTE7_q(61) & WERTE6_q(61) & WERTE5_q(61) &
	 WERTE4_q(61) & WERTE3_q(61) & WERTE2_q(61) & WERTE1_q(61) &
	 WERTE0_q(61)) and sizeIt(to_std_logic(RTC_ADR_q = "111101"),8) and
	 sizeIt(UHR_DS,8)) or (std_logic_vector'(WERTE7_q(62) & WERTE6_q(62) &
	 WERTE5_q(62) & WERTE4_q(62) & WERTE3_q(62) & WERTE2_q(62) &
	 WERTE1_q(62) & WERTE0_q(62)) and sizeIt(to_std_logic(RTC_ADR_q =
	 "111110"),8) and sizeIt(UHR_DS,8)) or (std_logic_vector'(WERTE7_q(63)
	 & WERTE6_q(63) & WERTE5_q(63) & WERTE4_q(63) & WERTE3_q(63) &
	 WERTE2_q(63) & WERTE1_q(63) & WERTE0_q(63)) and
	 sizeIt(to_std_logic(RTC_ADR_q = "111111"),8) and sizeIt(UHR_DS,8)) or
	 (std_logic_vector'("00" & RTC_ADR_q) and sizeIt(UHR_AS,8)) or
	 (sizeIt(INT_CTR_CS,8) and INT_CTR_q(23 DOWNTO 16)) or
	 (sizeIt(INT_ENA_CS,8) and INT_ENA_q(23 DOWNTO 16)) or
	 (sizeIt(INT_LATCH_CS,8) and INT_LATCH_q(23 DOWNTO 16)) or
	 (sizeIt(INT_CLEAR_CS,8) and INT_IN(23 DOWNTO 16)) or
	 (sizeIt(ACP_CONF_CS,8) and ACP_CONF_q(23 DOWNTO 16));
   u1_enabledt <= (UHR_DS or UHR_AS or INT_CTR_CS or INT_ENA_CS or INT_LATCH_CS
	 or INT_CLEAR_CS or ACP_CONF_CS) and (not nFB_OE);
   FB_AD(23 DOWNTO 16) <= u1_tridata;
   u2_data <= (sizeIt(INT_CTR_CS,8) and INT_CTR_q(15 DOWNTO 8)) or
	 (sizeIt(INT_ENA_CS,8) and INT_ENA_q(15 DOWNTO 8)) or
	 (sizeIt(INT_LATCH_CS,8) and INT_LATCH_q(15 DOWNTO 8)) or
	 (sizeIt(INT_CLEAR_CS,8) and INT_IN(15 DOWNTO 8)) or
	 (sizeIt(ACP_CONF_CS,8) and ACP_CONF_q(15 DOWNTO 8));
   u2_enabledt <= (INT_CTR_CS or INT_ENA_CS or INT_LATCH_CS or INT_CLEAR_CS or
	 ACP_CONF_CS) and (not nFB_OE);
   FB_AD(15 DOWNTO 8) <= u2_tridata;
   u3_data <= (sizeIt(INT_CTR_CS,8) and INT_CTR_q(7 DOWNTO 0)) or
	 (sizeIt(INT_ENA_CS,8) and INT_ENA_q(7 DOWNTO 0)) or
	 (sizeIt(INT_LATCH_CS,8) and INT_LATCH_q(7 DOWNTO 0)) or
	 (sizeIt(INT_CLEAR_CS,8) and INT_IN(7 DOWNTO 0)) or
	 (sizeIt(ACP_CONF_CS,8) and ACP_CONF_q(7 DOWNTO 0));
   u3_enabledt <= (INT_CTR_CS or INT_ENA_CS or INT_LATCH_CS or INT_CLEAR_CS or
	 ACP_CONF_CS) and (not nFB_OE);
   FB_AD(7 DOWNTO 0) <= u3_tridata;
   INT_HANDLER_TA <= int_ctr_cs or int_ena_cs or int_latch_cs or int_clear_cs;


-- Assignments added to explicitly combine the
-- effects of multiple drivers in the source
   UPDATE_ON <= UPDATE_ON_1 or UPDATE_ON_2;
   WERTE0_ena(0) <= WERTE0_0_ena_1 or WERTE0_0_ena_2;
   WERTE0_ena(2) <= WERTE0_2_ena_1 or WERTE0_2_ena_2;
   WERTE0_ena(4) <= WERTE0_4_ena_1 or WERTE0_4_ena_2;
   WERTE0_ena(6) <= WERTE0_6_ena_1 or WERTE0_6_ena_2;
   WERTE0_ena(7) <= WERTE0_7_ena_1 or WERTE0_7_ena_2;
   WERTE0_ena(8) <= WERTE0_8_ena_1 or WERTE0_8_ena_2;
   WERTE0_ena(9) <= WERTE0_9_ena_1 or WERTE0_9_ena_2;
   WERTE0_ena(13) <= WERTE0_13_ena_1 or WERTE0_13_ena_2;
   WERTE0_d(0) <= WERTE0_0_d_1 or WERTE0_0_d_2;
   WERTE0_d(2) <= WERTE0_2_d_1 or WERTE0_2_d_2;
   WERTE0_d(4) <= WERTE0_4_d_1 or WERTE0_4_d_2;
   WERTE0_d(6) <= WERTE0_6_d_1 or WERTE0_6_d_2;
   WERTE0_d(7) <= WERTE0_7_d_1 or WERTE0_7_d_2;
   WERTE0_d(8) <= WERTE0_8_d_1 or WERTE0_8_d_2;
   WERTE0_d(9) <= WERTE0_9_d_1 or WERTE0_9_d_2;
   WERTE0_d(11) <= WERTE0_11_d_1 or WERTE0_11_d_2;
   WERTE0_d(13) <= WERTE0_13_d_1 or WERTE0_13_d_2;
   WERTE1_ena(0) <= WERTE1_0_ena_1 or WERTE1_0_ena_2;
   WERTE1_ena(2) <= WERTE1_2_ena_1 or WERTE1_2_ena_2;
   WERTE1_ena(4) <= WERTE1_4_ena_1 or WERTE1_4_ena_2;
   WERTE1_ena(6) <= WERTE1_6_ena_1 or WERTE1_6_ena_2;
   WERTE1_ena(7) <= WERTE1_7_ena_1 or WERTE1_7_ena_2;
   WERTE1_ena(8) <= WERTE1_8_ena_1 or WERTE1_8_ena_2;
   WERTE1_ena(9) <= WERTE1_9_ena_1 or WERTE1_9_ena_2;
   WERTE1_d(0) <= WERTE1_0_d_1 or WERTE1_0_d_2;
   WERTE1_d(2) <= WERTE1_2_d_1 or WERTE1_2_d_2;
   WERTE1_d(4) <= WERTE1_4_d_1 or WERTE1_4_d_2;
   WERTE1_d(6) <= WERTE1_6_d_1 or WERTE1_6_d_2;
   WERTE1_d(7) <= WERTE1_7_d_1 or WERTE1_7_d_2;
   WERTE1_d(8) <= WERTE1_8_d_1 or WERTE1_8_d_2;
   WERTE1_d(9) <= WERTE1_9_d_1 or WERTE1_9_d_2;
   WERTE1_d(11) <= WERTE1_11_d_1 or WERTE1_11_d_2;
   WERTE2_ena(0) <= WERTE2_0_ena_1 or WERTE2_0_ena_2;
   WERTE2_ena(2) <= WERTE2_2_ena_1 or WERTE2_2_ena_2;
   WERTE2_ena(4) <= WERTE2_4_ena_1 or WERTE2_4_ena_2;
   WERTE2_ena(6) <= WERTE2_6_ena_1 or WERTE2_6_ena_2;
   WERTE2_ena(7) <= WERTE2_7_ena_1 or WERTE2_7_ena_2;
   WERTE2_ena(8) <= WERTE2_8_ena_1 or WERTE2_8_ena_2;
   WERTE2_ena(9) <= WERTE2_9_ena_1 or WERTE2_9_ena_2;
   WERTE2_d(0) <= WERTE2_0_d_1 or WERTE2_0_d_2;
   WERTE2_d(2) <= WERTE2_2_d_1 or WERTE2_2_d_2;
   WERTE2_d(4) <= WERTE2_4_d_1 or WERTE2_4_d_2;
   WERTE2_d(6) <= WERTE2_6_d_1 or WERTE2_6_d_2;
   WERTE2_d(7) <= WERTE2_7_d_1 or WERTE2_7_d_2;
   WERTE2_d(8) <= WERTE2_8_d_1 or WERTE2_8_d_2;
   WERTE2_d(9) <= WERTE2_9_d_1 or WERTE2_9_d_2;
   WERTE2_d(11) <= WERTE2_11_d_1 or WERTE2_11_d_2;
   WERTE3_ena(0) <= WERTE3_0_ena_1 or WERTE3_0_ena_2;
   WERTE3_ena(2) <= WERTE3_2_ena_1 or WERTE3_2_ena_2;
   WERTE3_ena(4) <= WERTE3_4_ena_1 or WERTE3_4_ena_2;
   WERTE3_ena(6) <= WERTE3_6_ena_1 or WERTE3_6_ena_2;
   WERTE3_ena(7) <= WERTE3_7_ena_1 or WERTE3_7_ena_2;
   WERTE3_ena(8) <= WERTE3_8_ena_1 or WERTE3_8_ena_2;
   WERTE3_ena(9) <= WERTE3_9_ena_1 or WERTE3_9_ena_2;
   WERTE3_d(0) <= WERTE3_0_d_1 or WERTE3_0_d_2;
   WERTE3_d(2) <= WERTE3_2_d_1 or WERTE3_2_d_2;
   WERTE3_d(4) <= WERTE3_4_d_1 or WERTE3_4_d_2;
   WERTE3_d(6) <= WERTE3_6_d_1 or WERTE3_6_d_2;
   WERTE3_d(7) <= WERTE3_7_d_1 or WERTE3_7_d_2;
   WERTE3_d(8) <= WERTE3_8_d_1 or WERTE3_8_d_2;
   WERTE3_d(9) <= WERTE3_9_d_1 or WERTE3_9_d_2;
   WERTE4_ena(0) <= WERTE4_0_ena_1 or WERTE4_0_ena_2;
   WERTE4_ena(2) <= WERTE4_2_ena_1 or WERTE4_2_ena_2;
   WERTE4_ena(4) <= WERTE4_4_ena_1 or WERTE4_4_ena_2;
   WERTE4_ena(6) <= WERTE4_6_ena_1 or WERTE4_6_ena_2;
   WERTE4_ena(7) <= WERTE4_7_ena_1 or WERTE4_7_ena_2;
   WERTE4_ena(8) <= WERTE4_8_ena_1 or WERTE4_8_ena_2;
   WERTE4_ena(9) <= WERTE4_9_ena_1 or WERTE4_9_ena_2;
   WERTE4_d(0) <= WERTE4_0_d_1 or WERTE4_0_d_2;
   WERTE4_d(2) <= WERTE4_2_d_1 or WERTE4_2_d_2;
   WERTE4_d(4) <= WERTE4_4_d_1 or WERTE4_4_d_2;
   WERTE4_d(6) <= WERTE4_6_d_1 or WERTE4_6_d_2;
   WERTE4_d(7) <= WERTE4_7_d_1 or WERTE4_7_d_2;
   WERTE4_d(8) <= WERTE4_8_d_1 or WERTE4_8_d_2;
   WERTE4_d(9) <= WERTE4_9_d_1 or WERTE4_9_d_2;
   WERTE5_ena(0) <= WERTE5_0_ena_1 or WERTE5_0_ena_2;
   WERTE5_ena(2) <= WERTE5_2_ena_1 or WERTE5_2_ena_2;
   WERTE5_ena(4) <= WERTE5_4_ena_1 or WERTE5_4_ena_2;
   WERTE5_ena(6) <= WERTE5_6_ena_1 or WERTE5_6_ena_2;
   WERTE5_ena(7) <= WERTE5_7_ena_1 or WERTE5_7_ena_2;
   WERTE5_ena(8) <= WERTE5_8_ena_1 or WERTE5_8_ena_2;
   WERTE5_ena(9) <= WERTE5_9_ena_1 or WERTE5_9_ena_2;
   WERTE5_d(0) <= WERTE5_0_d_1 or WERTE5_0_d_2;
   WERTE5_d(2) <= WERTE5_2_d_1 or WERTE5_2_d_2;
   WERTE5_d(4) <= WERTE5_4_d_1 or WERTE5_4_d_2;
   WERTE5_d(6) <= WERTE5_6_d_1 or WERTE5_6_d_2;
   WERTE5_d(7) <= WERTE5_7_d_1 or WERTE5_7_d_2;
   WERTE5_d(8) <= WERTE5_8_d_1 or WERTE5_8_d_2;
   WERTE5_d(9) <= WERTE5_9_d_1 or WERTE5_9_d_2;
   WERTE6_ena(0) <= WERTE6_0_ena_1 or WERTE6_0_ena_2;
   WERTE6_ena(2) <= WERTE6_2_ena_1 or WERTE6_2_ena_2;
   WERTE6_ena(4) <= WERTE6_4_ena_1 or WERTE6_4_ena_2;
   WERTE6_ena(6) <= WERTE6_6_ena_1 or WERTE6_6_ena_2;
   WERTE6_ena(7) <= WERTE6_7_ena_1 or WERTE6_7_ena_2;
   WERTE6_ena(8) <= WERTE6_8_ena_1 or WERTE6_8_ena_2;
   WERTE6_ena(9) <= WERTE6_9_ena_1 or WERTE6_9_ena_2;
   WERTE6_d(0) <= WERTE6_0_d_1 or WERTE6_0_d_2;
   WERTE6_d(2) <= WERTE6_2_d_1 or WERTE6_2_d_2;
   WERTE6_d(4) <= WERTE6_4_d_1 or WERTE6_4_d_2;
   WERTE6_d(6) <= WERTE6_6_d_1 or WERTE6_6_d_2;
   WERTE6_d(7) <= WERTE6_7_d_1 or WERTE6_7_d_2;
   WERTE6_d(8) <= WERTE6_8_d_1 or WERTE6_8_d_2;
   WERTE6_d(9) <= WERTE6_9_d_1 or WERTE6_9_d_2;
   WERTE7_ena(0) <= WERTE7_0_ena_1 or WERTE7_0_ena_2;
   WERTE7_ena(2) <= WERTE7_2_ena_1 or WERTE7_2_ena_2;
   WERTE7_ena(4) <= WERTE7_4_ena_1 or WERTE7_4_ena_2;
   WERTE7_ena(6) <= WERTE7_6_ena_1 or WERTE7_6_ena_2;
   WERTE7_ena(7) <= WERTE7_7_ena_1 or WERTE7_7_ena_2;
   WERTE7_ena(8) <= WERTE7_8_ena_1 or WERTE7_8_ena_2;
   WERTE7_ena(9) <= WERTE7_9_ena_1 or WERTE7_9_ena_2;
   WERTE7_d(0) <= WERTE7_0_d_1 or WERTE7_0_d_2;
   WERTE7_d(2) <= WERTE7_2_d_1 or WERTE7_2_d_2;
   WERTE7_d(4) <= WERTE7_4_d_1 or WERTE7_4_d_2;
   WERTE7_d(6) <= WERTE7_6_d_1 or WERTE7_6_d_2;
   WERTE7_d(7) <= WERTE7_7_d_1 or WERTE7_7_d_2;
   WERTE7_d(8) <= WERTE7_8_d_1 or WERTE7_8_d_2;
   WERTE7_d(9) <= WERTE7_9_d_1 or WERTE7_9_d_2;
   WERTE7_d(13) <= WERTE7_13_d_1 or WERTE7_13_d_2;

-- Define power SIGNAL(s)
   vcc <= '1';
   gnd <= '0';
END     ;
