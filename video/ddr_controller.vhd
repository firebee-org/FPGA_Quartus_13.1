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
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
entity ddr_ctr is
    port
    (
        fb_adr          : in std_logic_vector(31 downto 0);
        nFB_CS1         : in std_logic;
        nFB_CS2         : in std_logic;
        nFB_CS3         : in std_logic;
        nFB_OE          : in std_logic;
        fb_size0        : in std_logic;
        fb_size1        : in std_logic;
        nRSTO           : in std_logic;
        main_clk        : in std_logic;
	    FB_ALE          : in std_logic;
        nFB_WR          : in std_logic;
        DDR_SYNC_66M    : in std_logic;
        CLR_FIFO        : in std_logic;
        VIDEO_RAM_CTR   : in std_logic_vector(15 downto 0);
        BLITTER_ADR     : in std_logic_vector(31 downto 0);
        BLITTER_SIG     : in std_logic;
        BLITTER_WR      : in std_logic;
        DDRCLK0         : in std_logic;
        CLK33M          : in std_logic;
        FIFO_MW         : in std_logic_vector(8 downto 0);
        VA              : buffer std_logic_vector(12 downto 0);
        nVWE            : buffer std_logic;
        nVRAS           : buffer std_logic;
        nVCS            : buffer std_logic;
        vcke            : buffer std_logic;
        nVCAS           : buffer std_logic;
        fb_le           : buffer std_logic_vector(3 downto 0);
        fb_vdoe         : buffer std_logic_vector(3 downto 0);
        SR_FIFO_WRE     : buffer std_logic;
        SR_DDR_FB       : buffer std_logic;
        SR_DDR_WR       : buffer std_logic;
        SR_DDRWR_D_SEL  : buffer std_logic;
        SR_VDMP         : buffer std_logic_vector(7 downto 0);
        video_ddr_ta    : buffer std_logic;
        SR_BLITTER_DACK : buffer std_logic;
        BA              : buffer std_logic_vector(1 downto 0);
        DDRWR_D_SEL1    : buffer std_logic;
        VDM_SEL         : buffer std_logic_vector(3 downto 0);
        fb_ad_in        : in std_logic_vector(31 downto 0);
        fb_ad_out       : out std_logic_vector(31 downto 0)
   );
end ddr_ctr;


