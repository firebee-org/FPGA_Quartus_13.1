-- Xilinx XPort Language Converter, Version 4.1 (110)
-- 
-- AHDL Design Source: DDR_CTR.tdf
-- VHDL Design Output: DDR_CTR.vhd
-- Created 11-Jan-2016 06:52 PM
--
-- Copyright (c) 2016, Xilinx, Inc.  All Rights Reserved.
-- Xilinx Inc makes no warranty, expressed or implied, with respect to
-- the operation and/or functionality of the converted output files.
-- 

-- ddr_ctr


--  CREATED BY FREDI ASCHWANDEN
--  FIFO WATER MARK
--  {{ALTERA_PARAMETERS_BEGIN}} DO NOT REMOVE THIS LINE!
--  {{ALTERA_PARAMETERS_END}} DO NOT REMOVE THIS LINE!
LIBRARY ieee;
    USE ieee.std_logic_1164.all;
    USE ieee.std_logic_arith.all;
ENTITY ddr_ctr IS
    PORT
    (
        FB_ADR          : IN std_logic_vector(31 DOWNTO 0);
        nFB_CS1         : IN std_logic;
        nFB_CS2         : IN std_logic;
        nFB_CS3         : IN std_logic;
        nFB_OE          : IN std_logic;
        FB_SIZE0        : IN std_logic;
        FB_SIZE1        : IN std_logic;
        nRSTO           : IN std_logic;
        MAIN_CLK        : IN std_logic;
	    FB_ALE          : IN std_logic;
        nFB_WR          : IN std_logic;
        DDR_SYNC_66M    : IN std_logic;
        CLR_FIFO        : IN std_logic;
        VIDEO_RAM_CTR   : IN std_logic_vector(15 DOWNTO 0);
        BLITTER_ADR     : IN std_logic_vector(31 DOWNTO 0);
        BLITTER_SIG     : IN std_logic;
        BLITTER_WR      : IN std_logic;
        DDRCLK0         : IN std_logic;
        CLK33M          : IN std_logic;
        FIFO_MW         : IN std_logic_vector(8 DOWNTO 0);
        VA              : BUFFER std_logic_vector(12 DOWNTO 0);
        nVWE            : BUFFER std_logic;
        nVRAS           : BUFFER std_logic;
        nVCS            : BUFFER std_logic;
        VCKE            : BUFFER std_logic;
        nVCAS           : BUFFER std_logic;
        FB_LE           : BUFFER std_logic_vector(3 DOWNTO 0);
        FB_VDOE         : BUFFER std_logic_vector(3 DOWNTO 0);
        SR_FIFO_WRE     : BUFFER std_logic;
        SR_DDR_FB       : BUFFER std_logic;
        SR_DDR_WR       : BUFFER std_logic;
        SR_DDRWR_D_SEL  : BUFFER std_logic;
        SR_VDMP         : BUFFER std_logic_vector(7 DOWNTO 0);
        VIDEO_DDR_TA    : BUFFER std_logic;
        SR_BLITTER_DACK : BUFFER std_logic;
        BA              : BUFFER std_logic_vector(1 DOWNTO 0);
        DDRWR_D_SEL1    : BUFFER std_logic;
        VDM_SEL         : BUFFER std_logic_vector(3 DOWNTO 0);
        FB_AD           : INOUT std_logic_vector(31 DOWNTO 0)
   );
END ddr_ctr;