architecture rtl of ddr_ctr is
    --  START (NORMAL 8 CYCLES TOTAL = 60ns)
    --  CONFIG
    --  READ CPU UND BLITTER,
    --  WRITE CPU UND BLITTER
    --  READ FIFO
    --  CLOSE FIFO BANK
    --  REFRESH 10X7.5NfS=75NS
    signal fb_regddr_3                  : std_logic_vector(2 downto 0);
    signal fb_regddr_d                  : std_logic_vector(2 downto 0);
    signal fb_regddr_q                  : std_logic_vector(2 downto 0);
    signal DDR_SM_6                     : std_logic_vector(5 downto 0);
    signal DDR_SM_d                     : std_logic_vector(5 downto 0);
    signal DDR_SM_q                     : std_logic_vector(5 downto 0);
    signal fb_b                         : std_logic_vector(3 downto 0);
    signal VA_P                         : std_logic_vector(12 downto 0);
    signal VA_P_d                       : std_logic_vector(12 downto 0);
    signal VA_P_q                       : std_logic_vector(12 downto 0);
    signal BA_P                         : std_logic_vector(1 downto 0);
    signal BA_P_d                       : std_logic_vector(1 downto 0);
    signal BA_P_q                       : std_logic_vector(1 downto 0);
    signal VA_S                         : std_logic_vector(12 downto 0);
    signal VA_S_d                       : std_logic_vector(12 downto 0);
    signal VA_S_q                       : std_logic_vector(12 downto 0);
    signal BA_S                         : std_logic_vector(1 downto 0);
    signal BA_S_d                       : std_logic_vector(1 downto 0);
    signal BA_S_q                       : std_logic_vector(1 downto 0);
    signal MCS                          : std_logic_vector(1 downto 0);
    signal MCS_d                        : std_logic_vector(1 downto 0);
    signal MCS_q                        : std_logic_vector(1 downto 0);
    signal SR_VDMP_d                    : std_logic_vector(7 downto 0);
    signal SR_VDMP_q                    : std_logic_vector(7 downto 0);
    signal cpu_row_adr                  : std_logic_vector(12 downto 0);
    signal CPU_BA                       : std_logic_vector(1 downto 0);
    signal CPU_COL_ADR                  : std_logic_vector(9 downto 0);
    signal BLITTER_ROW_ADR              : std_logic_vector(12 downto 0);
    signal BLITTER_BA                   : std_logic_vector(1 downto 0);
    signal BLITTER_COL_ADR              : std_logic_vector(9 downto 0);
    signal FIFO_ROW_ADR                 : std_logic_vector(12 downto 0);
    signal FIFO_BA                      : std_logic_vector(1 downto 0);
    signal FIFO_COL_ADR                 : std_logic_vector(9 downto 0);
    signal DDR_REFRESH_CNT              : std_logic_vector(10 downto 0);
    signal DDR_REFRESH_CNT_d            : std_logic_vector(10 downto 0);
    signal DDR_REFRESH_CNT_q            : std_logic_vector(10 downto 0);
    signal DDR_REFRESH_SIG              : std_logic_vector(3 downto 0);
    signal DDR_REFRESH_SIG_d            : std_logic_vector(3 downto 0);
    signal DDR_REFRESH_SIG_q            : std_logic_vector(3 downto 0);
    signal VIDEO_BASE_L_D               : std_logic_vector(7 downto 0);
    signal VIDEO_BASE_L_D_d             : std_logic_vector(7 downto 0);
    signal VIDEO_BASE_L_D_q             : std_logic_vector(7 downto 0);
    signal VIDEO_BASE_M_D               : std_logic_vector(7 downto 0);
    signal VIDEO_BASE_M_D_d             : std_logic_vector(7 downto 0);
    signal VIDEO_BASE_M_D_q             : std_logic_vector(7 downto 0);
    signal VIDEO_BASE_H_D               : std_logic_vector(7 downto 0);
    signal VIDEO_BASE_H_D_d             : std_logic_vector(7 downto 0);
    signal VIDEO_BASE_H_D_q             : std_logic_vector(7 downto 0);
    signal VIDEO_BASE_X_D               : std_logic_vector(2 downto 0);
    signal VIDEO_BASE_X_D_d             : std_logic_vector(2 downto 0);
    signal VIDEO_BASE_X_D_q             : std_logic_vector(2 downto 0);
    signal VIDEO_ADR_CNT                : std_logic_vector(22 downto 0);
    signal VIDEO_ADR_CNT_d              : std_logic_vector(22 downto 0);
    signal VIDEO_ADR_CNT_q              : std_logic_vector(22 downto 0);
    signal VIDEO_BASE_ADR               : std_logic_vector(22 downto 0);
    signal VIDEO_ACT_ADR                : std_logic_vector(26 downto 0);
    signal u0_data                      : std_logic_vector(7 downto 0);
    signal u0_tridata                   : std_logic_vector(7 downto 0);
    signal fb_regddr_0_clk_ctrl         : std_logic;
    signal SR_VDMP0_clk_ctrl            : std_logic;
    signal MCS0_clk_ctrl                : std_logic;
	signal VA_S0_clk_ctrl               : std_logic;
    signal BA_S0_clk_ctrl               : std_logic;
    signal VA_P0_clk_ctrl               : std_logic;
    signal BA_P0_clk_ctrl               : std_logic;
	signal DDR_SM_0_clk_ctrl            : std_logic;
    signal VIDEO_ADR_CNT0_clk_ctrl      : std_logic;
    signal VIDEO_ADR_CNT0_ena_ctrl      : std_logic;
	signal DDR_REFRESH_CNT0_clk_ctrl    : std_logic;
    signal DDR_REFRESH_SIG0_clk_ctrl    : std_logic;
	signal DDR_REFRESH_SIG0_ena_ctrl    : std_logic;
    signal VIDEO_BASE_L_D0_clk_ctrl     : std_logic;
	signal VIDEO_BASE_L_D0_ena_ctrl     : std_logic;
    signal VIDEO_BASE_M_D0_clk_ctrl     : std_logic;
	signal VIDEO_BASE_M_D0_ena_ctrl     : std_logic;
    signal VIDEO_BASE_H_D0_clk_ctrl     : std_logic;
	signal VIDEO_BASE_H_D0_ena_ctrl     : std_logic;
    signal VIDEO_BASE_X_D0_clk_ctrl     : std_logic;
    signal VIDEO_BASE_X_D0_ena_ctrl     : std_logic;
    signal VA12_2                       : std_logic;
    signal VA12_1                       : std_logic;
    signal VA11_2                       : std_logic;
    signal VA11_1                       : std_logic;
    signal VA10_2                       : std_logic;
	signal VA10_1                       : std_logic;
    signal VA9_2                        : std_logic;
    signal VA9_1                        : std_logic;
    signal VA8_2                        : std_logic;
    signal VA8_1                        : std_logic;
    signal VA7_2                        : std_logic;
    signal VA7_1                        : std_logic;
    signal VA6_2                        : std_logic;
    signal VA6_1                        : std_logic;
    signal VA5_2                        : std_logic;
	signal VA5_1                        : std_logic;
    signal VA4_2                        : std_logic;
    signal VA4_1                        : std_logic;
    signal VA3_2                        : std_logic;
    signal VA3_1                        : std_logic;
    signal VA2_2                        : std_logic;
    signal VA2_1                        : std_logic;
    signal VA1_2                        : std_logic;
    signal VA1_1                        : std_logic;
    signal VA0_2                        : std_logic;
    signal VA0_1                        : std_logic;
    signal BA1_2                        : std_logic;
    signal BA1_1                        : std_logic;
    signal BA0_2                        : std_logic;
    signal BA0_1                        : std_logic;
    signal bus_cyc_d_2                  : std_logic;
    signal bus_cyc_d_1                  : std_logic;
	signal FIFO_BANK_OK_d_2             : std_logic;
    signal FIFO_BANK_OK_d_1             : std_logic;
    signal u0_enabledt                  : std_logic;
	signal VIDEO_CNT_H                  : std_logic;
    signal VIDEO_CNT_M                  : std_logic;
    signal VIDEO_CNT_L                  : std_logic;
    signal VIDEO_BASE_H                 : std_logic;
    signal VIDEO_BASE_M                 : std_logic;
    signal VIDEO_BASE_L                 : std_logic;
    signal REFRESH_TIME_q               : std_logic;
    signal REFRESH_TIME_clk             : std_logic;
    signal REFRESH_TIME_d               : std_logic;
	signal REFRESH_TIME                 : std_logic;
    signal DDR_REFRESH_REQ_q            : std_logic;
    signal DDR_REFRESH_REQ_clk          : std_logic;
	signal DDR_REFRESH_REQ_d            : std_logic;
    signal DDR_REFRESH_REQ              : std_logic;
    signal ddr_refresh_on               : std_logic;
    signal FIFO_BANK_NOT_OK             : std_logic;
	signal FIFO_BANK_OK_q               : std_logic;
    signal FIFO_BANK_OK_clk             : std_logic;
    signal FIFO_BANK_OK_d               : std_logic;
    signal FIFO_BANK_OK                 : std_logic;
	SiGNAL SR_FIFO_WRE_q                : std_logic;
    signal SR_FIFO_WRE_clk              : std_logic;
    signal SR_FIFO_WRE_d                : std_logic;
    signal STOP_q                       : std_logic;
    signal STOP_clk                     : std_logic;
	signal STOP_d                       : std_logic;
    signal STOP                         : std_logic;
    signal CLEAR_FIFO_CNT_q             : std_logic;
    signal CLEAR_FIFO_CNT_clk           : std_logic;
    signal CLEAR_FIFO_CNT_d             : std_logic;
    signal CLEAR_FIFO_CNT               : std_logic;
    signal CLR_FIFO_SYNC_q              : std_logic;
    signal CLR_FIFO_SYNC_clk            : std_logic;
    signal CLR_FIFO_SYNC_d              : std_logic;
	signal CLR_FIFO_SYNC                : std_logic;
    signal FIFO_ACTIVE                  : std_logic;
    signal FIFO_AC_q                    : std_logic;
    signal FIFO_AC_clk                  : std_logic;
    signal FIFO_AC_d                    : std_logic;
	signal FIFO_AC                      : std_logic;
    signal FIFO_REQ_q                   : std_logic;
    signal FIFO_REQ_clk                 : std_logic;
    signal FIFO_REQ_d                   : std_logic;
    signal FIFO_REQ                     : std_logic;
    signal BLITTER_AC_q                 : std_logic;
    signal BLITTER_AC_clk               : std_logic;
    signal BLITTER_AC_d                 : std_logic;
    signal BLITTER_AC                   : std_logic;
    signal BLITTER_REQ_q                : std_logic;
	signal BLITTER_REQ_clk              : std_logic;
    signal BLITTER_REQ_d                : std_logic;
    signal BLITTER_REQ                  : std_logic;
    signal bus_cyc_end                  : std_logic;
    signal bus_cyc_q                    : std_logic;
    signal bus_cyc_clk                  : std_logic;
    signal bus_cyc_d                    : std_logic;
    signal bus_cyc                      : std_logic;
    signal CPU_AC_q                     : std_logic;
    signal CPU_AC_clk                   : std_logic;
    signal CPU_AC_d                     : std_logic;
	signal CPU_AC                       : std_logic;
    signal CPU_REQ_q                    : std_logic;
    signal CPU_REQ_clk                  : std_logic;
    signal CPU_REQ_d                    : std_logic;
    signal CPU_REQ                      : std_logic;
    signal CPU_SIG                      : std_logic;
    signal SR_DDRWR_D_SEL_q             : std_logic;
    signal SR_DDRWR_D_SEL_clk           : std_logic;
    signal SR_DDRWR_D_SEL_d             : std_logic;
    signal SR_DDR_WR_q                  : std_logic;
	signal SR_DDR_WR_clk                : std_logic;
    signal SR_DDR_WR_d                  : std_logic;
    signal ddr_config                   : std_logic;
    signal ddr_cs_q                     : std_logic;
    signal ddr_cs_ena                   : std_logic;
	signal ddr_cs_clk                   : std_logic;
    signal ddr_cs_d                     : std_logic;
    signal ddr_cs                       : std_logic;
    signal ddr_sel                      : std_logic;
    signal CPU_DDR_SYNC_q               : std_logic;
	signal CPU_DDR_SYNC_clk             : std_logic;
    signal CPU_DDR_SYNC_d               : std_logic;
    signal CPU_DDR_SYNC                 : std_logic;
    signal VWE                          : std_logic;
    signal VRAS                         : std_logic;
    signal VCAS                         : std_logic;
    signal LINE                         : std_logic;

    signal v_basx                       : std_logic_vector(1 downto 0);
    signal v_basx_ta                    : std_logic;

    signal v_bash                       : std_logic_vector(7 downto 0);
    signal v_bash_cs                    : std_logic;
    
    signal reg_ta                       : std_logic := '0';
    
    type flexbus_states is (FR_WAIT, FR_S0, FR_S1, FR_S2, FR_S3);
    
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
    end to_std_logic;


    -- sizeIt replicates a value to an array of specific length.
    function sizeit(a: std_logic; len: integer) return std_logic_vector is
        variable rep: std_logic_vector(len - 1 downto 0);
    begin
        FOR i in rep'RANGE LOOP
            rep(i) := a;
        end LOOP;
        return rep;
    end sizeIt;