ARCHITECTURE rtl OF ddr_ctr IS
    --  START (NORMAL 8 CYCLES TOTAL = 60ns)
    --  CONFIG
    --  READ CPU UND BLITTER,
    --  WRITE CPU UND BLITTER
    --  READ FIFO
    --  CLOSE FIFO BANK
    --  REFRESH 10X7.5NfS=75NS
    SIGNAL FB_REGDDR_3                  : std_logic_vector(2 DOWNTO 0);
    SIGNAL FB_REGDDR_d                  : std_logic_vector(2 DOWNTO 0);
    SIGNAL FB_REGDDR_q                  : std_logic_vector(2 DOWNTO 0);
    SIGNAL DDR_SM_6                     : std_logic_vector(5 DOWNTO 0);
    SIGNAL DDR_SM_d                     : std_logic_vector(5 DOWNTO 0);
    SIGNAL DDR_SM_q                     : std_logic_vector(5 DOWNTO 0);
    SIGNAL FB_B                         : std_logic_vector(3 DOWNTO 0);
    SIGNAL VA_P                         : std_logic_vector(12 DOWNTO 0);
    SIGNAL VA_P_d                       : std_logic_vector(12 DOWNTO 0);
    SIGNAL VA_P_q                       : std_logic_vector(12 DOWNTO 0);
    SIGNAL BA_P                         : std_logic_vector(1 DOWNTO 0);
    SIGNAL BA_P_d                       : std_logic_vector(1 DOWNTO 0);
    SIGNAL BA_P_q                       : std_logic_vector(1 DOWNTO 0);
    SIGNAL VA_S                         : std_logic_vector(12 DOWNTO 0);
    SIGNAL VA_S_d                       : std_logic_vector(12 DOWNTO 0);
    SIGNAL VA_S_q                       : std_logic_vector(12 DOWNTO 0);
    SIGNAL BA_S                         : std_logic_vector(1 DOWNTO 0);
    SIGNAL BA_S_d                       : std_logic_vector(1 DOWNTO 0);
    SIGNAL BA_S_q                       : std_logic_vector(1 DOWNTO 0);
    SIGNAL MCS                          : std_logic_vector(1 DOWNTO 0);
    SIGNAL MCS_d                        : std_logic_vector(1 DOWNTO 0);
    SIGNAL MCS_q                        : std_logic_vector(1 DOWNTO 0);
    SIGNAL SR_VDMP_d                    : std_logic_vector(7 DOWNTO 0);
    SIGNAL SR_VDMP_q                    : std_logic_vector(7 DOWNTO 0);
    SIGNAL CPU_ROW_ADR                  : std_logic_vector(12 DOWNTO 0);
    SIGNAL CPU_BA                       : std_logic_vector(1 DOWNTO 0);
    SIGNAL CPU_COL_ADR                  : std_logic_vector(9 DOWNTO 0);
    SIGNAL BLITTER_ROW_ADR              : std_logic_vector(12 DOWNTO 0);
    SIGNAL BLITTER_BA                   : std_logic_vector(1 DOWNTO 0);
    SIGNAL BLITTER_COL_ADR              : std_logic_vector(9 DOWNTO 0);
    SIGNAL FIFO_ROW_ADR                 : std_logic_vector(12 DOWNTO 0);
    SIGNAL FIFO_BA                      : std_logic_vector(1 DOWNTO 0);
    SIGNAL FIFO_COL_ADR                 : std_logic_vector(9 DOWNTO 0);
    SIGNAL DDR_REFRESH_CNT              : std_logic_vector(10 DOWNTO 0);
    SIGNAL DDR_REFRESH_CNT_d            : std_logic_vector(10 DOWNTO 0);
    SIGNAL DDR_REFRESH_CNT_q            : std_logic_vector(10 DOWNTO 0);
    SIGNAL DDR_REFRESH_SIG              : std_logic_vector(3 DOWNTO 0);
    SIGNAL DDR_REFRESH_SIG_d            : std_logic_vector(3 DOWNTO 0);
    SIGNAL DDR_REFRESH_SIG_q            : std_logic_vector(3 DOWNTO 0);
    SIGNAL VIDEO_BASE_L_D               : std_logic_vector(7 DOWNTO 0);
    SIGNAL VIDEO_BASE_L_D_d             : std_logic_vector(7 DOWNTO 0);
    SIGNAL VIDEO_BASE_L_D_q             : std_logic_vector(7 DOWNTO 0);
    SIGNAL VIDEO_BASE_M_D               : std_logic_vector(7 DOWNTO 0);
    SIGNAL VIDEO_BASE_M_D_d             : std_logic_vector(7 DOWNTO 0);
    SIGNAL VIDEO_BASE_M_D_q             : std_logic_vector(7 DOWNTO 0);
    SIGNAL VIDEO_BASE_H_D               : std_logic_vector(7 DOWNTO 0);
    SIGNAL VIDEO_BASE_H_D_d             : std_logic_vector(7 DOWNTO 0);
    SIGNAL VIDEO_BASE_H_D_q             : std_logic_vector(7 DOWNTO 0);
    SIGNAL VIDEO_BASE_X_D               : std_logic_vector(2 DOWNTO 0);
    SIGNAL VIDEO_BASE_X_D_d             : std_logic_vector(2 DOWNTO 0);
    SIGNAL VIDEO_BASE_X_D_q             : std_logic_vector(2 DOWNTO 0);
    SIGNAL VIDEO_ADR_CNT                : std_logic_vector(22 DOWNTO 0);
    SIGNAL VIDEO_ADR_CNT_d              : std_logic_vector(22 DOWNTO 0);
    SIGNAL VIDEO_ADR_CNT_q              : std_logic_vector(22 DOWNTO 0);
    SIGNAL VIDEO_BASE_ADR               : std_logic_vector(22 DOWNTO 0);
    SIGNAL VIDEO_ACT_ADR                : std_logic_vector(26 DOWNTO 0);
    SIGNAL u0_data                      : std_logic_vector(7 DOWNTO 0);
    SIGNAL u0_tridata                   : std_logic_vector(7 DOWNTO 0);
    SIGNAL FB_REGDDR_0_clk_ctrl         : std_logic;
    SIGNAL SR_VDMP0_clk_ctrl            : std_logic;
    SIGNAL MCS0_clk_ctrl                : std_logic;
	SIGNAL VA_S0_clk_ctrl               : std_logic;
    SIGNAL BA_S0_clk_ctrl               : std_logic;
    SIGNAL VA_P0_clk_ctrl               : std_logic;
    SIGNAL BA_P0_clk_ctrl               : std_logic;
	SIGNAL DDR_SM_0_clk_ctrl            : std_logic;
    SIGNAL VIDEO_ADR_CNT0_clk_ctrl      : std_logic;
    SIGNAL VIDEO_ADR_CNT0_ena_ctrl      : std_logic;
	SIGNAL DDR_REFRESH_CNT0_clk_ctrl    : std_logic;
    SIGNAL DDR_REFRESH_SIG0_clk_ctrl    : std_logic;
	SIGNAL DDR_REFRESH_SIG0_ena_ctrl    : std_logic;
    SIGNAL VIDEO_BASE_L_D0_clk_ctrl     : std_logic;
	SIGNAL VIDEO_BASE_L_D0_ena_ctrl     : std_logic;
    SIGNAL VIDEO_BASE_M_D0_clk_ctrl     : std_logic;
	SIGNAL VIDEO_BASE_M_D0_ena_ctrl     : std_logic;
    SIGNAL VIDEO_BASE_H_D0_clk_ctrl     : std_logic;
	SIGNAL VIDEO_BASE_H_D0_ena_ctrl     : std_logic;
    SIGNAL VIDEO_BASE_X_D0_clk_ctrl     : std_logic;
    SIGNAL VIDEO_BASE_X_D0_ena_ctrl     : std_logic;
    SIGNAL VA12_2                       : std_logic;
    SIGNAL VA12_1                       : std_logic;
    SIGNAL VA11_2                       : std_logic;
    SIGNAL VA11_1                       : std_logic;
    SIGNAL VA10_2                       : std_logic;
	SIGNAL VA10_1                       : std_logic;
    SIGNAL VA9_2                        : std_logic;
    SIGNAL VA9_1                        : std_logic;
    SIGNAL VA8_2                        : std_logic;
    SIGNAL VA8_1                        : std_logic;
    SIGNAL VA7_2                        : std_logic;
    SIGNAL VA7_1                        : std_logic;
    SIGNAL VA6_2                        : std_logic;
    SIGNAL VA6_1                        : std_logic;
    SIGNAL VA5_2                        : std_logic;
	SIGNAL VA5_1                        : std_logic;
    SIGNAL VA4_2                        : std_logic;
    SIGNAL VA4_1                        : std_logic;
    SIGNAL VA3_2                        : std_logic;
    SIGNAL VA3_1                        : std_logic;
    SIGNAL VA2_2                        : std_logic;
    SIGNAL VA2_1                        : std_logic;
    SIGNAL VA1_2                        : std_logic;
    SIGNAL VA1_1                        : std_logic;
    SIGNAL VA0_2                        : std_logic;
    SIGNAL VA0_1                        : std_logic;
    SIGNAL BA1_2                        : std_logic;
    SIGNAL BA1_1                        : std_logic;
    SIGNAL BA0_2                        : std_logic;
    SIGNAL BA0_1                        : std_logic;
    SIGNAL BUS_CYC_d_2                  : std_logic;
    SIGNAL BUS_CYC_d_1                  : std_logic;
	SIGNAL FIFO_BANK_OK_d_2             : std_logic;
    SIGNAL FIFO_BANK_OK_d_1             : std_logic;
    SIGNAL u0_enabledt                  : std_logic;
    SiGNAL gnd                          : std_logic;
    SIGNAL vcc                          : std_logic;
	SIGNAL VIDEO_CNT_H                  : std_logic;
    SIGNAL VIDEO_CNT_M                  : std_logic;
    SIGNAL VIDEO_CNT_L                  : std_logic;
    SIGNAL VIDEO_BASE_H                 : std_logic;
    SIGNAL VIDEO_BASE_M                 : std_logic;
    SIGNAL VIDEO_BASE_L                 : std_logic;
    SIGNAL REFRESH_TIME_q               : std_logic;
    SIGNAL REFRESH_TIME_clk             : std_logic;
    SIGNAL REFRESH_TIME_d               : std_logic;
	SIGNAL REFRESH_TIME                 : std_logic;
    SIGNAL DDR_REFRESH_REQ_q            : std_logic;
    SIGNAL DDR_REFRESH_REQ_clk          : std_logic;
	SIGNAL DDR_REFRESH_REQ_d            : std_logic;
    SIGNAL DDR_REFRESH_REQ              : std_logic;
    SIGNAL DDR_REFRESH_ON               : std_logic;
    SIGNAL FIFO_BANK_NOT_OK             : std_logic;
	SIGNAL FIFO_BANK_OK_q               : std_logic;
    SIGNAL FIFO_BANK_OK_clk             : std_logic;
    SIGNAL FIFO_BANK_OK_d               : std_logic;
    SIGNAL FIFO_BANK_OK                 : std_logic;
	SiGNAL SR_FIFO_WRE_q                : std_logic;
    SIGNAL SR_FIFO_WRE_clk              : std_logic;
    SIGNAL SR_FIFO_WRE_d                : std_logic;
    SIGNAL STOP_q                       : std_logic;
    SIGNAL STOP_clk                     : std_logic;
	SIGNAL STOP_d                       : std_logic;
    SIGNAL STOP                         : std_logic;
    SIGNAL CLEAR_FIFO_CNT_q             : std_logic;
    SIGNAL CLEAR_FIFO_CNT_clk           : std_logic;
    SIGNAL CLEAR_FIFO_CNT_d             : std_logic;
    SIGNAL CLEAR_FIFO_CNT               : std_logic;
    SIGNAL CLR_FIFO_SYNC_q              : std_logic;
    SIGNAL CLR_FIFO_SYNC_clk            : std_logic;
    SIGNAL CLR_FIFO_SYNC_d              : std_logic;
	SIGNAL CLR_FIFO_SYNC                : std_logic;
    SIGNAL FIFO_ACTIVE                  : std_logic;
    SIGNAL FIFO_AC_q                    : std_logic;
    SIGNAL FIFO_AC_clk                  : std_logic;
    SIGNAL FIFO_AC_d                    : std_logic;
	SIGNAL FIFO_AC                      : std_logic;
    SIGNAL FIFO_REQ_q                   : std_logic;
    SIGNAL FIFO_REQ_clk                 : std_logic;
    SIGNAL FIFO_REQ_d                   : std_logic;
    SIGNAL FIFO_REQ                     : std_logic;
    SIGNAL BLITTER_AC_q                 : std_logic;
    SIGNAL BLITTER_AC_clk               : std_logic;
    SIGNAL BLITTER_AC_d                 : std_logic;
    SIGNAL BLITTER_AC                   : std_logic;
    SIGNAL BLITTER_REQ_q                : std_logic;
	SIGNAL BLITTER_REQ_clk              : std_logic;
    SIGNAL BLITTER_REQ_d                : std_logic;
    SIGNAL BLITTER_REQ                  : std_logic;
    SIGNAL BUS_CYC_END                  : std_logic;
    SIGNAL BUS_CYC_q                    : std_logic;
    SIGNAL BUS_CYC_clk                  : std_logic;
    SIGNAL BUS_CYC_d                    : std_logic;
    SIGNAL BUS_CYC                      : std_logic;
    SIGNAL CPU_AC_q                     : std_logic;
    SIGNAL CPU_AC_clk                   : std_logic;
    SIGNAL CPU_AC_d                     : std_logic;
	SIGNAL CPU_AC                       : std_logic;
    SIGNAL CPU_REQ_q                    : std_logic;
    SIGNAL CPU_REQ_clk                  : std_logic;
    SIGNAL CPU_REQ_d                    : std_logic;
    SIGNAL CPU_REQ                      : std_logic;
    SIGNAL CPU_SIG                      : std_logic;
    SIGNAL SR_DDRWR_D_SEL_q             : std_logic;
    SIGNAL SR_DDRWR_D_SEL_clk           : std_logic;
    SIGNAL SR_DDRWR_D_SEL_d             : std_logic;
    SIGNAL SR_DDR_WR_q                  : std_logic;
	SIGNAL SR_DDR_WR_clk                : std_logic;
    SIGNAL SR_DDR_WR_d                  : std_logic;
    SIGNAL DDR_CONFIG                   : std_logic;
    SIGNAL DDR_CS_q                     : std_logic;
    SIGNAL DDR_CS_ena                   : std_logic;
	SIGNAL DDR_CS_clk                   : std_logic;
    SIGNAL DDR_CS_d                     : std_logic;
    SIGNAL DDR_CS                       : std_logic;
    SIGNAL DDR_SEL                      : std_logic;
    SIGNAL CPU_DDR_SYNC_q               : std_logic;
	SIGNAL CPU_DDR_SYNC_clk             : std_logic;
    SIGNAL CPU_DDR_SYNC_d               : std_logic;
    SIGNAL CPU_DDR_SYNC                 : std_logic;
    SIGNAL VWE                          : std_logic;
    SIGNAL VRAS                         : std_logic;
    SIGNAL VCAS                         : std_logic;
    SIGNAL LINE                         : std_logic;

-- Sub Module Interface Section


    COMPONENT lpm_bustri_BYT
        PORT
        (
            data        : IN std_logic_vector(7 DOWNTO 0);
            enabledt    : IN std_logic;
            tridata     : BUFFER std_logic_vector(7 DOWNTO 0)
        );
    END COMPONENT lpm_bustri_BYT;

    FUNCTION to_std_logic(X : IN boolean) RETURN std_logic IS
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
    FUNCTION sizeit(a: std_logic; len: integer) RETURN std_logic_vector IS
        VARIABLE rep: std_logic_vector(len - 1 DOWNTO 0);
    BEGIN
        FOR i IN rep'RANGE LOOP
            rep(i) := a;
        END LOOP;
        RETURN rep;
    END sizeIt;

BEGIN

    -- Sub Module Section
    u0: lpm_bustri_BYT
        port map
        (
            data=>u0_data,
            enabledt=>u0_enabledt,
            tridata=>u0_tridata
        );

    -- Register Section

    SR_FIFO_WRE <= SR_FIFO_WRE_q;
    PROCESS (SR_FIFO_WRE_clk)
    BEGIN
        IF SR_FIFO_WRE_clk'event and SR_FIFO_WRE_clk='1' THEN
            SR_FIFO_WRE_q <= SR_FIFO_WRE_d;
        END IF;
    END PROCESS;

    SR_DDR_WR <= SR_DDR_WR_q;
    PROCESS (SR_DDR_WR_clk)
    BEGIN
        IF SR_DDR_WR_clk'event and SR_DDR_WR_clk='1' THEN
            SR_DDR_WR_q <= SR_DDR_WR_d;
        END IF;
    END PROCESS;

    SR_DDRWR_D_SEL <= SR_DDRWR_D_SEL_q;
    PROCESS (SR_DDRWR_D_SEL_clk)
    BEGIN
        IF SR_DDRWR_D_SEL_clk'event and SR_DDRWR_D_SEL_clk='1' THEN
            SR_DDRWR_D_SEL_q <= SR_DDRWR_D_SEL_d;
        END IF;
    END PROCESS;

    SR_VDMP <= SR_VDMP_q;
    PROCESS (SR_VDMP0_clk_ctrl)
    BEGIN
        IF SR_VDMP0_clk_ctrl'event and SR_VDMP0_clk_ctrl='1' THEN
            SR_VDMP_q <= SR_VDMP_d;
        END IF;
    END PROCESS;

    PROCESS (FB_REGDDR_0_clk_ctrl)
    BEGIN
        IF FB_REGDDR_0_clk_ctrl'event and FB_REGDDR_0_clk_ctrl='1' THEN
            FB_REGDDR_q <= FB_REGDDR_d;
        END IF;
    END PROCESS;

    PROCESS (DDR_SM_0_clk_ctrl)
    BEGIN
        IF DDR_SM_0_clk_ctrl'event and DDR_SM_0_clk_ctrl='1' THEN
            DDR_SM_q <= DDR_SM_d;
        END IF;
    END PROCESS;

    PROCESS (VA_P0_clk_ctrl)
    BEGIN
        IF VA_P0_clk_ctrl'event and VA_P0_clk_ctrl='1' THEN
            VA_P_q <= VA_P_d;
        END IF;
    END PROCESS;

    PROCESS (BA_P0_clk_ctrl)
    BEGIN
        IF BA_P0_clk_ctrl'event and BA_P0_clk_ctrl='1' THEN
            BA_P_q <= BA_P_d;
        END IF;
    END PROCESS;

    PROCESS (VA_S0_clk_ctrl)
    BEGIN
        IF VA_S0_clk_ctrl'event and VA_S0_clk_ctrl='1' THEN
            VA_S_q <= VA_S_d;
        END IF;
    END PROCESS;

    PROCESS (BA_S0_clk_ctrl)
    BEGIN
        IF BA_S0_clk_ctrl'event and BA_S0_clk_ctrl='1' THEN
            BA_S_q <= BA_S_d;
        END IF;
    END PROCESS;

    PROCESS (MCS0_clk_ctrl)
    BEGIN
        IF MCS0_clk_ctrl'event and MCS0_clk_ctrl='1' THEN
            MCS_q <= MCS_d;
        END IF;
    END PROCESS;

    PROCESS (CPU_DDR_SYNC_clk)
    BEGIN
        IF CPU_DDR_SYNC_clk'event and CPU_DDR_SYNC_clk='1' THEN
            CPU_DDR_SYNC_q <= CPU_DDR_SYNC_d;
        END IF;
    END PROCESS;

    PROCESS (DDR_CS_clk)
    BEGIN
        IF DDR_CS_clk'event and DDR_CS_clk='1' THEN
            IF DDR_CS_ena='1' THEN
                DDR_CS_q <= DDR_CS_d;
            END IF;
        END IF;
    END PROCESS;

    PROCESS (CPU_REQ_clk)
    BEGIN
        IF CPU_REQ_clk'event and CPU_REQ_clk='1' THEN
            CPU_REQ_q <= CPU_REQ_d;
        END IF;
    END PROCESS;

    PROCESS (CPU_AC_clk)
    BEGIN
        IF CPU_AC_clk'event and CPU_AC_clk='1' THEN
            CPU_AC_q <= CPU_AC_d;
        END IF;
    END PROCESS;

    PROCESS (BUS_CYC_clk)
    BEGIN
        IF BUS_CYC_clk'event and BUS_CYC_clk='1' THEN
            BUS_CYC_q <= BUS_CYC_d;
        END IF;
    END PROCESS;

    PROCESS (BLITTER_REQ_clk)
    BEGIN
        IF BLITTER_REQ_clk'event and BLITTER_REQ_clk='1' THEN
            BLITTER_REQ_q <= BLITTER_REQ_d;
        END IF;
    END PROCESS;

    PROCESS (BLITTER_AC_clk)
    BEGIN
        IF BLITTER_AC_clk'event and BLITTER_AC_clk='1' THEN
            BLITTER_AC_q <= BLITTER_AC_d;
        END IF;
    END PROCESS;

    PROCESS (FIFO_REQ_clk)
    BEGIN
        IF FIFO_REQ_clk'event and FIFO_REQ_clk='1' THEN
            FIFO_REQ_q <= FIFO_REQ_d;
        END IF;
    END PROCESS;

    PROCESS (FIFO_AC_clk)
    BEGIN
        IF FIFO_AC_clk'event and FIFO_AC_clk='1' THEN
            FIFO_AC_q <= FIFO_AC_d;
        END IF;
    END PROCESS;

    PROCESS (CLR_FIFO_SYNC_clk)
    BEGIN
        IF CLR_FIFO_SYNC_clk'event and CLR_FIFO_SYNC_clk='1' THEN
            CLR_FIFO_SYNC_q <= CLR_FIFO_SYNC_d;
        END IF;
    END PROCESS;

    PROCESS (CLEAR_FIFO_CNT_clk)
    BEGIN
        IF CLEAR_FIFO_CNT_clk'event and CLEAR_FIFO_CNT_clk='1' THEN
            CLEAR_FIFO_CNT_q <= CLEAR_FIFO_CNT_d;
        END IF;
    END PROCESS;

    PROCESS (STOP_clk)
    BEGIN
        IF STOP_clk'event and STOP_clk='1' THEN
            STOP_q <= STOP_d;
        END IF;
    END PROCESS;

    PROCESS (FIFO_BANK_OK_clk)
    BEGIN
        IF FIFO_BANK_OK_clk'event and FIFO_BANK_OK_clk='1' THEN
            FIFO_BANK_OK_q <= FIFO_BANK_OK_d;
        END IF;
    END PROCESS;

    PROCESS (DDR_REFRESH_CNT0_clk_ctrl)
    BEGIN
        IF DDR_REFRESH_CNT0_clk_ctrl'event and DDR_REFRESH_CNT0_clk_ctrl='1' THEN
            DDR_REFRESH_CNT_q <= DDR_REFRESH_CNT_d;
        END IF;
    END PROCESS;

    PROCESS (DDR_REFRESH_REQ_clk)
    BEGIN
        IF DDR_REFRESH_REQ_clk'event and DDR_REFRESH_REQ_clk='1' THEN
            DDR_REFRESH_REQ_q <= DDR_REFRESH_REQ_d;
        END IF;
    END PROCESS;

    PROCESS (DDR_REFRESH_SIG0_clk_ctrl)
    BEGIN
        IF DDR_REFRESH_SIG0_clk_ctrl'event and DDR_REFRESH_SIG0_clk_ctrl='1' THEN
            IF DDR_REFRESH_SIG0_ena_ctrl='1' THEN
                DDR_REFRESH_SIG_q <= DDR_REFRESH_SIG_d;
            END IF;
        END IF;
    END PROCESS;

   PROCESS (REFRESH_TIME_clk) BEGIN
      IF REFRESH_TIME_clk'event and REFRESH_TIME_clk='1' THEN
	 REFRESH_TIME_q <= REFRESH_TIME_d;
      END IF;
   END PROCESS;

   PROCESS (VIDEO_BASE_L_D0_clk_ctrl) BEGIN
      IF VIDEO_BASE_L_D0_clk_ctrl'event and VIDEO_BASE_L_D0_clk_ctrl='1' THEN
	 IF VIDEO_BASE_L_D0_ena_ctrl='1' THEN
	    VIDEO_BASE_L_D_q <= VIDEO_BASE_L_D_d;
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (VIDEO_BASE_M_D0_clk_ctrl) BEGIN
      IF VIDEO_BASE_M_D0_clk_ctrl'event and VIDEO_BASE_M_D0_clk_ctrl='1' THEN
	 IF VIDEO_BASE_M_D0_ena_ctrl='1' THEN
	    VIDEO_BASE_M_D_q <= VIDEO_BASE_M_D_d;
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (VIDEO_BASE_H_D0_clk_ctrl) BEGIN
      IF VIDEO_BASE_H_D0_clk_ctrl'event and VIDEO_BASE_H_D0_clk_ctrl='1' THEN
	 IF VIDEO_BASE_H_D0_ena_ctrl='1' THEN
	    VIDEO_BASE_H_D_q <= VIDEO_BASE_H_D_d;
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (VIDEO_BASE_X_D0_clk_ctrl) BEGIN
      IF VIDEO_BASE_X_D0_clk_ctrl'event and VIDEO_BASE_X_D0_clk_ctrl='1' THEN
	 IF VIDEO_BASE_X_D0_ena_ctrl='1' THEN
	    VIDEO_BASE_X_D_q <= VIDEO_BASE_X_D_d;
	 END IF;
      END IF;
   END PROCESS;

   PROCESS (VIDEO_ADR_CNT0_clk_ctrl) BEGIN
      IF VIDEO_ADR_CNT0_clk_ctrl'event and VIDEO_ADR_CNT0_clk_ctrl='1' THEN
	 IF VIDEO_ADR_CNT0_ena_ctrl='1' THEN
	    VIDEO_ADR_CNT_q <= VIDEO_ADR_CNT_d;
	 END IF;
      END IF;
   END PROCESS;