begin
    -- Register Section

    SR_FIFO_WRE <= SR_FIFO_WRE_q;
    process (SR_FIFO_WRE_clk)
    begin
        if rising_edge(sr_fifo_wre_clk) then
            SR_FIFO_WRE_q <= SR_FIFO_WRE_d;
        end if;
    end process;

    SR_DDR_WR <= SR_DDR_WR_q;
    process (SR_DDR_WR_clk)
    begin
        if rising_edge(sr_ddr_wr_clk) then
            SR_DDR_WR_q <= SR_DDR_WR_d;
        end if;
    end process;

    SR_DDRWR_D_SEL <= SR_DDRWR_D_SEL_q;
    process (SR_DDRWR_D_SEL_clk)
    begin
        if rising_edge(sr_ddrwr_d_sel_clk) then
            SR_DDRWR_D_SEL_q <= SR_DDRWR_D_SEL_d;
        end if;
    end process;

    SR_VDMP <= SR_VDMP_q;
    process (SR_VDMP0_clk_ctrl)
    begin
        if rising_edge(sr_vdmp0_clk_ctrl) then
            SR_VDMP_q <= SR_VDMP_d;
        end if;
    end process;

    process (fb_regddr_0_clk_ctrl)
    begin
        if rising_edge(fb_regddr_0_clk_ctrl) then
            fb_regddr_q <= fb_regddr_d;
        end if;
    end process;

    process (DDR_SM_0_clk_ctrl)
    begin
        if rising_edge(ddr_sm_0_clk_ctrl) then
            DDR_SM_q <= DDR_SM_d;
        end if;
    end process;

    process (VA_P0_clk_ctrl)
    begin
        if rising_edge(va_p0_clk_ctrl) then
            VA_P_q <= VA_P_d;
        end if;
    end process;

    process (BA_P0_clk_ctrl)
    begin
        if rising_edge(ba_p0_clk_ctrl) then
            BA_P_q <= BA_P_d;
        end if;
    end process;

    process (VA_S0_clk_ctrl)
    begin
        if rising_edge(va_s0_clk_ctrl) then
            VA_S_q <= VA_S_d;
        end if;
    end process;

    process (BA_S0_clk_ctrl)
    begin
        if BA_S0_clk_ctrl'event and BA_S0_clk_ctrl='1' then
            BA_S_q <= BA_S_d;
        end if;
    end process;

    process (MCS0_clk_ctrl)
    begin
        if MCS0_clk_ctrl'event and MCS0_clk_ctrl='1' then
            MCS_q <= MCS_d;
        end if;
    end process;

    process (CPU_DDR_SYNC_clk)
    begin
        if CPU_DDR_SYNC_clk'event and CPU_DDR_SYNC_clk='1' then
            CPU_DDR_SYNC_q <= CPU_DDR_SYNC_d;
        end if;
    end process;

    process (ddr_cs_clk)
    begin
        if ddr_cs_clk'event and ddr_cs_clk='1' then
            if ddr_cs_ena='1' then
                ddr_cs_q <= ddr_cs_d;
            end if;
        end if;
    end process;

    process (CPU_REQ_clk)
    begin
        if CPU_REQ_clk'event and CPU_REQ_clk='1' then
            CPU_REQ_q <= CPU_REQ_d;
        end if;
    end process;

    process (CPU_AC_clk)
    begin
        if CPU_AC_clk'event and CPU_AC_clk='1' then
            CPU_AC_q <= CPU_AC_d;
        end if;
    end process;

    process (bus_cyc_clk)
    begin
        if bus_cyc_clk'event and bus_cyc_clk='1' then
            bus_cyc_q <= bus_cyc_d;
        end if;
    end process;

    process (BLITTER_REQ_clk)
    begin
        if BLITTER_REQ_clk'event and BLITTER_REQ_clk='1' then
            BLITTER_REQ_q <= BLITTER_REQ_d;
        end if;
    end process;

    process (BLITTER_AC_clk)
    begin
        if BLITTER_AC_clk'event and BLITTER_AC_clk='1' then
            BLITTER_AC_q <= BLITTER_AC_d;
        end if;
    end process;

    process (FIFO_REQ_clk)
    begin
        if FIFO_REQ_clk'event and FIFO_REQ_clk='1' then
            FIFO_REQ_q <= FIFO_REQ_d;
        end if;
    end process;

    process (FIFO_AC_clk)
    begin
        if FIFO_AC_clk'event and FIFO_AC_clk='1' then
            FIFO_AC_q <= FIFO_AC_d;
        end if;
    end process;

    process (CLR_FIFO_SYNC_clk)
    begin
        if CLR_FIFO_SYNC_clk'event and CLR_FIFO_SYNC_clk='1' then
            CLR_FIFO_SYNC_q <= CLR_FIFO_SYNC_d;
        end if;
    end process;

    process (CLEAR_FIFO_CNT_clk)
    begin
        if CLEAR_FIFO_CNT_clk'event and CLEAR_FIFO_CNT_clk='1' then
            CLEAR_FIFO_CNT_q <= CLEAR_FIFO_CNT_d;
        end if;
    end process;

    process (STOP_clk)
    begin
        if STOP_clk'event and STOP_clk='1' then
            STOP_q <= STOP_d;
        end if;
    end process;

    process (FIFO_BANK_OK_clk)
    begin
        if FIFO_BANK_OK_clk'event and FIFO_BANK_OK_clk='1' then
            FIFO_BANK_OK_q <= FIFO_BANK_OK_d;
        end if;
    end process;

    process (DDR_REFRESH_CNT0_clk_ctrl)
    begin
        if DDR_REFRESH_CNT0_clk_ctrl'event and DDR_REFRESH_CNT0_clk_ctrl='1' then
            DDR_REFRESH_CNT_q <= DDR_REFRESH_CNT_d;
        end if;
    end process;

    process (DDR_REFRESH_REQ_clk)
    begin
        if DDR_REFRESH_REQ_clk'event and DDR_REFRESH_REQ_clk='1' then
            DDR_REFRESH_REQ_q <= DDR_REFRESH_REQ_d;
        end if;
    end process;

    process (DDR_REFRESH_SIG0_clk_ctrl)
    begin
        if DDR_REFRESH_SIG0_clk_ctrl'event and DDR_REFRESH_SIG0_clk_ctrl='1' then
            if DDR_REFRESH_SIG0_ena_ctrl='1' then
                DDR_REFRESH_SIG_q <= DDR_REFRESH_SIG_d;
            end if;
        end if;
    end process;

    process (REFRESH_TIME_clk)
    begin
        if REFRESH_TIME_clk'event and REFRESH_TIME_clk = '1' then
            REFRESH_TIME_q <= REFRESH_TIME_d;
        end if;
    end process;

    process (VIDEO_BASE_L_D0_clk_ctrl)
    begin
        if VIDEO_BASE_L_D0_clk_ctrl'event and VIDEO_BASE_L_D0_clk_ctrl='1' then
            if VIDEO_BASE_L_D0_ena_ctrl='1' then
                VIDEO_BASE_L_D_q <= VIDEO_BASE_L_D_d;
            end if;
        end if;
    end process;

    process (VIDEO_BASE_M_D0_clk_ctrl)
    begin
        if VIDEO_BASE_M_D0_clk_ctrl'event and VIDEO_BASE_M_D0_clk_ctrl='1' then
            if VIDEO_BASE_M_D0_ena_ctrl='1' then
                VIDEO_BASE_M_D_q <= VIDEO_BASE_M_D_d;
            end if;
        end if;
    end process;

    process (VIDEO_BASE_H_D0_clk_ctrl)
    begin
        if VIDEO_BASE_H_D0_clk_ctrl'event and VIDEO_BASE_H_D0_clk_ctrl='1' then
            if VIDEO_BASE_H_D0_ena_ctrl='1' then
                VIDEO_BASE_H_D_q <= VIDEO_BASE_H_D_d;
            end if;
        end if;
    end process;

    process (VIDEO_BASE_X_D0_clk_ctrl)
    begin
        if VIDEO_BASE_X_D0_clk_ctrl'event and VIDEO_BASE_X_D0_clk_ctrl='1' then
            if VIDEO_BASE_X_D0_ena_ctrl='1' then
                VIDEO_BASE_X_D_q <= VIDEO_BASE_X_D_d;
            end if;
        end if;
    end process;

    process (VIDEO_ADR_CNT0_clk_ctrl)
    begin
        if VIDEO_ADR_CNT0_clk_ctrl'event and VIDEO_ADR_CNT0_clk_ctrl='1' then
            if VIDEO_ADR_CNT0_ena_ctrl='1' then
                VIDEO_ADR_CNT_q <= VIDEO_ADR_CNT_d;
            end if;
        end if;
    end process;

    i_vbasx : work.flexbus_register
        generic map
        (
            reg_width => 8,
            match_address => x"ffff8603",
            num_ignore => 4,
            match_fbcs => 1
        )
        port map
        (
            clk => clk33m,
            fb_addr => fb_adr,
            fb_ad_in => fb_ad_in,
            fb_ad_out => fb_ad_out,
            fb_cs_n => ('1', '1', nfb_cs3, nfb_cs2, nfb_cs1),
            fb_wr_n => nfb_wr,
            fb_oe_n => nfb_oe,
            fb_size => (fb_size1, fb_size0),
            register_ta => v_basx_ta
        );