-- Start of original equations
   LINE <= FB_SIZE0 and FB_SIZE1;

--  BYT SELECT
--  ADR==0
--  LONG UND LINE
   FB_B(0) <= to_std_logic(FB_ADR(1 DOWNTO 0) = "00") or (FB_SIZE1 and
	 FB_SIZE0) or ((not FB_SIZE1) and (not FB_SIZE0));

--  ADR==1
--  HIGH WORD
--  LONG UND LINE
   FB_B(1) <= to_std_logic(FB_ADR(1 DOWNTO 0) = "01") or (FB_SIZE1 and (not
	 FB_SIZE0) and (not FB_ADR(1))) or (FB_SIZE1 and FB_SIZE0) or ((not
	 FB_SIZE1) and (not FB_SIZE0));

--  ADR==2
--  LONG UND LINE
   FB_B(2) <= to_std_logic(FB_ADR(1 DOWNTO 0) = "10") or (FB_SIZE1 and
	 FB_SIZE0) or ((not FB_SIZE1) and (not FB_SIZE0));

--  ADR==3
--  LOW WORD
--  LONG UND LINE
   FB_B(3) <= to_std_logic(FB_ADR(1 DOWNTO 0) = "11") or (FB_SIZE1 and (not
	 FB_SIZE0) and FB_ADR(1)) or (FB_SIZE1 and FB_SIZE0) or ((not FB_SIZE1)
	 and (not FB_SIZE0));