--    i_vbash : work.flexbus_register
--        generic map
--        (
--            reg_width => 8,
--            match_address => x"ffff8604",
--            match_mask => x"0000fffe",      -- byte register
--            match_fbcs => 1
--        )
--        port map
--        (
--            clk => clk33m,
--            fb_addr => fb_adr,
--            fb_data => fb_ad,
--            fb_cs => ('0', '0', nfb_cs3, nfb_cs2, nfb_cs1),
--            fb_ta_n => V,
--            fb_wr_n => nfb_wr,
--            reg_value => v_bash,
--            cs => v_bash_cs
--        );
        
    -- Start of original equations
    line <= fb_size0 and fb_size1;

    --  BYT SELECT
    --  ADR==0
    --  LONG UND LINE
    fb_b(0) <= to_std_logic(fb_adr(1 downto 0) = "00") or (fb_size1 and fb_size0) or ((not fb_size1) and (not fb_size0));

    --  ADR==1
    --  HIGH WORD
    --  LONG UND LINE
    fb_b(1) <= to_std_logic(fb_adr(1 downto 0) = "01") or (fb_size1 and (not fb_size0) and (not fb_adr(1))) or (fb_size1 and fb_size0) or ((not fb_size1) and (not fb_size0));

    --  ADR==2
    --  LONG UND LINE
    fb_b(2) <= to_std_logic(fb_adr(1 downto 0) = "10") or (fb_size1 and fb_size0) or ((not fb_size1) and (not fb_size0));

    --  ADR==3
    --  LOW WORD
    --  LONG UND LINE
    fb_b(3) <= to_std_logic(fb_adr(1 downto 0) = "11") or (fb_size1 and (not fb_size0) and fb_adr(1)) or (fb_size1 and fb_size0) or ((not fb_size1) and (not fb_size0));

    --  CPU READ (REG DDR => CPU) AND WRITE (CPU => REG DDR)  --------------------------------------------------
    fb_regddr_0_clk_ctrl <= main_clk;


    process (fb_regddr_q, ddr_sel, bus_cyc_q, LINE, ddr_cs_q, nFB_OE, main_clk, ddr_config, nFB_WR)
        variable stdVec3: std_logic_vector(2 downto 0);
    begin
        fb_regddr_d <= fb_regddr_q;
        fb_vdoe <= (others => '0');
        fb_le <= (others => '0');
        video_ddr_ta <= '0';
        bus_cyc_end <= '0';
        
        stdVec3 := fb_regddr_q;
        
        case stdVec3 is
            when "000" =>
                fb_le(0) <= not nFB_WR;
                --  LOS WENN BEREIT ODER IMMER BEI LINE WRITE
                if (bus_cyc_q or (ddr_sel and LINE and (not nFB_WR))) = '1' then
                    fb_regddr_d <= "001";
                else
                    fb_regddr_d <= "000";
                end if;
            
            when "001" =>
                if ddr_cs_q = '1' then
                    fb_le(0) <= not nFB_WR;
                    video_ddr_ta <= '1';
                    if LINE ='1' then
                        fb_vdoe(0) <= (not nFB_OE) and (not ddr_config);
                        fb_regddr_d <= "010";
                    else
                        bus_cyc_end <= '1';
                        fb_vdoe(0) <= (not nFB_OE) and (not main_clk) and (not ddr_config);
                        fb_regddr_d <= "000";
                    end if;
                else
                    fb_regddr_d <= "000";
                end if;
            
            when "010" =>
                if ddr_cs_q = '1' then
                    fb_vdoe(1) <= (not nFB_OE) and (not ddr_config);
                    fb_le(1) <= not nFB_WR;
                    video_ddr_ta <= '1';
                    fb_regddr_d <= "011";
                else
                    fb_regddr_d <= "000";
                end if;
            
            when "011" =>
                if ddr_cs_q ='1' then
                    fb_vdoe(2) <= (not nFB_OE) and (not ddr_config);
                    fb_le(2) <= not nFB_WR;

                    --  BEI LINE WRITE EVT. WARTEN
                    if ((not bus_cyc_q) and LINE and (not nFB_WR)) = '1' then
                        fb_regddr_d <= "011";
                    else
                        video_ddr_ta <= '1';
                        fb_regddr_d <= "100";
                    end if;
                else
                    fb_regddr_d <= "000";
                end if;
    
            when "100" =>
                if ddr_cs_q = '1' then
                    fb_vdoe(3) <= (not nFB_OE) and (not main_clk) and (not ddr_config);
                    fb_le(3) <= not nFB_WR;
                    video_ddr_ta <= '1';
                    bus_cyc_end <= '1';
                    fb_regddr_d <= "000";
                else
                    fb_regddr_d <= "000";
                end if;
            
            when others =>
                
        end case;
        stdVec3 := (others => '0');  -- no storage needed
    end process;

    --  DDR STEUERUNG -----------------------------------------------------
    --  VIDEO RAM CONTROL REGISTER (IST in VIDEO_MUX_CTR) $F0000400: BIT 0: vcke; 1: !nVCS ;2:REFRESH ON , (0=FIFO UND CNT CLEAR); 3: CONFIG; 8: FIFO_ACTIVE;
    vcke <= VIDEO_RAM_CTR(0);
    nVCS <= not VIDEO_RAM_CTR(1);
    ddr_refresh_on <= VIDEO_RAM_CTR(2);
    ddr_config <= VIDEO_RAM_CTR(3);
    FIFO_ACTIVE <= VIDEO_RAM_CTR(8);

    -- ------------------------------
    cpu_row_adr <= fb_adr(26 downto 14);
    CPU_BA <= fb_adr(13 downto 12);
    CPU_COL_ADR <= fb_adr(11 downto 2);
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
    ddr_sel <= to_std_logic(FB_ALE='1' and fb_ad_in(31 downto 30) = "01");
    ddr_cs_clk <= main_clk;
    ddr_cs_ena <= FB_ALE;
    ddr_cs_d <= ddr_sel;

    --  WENN READ ODER WRITE B,W,L DDR SOFORT ANFORDERN, BEI WRITE LINE SPÃ„TER
    --  NICHT LINE ODER READ SOFORT LOS WENN NICHT CONFIG
    --  CONFIG SOFORT LOS
    --  LINE WRITE SPÃ„TER
    CPU_SIG <= (ddr_sel and (nFB_WR or (not LINE)) and (not ddr_config)) or
	 (ddr_sel and ddr_config) or (to_std_logic(fb_regddr_q = "010") and (not nFB_WR));
    CPU_REQ_clk <= DDR_SYNC_66M;

    --  HALTEN BUS CYC BEGONNEN ODER FERTIG
    CPU_REQ_d <= CPU_SIG or (to_std_logic(CPU_REQ_q='1' and fb_regddr_q /= "010"
	 and fb_regddr_q /= "100") and (not bus_cyc_end) and (not bus_cyc_q));
    bus_cyc_clk <= DDRCLK0;
    bus_cyc_d_1 <= bus_cyc_q and (not bus_cyc_end);

    --  STATE MACHINE SYNCHRONISIEREN -----------------
    MCS0_clk_ctrl <= DDRCLK0;
    MCS_d(0) <= main_clk;
    MCS_d(1) <= MCS_q(0);
    CPU_DDR_SYNC_clk <= DDRCLK0;

    --  NUR 1 WENN EIN
    CPU_DDR_SYNC_d <= to_std_logic(MCS_q = "10") and vcke and (not nVCS);

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


    process (DDR_SM_q, DDR_REFRESH_REQ_q, CPU_DDR_SYNC_q, ddr_config,
	 cpu_row_adr, FIFO_ROW_ADR, BLITTER_ROW_ADR, BLITTER_REQ_q, BLITTER_WR,
	 FIFO_AC_q, CPU_COL_ADR, BLITTER_COL_ADR, VA_S_q, CPU_BA, BLITTER_BA,
	 fb_b, CPU_AC_q, BLITTER_AC_q, FIFO_BANK_OK_q, FIFO_MW, FIFO_REQ_q,
	 VIDEO_ADR_CNT_q, FIFO_COL_ADR, ddr_sel, LINE, FIFO_BA, VA_P_q,
	 BA_P_q, CPU_REQ_q, fb_ad_in, nFB_WR, fb_size0, fb_size1,
	 DDR_REFRESH_SIG_q)
        variable stdVec6: std_logic_vector(5 downto 0);
    begin
        DDR_SM_d <= DDR_SM_q;
        BA_S_d <= "00";
        VA_S_d <= "0000000000000";
        BA_P_d <= "00";
        (VA_P_d(9), VA_P_d(8), VA_P_d(7), VA_P_d(6), VA_P_d(5), VA_P_d(4),
            VA_P_d(3), VA_P_d(2), VA_P_d(1), VA_P_d(0), VA_P_d(10)) <=
            std_logic_vector'("00000000000");
        SR_VDMP_d <= "00000000";
        VA_P_d(12 downto 11) <= "00";
        (FIFO_BANK_OK_d_1, FIFO_AC_d, SR_DDR_FB, SR_BLITTER_DACK, BLITTER_AC_d,
	    SR_DDR_WR_d, SR_DDRWR_D_SEL_d, CPU_AC_d, VA12_2, VA11_2, VA9_2,
	    VA8_2, VA7_2, VA6_2, VA5_2, VA4_2, VA3_2, VA2_2, VA1_2, VA0_2,
	    BA1_2, BA0_2, SR_FIFO_WRE_d, bus_cyc_d_2, VWE, VA10_2,
	    FIFO_BANK_NOT_OK, VCAS, VRAS) <=
	    std_logic_vector'("00000000000000000000000000000");
        stdVec6 := DDR_SM_q;
    
        case stdVec6 is
            when "000000" =>
                if (DDR_REFRESH_REQ_q)='1' then
                    DDR_SM_d <= "011111";
                    --  SYNCHRON UND EIN?
                elsif (CPU_DDR_SYNC_q)='1' then
                    --  JA
                    if (ddr_config)='1' then
                        DDR_SM_d <= "001000";
                        --  BEI WAIT UND LINE WRITE
                    elsif (CPU_REQ_q)='1' then
                        VA_S_d <= cpu_row_adr;
                        BA_S_d <= CPU_BA;
                        CPU_AC_d <= '1';
                        bus_cyc_d_2 <= '1';
                        DDR_SM_d <= "000010";
                    else
                        --  FIFO IST DEFAULT
                        if (FIFO_REQ_q or (not BLITTER_REQ_q))='1' then
                            VA_P_d <= FIFO_ROW_ADR;
                            BA_P_d <= FIFO_BA;
                            --  VORBESETZEN
                            FIFO_AC_d <= '1';
                        else
                            VA_P_d <= BLITTER_ROW_ADR;
                            BA_P_d <= BLITTER_BA;
                            --  VORBESETZEN
                            BLITTER_AC_d <= '1';
                        end if;
                        DDR_SM_d <= "000001";
                    end if;
                else
                    --  NEIN ->SYNCHRONISIEREN
                    DDR_SM_d <= "000000";
                end if;
        
            when "000001" =>
                --  SCHNELLZUGRIFF *** HIER IST PAGE IMMER NOT OK ***
                if (ddr_sel and (nFB_WR or (not LINE)))='1' then
                    VRAS <= '1';
                    (VA12_2, VA11_2, VA10_2, VA9_2, VA8_2, VA7_2, VA6_2, VA5_2, VA4_2, VA3_2, VA2_2, VA1_2, VA0_2) <= fb_ad_in(26 downto 14);
                    (BA1_2, BA0_2) <= fb_ad_in(13 downto 12);
                    --  AUTO PRECHARGE DA NICHT FIFO PAGE
                    VA_S_d(10) <= '1';
                    CPU_AC_d <= '1';
                    --  BUS CYCLUS LOSTRETEN
                    bus_cyc_d_2 <= '1';
                else
                    VRAS <= (FIFO_AC_q and FIFO_REQ_q) or (BLITTER_AC_q and BLITTER_REQ_q);
                    (VA12_2, VA11_2, VA10_2, VA9_2, VA8_2, VA7_2, VA6_2, VA5_2, VA4_2, VA3_2, VA2_2, VA1_2, VA0_2) <= VA_P_q;
                    (BA1_2, BA0_2) <= BA_P_q;
                    VA_S_d(10) <= not (FIFO_AC_q and FIFO_REQ_q);
                    FIFO_BANK_OK_d_1 <= FIFO_AC_q and FIFO_REQ_q;
                    FIFO_AC_d <= FIFO_AC_q and FIFO_REQ_q;
                    BLITTER_AC_d <= BLITTER_AC_q and BLITTER_REQ_q;
                end if;
                DDR_SM_d <= "000011";
            
            when "000010" =>
                VRAS <= '1';
                FIFO_BANK_NOT_OK <= '1';
                CPU_AC_d <= '1';

                --  BUS CYCLUS LOSTRETEN
                bus_cyc_d_2 <= '1';
                DDR_SM_d <= "000011";
      
            when "000011" =>
                CPU_AC_d <= CPU_AC_q;
                FIFO_AC_d <= FIFO_AC_q;
                BLITTER_AC_d <= BLITTER_AC_q;

                --  AUTO PRECHARGE WENN NICHT FIFO PAGE
                VA_S_d(10) <= VA_S_q(10);
                if (((not nFB_WR) and CPU_AC_q) or (BLITTER_WR and BLITTER_AC_q))='1' then
                    DDR_SM_d <= "010000";
                    --  CPU?
                elsif (CPU_AC_q)='1' then
                    VA_S_d(9 downto 0) <= CPU_COL_ADR;
                    BA_S_d <= CPU_BA;
                    DDR_SM_d <= "001110";
                    
                    --  FIFO?
                elsif (FIFO_AC_q)='1' then
                    VA_S_d(9 downto 0) <= FIFO_COL_ADR;
                    BA_S_d <= FIFO_BA;
                    DDR_SM_d <= "010110";
                elsif (BLITTER_AC_q)='1' then
                    VA_S_d(9 downto 0) <= BLITTER_COL_ADR;
                    BA_S_d <= BLITTER_BA;
                    DDR_SM_d <= "001110";
                else
                    --  READ
                    DDR_SM_d <= "000111";
                end if;
      
            when "001110" =>
                CPU_AC_d <= CPU_AC_q;
                BLITTER_AC_d <= BLITTER_AC_q;
                VCAS <= '1';

                --  READ DATEN FÃœR CPU
                SR_DDR_FB <= CPU_AC_q;

                --  BLITTER DACK AND BLITTER LATCH DATEN
                SR_BLITTER_DACK <= BLITTER_AC_q;
                DDR_SM_d <= "001111";
      
            when "001111" =>
                CPU_AC_d <= CPU_AC_q;
                BLITTER_AC_d <= BLITTER_AC_q;

                --  FIFO READ EINSCHIEBEN WENN BANK OK
                if (FIFO_REQ_q and FIFO_BANK_OK_q)='1' then
                    VA_S_d(9 downto 0) <= FIFO_COL_ADR;         
                    
                    --  MANUELL PRECHARGE
                    VA_S_d(10) <= '0';
                    BA_S_d <= FIFO_BA;
                    DDR_SM_d <= "011000";
                else
                    --  ALLE PAGES SCHLIESSEN
                    VA_S_d(10) <= '1';
                    --  WRITE
                    DDR_SM_d <= "011101";
                end if;
            
            when "010000" =>
                CPU_AC_d <= CPU_AC_q;
                BLITTER_AC_d <= BLITTER_AC_q;

                --  BLITTER ACK AND BLITTER LATCH DATEN
                SR_BLITTER_DACK <= BLITTER_AC_q;

                --  AUTO PRECHARGE WENN NICHT FIFO PAGE
                VA_S_d(10) <= VA_S_q(10);
                DDR_SM_d <= "010001";
            
            when "010001" =>
                CPU_AC_d <= CPU_AC_q;
                BLITTER_AC_d <= BLITTER_AC_q;
                VA_S_d(9 downto 0) <= (sizeIt(CPU_AC_q, 10) and CPU_COL_ADR) or (sizeIt(BLITTER_AC_q, 10) and BLITTER_COL_ADR);

                --  AUTO PRECHARGE WENN NICHT FIFO PAGE
                VA_S_d(10) <= VA_S_q(10);
                BA_S_d <= (std_logic_vector'(CPU_AC_q & CPU_AC_q) and CPU_BA) or (std_logic_vector'(BLITTER_AC_q & BLITTER_AC_q) and BLITTER_BA);

                --  BYTE ENABLE WRITE
                SR_VDMP_d(7 downto 4) <= fb_b;

                --  LINE ENABLE WRITE
                SR_VDMP_d(3 downto 0) <= sizeIt(LINE,4) and "1111";
                DDR_SM_d <= "010010";
      
            when "010010" =>
                CPU_AC_d <= CPU_AC_q;
                BLITTER_AC_d <= BLITTER_AC_q;
                VCAS <= '1';
                VWE <= '1';

                --  WRITE COMMAND CPU UND BLITTER if WRITER
                SR_DDR_WR_d <= '1';

                --  2. HÃ„LFTE WRITE DATEN SELEKTIEREN
                SR_DDRWR_D_SEL_d <= '1';

                --  WENN LINE DANN ACTIV
                SR_VDMP_d <= sizeIt(LINE,8) and "11111111";
                DDR_SM_d <= "010011";
            
            when "010011" =>
                CPU_AC_d <= CPU_AC_q;
                BLITTER_AC_d <= BLITTER_AC_q;

                --  WRITE COMMAND CPU UND BLITTER if WRITE
                SR_DDR_WR_d <= '1';

                --  2. HÃ„LFTE WRITE DATEN SELEKTIEREN
                SR_DDRWR_D_SEL_d <= '1';
                DDR_SM_d <= "010100";
      
            when "010100" =>
                DDR_SM_d <= "010101";
      
            when "010101" =>
                if (FIFO_REQ_q and FIFO_BANK_OK_q)='1' then
                    VA_S_d(9 downto 0) <= FIFO_COL_ADR;
                    
                    --  NON AUTO PRECHARGE
                    VA_S_d(10) <= '0';
                    BA_S_d <= FIFO_BA;
                    DDR_SM_d <= "011000";
                else
                    --  ALLE PAGES SCHLIESSEN
                    VA_S_d(10) <= '1';
                    --  FIFO READ
                    DDR_SM_d <= "011101";
                end if;
            
            when "010110" =>
                VCAS <= '1';

                --  DATEN WRITE FIFO
                SR_FIFO_WRE_d <= '1';
                DDR_SM_d <= "010111";
            
            when "010111" =>
                if (FIFO_REQ_q)='1' then

                    --  NEUE PAGE?
                    if VIDEO_ADR_CNT_q(7 downto 0) = "11111111" then

                        --  ALLE PAGES SCHLIESSEN
                        VA_S_d(10) <= '1';

                        --  BANK SCHLIESSEN
                        DDR_SM_d <= "011101";
                    else
                        VA_S_d(9 downto 0) <= std_logic_vector'(unsigned(FIFO_COL_ADR) + unsigned'("0000000100"));

                        --  NON AUTO PRECHARGE
                        VA_S_d(10) <= '0';
                        BA_S_d <= FIFO_BA;
                        DDR_SM_d <= "011000";
                    end if;
                else

                    --  ALLE PAGES SCHLIESSEN
                    VA_S_d(10) <= '1';

                    --  NOCH OFFEN LASSEN
                    DDR_SM_d <= "011101";
                end if;
      
            when "011000" =>
                VCAS <= '1';

                --  DATEN WRITE FIFO
                SR_FIFO_WRE_d <= '1';
                DDR_SM_d <= "011001";
            
            when "011001" =>
                if CPU_REQ_q='1' and (unsigned(FIFO_MW) > unsigned'("000000000")) then

                    --  ALLE PAGES SCHLIESEN
                    VA_S_d(10) <= '1';

                    --  BANK SCHLIESSEN
                    DDR_SM_d <= "011110";
                elsif (FIFO_REQ_q)='1' then

                    --  NEUE PAGE?
                    if VIDEO_ADR_CNT_q(7 downto 0) = "11111111" then

                        --  ALLE PAGES SCHLIESSEN
                        VA_S_d(10) <= '1';

                        --  BANK SCHLIESSEN
                        DDR_SM_d <= "011110";
                    else
                        VA_S_d(9 downto 0) <= std_logic_vector'(unsigned(FIFO_COL_ADR) + unsigned'("0000000100"));

                        --  NON AUTO PRECHARGE
                        VA_S_d(10) <= '0';
                        BA_S_d <= FIFO_BA;
                        DDR_SM_d <= "011010";
                    end if;
                else

                    --  ALLE PAGES SCHLIESEN
                    VA_S_d(10) <= '1';

                    --  BANK SCHLIESSEN
                    DDR_SM_d <= "011110";
                end if;
            
            when "011010" =>
                VCAS <= '1';

                --  DATEN WRITE FIFO
                SR_FIFO_WRE_d <= '1';

                --  NOTFALL?
                if (unsigned(FIFO_MW) < unsigned'("000000000")) then

                    --  JA->
                    DDR_SM_d <= "010111";
                else
                    DDR_SM_d <= "011011";
                end if;
            
            when "011011" =>
                if (FIFO_REQ_q)='1' then

                    --  NEUE PAGE?
                    if VIDEO_ADR_CNT_q(7 downto 0) = "11111111" then

                        --  ALLE BANKS SCHLIESEN
                        VA_S_d(10) <= '1';

                        --  BANK SCHLIESSEN
                        DDR_SM_d <= "011101";
                    else
                        VA_P_d(9 downto 0) <= std_logic_vector'(unsigned(FIFO_COL_ADR) + unsigned'("0000000100"));

                        --  NON AUTO PRECHARGE
                        VA_P_d(10) <= '0';
                        BA_P_d <= FIFO_BA;
                        DDR_SM_d <= "011100";
                    end if;
                else

                    --  ALLE BANKS SCHLIESEN
                    VA_S_d(10) <= '1';

                    --  BANK SCHLIESSEN
                    DDR_SM_d <= "011101";
                end if;
      
            when "011100" =>
                if (ddr_sel and (nFB_WR or (not LINE)))='1' and fb_ad_in(13 downto 12) /= FIFO_BA then
                    VRAS <= '1';
                    (VA12_2, VA11_2, VA10_2, VA9_2, VA8_2, VA7_2, VA6_2, VA5_2, VA4_2, VA3_2, VA2_2, VA1_2, VA0_2) <= fb_ad_in(26 downto 14);
                    (BA1_2, BA0_2) <= fb_ad_in(13 downto 12);
                    CPU_AC_d <= '1';

                    --  BUS CYCLUS LOSTRETEN
                    bus_cyc_d_2 <= '1';

                    --  AUTO PRECHARGE DA NICHT FIFO BANK
                    VA_S_d(10) <= '1';
                    DDR_SM_d <= "000011";
                else
                    VCAS <= '1';
                    (VA12_2, VA11_2, VA10_2, VA9_2, VA8_2, VA7_2, VA6_2, VA5_2, VA4_2, VA3_2, VA2_2, VA1_2, VA0_2) <= VA_P_q;
                    (BA1_2, BA0_2) <= BA_P_q;

                    --  DATEN WRITE FIFO
                    SR_FIFO_WRE_d <= '1';

                    --  CONFIG CYCLUS
                    DDR_SM_d <= "011001";
                end if;
            
            when "001000" =>
                DDR_SM_d <= "001001";
      
            when "001001" =>
                bus_cyc_d_2 <= CPU_REQ_q;
                DDR_SM_d <= "001010";
      
            when "001010" =>
                if (CPU_REQ_q)='1' then
                    DDR_SM_d <= "001011";
                else
                    DDR_SM_d <= "000000";
                end if;
            
            when "001011" =>
                DDR_SM_d <= "001100";
            
            when "001100" =>
                VA_S_d <= fb_ad_in(12 downto 0);
                BA_S_d <= fb_ad_in(14 downto 13);
                DDR_SM_d <= "001101";
      
            when "001101" =>

                --  NUR BEI LONG WRITE
                VRAS <= fb_ad_in(18) and (not nFB_WR) and (not fb_size0) and (not fb_size1);

                --  NUR BEI LONG WRITE
                VCAS <= fb_ad_in(17) and (not nFB_WR) and (not fb_size0) and (not fb_size1);

                --  NUR BEI LONG WRITE
                VWE <= fb_ad_in(16) and (not nFB_WR) and (not fb_size0) and (not fb_size1);

                --  CLOSE FIFO BANK
                DDR_SM_d <= "000111";
            
            when "011101" =>

                --  AUF NOT OK
                FIFO_BANK_NOT_OK <= '1';

                --  BÃ„NKE SCHLIESSEN
                VRAS <= '1';
                VWE <= '1';
                DDR_SM_d <= "000110";
            
            when "011110" =>
                --  AUF NOT OK
                FIFO_BANK_NOT_OK <= '1';

                --  BÃ„NKE SCHLIESSEN
                VRAS <= '1';
                VWE <= '1';

                --  REFRESH 70NS = 10 ZYCLEN
                DDR_SM_d <= "000000";
            
            when "011111" =>

                --  EIN CYCLUS VORLAUF UM BANKS ZU SCHLIESSEN
                if DDR_REFRESH_SIG_q = "1001" then

                    --  ALLE BANKS SCHLIESSEN
                    VRAS <= '1';
                    VWE <= '1';
                    VA10_2 <= '1';
                    FIFO_BANK_NOT_OK <= '1';
                    DDR_SM_d <= "100001";
                else
                    VCAS <= '1';
                    VRAS <= '1';
                    DDR_SM_d <= "100000";
                end if;
            
            when "100000" =>
                DDR_SM_d <= "100001";
            
            when "100001" =>
                DDR_SM_d <= "100010";
            
            when "100010" =>
                DDR_SM_d <= "100011";
            
            when "100011" =>
                --  LEERSCHLAUFE
                DDR_SM_d <= "000100";
      
            when "000100" =>
                DDR_SM_d <= "000101";
            
            when "000101" =>
                DDR_SM_d <= "000110";
            
            when "000110" =>
                DDR_SM_d <= "000111";
            
            when "000111" =>
                DDR_SM_d <= "000000";
            
            when others =>
        end case;
        stdVec6 := (others => '0');  -- no storage needed
    end process;

    -- -------------------------------------------------------------
    --  BLITTER ----------------------
    -- ---------------------------------------
    BLITTER_REQ_clk <= DDRCLK0;
    BLITTER_REQ_d <= BLITTER_SIG and (not ddr_config) and vcke and (not nVCS);
    BLITTER_ROW_ADR <= BLITTER_ADR(26 downto 14);
    BLITTER_BA(1) <= BLITTER_ADR(13);
    BLITTER_BA(0) <= BLITTER_ADR(12);
    BLITTER_COL_ADR <= BLITTER_ADR(11 downto 2);

    -- ----------------------------------------------------------------------------
    --  FIFO ---------------------------------
    -- ------------------------------------------------------
    FIFO_REQ_clk <= DDRCLK0;
    FIFO_REQ_d <= (to_std_logic((unsigned(FIFO_MW) < unsigned'("011001000"))) or
	 (to_std_logic((unsigned(FIFO_MW) < unsigned'("111110100"))) and
	 FIFO_REQ_q)) and FIFO_ACTIVE and (not CLEAR_FIFO_CNT_q) and (not
	 STOP_q) and (not ddr_config) and vcke and (not nVCS);
    FIFO_ROW_ADR <= VIDEO_ADR_CNT_q(22 downto 10);
    FIFO_BA(1) <= VIDEO_ADR_CNT_q(9);
    FIFO_BA(0) <= VIDEO_ADR_CNT_q(8);
    FIFO_COL_ADR <= std_logic_vector'(VIDEO_ADR_CNT_q(7) & VIDEO_ADR_CNT_q(6) &
	 VIDEO_ADR_CNT_q(5) & VIDEO_ADR_CNT_q(4) & VIDEO_ADR_CNT_q(3) &
	 VIDEO_ADR_CNT_q(2) & VIDEO_ADR_CNT_q(1) & VIDEO_ADR_CNT_q(0) & "00");
    FIFO_BANK_OK_clk <= DDRCLK0;
    FIFO_BANK_OK_d_2 <= FIFO_BANK_OK_q and (not FIFO_BANK_NOT_OK);

    --  ZÃ„HLER RÃœCKSETZEN WENN CLR FIFO ----------------
    CLR_FIFO_SYNC_clk <= DDRCLK0;

    --  SYNCHRONISIEREN
    CLR_FIFO_SYNC_d <= CLR_FIFO;
    CLEAR_FIFO_CNT_clk <= DDRCLK0;
    CLEAR_FIFO_CNT_d <= CLR_FIFO_SYNC_q or (not FIFO_ACTIVE);
    STOP_clk <= DDRCLK0;
    STOP_d <= CLR_FIFO_SYNC_q or CLEAR_FIFO_CNT_q;

    --  ZÃ„HLEN -----------------------------------------------
    VIDEO_ADR_CNT0_clk_ctrl <= DDRCLK0;
    VIDEO_ADR_CNT0_ena_ctrl <= SR_FIFO_WRE_q or CLEAR_FIFO_CNT_q;
    VIDEO_ADR_CNT_d <= (sizeIt(CLEAR_FIFO_CNT_q,23) and VIDEO_BASE_ADR) or
	 (sizeIt(not CLEAR_FIFO_CNT_q,23) and
	 (std_logic_vector'(unsigned(VIDEO_ADR_CNT_q) +
	 unsigned'("00000000000000000000001"))));
    
    VIDEO_BASE_ADR(22 downto 20) <= VIDEO_BASE_X_D_q;
    VIDEO_BASE_ADR(19 downto 12) <= VIDEO_BASE_H_D_q;
    VIDEO_BASE_ADR(11 downto 4) <= VIDEO_BASE_M_D_q;
    VIDEO_BASE_ADR(3 downto 0) <= VIDEO_BASE_L_D_q(7 downto 4);
    VDM_SEL <= VIDEO_BASE_L_D_q(3 downto 0);

    --  AKTUELLE VIDEO ADRESSE
    VIDEO_ACT_ADR(26 downto 4) <= std_logic_vector'(unsigned(VIDEO_ADR_CNT_q) -
	 unsigned(std_logic_vector'("00000000000000" & FIFO_MW)));
    VIDEO_ACT_ADR(3 downto 0) <= VDM_SEL;

    -- ---------------------------------------------------------------------------------------
    --  REFRESH: IMMER 8 AUFS MAL, ANFORDERUNG ALLE 7.8us X 8 STCK. = 62.4us = 2059->2048 33MHz CLOCKS
    -- ---------------------------------------------------------------------------------------
    DDR_REFRESH_CNT0_clk_ctrl <= CLK33M;

    --  ZÃ„HLEN 0-2047
    DDR_REFRESH_CNT_d <= std_logic_vector'(unsigned(DDR_REFRESH_CNT_q) + unsigned'("00000000001"));
    REFRESH_TIME_clk <= DDRCLK0;

    --  SYNC
    REFRESH_TIME_d <= to_std_logic(DDR_REFRESH_CNT_q = "00000000000") and (not main_clk);
    DDR_REFRESH_SIG0_clk_ctrl <= DDRCLK0;
    DDR_REFRESH_SIG0_ena_ctrl <= to_std_logic(REFRESH_TIME_q='1' or DDR_SM_q = "100011");

    --  9 STÃœCK (8 REFRESH UND 1 ALS VORLAUF)
    --  MINUS 1 WENN GEMACHT
    DDR_REFRESH_SIG_d <= (sizeIt(REFRESH_TIME_q,4) and "1001" and
	 sizeIt(ddr_refresh_on,4) and sizeIt(not ddr_config,4)) or (sizeIt(not
	 REFRESH_TIME_q,4) and (std_logic_vector'(unsigned(DDR_REFRESH_SIG_q) -
	 unsigned'("0001"))) and sizeIt(ddr_refresh_on,4) and sizeIt(not
	 ddr_config,4));
    DDR_REFRESH_REQ_clk <= DDRCLK0;
    DDR_REFRESH_REQ_d <= to_std_logic(DDR_REFRESH_SIG_q /= "0000") and ddr_refresh_on and (not REFRESH_TIME_q) and (not ddr_config);

    -- ---------------------------------------------------------
    --  VIDEO REGISTER -----------------------
    -- -------------------------------------------------------------------------------------------------------------------
    VIDEO_BASE_L_D0_clk_ctrl <= main_clk;

    --  820D/2
    VIDEO_BASE_L <= to_std_logic(((not nFB_CS1)='1') and fb_adr(19 downto 1) = "1111100000100000110");

    --  SORRY, NUR 16 BYT GRENZEN
    VIDEO_BASE_L_D_d <= fb_ad_in(23 downto 16);
    VIDEO_BASE_L_D0_ena_ctrl <= (not nFB_WR) and VIDEO_BASE_L and fb_b(1);
    VIDEO_BASE_M_D0_clk_ctrl <= main_clk;

    --  8203/2
    VIDEO_BASE_M <= to_std_logic(((not nFB_CS1)='1') and fb_adr(19 downto 1) = "1111100000100000001");
    VIDEO_BASE_M_D_d <= fb_ad_in(23 downto 16);
    VIDEO_BASE_M_D0_ena_ctrl <= (not nFB_WR) and VIDEO_BASE_M and fb_b(3);
    VIDEO_BASE_H_D0_clk_ctrl <= main_clk;

    --  8200-1/2
    VIDEO_BASE_H <= to_std_logic(((not nFB_CS1)='1') and fb_adr(19 downto 1) = "1111100000100000000");
    VIDEO_BASE_H_D_d <= fb_ad_in(23 downto 16);
    VIDEO_BASE_H_D0_ena_ctrl <= (not nFB_WR) and VIDEO_BASE_H and fb_b(1);
    VIDEO_BASE_X_D0_clk_ctrl <= main_clk;
    VIDEO_BASE_X_D_d <= fb_ad_in(26 downto 24);
    VIDEO_BASE_X_D0_ena_ctrl <= (not nFB_WR) and VIDEO_BASE_H and fb_b(0);

    --  8209/2
    VIDEO_CNT_L <= to_std_logic(((not nFB_CS1)='1') and fb_adr(19 downto 1) = "1111100000100000100");

    --  8207/2
    VIDEO_CNT_M <= to_std_logic(((not nFB_CS1)='1') and fb_adr(19 downto 1) = "1111100000100000011");

    --  8204,5/2
    VIDEO_CNT_H <= to_std_logic(((not nFB_CS1)='1') and fb_adr(19 downto 1) = "1111100000100000010");

    --  FB_AD[31..24] = lpm_bustri_BYT(
    --                         VIDEO_BASE_H  & (0, VIDEO_BASE_X_D[])
    --                       # VIDEO_CNT_H   & (0, VIDEO_ACT_ADR[26..24]),
    --                        (VIDEO_BASE_H # VIDEO_CNT_H) & !nFB_OE); 
    fb_ad_out(31 downto 24) <= "00000" & video_base_x_d_d when video_base_h and not nfb_oe else
                           "00000" & video_act_adr(26 downto 24) when video_cnt_h and not nfb_oe else
                           (others => 'Z');
                           
--    u0_data <= (sizeIt(VIDEO_BASE_L,8) and VIDEO_BASE_L_D_q) or
--	 (sizeIt(VIDEO_BASE_M,8) and VIDEO_BASE_M_D_q) or
--	 (sizeIt(VIDEO_BASE_H,8) and VIDEO_BASE_H_D_q) or
--	 (sizeIt(VIDEO_CNT_L,8) and VIDEO_ACT_ADR(7 downto 0)) or
--	 (sizeIt(VIDEO_CNT_M,8) and VIDEO_ACT_ADR(15 downto 8)) or
--	 (sizeIt(VIDEO_CNT_H,8) and VIDEO_ACT_ADR(23 downto 16));
--    u0_enabledt <= (VIDEO_BASE_L or VIDEO_BASE_M or VIDEO_BASE_H or VIDEO_CNT_L
--	 or VIDEO_CNT_M or VIDEO_CNT_H) and (not nFB_OE);
--  fb_ad_out(23 downto 16) <= u0_tridata when u0_enabledt else (others => 'Z');
    
    fb_ad_out(23 downto 16) <= video_base_l_d_q when video_base_l and not nfb_oe else
                               video_base_m_d_q when video_base_m and not nfb_oe else
                               video_base_h_d_q when video_base_h and not nfb_oe else
                               video_act_adr(7 downto 0) when video_cnt_l and not nfb_oe else
                               video_act_adr(15 downto 8) when video_cnt_m and not nfb_oe else
                               video_act_adr(23 downto 16) when video_cnt_h and not nfb_oe else
                               (others => 'Z');
    fb_ad_out(15 downto 0) <= (others => 'Z');
    
    -- Assignments added to explicitly combine the
    -- effects of multiple drivers in the source
    FIFO_BANK_OK_d <= FIFO_BANK_OK_d_1 or FIFO_BANK_OK_d_2;
    bus_cyc_d <= bus_cyc_d_1 or bus_cyc_d_2;
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

end architecture rtl;