--  CPU READ (REG DDR => CPU) AND WRITE (CPU => REG DDR)  --------------------------------------------------
   FB_REGDDR_0_clk_ctrl <= MAIN_CLK;


    PROCESS (FB_REGDDR_q, DDR_SEL, BUS_CYC_q, LINE, DDR_CS_q, nFB_OE, MAIN_CLK, DDR_CONFIG, nFB_WR, vcc)
        VARIABLE stdVec3: std_logic_vector(2 DOWNTO 0);
    BEGIN
        FB_REGDDR_d <= FB_REGDDR_q;
        (FB_VDOE(0), FB_VDOE(1)) <= std_logic_vector'("00");
        (FB_LE(0), FB_LE(1), FB_VDOE(2), FB_LE(2), FB_VDOE(3), FB_LE(3),
        VIDEO_DDR_TA, BUS_CYC_END) <= std_logic_vector'("00000000");
        stdVec3 := FB_REGDDR_q;
        CASE stdVec3 IS
            WHEN "000" =>
                FB_LE(0) <= not nFB_WR;
                --  LOS WENN BEREIT ODER IMMER BEI LINE WRITE
                IF (BUS_CYC_q or (DDR_SEL and LINE and (not nFB_WR)))='1' THEN
                    FB_REGDDR_d <= "001";
                ELSE
                    FB_REGDDR_d <= "000";
                END IF;
            
            WHEN "001" =>
                IF (DDR_CS_q)='1' THEN
                    FB_LE(0) <= not nFB_WR;
                    VIDEO_DDR_TA <= vcc;
                    IF (LINE)='1' THEN
                        FB_VDOE(0) <= (not nFB_OE) and (not DDR_CONFIG);
                        FB_REGDDR_d <= "010";
                    ELSE
                        BUS_CYC_END <= vcc;
                        FB_VDOE(0) <= (not nFB_OE) and (not MAIN_CLK) and (not DDR_CONFIG);
                        FB_REGDDR_d <= "000";
                    END IF;
                ELSE
                    FB_REGDDR_d <= "000";
                END IF;
            
            WHEN "010" =>
                IF (DDR_CS_q)='1' THEN
                    FB_VDOE(1) <= (not nFB_OE) and (not DDR_CONFIG);
                    FB_LE(1) <= not nFB_WR;
                    VIDEO_DDR_TA <= vcc;
                    FB_REGDDR_d <= "011";
                ELSE
                    FB_REGDDR_d <= "000";
                END IF;
            
            WHEN "011" =>
                IF (DDR_CS_q)='1' THEN
                    FB_VDOE(2) <= (not nFB_OE) and (not DDR_CONFIG);
                    FB_LE(2) <= not nFB_WR;

                    --  BEI LINE WRITE EVT. WARTEN
                    IF ((not BUS_CYC_q) and LINE and (not nFB_WR))='1' THEN
                        FB_REGDDR_d <= "011";
                    ELSE
                        VIDEO_DDR_TA <= vcc;
                        FB_REGDDR_d <= "100";
                    END IF;
                ELSE
                    FB_REGDDR_d <= "000";
                END IF;
    
            WHEN "100" =>
                IF (DDR_CS_q)='1' THEN
                    FB_VDOE(3) <= (not nFB_OE) and (not MAIN_CLK) and (not DDR_CONFIG);
                    FB_LE(3) <= not nFB_WR;
                    VIDEO_DDR_TA <= vcc;
                    BUS_CYC_END <= vcc;
                    FB_REGDDR_d <= "000";
                ELSE
                    FB_REGDDR_d <= "000";
                END IF;
            
            WHEN others =>
        END CASE;
        stdVec3 := (others=>'0');  -- no storage needed
    END PROCESS;

    --  DDR STEUERUNG -----------------------------------------------------
    --  VIDEO RAM CONTROL REGISTER (IST IN VIDEO_MUX_CTR) $F0000400: BIT 0: VCKE; 1: !nVCS ;2:REFRESH ON , (0=FIFO UND CNT CLEAR); 3: CONFIG; 8: FIFO_ACTIVE;
    VCKE <= VIDEO_RAM_CTR(0);
    nVCS <= not VIDEO_RAM_CTR(1);
    DDR_REFRESH_ON <= VIDEO_RAM_CTR(2);
    DDR_CONFIG <= VIDEO_RAM_CTR(3);
    FIFO_ACTIVE <= VIDEO_RAM_CTR(8);

    -- ------------------------------
    CPU_ROW_ADR <= FB_ADR(26 DOWNTO 14);
    CPU_BA <= FB_ADR(13 DOWNTO 12);
    CPU_COL_ADR <= FB_ADR(11 DOWNTO 2);
    nVRAS <= not VRAS;
    nVCAS <= not VCAS;
    nVWE <= not VWE;
    SR_DDR_WR_clk <= DDRCLK0;
    SR_DDRWR_D_SEL_clk <= DDRCLK0;
    SR_VDMP0_clk_ctrl <= DDRCLK0;
    SR_FIFO_WRE_clk <= DDRCLK0;
    CPU_AC_clk <= DDRCLK0;
    FIFO_AC_clk <= DDRCLK0;
    BLITTER_AC_clk <= DDRCLK0;
    DDRWR_D_SEL1 <= BLITTER_AC_q;

    --  SELECT LOGIC
    DDR_SEL <= to_std_logic(FB_ALE='1' and FB_AD(31 DOWNTO 30) = "01");
    DDR_CS_clk <= MAIN_CLK;
    DDR_CS_ena <= FB_ALE;
    DDR_CS_d <= DDR_SEL;

    --  WENN READ ODER WRITE B,W,L DDR SOFORT ANFORDERN, BEI WRITE LINE SPÄTER
    --  NICHT LINE ODER READ SOFORT LOS WENN NICHT CONFIG
    --  CONFIG SOFORT LOS
    --  LINE WRITE SPÄTER
    CPU_SIG <= (DDR_SEL and (nFB_WR or (not LINE)) and (not DDR_CONFIG)) or
	 (DDR_SEL and DDR_CONFIG) or (to_std_logic(FB_REGDDR_q = "010") and (not nFB_WR));
    CPU_REQ_clk <= DDR_SYNC_66M;

    --  HALTEN BUS CYC BEGONNEN ODER FERTIG
    CPU_REQ_d <= CPU_SIG or (to_std_logic(CPU_REQ_q='1' and FB_REGDDR_q /= "010"
	 and FB_REGDDR_q /= "100") and (not BUS_CYC_END) and (not BUS_CYC_q));
    BUS_CYC_clk <= DDRCLK0;
    BUS_CYC_d_1 <= BUS_CYC_q and (not BUS_CYC_END);

    --  STATE MACHINE SYNCHRONISIEREN -----------------
    MCS0_clk_ctrl <= DDRCLK0;
    MCS_d(0) <= MAIN_CLK;
    MCS_d(1) <= MCS_q(0);
    CPU_DDR_SYNC_clk <= DDRCLK0;

    --  NUR 1 WENN EIN
    CPU_DDR_SYNC_d <= to_std_logic(MCS_q = "10") and VCKE and (not nVCS);

    -- -------------------------------------------------
    VA_S0_clk_ctrl <= DDRCLK0;
    BA_S0_clk_ctrl <= DDRCLK0;
    (VA12_1, VA11_1, VA10_1, VA9_1, VA8_1, VA7_1, VA6_1, VA5_1, VA4_1, VA3_1,
	 VA2_1, VA1_1, VA0_1) <= VA_S_q;
    (BA1_1, BA0_1) <= BA_S_q;
    VA_P0_clk_ctrl <= DDRCLK0;
    BA_P0_clk_ctrl <= DDRCLK0;

    --  DDR STATE MACHINE  -----------------------------------------------
    DDR_SM_0_clk_ctrl <= DDRCLK0;


    PROCESS (DDR_SM_q, DDR_REFRESH_REQ_q, CPU_DDR_SYNC_q, DDR_CONFIG,
	 CPU_ROW_ADR, FIFO_ROW_ADR, BLITTER_ROW_ADR, BLITTER_REQ_q, BLITTER_WR,
	 FIFO_AC_q, CPU_COL_ADR, BLITTER_COL_ADR, VA_S_q, CPU_BA, BLITTER_BA,
	 FB_B, CPU_AC_q, BLITTER_AC_q, FIFO_BANK_OK_q, FIFO_MW, FIFO_REQ_q,
	 VIDEO_ADR_CNT_q, FIFO_COL_ADR, gnd, DDR_SEL, LINE, FIFO_BA, VA_P_q,
	 BA_P_q, CPU_REQ_q, FB_AD, nFB_WR, FB_SIZE0, FB_SIZE1,
	 DDR_REFRESH_SIG_q, vcc)
        VARIABLE stdVec6: std_logic_vector(5 DOWNTO 0);
    BEGIN
        DDR_SM_d <= DDR_SM_q;
        BA_S_d <= "00";
        VA_S_d <= "0000000000000";
        BA_P_d <= "00";
        (VA_P_d(9), VA_P_d(8), VA_P_d(7), VA_P_d(6), VA_P_d(5), VA_P_d(4),
            VA_P_d(3), VA_P_d(2), VA_P_d(1), VA_P_d(0), VA_P_d(10)) <=
            std_logic_vector'("00000000000");
        SR_VDMP_d <= "00000000";
        VA_P_d(12 DOWNTO 11) <= "00";
        (FIFO_BANK_OK_d_1, FIFO_AC_d, SR_DDR_FB, SR_BLITTER_DACK, BLITTER_AC_d,
	    SR_DDR_WR_d, SR_DDRWR_D_SEL_d, CPU_AC_d, VA12_2, VA11_2, VA9_2,
	    VA8_2, VA7_2, VA6_2, VA5_2, VA4_2, VA3_2, VA2_2, VA1_2, VA0_2,
	    BA1_2, BA0_2, SR_FIFO_WRE_d, BUS_CYC_d_2, VWE, VA10_2,
	    FIFO_BANK_NOT_OK, VCAS, VRAS) <=
	    std_logic_vector'("00000000000000000000000000000");
        stdVec6 := DDR_SM_q;
    
        CASE stdVec6 IS
            WHEN "000000" =>
                IF (DDR_REFRESH_REQ_q)='1' THEN
                    DDR_SM_d <= "011111";
                    --  SYNCHRON UND EIN?
                ELSIF (CPU_DDR_SYNC_q)='1' THEN
                    --  JA
                    IF (DDR_CONFIG)='1' THEN
                        DDR_SM_d <= "001000";
                        --  BEI WAIT UND LINE WRITE
                    ELSIF (CPU_REQ_q)='1' THEN
                        VA_S_d <= CPU_ROW_ADR;
                        BA_S_d <= CPU_BA;
                        CPU_AC_d <= vcc;
                        BUS_CYC_d_2 <= vcc;
                        DDR_SM_d <= "000010";
                    ELSE
                        --  FIFO IST DEFAULT
                        IF (FIFO_REQ_q or (not BLITTER_REQ_q))='1' THEN
                            VA_P_d <= FIFO_ROW_ADR;
                            BA_P_d <= FIFO_BA;
                            --  VORBESETZEN
                            FIFO_AC_d <= vcc;
                        ELSE
                            VA_P_d <= BLITTER_ROW_ADR;
                            BA_P_d <= BLITTER_BA;
                            --  VORBESETZEN
                            BLITTER_AC_d <= vcc;
                        END IF;
                        DDR_SM_d <= "000001";
                    END IF;
                ELSE
                    --  NEIN ->SYNCHRONISIEREN
                    DDR_SM_d <= "000000";
                END IF;
        
            WHEN "000001" =>
                --  SCHNELLZUGRIFF *** HIER IST PAGE IMMER NOT OK ***
                IF (DDR_SEL and (nFB_WR or (not LINE)))='1' THEN
                    VRAS <= vcc;
                    (VA12_2, VA11_2, VA10_2, VA9_2, VA8_2, VA7_2, VA6_2, VA5_2, VA4_2, VA3_2, VA2_2, VA1_2, VA0_2) <= FB_AD(26 DOWNTO 14);
                    (BA1_2, BA0_2) <= FB_AD(13 DOWNTO 12);
                    --  AUTO PRECHARGE DA NICHT FIFO PAGE
                    VA_S_d(10) <= vcc;
                    CPU_AC_d <= vcc;
                    --  BUS CYCLUS LOSTRETEN
                    BUS_CYC_d_2 <= vcc;
                ELSE
                    VRAS <= (FIFO_AC_q and FIFO_REQ_q) or (BLITTER_AC_q and BLITTER_REQ_q);
                    (VA12_2, VA11_2, VA10_2, VA9_2, VA8_2, VA7_2, VA6_2, VA5_2, VA4_2, VA3_2, VA2_2, VA1_2, VA0_2) <= VA_P_q;
                    (BA1_2, BA0_2) <= BA_P_q;
                    VA_S_d(10) <= not (FIFO_AC_q and FIFO_REQ_q);
                    FIFO_BANK_OK_d_1 <= FIFO_AC_q and FIFO_REQ_q;
                    FIFO_AC_d <= FIFO_AC_q and FIFO_REQ_q;
                    BLITTER_AC_d <= BLITTER_AC_q and BLITTER_REQ_q;
                END IF;
                DDR_SM_d <= "000011";
            
            WHEN "000010" =>
                VRAS <= vcc;
                FIFO_BANK_NOT_OK <= vcc;
                CPU_AC_d <= vcc;

                --  BUS CYCLUS LOSTRETEN
                BUS_CYC_d_2 <= vcc;
                DDR_SM_d <= "000011";
      
            WHEN "000011" =>
                CPU_AC_d <= CPU_AC_q;
                FIFO_AC_d <= FIFO_AC_q;
                BLITTER_AC_d <= BLITTER_AC_q;

                --  AUTO PRECHARGE WENN NICHT FIFO PAGE
                VA_S_d(10) <= VA_S_q(10);
                IF (((not nFB_WR) and CPU_AC_q) or (BLITTER_WR and BLITTER_AC_q))='1' THEN
                    DDR_SM_d <= "010000";
                    --  CPU?
                ELSIF (CPU_AC_q)='1' THEN
                    VA_S_d(9 DOWNTO 0) <= CPU_COL_ADR;
                    BA_S_d <= CPU_BA;
                    DDR_SM_d <= "001110";
                    
                    --  FIFO?
                ELSIF (FIFO_AC_q)='1' THEN
                    VA_S_d(9 DOWNTO 0) <= FIFO_COL_ADR;
                    BA_S_d <= FIFO_BA;
                    DDR_SM_d <= "010110";
                ELSIF (BLITTER_AC_q)='1' THEN
                    VA_S_d(9 DOWNTO 0) <= BLITTER_COL_ADR;
                    BA_S_d <= BLITTER_BA;
                    DDR_SM_d <= "001110";
                ELSE
                    --  READ
                    DDR_SM_d <= "000111";
                END IF;
      
            WHEN "001110" =>
                CPU_AC_d <= CPU_AC_q;
                BLITTER_AC_d <= BLITTER_AC_q;
                VCAS <= vcc;

                --  READ DATEN FÜR CPU
                SR_DDR_FB <= CPU_AC_q;

                --  BLITTER DACK AND BLITTER LATCH DATEN
                SR_BLITTER_DACK <= BLITTER_AC_q;
                DDR_SM_d <= "001111";
      
            WHEN "001111" =>
                CPU_AC_d <= CPU_AC_q;
                BLITTER_AC_d <= BLITTER_AC_q;

                --  FIFO READ EINSCHIEBEN WENN BANK OK
                IF (FIFO_REQ_q and FIFO_BANK_OK_q)='1' THEN
                    VA_S_d(9 DOWNTO 0) <= FIFO_COL_ADR;         
                    
                    --  MANUELL PRECHARGE
                    VA_S_d(10) <= gnd;
                    BA_S_d <= FIFO_BA;
                    DDR_SM_d <= "011000";
                ELSE
                    --  ALLE PAGES SCHLIESSEN
                    VA_S_d(10) <= vcc;
                    --  WRITE
                    DDR_SM_d <= "011101";
                END IF;
            
            WHEN "010000" =>
                CPU_AC_d <= CPU_AC_q;
                BLITTER_AC_d <= BLITTER_AC_q;

                --  BLITTER ACK AND BLITTER LATCH DATEN
                SR_BLITTER_DACK <= BLITTER_AC_q;

                --  AUTO PRECHARGE WENN NICHT FIFO PAGE
                VA_S_d(10) <= VA_S_q(10);
                DDR_SM_d <= "010001";
            
            WHEN "010001" =>
                CPU_AC_d <= CPU_AC_q;
                BLITTER_AC_d <= BLITTER_AC_q;
                VA_S_d(9 DOWNTO 0) <= (sizeIt(CPU_AC_q, 10) and CPU_COL_ADR) or (sizeIt(BLITTER_AC_q, 10) and BLITTER_COL_ADR);

                --  AUTO PRECHARGE WENN NICHT FIFO PAGE
                VA_S_d(10) <= VA_S_q(10);
                BA_S_d <= (std_logic_vector'(CPU_AC_q & CPU_AC_q) and CPU_BA) or (std_logic_vector'(BLITTER_AC_q & BLITTER_AC_q) and BLITTER_BA);

                --  BYTE ENABLE WRITE
                SR_VDMP_d(7 DOWNTO 4) <= FB_B;

                --  LINE ENABLE WRITE
                SR_VDMP_d(3 DOWNTO 0) <= sizeIt(LINE,4) and "1111";
                DDR_SM_d <= "010010";
      
            WHEN "010010" =>
                CPU_AC_d <= CPU_AC_q;
                BLITTER_AC_d <= BLITTER_AC_q;
                VCAS <= vcc;
                VWE <= vcc;

                --  WRITE COMMAND CPU UND BLITTER IF WRITER
                SR_DDR_WR_d <= vcc;

                --  2. HÄLFTE WRITE DATEN SELEKTIEREN
                SR_DDRWR_D_SEL_d <= vcc;

                --  WENN LINE DANN ACTIV
                SR_VDMP_d <= sizeIt(LINE,8) and "11111111";
                DDR_SM_d <= "010011";
            
            WHEN "010011" =>
                CPU_AC_d <= CPU_AC_q;
                BLITTER_AC_d <= BLITTER_AC_q;

                --  WRITE COMMAND CPU UND BLITTER IF WRITE
                SR_DDR_WR_d <= vcc;

                --  2. HÄLFTE WRITE DATEN SELEKTIEREN
                SR_DDRWR_D_SEL_d <= vcc;
                DDR_SM_d <= "010100";
      
            WHEN "010100" =>
                DDR_SM_d <= "010101";
      
            WHEN "010101" =>
                IF (FIFO_REQ_q and FIFO_BANK_OK_q)='1' THEN
                    VA_S_d(9 DOWNTO 0) <= FIFO_COL_ADR;
                    
                    --  NON AUTO PRECHARGE
                    VA_S_d(10) <= gnd;
                    BA_S_d <= FIFO_BA;
                    DDR_SM_d <= "011000";
                ELSE
                    --  ALLE PAGES SCHLIESSEN
                    VA_S_d(10) <= vcc;
                    --  FIFO READ
                    DDR_SM_d <= "011101";
                END IF;
            
            WHEN "010110" =>
                VCAS <= vcc;

                --  DATEN WRITE FIFO
                SR_FIFO_WRE_d <= vcc;
                DDR_SM_d <= "010111";
            
            WHEN "010111" =>
                IF (FIFO_REQ_q)='1' THEN

                    --  NEUE PAGE?
                    IF VIDEO_ADR_CNT_q(7 DOWNTO 0) = "11111111" THEN

                        --  ALLE PAGES SCHLIESSEN
                        VA_S_d(10) <= vcc;

                        --  BANK SCHLIESSEN
                        DDR_SM_d <= "011101";
                    ELSE
                        VA_S_d(9 DOWNTO 0) <= std_logic_vector'(unsigned(FIFO_COL_ADR) + unsigned'("0000000100"));

                        --  NON AUTO PRECHARGE
                        VA_S_d(10) <= gnd;
                        BA_S_d <= FIFO_BA;
                        DDR_SM_d <= "011000";
                    END IF;
                ELSE

                    --  ALLE PAGES SCHLIESSEN
                    VA_S_d(10) <= vcc;

                    --  NOCH OFFEN LASSEN
                    DDR_SM_d <= "011101";
                END IF;
      
            WHEN "011000" =>
                VCAS <= vcc;

                --  DATEN WRITE FIFO
                SR_FIFO_WRE_d <= vcc;
                DDR_SM_d <= "011001";
            
            WHEN "011001" =>
                IF CPU_REQ_q='1' and (unsigned(FIFO_MW) > unsigned'("000000000")) THEN

                    --  ALLE PAGES SCHLIESEN
                    VA_S_d(10) <= vcc;

                    --  BANK SCHLIESSEN
                    DDR_SM_d <= "011110";
                ELSIF (FIFO_REQ_q)='1' THEN

                    --  NEUE PAGE?
                    IF VIDEO_ADR_CNT_q(7 DOWNTO 0) = "11111111" THEN

                        --  ALLE PAGES SCHLIESSEN
                        VA_S_d(10) <= vcc;

                        --  BANK SCHLIESSEN
                        DDR_SM_d <= "011110";
                    ELSE
                        VA_S_d(9 DOWNTO 0) <= std_logic_vector'(unsigned(FIFO_COL_ADR) + unsigned'("0000000100"));

                        --  NON AUTO PRECHARGE
                        VA_S_d(10) <= gnd;
                        BA_S_d <= FIFO_BA;
                        DDR_SM_d <= "011010";
                    END IF;
                ELSE

                    --  ALLE PAGES SCHLIESEN
                    VA_S_d(10) <= vcc;

                    --  BANK SCHLIESSEN
                    DDR_SM_d <= "011110";
                END IF;
            
            WHEN "011010" =>
                VCAS <= vcc;

                --  DATEN WRITE FIFO
                SR_FIFO_WRE_d <= vcc;

                --  NOTFALL?
                IF (unsigned(FIFO_MW) < unsigned'("000000000")) THEN

                    --  JA->
                    DDR_SM_d <= "010111";
                ELSE
                    DDR_SM_d <= "011011";
                END IF;
            
            WHEN "011011" =>
                IF (FIFO_REQ_q)='1' THEN

                    --  NEUE PAGE?
                    IF VIDEO_ADR_CNT_q(7 DOWNTO 0) = "11111111" THEN

                        --  ALLE BANKS SCHLIESEN
                        VA_S_d(10) <= vcc;

                        --  BANK SCHLIESSEN
                        DDR_SM_d <= "011101";
                    ELSE
                        VA_P_d(9 DOWNTO 0) <= std_logic_vector'(unsigned(FIFO_COL_ADR) + unsigned'("0000000100"));

                        --  NON AUTO PRECHARGE
                        VA_P_d(10) <= gnd;
                        BA_P_d <= FIFO_BA;
                        DDR_SM_d <= "011100";
                    END IF;
                ELSE

                    --  ALLE BANKS SCHLIESEN
                    VA_S_d(10) <= vcc;

                    --  BANK SCHLIESSEN
                    DDR_SM_d <= "011101";
                END IF;
      
            WHEN "011100" =>
                IF (DDR_SEL and (nFB_WR or (not LINE)))='1' and FB_AD(13 DOWNTO 12) /= FIFO_BA THEN
                    VRAS <= vcc;
                    (VA12_2, VA11_2, VA10_2, VA9_2, VA8_2, VA7_2, VA6_2, VA5_2, VA4_2, VA3_2, VA2_2, VA1_2, VA0_2) <= FB_AD(26 DOWNTO 14);
                    (BA1_2, BA0_2) <= FB_AD(13 DOWNTO 12);
                    CPU_AC_d <= vcc;

                    --  BUS CYCLUS LOSTRETEN
                    BUS_CYC_d_2 <= vcc;

                    --  AUTO PRECHARGE DA NICHT FIFO BANK
                    VA_S_d(10) <= vcc;
                    DDR_SM_d <= "000011";
                ELSE
                    VCAS <= vcc;
                    (VA12_2, VA11_2, VA10_2, VA9_2, VA8_2, VA7_2, VA6_2, VA5_2, VA4_2, VA3_2, VA2_2, VA1_2, VA0_2) <= VA_P_q;
                    (BA1_2, BA0_2) <= BA_P_q;

                    --  DATEN WRITE FIFO
                    SR_FIFO_WRE_d <= vcc;

                    --  CONFIG CYCLUS
                    DDR_SM_d <= "011001";
                END IF;
            
            WHEN "001000" =>
                DDR_SM_d <= "001001";
      
            WHEN "001001" =>
                BUS_CYC_d_2 <= CPU_REQ_q;
                DDR_SM_d <= "001010";
      
            WHEN "001010" =>
                IF (CPU_REQ_q)='1' THEN
                    DDR_SM_d <= "001011";
                ELSE
                    DDR_SM_d <= "000000";
                END IF;
            
            WHEN "001011" =>
                DDR_SM_d <= "001100";
            
            WHEN "001100" =>
                VA_S_d <= FB_AD(12 DOWNTO 0);
                BA_S_d <= FB_AD(14 DOWNTO 13);
                DDR_SM_d <= "001101";
      
            WHEN "001101" =>

                --  NUR BEI LONG WRITE
                VRAS <= FB_AD(18) and (not nFB_WR) and (not FB_SIZE0) and (not FB_SIZE1);

                --  NUR BEI LONG WRITE
                VCAS <= FB_AD(17) and (not nFB_WR) and (not FB_SIZE0) and (not FB_SIZE1);

                --  NUR BEI LONG WRITE
                VWE <= FB_AD(16) and (not nFB_WR) and (not FB_SIZE0) and (not FB_SIZE1);

                --  CLOSE FIFO BANK
                DDR_SM_d <= "000111";
            
            WHEN "011101" =>

                --  AUF NOT OK
                FIFO_BANK_NOT_OK <= vcc;

                --  BÄNKE SCHLIESSEN
                VRAS <= vcc;
                VWE <= vcc;
                DDR_SM_d <= "000110";
            
            WHEN "011110" =>
                --  AUF NOT OK
                FIFO_BANK_NOT_OK <= vcc;

                --  BÄNKE SCHLIESSEN
                VRAS <= vcc;
                VWE <= vcc;

                --  REFRESH 70NS = 10 ZYCLEN
                DDR_SM_d <= "000000";
            
            WHEN "011111" =>

                --  EIN CYCLUS VORLAUF UM BANKS ZU SCHLIESSEN
                IF DDR_REFRESH_SIG_q = "1001" THEN

                    --  ALLE BANKS SCHLIESSEN
                    VRAS <= vcc;
                    VWE <= vcc;
                    VA10_2 <= vcc;
                    FIFO_BANK_NOT_OK <= vcc;
                    DDR_SM_d <= "100001";
                ELSE
                    VCAS <= vcc;
                    VRAS <= vcc;
                    DDR_SM_d <= "100000";
                END IF;
            
            WHEN "100000" =>
                DDR_SM_d <= "100001";
            
            WHEN "100001" =>
                DDR_SM_d <= "100010";
            
            WHEN "100010" =>
                DDR_SM_d <= "100011";
            
            WHEN "100011" =>
                --  LEERSCHLAUFE
                DDR_SM_d <= "000100";
      
            WHEN "000100" =>
                DDR_SM_d <= "000101";
            
            WHEN "000101" =>
                DDR_SM_d <= "000110";
            
            WHEN "000110" =>
                DDR_SM_d <= "000111";
            
            WHEN "000111" =>
                DDR_SM_d <= "000000";
            
            WHEN OTHERS =>
        END CASE;
        stdVec6 := (OTHERS => '0');  -- no storage needed
    END PROCESS;

    -- -------------------------------------------------------------
    --  BLITTER ----------------------
    -- ---------------------------------------
    BLITTER_REQ_clk <= DDRCLK0;
    BLITTER_REQ_d <= BLITTER_SIG and (not DDR_CONFIG) and VCKE and (not nVCS);
    BLITTER_ROW_ADR <= BLITTER_ADR(26 DOWNTO 14);
    BLITTER_BA(1) <= BLITTER_ADR(13);
    BLITTER_BA(0) <= BLITTER_ADR(12);
    BLITTER_COL_ADR <= BLITTER_ADR(11 DOWNTO 2);

    -- ----------------------------------------------------------------------------
    --  FIFO ---------------------------------
    -- ------------------------------------------------------
    FIFO_REQ_clk <= DDRCLK0;
    FIFO_REQ_d <= (to_std_logic((unsigned(FIFO_MW) < unsigned'("011001000"))) or
	 (to_std_logic((unsigned(FIFO_MW) < unsigned'("111110100"))) and
	 FIFO_REQ_q)) and FIFO_ACTIVE and (not CLEAR_FIFO_CNT_q) and (not
	 STOP_q) and (not DDR_CONFIG) and VCKE and (not nVCS);
    FIFO_ROW_ADR <= VIDEO_ADR_CNT_q(22 DOWNTO 10);
    FIFO_BA(1) <= VIDEO_ADR_CNT_q(9);
    FIFO_BA(0) <= VIDEO_ADR_CNT_q(8);
    FIFO_COL_ADR <= std_logic_vector'(VIDEO_ADR_CNT_q(7) & VIDEO_ADR_CNT_q(6) &
	 VIDEO_ADR_CNT_q(5) & VIDEO_ADR_CNT_q(4) & VIDEO_ADR_CNT_q(3) &
	 VIDEO_ADR_CNT_q(2) & VIDEO_ADR_CNT_q(1) & VIDEO_ADR_CNT_q(0) & "00");
    FIFO_BANK_OK_clk <= DDRCLK0;
    FIFO_BANK_OK_d_2 <= FIFO_BANK_OK_q and (not FIFO_BANK_NOT_OK);

    --  ZÄHLER RÜCKSETZEN WENN CLR FIFO ----------------
    CLR_FIFO_SYNC_clk <= DDRCLK0;

    --  SYNCHRONISIEREN
    CLR_FIFO_SYNC_d <= CLR_FIFO;
    CLEAR_FIFO_CNT_clk <= DDRCLK0;
    CLEAR_FIFO_CNT_d <= CLR_FIFO_SYNC_q or (not FIFO_ACTIVE);
    STOP_clk <= DDRCLK0;
    STOP_d <= CLR_FIFO_SYNC_q or CLEAR_FIFO_CNT_q;

    --  ZÄHLEN -----------------------------------------------
    VIDEO_ADR_CNT0_clk_ctrl <= DDRCLK0;
    VIDEO_ADR_CNT0_ena_ctrl <= SR_FIFO_WRE_q or CLEAR_FIFO_CNT_q;
    VIDEO_ADR_CNT_d <= (sizeIt(CLEAR_FIFO_CNT_q,23) and VIDEO_BASE_ADR) or
	 (sizeIt(not CLEAR_FIFO_CNT_q,23) and
	 (std_logic_vector'(unsigned(VIDEO_ADR_CNT_q) +
	 unsigned'("00000000000000000000001"))));
    
    VIDEO_BASE_ADR(22 DOWNTO 20) <= VIDEO_BASE_X_D_q;
    VIDEO_BASE_ADR(19 DOWNTO 12) <= VIDEO_BASE_H_D_q;
    VIDEO_BASE_ADR(11 DOWNTO 4) <= VIDEO_BASE_M_D_q;
    VIDEO_BASE_ADR(3 DOWNTO 0) <= VIDEO_BASE_L_D_q(7 DOWNTO 4);
    VDM_SEL <= VIDEO_BASE_L_D_q(3 DOWNTO 0);

    --  AKTUELLE VIDEO ADRESSE
    VIDEO_ACT_ADR(26 DOWNTO 4) <= std_logic_vector'(unsigned(VIDEO_ADR_CNT_q) -
	 unsigned(std_logic_vector'("00000000000000" & FIFO_MW)));
    VIDEO_ACT_ADR(3 DOWNTO 0) <= VDM_SEL;

    -- ---------------------------------------------------------------------------------------
    --  REFRESH: IMMER 8 AUFS MAL, ANFORDERUNG ALLE 7.8us X 8 STCK. = 62.4us = 2059->2048 33MHz CLOCKS
    -- ---------------------------------------------------------------------------------------
    DDR_REFRESH_CNT0_clk_ctrl <= CLK33M;

    --  ZÄHLEN 0-2047
    DDR_REFRESH_CNT_d <= std_logic_vector'(unsigned(DDR_REFRESH_CNT_q) + unsigned'("00000000001"));
    REFRESH_TIME_clk <= DDRCLK0;

    --  SYNC
    REFRESH_TIME_d <= to_std_logic(DDR_REFRESH_CNT_q = "00000000000") and (not MAIN_CLK);
    DDR_REFRESH_SIG0_clk_ctrl <= DDRCLK0;
    DDR_REFRESH_SIG0_ena_ctrl <= to_std_logic(REFRESH_TIME_q='1' or DDR_SM_q = "100011");

    --  9 STÜCK (8 REFRESH UND 1 ALS VORLAUF)
    --  MINUS 1 WENN GEMACHT
    DDR_REFRESH_SIG_d <= (sizeIt(REFRESH_TIME_q,4) and "1001" and
	 sizeIt(DDR_REFRESH_ON,4) and sizeIt(not DDR_CONFIG,4)) or (sizeIt(not
	 REFRESH_TIME_q,4) and (std_logic_vector'(unsigned(DDR_REFRESH_SIG_q) -
	 unsigned'("0001"))) and sizeIt(DDR_REFRESH_ON,4) and sizeIt(not
	 DDR_CONFIG,4));
    DDR_REFRESH_REQ_clk <= DDRCLK0;
    DDR_REFRESH_REQ_d <= to_std_logic(DDR_REFRESH_SIG_q /= "0000") and DDR_REFRESH_ON and (not REFRESH_TIME_q) and (not DDR_CONFIG);

    -- ---------------------------------------------------------
    --  VIDEO REGISTER -----------------------
    -- -------------------------------------------------------------------------------------------------------------------
    VIDEO_BASE_L_D0_clk_ctrl <= MAIN_CLK;

    --  820D/2
    VIDEO_BASE_L <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 DOWNTO 1) = "1111100000100000110");

    --  SORRY, NUR 16 BYT GRENZEN
    VIDEO_BASE_L_D_d <= FB_AD(23 DOWNTO 16);
    VIDEO_BASE_L_D0_ena_ctrl <= (not nFB_WR) and VIDEO_BASE_L and FB_B(1);
    VIDEO_BASE_M_D0_clk_ctrl <= MAIN_CLK;

    --  8203/2
    VIDEO_BASE_M <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 DOWNTO 1) = "1111100000100000001");
    VIDEO_BASE_M_D_d <= FB_AD(23 DOWNTO 16);
    VIDEO_BASE_M_D0_ena_ctrl <= (not nFB_WR) and VIDEO_BASE_M and FB_B(3);
    VIDEO_BASE_H_D0_clk_ctrl <= MAIN_CLK;

    --  8200-1/2
    VIDEO_BASE_H <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 DOWNTO 1) = "1111100000100000000");
    VIDEO_BASE_H_D_d <= FB_AD(23 DOWNTO 16);
    VIDEO_BASE_H_D0_ena_ctrl <= (not nFB_WR) and VIDEO_BASE_H and FB_B(1);
    VIDEO_BASE_X_D0_clk_ctrl <= MAIN_CLK;
    VIDEO_BASE_X_D_d <= FB_AD(26 DOWNTO 24);
    VIDEO_BASE_X_D0_ena_ctrl <= (not nFB_WR) and VIDEO_BASE_H and FB_B(0);

    --  8209/2
    VIDEO_CNT_L <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 DOWNTO 1) = "1111100000100000100");

    --  8207/2
    VIDEO_CNT_M <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 DOWNTO 1) = "1111100000100000011");

    --  8204,5/2
    VIDEO_CNT_H <= to_std_logic(((not nFB_CS1)='1') and FB_ADR(19 DOWNTO 1) = "1111100000100000010");

--  FB_AD[31..24] = lpm_bustri_BYT(
--                         VIDEO_BASE_H  & (0, VIDEO_BASE_X_D[])
--                       # VIDEO_CNT_H   & (0, VIDEO_ACT_ADR[26..24]),
--                        (VIDEO_BASE_H # VIDEO_CNT_H) & !nFB_OE); 
   u0_data <= (sizeIt(VIDEO_BASE_L,8) and VIDEO_BASE_L_D_q) or
	 (sizeIt(VIDEO_BASE_M,8) and VIDEO_BASE_M_D_q) or
	 (sizeIt(VIDEO_BASE_H,8) and VIDEO_BASE_H_D_q) or
	 (sizeIt(VIDEO_CNT_L,8) and VIDEO_ACT_ADR(7 DOWNTO 0)) or
	 (sizeIt(VIDEO_CNT_M,8) and VIDEO_ACT_ADR(15 DOWNTO 8)) or
	 (sizeIt(VIDEO_CNT_H,8) and VIDEO_ACT_ADR(23 DOWNTO 16));
   u0_enabledt <= (VIDEO_BASE_L or VIDEO_BASE_M or VIDEO_BASE_H or VIDEO_CNT_L
	 or VIDEO_CNT_M or VIDEO_CNT_H) and (not nFB_OE);
    FB_AD(23 DOWNTO 16) <= u0_tridata;


    -- Assignments added to explicitly combine the
    -- effects of multiple drivers in the source
    FIFO_BANK_OK_d <= FIFO_BANK_OK_d_1 or FIFO_BANK_OK_d_2;
    BUS_CYC_d <= BUS_CYC_d_1 or BUS_CYC_d_2;
    BA(0) <= BA0_1 or BA0_2;
    BA(1) <= BA1_1 or BA1_2;
    VA(0) <= VA0_1 or VA0_2;
    VA(1) <= VA1_1 or VA1_2;
    VA(2) <= VA2_1 or VA2_2;
    VA(3) <= VA3_1 or VA3_2;
    VA(4) <= VA4_1 or VA4_2;
    VA(5) <= VA5_1 or VA5_2;
    VA(6) <= VA6_1 or VA6_2;
    VA(7) <= VA7_1 or VA7_2;
    VA(8) <= VA8_1 or VA8_2;
    VA(9) <= VA9_1 or VA9_2;
    VA(10) <= VA10_1 or VA10_2;
    VA(11) <= VA11_1 or VA11_2;
    VA(12) <= VA12_1 or VA12_2;

-- Define power SIGNAL(s)
    vcc <= '1';
    gnd <= '0';
END ARCHITECTURE rtl;
