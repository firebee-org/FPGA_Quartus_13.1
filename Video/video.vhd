-- Copyright (C) 1991-2014 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 13.1.4 Build 182 03/12/2014 SJ Web Edition"
-- CREATED		"Mon Jan 11 09:20:56 2016"

LIBRARY ieee;
    USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY video IS 
	PORT
	(
		MAIN_CLK        : IN  std_logic;
		nFB_CS1         : IN  std_logic;
		nFB_CS2         : IN  std_logic;
		nFB_CS3         : IN  std_logic;
		nFB_WR          : IN  std_logic;
		FB_SIZE0        : IN  std_logic;
		FB_SIZE1        : IN  std_logic;
		nRSTO           : IN  std_logic;
		nFB_OE          : IN  std_logic;
		FB_ALE          : IN  std_logic;
		DDR_SYNC_66M    : IN  std_logic;
		CLK33M          : IN  std_logic;
		CLK25M          : IN  std_logic;
		CLK_VIDEO       : IN  std_logic;
		VR_BUSY         : IN  std_logic;
		DDRCLK          : IN  std_logic_vector(3 DOWNTO 0);
		FB_AD           : INOUT  std_logic_vector(31 DOWNTO 0);
		FB_ADR          : IN  std_logic_vector(31 DOWNTO 0);
		VD              : INOUT  std_logic_vector(31 DOWNTO 0);
		VDQS            : INOUT  std_logic_vector(3 DOWNTO 0);
		VR_D            : IN  std_logic_vector(8 DOWNTO 0);
		nBLANK          : OUT  std_logic;
		nVWE            : OUT  std_logic;
		nVCAS           : OUT  std_logic;
		nVRAS           : OUT  std_logic;
		nVCS            : OUT  std_logic;
		nPD_VGA         : OUT  std_logic;
		VCKE            : OUT  std_logic;
		VSYNC           : OUT  std_logic;
		HSYNC           : OUT  std_logic;
		nSYNC           : OUT  std_logic;
		VIDEO_TA        : OUT  std_logic;
		PIXEL_CLK       : OUT  std_logic;
		VIDEO_RECONFIG  : OUT  std_logic;
		VR_WR           : OUT  std_logic;
		VR_RD           : OUT  std_logic;
		BA              : OUT  std_logic_vector(1 DOWNTO 0);
		VA              : OUT  std_logic_vector(12 DOWNTO 0);
		VB              : OUT  std_logic_vector(7 DOWNTO 0);
		VDM             : OUT  std_logic_vector(3 DOWNTO 0);
		VG              : OUT  std_logic_vector(7 DOWNTO 0);
		VR              : OUT  std_logic_vector(7 DOWNTO 0)
	);
END video;

ARCHITECTURE rtl OF video IS 
    ATTRIBUTE black_box     : BOOLEAN;
    ATTRIBUTE noopt         : BOOLEAN;
    
    COMPONENT mux41_0
        PORT
        (
            S0  : IN std_logic;
            S1  : IN std_logic;
            D0  : IN std_logic;
            INH : IN std_logic;
            D1  : IN std_logic;
            Q   : OUT std_logic
        );
    END COMPONENT mux41_0;
    
    ATTRIBUTE black_box OF mux41_0: COMPONENT IS true;
    ATTRIBUTE noopt OF mux41_0: COMPONENT IS true;
    
    COMPONENT mux41_1
        PORT
        (
            S0  : IN std_logic;
            S1  : IN std_logic;
            D0  : IN std_logic;
            INH : IN std_logic;
            D1  : IN std_logic;
            Q   : OUT std_logic
        );
    END COMPONENT mux41_1;
    
    ATTRIBUTE black_box OF mux41_1: COMPONENT IS true;
    ATTRIBUTE noopt OF mux41_1: COMPONENT IS true;
    
    COMPONENT mux41_2
        PORT
        (
            S0  : IN std_logic;
            D2  : IN std_logic;
            S1  : IN std_logic;
            D0  : IN std_logic;
            INH : IN std_logic;
            D1  : IN std_logic;
            Q   : OUT std_logic
        );
    END COMPONENT mux41_2;
    
    ATTRIBUTE black_box OF mux41_2: COMPONENT IS true;
    ATTRIBUTE noopt OF mux41_2: COMPONENT IS true;
    
    COMPONENT mux41_3
        PORT
        (
            S0  : IN std_logic;
            D2  : IN std_logic;
            S1  : IN std_logic;
            D0  : IN std_logic;
            INH : IN std_logic;
            D1  : IN std_logic;
            Q   : OUT std_logic
        );
    END COMPONENT mux41_3;
    
    ATTRIBUTE black_box OF mux41_3: COMPONENT IS true;
    ATTRIBUTE noopt OF mux41_3: COMPONENT IS true;
    
    COMPONENT mux41_4
        PORT
        (
            S0  : IN std_logic;
            D2  : IN std_logic;
            S1  : IN std_logic;
            D0  : IN std_logic;
            INH : IN std_logic;
            D1  : IN std_logic;
            Q   : OUT std_logic
        );
    END COMPONENT;
    
    ATTRIBUTE black_box OF mux41_4: COMPONENT IS true;
    ATTRIBUTE noopt OF mux41_4: COMPONENT IS true;
    
    COMPONENT mux41_5
        PORT
        (
            S0  : IN std_logic;
            D2  : IN std_logic;
            S1  : IN std_logic;
            D0  : IN std_logic;
            INH : IN std_logic;
            D1  : IN std_logic;
            Q   : OUT std_logic
        );
    END COMPONENT;
    
    ATTRIBUTE black_box OF mux41_5: COMPONENT IS true;
    ATTRIBUTE noopt OF mux41_5: COMPONENT IS true;
    
    COMPONENT altdpram2
        PORT
        (
            wren_a      : IN std_logic;
            wren_b      : IN std_logic;
            clock_a     : IN std_logic;
            clock_b     : IN std_logic;
            address_a   : IN std_logic_vector(7 DOWNTO 0);
            address_b   : IN std_logic_vector(7 DOWNTO 0);
            data_a      : IN std_logic_vector(7 DOWNTO 0);
            data_b      : IN std_logic_vector(7 DOWNTO 0);
            q_a         : OUT std_logic_vector(7 DOWNTO 0);
            q_b         : OUT std_logic_vector(7 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT ddr_ctr
        PORT
        (
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
            BLITTER_SIG     : IN std_logic;
            BLITTER_WR      : IN std_logic;
            DDRCLK0         : IN std_logic;
            CLK33M          : IN std_logic;
            CLR_FIFO        : IN std_logic;
            BLITTER_ADR     : IN std_logic_vector(31 DOWNTO 0);
            FB_AD           : INOUT std_logic_vector(31 DOWNTO 0);
            FB_ADR          : IN std_logic_vector(31 DOWNTO 0);
            FIFO_MW         : IN std_logic_vector(8 DOWNTO 0);
            VIDEO_RAM_CTR   : IN std_logic_vector(15 DOWNTO 0);
            nVWE            : OUT std_logic;
            nVRAS           : OUT std_logic;
            nVCS            : OUT std_logic;
            VCKE            : OUT std_logic;
            nVCAS           : OUT std_logic;
            SR_FIFO_WRE     : OUT std_logic;
            SR_DDR_FB       : OUT std_logic;
            SR_DDR_WR       : OUT std_logic;
            SR_DDRWR_D_SEL  : OUT std_logic;
            VIDEO_DDR_TA    : OUT std_logic;
            SR_BLITTER_DACK : OUT std_logic;
            DDRWR_D_SEL1    : OUT std_logic;
            BA              : OUT std_logic_vector(1 DOWNTO 0);
            FB_LE           : OUT std_logic_vector(3 DOWNTO 0);
            FB_VDOE         : OUT std_logic_vector(3 DOWNTO 0);
            SR_VDMP         : OUT std_logic_vector(7 DOWNTO 0);
            VA              : OUT std_logic_vector(12 DOWNTO 0);
            VDM_SEL         : OUT std_logic_vector(3 DOWNTO 0)
        );
    END COMPONENT ddr_ctr;
    
    COMPONENT altdpram1
        PORT
        (
            wren_a      : IN std_logic;
            wren_b      : IN std_logic;
            clock_a     : IN std_logic;
            clock_b     : IN std_logic;
            address_a   : IN std_logic_vector(7 DOWNTO 0);
            address_b   : IN std_logic_vector(7 DOWNTO 0);
            data_a      : IN std_logic_vector(5 DOWNTO 0);
            data_b      : IN std_logic_vector(5 DOWNTO 0);
            q_a         : OUT std_logic_vector(5 DOWNTO 0);
            q_b         : OUT std_logic_vector(5 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT lpm_fifo_dc0
        PORT
        (
            wrreq   : IN std_logic;
            wrclk   : IN std_logic;
            rdreq   : IN std_logic;
            rdclk   : IN std_logic;
            aclr    : IN std_logic;
            data    : IN std_logic_vector(127 DOWNTO 0);
            rdempty : OUT std_logic;
            q       : OUT std_logic_vector(127 DOWNTO 0);
            wrusedw : OUT std_logic_vector(8 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT altddio_bidir0
        PORT
        (
            oe          : IN std_logic;
            inclock     : IN std_logic;
            outclock    : IN std_logic;
            datain_h    : IN std_logic_vector(31 DOWNTO 0);
            datain_l    : IN std_logic_vector(31 DOWNTO 0);
            padio       : INOUT std_logic_vector(31 DOWNTO 0);
            combout     : OUT std_logic_vector(31 DOWNTO 0);
            dataout_h   : OUT std_logic_vector(31 DOWNTO 0);
            dataout_l   : OUT std_logic_vector(31 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT lpm_ff4
        PORT
        (
            clock   : IN std_logic;
            data    : IN std_logic_vector(15 DOWNTO 0);
            q       : OUT std_logic_vector(15 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT lpm_muxvdm
        PORT
        (
            data0x  : IN std_logic_vector(127 DOWNTO 0);
            data10x : IN std_logic_vector(127 DOWNTO 0);
            data11x : IN std_logic_vector(127 DOWNTO 0);
            data12x : IN std_logic_vector(127 DOWNTO 0);
            data13x : IN std_logic_vector(127 DOWNTO 0);
            data14x : IN std_logic_vector(127 DOWNTO 0);
            data15x : IN std_logic_vector(127 DOWNTO 0);
            data1x  : IN std_logic_vector(127 DOWNTO 0);
            data2x  : IN std_logic_vector(127 DOWNTO 0);
            data3x  : IN std_logic_vector(127 DOWNTO 0);
            data4x  : IN std_logic_vector(127 DOWNTO 0);
            data5x  : IN std_logic_vector(127 DOWNTO 0);
            data6x  : IN std_logic_vector(127 DOWNTO 0);
            data7x  : IN std_logic_vector(127 DOWNTO 0);
            data8x  : IN std_logic_vector(127 DOWNTO 0);
            data9x  : IN std_logic_vector(127 DOWNTO 0);
            sel     : IN std_logic_vector(3 DOWNTO 0);
            result  : OUT std_logic_vector(127 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT lpm_mux3
        PORT
        (
            data1   : IN std_logic;
            data0   : IN std_logic;
            sel     : IN std_logic;
            result  : OUT std_logic
        );
    END COMPONENT;
    
    COMPONENT lpm_bustri_long
        PORT
        (
            enabledt    : IN std_logic;
            data        : IN std_logic_vector(31 DOWNTO 0);
            tridata     : INOUT std_logic_vector(31 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT lpm_ff5
        PORT
        (
            clock   : IN std_logic;
            data    : IN std_logic_vector(7 DOWNTO 0);
            q       : OUT std_logic_vector(7 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT lpm_ff1
        PORT
        (
            clock   : IN std_logic;
            data    : IN std_logic_vector(31 DOWNTO 0);
            q       : OUT std_logic_vector(31 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT lpm_ff0
        PORT
        (
            clock   : IN std_logic;
            enable  : IN std_logic;
            data    : IN std_logic_vector(31 DOWNTO 0);
            q       : OUT std_logic_vector(31 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT altddio_out0
        PORT
        (
            outclock    : IN std_logic;
            datain_h    : IN std_logic_vector(3 DOWNTO 0);
            datain_l    : IN std_logic_vector(3 DOWNTO 0);
            dataout     : OUT std_logic_vector(3 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT lpm_mux0
        PORT
        (
            clock   : IN std_logic;
            data0x  : IN std_logic_vector(31 DOWNTO 0);
            data1x  : IN std_logic_vector(31 DOWNTO 0);
            data2x  : IN std_logic_vector(31 DOWNTO 0);
            data3x  : IN std_logic_vector(31 DOWNTO 0);
            sel     : IN std_logic_vector(1 DOWNTO 0);
            result  : OUT std_logic_vector(31 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT lpm_mux5
        PORT
        (
            data0x  : IN std_logic_vector(63 DOWNTO 0);
            data1x  : IN std_logic_vector(63 DOWNTO 0);
            data2x  : IN std_logic_vector(63 DOWNTO 0);
            data3x  : IN std_logic_vector(63 DOWNTO 0);
            sel     : IN std_logic_vector(1 DOWNTO 0);
            result  : OUT std_logic_vector(63 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT lpm_constant2
        PORT
        (
            result  : OUT std_logic_vector(7 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT lpm_mux1
        PORT
        (
            clock   : IN std_logic;
            data0x  : IN std_logic_vector(15 DOWNTO 0);
            data1x  : IN std_logic_vector(15 DOWNTO 0);
            data2x  : IN std_logic_vector(15 DOWNTO 0);
            data3x  : IN std_logic_vector(15 DOWNTO 0);
            data4x  : IN std_logic_vector(15 DOWNTO 0);
            data5x  : IN std_logic_vector(15 DOWNTO 0);
            data6x  : IN std_logic_vector(15 DOWNTO 0);
            data7x  : IN std_logic_vector(15 DOWNTO 0);
            sel     : IN std_logic_vector(2 DOWNTO 0);
            result  : OUT std_logic_vector(15 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT lpm_mux2
        PORT
        (
            clock   : IN std_logic;
            data0x  : IN std_logic_vector(7 DOWNTO 0);
            data10x : IN std_logic_vector(7 DOWNTO 0);
            data11x : IN std_logic_vector(7 DOWNTO 0);
            data12x : IN std_logic_vector(7 DOWNTO 0);
            data13x : IN std_logic_vector(7 DOWNTO 0);
            data14x : IN std_logic_vector(7 DOWNTO 0);
            data15x : IN std_logic_vector(7 DOWNTO 0);
            data1x  : IN std_logic_vector(7 DOWNTO 0);
            data2x  : IN std_logic_vector(7 DOWNTO 0);
            data3x  : IN std_logic_vector(7 DOWNTO 0);
            data4x  : IN std_logic_vector(7 DOWNTO 0);
            data5x  : IN std_logic_vector(7 DOWNTO 0);
            data6x  : IN std_logic_vector(7 DOWNTO 0);
            data7x  : IN std_logic_vector(7 DOWNTO 0);
            data8x  : IN std_logic_vector(7 DOWNTO 0);
            data9x  : IN std_logic_vector(7 DOWNTO 0);
            sel     : IN std_logic_vector(3 DOWNTO 0);
            result  : OUT std_logic_vector(7 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT lpm_shiftreg4
        PORT
        (
            clock       : IN std_logic;
            shiftin     : IN std_logic;
            shiftout    : OUT std_logic
        );
    END COMPONENT;
    
    COMPONENT lpm_latch0
        PORT
        (
            gate    : IN std_logic;
            data    : IN std_logic_vector(31 DOWNTO 0);
            q       : OUT std_logic_vector(31 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT lpm_ff6
        PORT
        (
            clock   : IN std_logic;
            enable  : IN std_logic;
            data    : IN std_logic_vector(127 DOWNTO 0);
            q       : OUT std_logic_vector(127 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT lpm_ff3
        PORT
        (
            clock   : IN std_logic;
            data    : IN std_logic_vector(23 DOWNTO 0);
            q       : OUT std_logic_vector(23 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT altddio_out2
        PORT
        (
            outclock    : IN std_logic;
            datain_h    : IN std_logic_vector(23 DOWNTO 0);
            datain_l    : IN std_logic_vector(23 DOWNTO 0);
            dataout     : OUT std_logic_vector(23 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT lpm_bustri1
        PORT
        (
            enabledt    : IN std_logic;
            data        : IN std_logic_vector(2 DOWNTO 0);
            tridata     : INOUT std_logic_vector(2 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT lpm_bustri_byt
        PORT
        (
            enabledt    : IN std_logic;
            data        : IN std_logic_vector(7 DOWNTO 0);
            tridata     : INOUT std_logic_vector(7 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT lpm_constant0
        PORT
        (
            result  : OUT std_logic_vector(4 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT lpm_muxdz
        PORT
        (
            clock   : IN std_logic;
            clken   : IN std_logic;
            sel     : IN std_logic;
            data0x  : IN std_logic_vector(127 DOWNTO 0);
            data1x  : IN std_logic_vector(127 DOWNTO 0);
            result  : OUT std_logic_vector(127 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT lpm_fifodz
        PORT
        (
            wrreq   : IN std_logic;
            rdreq   : IN std_logic;
            clock   : IN std_logic;
            aclr    : IN std_logic;
            data    : IN std_logic_vector(127 DOWNTO 0);
            q       : OUT std_logic_vector(127 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT lpm_bustri3
        PORT
        (
            enabledt    : IN std_logic;
            data        : IN std_logic_vector(5 DOWNTO 0);
            tridata     : INOUT std_logic_vector(5 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT lpm_mux6
        PORT
        (
            clock   : IN std_logic;
            data0x  : IN std_logic_vector(23 DOWNTO 0);
            data1x  : IN std_logic_vector(23 DOWNTO 0);
            data2x  : IN std_logic_vector(23 DOWNTO 0);
            data3x  : IN std_logic_vector(23 DOWNTO 0);
            data4x  : IN std_logic_vector(23 DOWNTO 0);
            data5x  : IN std_logic_vector(23 DOWNTO 0);
            data6x  : IN std_logic_vector(23 DOWNTO 0);
            data7x  : IN std_logic_vector(23 DOWNTO 0);
            sel     : IN std_logic_vector(2 DOWNTO 0);
            result  : OUT std_logic_vector(23 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT lpm_constant1
        PORT
        (
            result  : OUT std_logic_vector(1 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT lpm_mux4
        PORT
        (
            sel     : IN std_logic;
            data0x  : IN std_logic_vector(6 DOWNTO 0);
            data1x  : IN std_logic_vector(6 DOWNTO 0);
            result  : OUT std_logic_vector(6 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT lpm_constant3
        PORT
        (
            result  : OUT std_logic_vector(6 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT lpm_shiftreg6
        PORT
        (
            clock   : IN std_logic;
            shiftin : IN std_logic;
            q       : OUT std_logic_vector(4 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT lpm_shiftreg0
        PORT
        (
            load        : IN std_logic;
            clock       : IN std_logic;
            shiftin     : IN std_logic;
            data        : IN std_logic_vector(15 DOWNTO 0);
            shiftout    : OUT std_logic
        );
    END COMPONENT;
    
    COMPONENT altdpram0
        PORT
        (
            wren_a      : IN std_logic;
            wren_b      : IN std_logic;
            clock_a     : IN std_logic;
            clock_b     : IN std_logic;
            address_a   : IN std_logic_vector(3 DOWNTO 0);
            address_b   : IN std_logic_vector(3 DOWNTO 0);
            data_a      : IN std_logic_vector(2 DOWNTO 0);
            data_b      : IN std_logic_vector(2 DOWNTO 0);
            q_a         : OUT std_logic_vector(2 DOWNTO 0);
            q_b         : OUT std_logic_vector(2 DOWNTO 0)
        );
    END COMPONENT;
    
    SIGNAL	ACP_CLUT_RD     :  std_logic;
    SIGNAL	ACP_CLUT_WR     :  std_logic_vector(3 DOWNTO 0);
    SIGNAL	BLITTER_ADR     :  std_logic_vector(31 DOWNTO 0);
    SIGNAL	BLITTER_DACK    :  std_logic_vector(4 DOWNTO 0);
    SIGNAL	BLITTER_DIN     :  std_logic_vector(127 DOWNTO 0);
    SIGNAL	BLITTER_DOUT    :  std_logic_vector(127 DOWNTO 0);
    SIGNAL	BLITTER_ON      :  std_logic;
    SIGNAL	BLITTER_RUN     :  std_logic;
    SIGNAL	BLITTER_SIG     :  std_logic;
    SIGNAL	BLITTER_TA      :  std_logic;
    SIGNAL	BLITTER_WR      :  std_logic;
    SIGNAL	BORDER_COLOR    :  std_logic_vector(23 DOWNTO 0);
    SIGNAL	CC16            :  std_logic_vector(23 DOWNTO 0);
    SIGNAL	CC24            :  std_logic_vector(31 DOWNTO 0);
    SIGNAL	CCA             :  std_logic_vector(23 DOWNTO 0);
    SIGNAL	CCF             :  std_logic_vector(23 DOWNTO 0);
    SIGNAL	CCS             :  std_logic_vector(23 DOWNTO 0);
    SIGNAL	CCSEL           :  std_logic_vector(2 DOWNTO 0);
    SIGNAL	CLR_FIFO        :  std_logic;
    SIGNAL	CLUT_ADR        :  std_logic_vector(7 DOWNTO 0);
    SIGNAL	CLUT_ADR1A      :  std_logic;
    SIGNAL	CLUT_ADR2A      :  std_logic;
    SIGNAL	CLUT_ADR3A      :  std_logic;
    SIGNAL	CLUT_ADR4A      :  std_logic;
    SIGNAL	CLUT_ADR5A      :  std_logic;
    SIGNAL	CLUT_ADR6A      :  std_logic;
    SIGNAL	CLUT_ADR7A      :  std_logic;
    SIGNAL	CLUT_MUX_ADR    :  std_logic_vector(3 DOWNTO 0);
    SIGNAL	CLUT_OFF        :  std_logic_vector(3 DOWNTO 0);
    SIGNAL	COLOR1          :  std_logic;
    SIGNAL	COLOR2          :  std_logic;
    SIGNAL	COLOR4          :  std_logic;
    SIGNAL	COLOR8          :  std_logic;
    SIGNAL	DDR_FB          :  std_logic_vector(4 DOWNTO 0);
    SIGNAL	DDR_WR          :  std_logic;
    SIGNAL	DDRWR_D_SEL     :  std_logic_vector(1 DOWNTO 0);
    SIGNAL	DOP_FIFO_CLR    :  std_logic;
    SIGNAL	FALCON_CLUT_RDH :  std_logic;
    SIGNAL	FALCON_CLUT_RDL :  std_logic;
    SIGNAL	FALCON_CLUT_WR  :  std_logic_vector(3 DOWNTO 0);
    SIGNAL	FB_DDR          :  std_logic_vector(127 DOWNTO 0);
    SIGNAL	FB_LE           :  std_logic_vector(3 DOWNTO 0);
    SIGNAL	FB_VDOE         :  std_logic_vector(3 DOWNTO 0);
    SIGNAL	FIFO_D          :  std_logic_vector(127 DOWNTO 0);
    SIGNAL	FIFO_MW         :  std_logic_vector(8 DOWNTO 0);
    SIGNAL	FIFO_RDE        :  std_logic;
    SIGNAL	FIFO_WRE        :  std_logic;
    SIGNAL	INTER_ZEI       :  std_logic;
    SIGNAL	nFB_BURST       :  std_logic := '0';
    SIGNAL	pixel_clk_i     :  std_logic;
    SIGNAL	SR_BLITTER_DACK :  std_logic;
    SIGNAL	SR_DDR_FB       :  std_logic;
    SIGNAL	SR_DDR_WR       :  std_logic;
    SIGNAL	SR_DDRWR_D_SEL  :  std_logic;
    SIGNAL	SR_FIFO_WRE     :  std_logic;
    SIGNAL	SR_VDMP         :  std_logic_vector(7 DOWNTO 0);
    SIGNAL	ST_CLUT_RD      :  std_logic;
    SIGNAL	ST_CLUT_WR      :  std_logic_vector(1 DOWNTO 0);
    SIGNAL	VDM_SEL         :  std_logic_vector(3 DOWNTO 0);
    SIGNAL	VDMA            :  std_logic_vector(127 DOWNTO 0);
    SIGNAL	VDMB            :  std_logic_vector(127 DOWNTO 0);
    SIGNAL	VDMC            :  std_logic_vector(127 DOWNTO 0);
    SIGNAL	VDMP            :  std_logic_vector(7 DOWNTO 0);
    SIGNAL	VDOUT_OE        :  std_logic;
    SIGNAL	VDP_IN          :  std_logic_vector(63 DOWNTO 0);
    SIGNAL	VDP_OUT         :  std_logic_vector(63 DOWNTO 0);
    SIGNAL	VDR             :  std_logic_vector(31 DOWNTO 0);
    SIGNAL	VDVZ            :  std_logic_vector(127 DOWNTO 0);
    SIGNAL	VIDEO_DDR_TA    :  std_logic;
    SIGNAL	VIDEO_MOD_TA    :  std_logic;
    SIGNAL	VIDEO_RAM_CTR   :  std_logic_vector(15 DOWNTO 0);
    SIGNAL	ZR_C8           :  std_logic_vector(7 DOWNTO 0);
    SIGNAL	ZR_C8B          :  std_logic_vector(7 DOWNTO 0);
    SIGNAL	SYNTHESIZED_WIRE_0 :  std_logic;
    SIGNAL	SYNTHESIZED_WIRE_1 :  std_logic;
    SIGNAL	SYNTHESIZED_WIRE_2 :  std_logic;
    SIGNAL	SYNTHESIZED_WIRE_3 :  std_logic;
    SIGNAL	SYNTHESIZED_WIRE_4 :  std_logic;
    SIGNAL	SYNTHESIZED_WIRE_5 :  std_logic;
    SIGNAL	SYNTHESIZED_WIRE_60 :  std_logic;
    SIGNAL	SYNTHESIZED_WIRE_7 :  std_logic_vector(15 DOWNTO 0);
    SIGNAL	DFF_inst93      :  std_logic;
    SIGNAL	SYNTHESIZED_WIRE_8 :  std_logic;
    SIGNAL	SYNTHESIZED_WIRE_9 :  std_logic;
    SIGNAL	SYNTHESIZED_WIRE_61 :  std_logic;
    SIGNAL	SYNTHESIZED_WIRE_11 :  std_logic_vector(31 DOWNTO 0);
    SIGNAL	SYNTHESIZED_WIRE_12 :  std_logic_vector(7 DOWNTO 0);
    SIGNAL	SYNTHESIZED_WIRE_13 :  std_logic_vector(31 DOWNTO 0);
    SIGNAL	SYNTHESIZED_WIRE_14 :  std_logic_vector(31 DOWNTO 0);
    SIGNAL	SYNTHESIZED_WIRE_15 :  std_logic_vector(31 DOWNTO 0);
    SIGNAL	SYNTHESIZED_WIRE_16 :  std_logic;
    SIGNAL	SYNTHESIZED_WIRE_18 :  std_logic;
    SIGNAL	SYNTHESIZED_WIRE_19 :  std_logic;
    SIGNAL	SYNTHESIZED_WIRE_20 :  std_logic;
    SIGNAL	SYNTHESIZED_WIRE_21 :  std_logic;
    SIGNAL	SYNTHESIZED_WIRE_22 :  std_logic;
    SIGNAL	SYNTHESIZED_WIRE_23 :  std_logic;
    SIGNAL	SYNTHESIZED_WIRE_24 :  std_logic;
    SIGNAL	SYNTHESIZED_WIRE_25 :  std_logic_vector(23 DOWNTO 0);
    SIGNAL	SYNTHESIZED_WIRE_26 :  std_logic_vector(23 DOWNTO 0);
    SIGNAL	SYNTHESIZED_WIRE_62 :  std_logic_vector(23 DOWNTO 0);
    SIGNAL	SYNTHESIZED_WIRE_29 :  std_logic_vector(2 DOWNTO 0);
    SIGNAL	SYNTHESIZED_WIRE_30 :  std_logic_vector(7 DOWNTO 0);
    SIGNAL	SYNTHESIZED_WIRE_31 :  std_logic_vector(2 DOWNTO 0);
    SIGNAL	SYNTHESIZED_WIRE_32 :  std_logic_vector(7 DOWNTO 0);
    SIGNAL	SYNTHESIZED_WIRE_33 :  std_logic_vector(7 DOWNTO 0);
    SIGNAL	SYNTHESIZED_WIRE_34 :  std_logic_vector(2 DOWNTO 0);
    SIGNAL	SYNTHESIZED_WIRE_63 :  std_logic_vector(127 DOWNTO 0);
    SIGNAL	SYNTHESIZED_WIRE_36 :  std_logic_vector(127 DOWNTO 0);
    SIGNAL	SYNTHESIZED_WIRE_38 :  std_logic;
    SIGNAL	SYNTHESIZED_WIRE_40 :  std_logic;
    SIGNAL	SYNTHESIZED_WIRE_41 :  std_logic_vector(5 DOWNTO 0);
    SIGNAL	SYNTHESIZED_WIRE_42 :  std_logic_vector(23 DOWNTO 0);
    SIGNAL	SYNTHESIZED_WIRE_43 :  std_logic_vector(23 DOWNTO 0);
    SIGNAL	SYNTHESIZED_WIRE_44 :  std_logic_vector(5 DOWNTO 0);
    SIGNAL	SYNTHESIZED_WIRE_45 :  std_logic_vector(5 DOWNTO 0);
    SIGNAL	SYNTHESIZED_WIRE_46 :  std_logic;
    SIGNAL	SYNTHESIZED_WIRE_47 :  std_logic_vector(6 DOWNTO 0);
    SIGNAL	SYNTHESIZED_WIRE_48 :  std_logic_vector(31 DOWNTO 0);
    SIGNAL	DFF_inst91          :  std_logic;
    SIGNAL	SYNTHESIZED_WIRE_64 :  std_logic;
    SIGNAL	SYNTHESIZED_WIRE_49 :  std_logic;
    SIGNAL	SYNTHESIZED_WIRE_50 :  std_logic;
    SIGNAL	SYNTHESIZED_WIRE_51 :  std_logic;
    SIGNAL	SYNTHESIZED_WIRE_52 :  std_logic;
    SIGNAL	SYNTHESIZED_WIRE_53 :  std_logic;
    SIGNAL	SYNTHESIZED_WIRE_54 :  std_logic;
    SIGNAL	SYNTHESIZED_WIRE_65 :  std_logic_vector(23 DOWNTO 0);
    
    SIGNAL	GDFX_TEMP_SIGNAL_16 :  std_logic_vector(7 DOWNTO 0);
    SIGNAL	GDFX_TEMP_SIGNAL_0  :  std_logic_vector(15 DOWNTO 0);
    SIGNAL	GDFX_TEMP_SIGNAL_6  :  std_logic_vector(127 DOWNTO 0);
    SIGNAL	GDFX_TEMP_SIGNAL_5  :  std_logic_vector(127 DOWNTO 0);
    SIGNAL	GDFX_TEMP_SIGNAL_4  :  std_logic_vector(127 DOWNTO 0);
    SIGNAL	GDFX_TEMP_SIGNAL_3  :  std_logic_vector(127 DOWNTO 0);
    SIGNAL	GDFX_TEMP_SIGNAL_2  :  std_logic_vector(127 DOWNTO 0);
    SIGNAL	GDFX_TEMP_SIGNAL_1  :  std_logic_vector(127 DOWNTO 0);
    SIGNAL	GDFX_TEMP_SIGNAL_15 :  std_logic_vector(127 DOWNTO 0);
    SIGNAL	GDFX_TEMP_SIGNAL_14 :  std_logic_vector(127 DOWNTO 0);
    SIGNAL	GDFX_TEMP_SIGNAL_13 :  std_logic_vector(127 DOWNTO 0);
    SIGNAL	GDFX_TEMP_SIGNAL_12 :  std_logic_vector(127 DOWNTO 0);
    SIGNAL	GDFX_TEMP_SIGNAL_11 :  std_logic_vector(127 DOWNTO 0);
    SIGNAL	GDFX_TEMP_SIGNAL_10 :  std_logic_vector(127 DOWNTO 0);
    SIGNAL	GDFX_TEMP_SIGNAL_9  :  std_logic_vector(127 DOWNTO 0);
    SIGNAL	GDFX_TEMP_SIGNAL_8  :  std_logic_vector(127 DOWNTO 0);
    SIGNAL	GDFX_TEMP_SIGNAL_7  :  std_logic_vector(127 DOWNTO 0);
    
BEGIN 
    VB(7 DOWNTO 0) <= SYNTHESIZED_WIRE_65(7 DOWNTO 0);
    VG(7 DOWNTO 0) <= SYNTHESIZED_WIRE_65(15 DOWNTO 8);
    VR(7 DOWNTO 0) <= SYNTHESIZED_WIRE_65(23 DOWNTO 16);

    SYNTHESIZED_WIRE_0 <= '0';
    SYNTHESIZED_WIRE_1 <= '0';
    SYNTHESIZED_WIRE_2 <= '0';
    SYNTHESIZED_WIRE_3 <= '0';
    SYNTHESIZED_WIRE_4 <= '0';
    SYNTHESIZED_WIRE_5 <= '0';
    SYNTHESIZED_WIRE_19 <= '0';
    SYNTHESIZED_WIRE_20 <= '0';
    SYNTHESIZED_WIRE_21 <= '0';
    SYNTHESIZED_WIRE_22 <= '0';
    SYNTHESIZED_WIRE_23 <= '0';
    SYNTHESIZED_WIRE_24 <= '0';

    CC16(23) <= GDFX_TEMP_SIGNAL_0(15);
    CC16(22) <= GDFX_TEMP_SIGNAL_0(14);
    CC16(21) <= GDFX_TEMP_SIGNAL_0(13);
    CC16(20) <= GDFX_TEMP_SIGNAL_0(12);
    CC16(19) <= GDFX_TEMP_SIGNAL_0(11);
    CC16(18) <= GDFX_TEMP_SIGNAL_16(7);
    CC16(17) <= GDFX_TEMP_SIGNAL_16(6);
    CC16(16) <= GDFX_TEMP_SIGNAL_16(5);
    CC16(15) <= GDFX_TEMP_SIGNAL_0(10);
    CC16(14) <= GDFX_TEMP_SIGNAL_0(9);
    CC16(13) <= GDFX_TEMP_SIGNAL_0(8);
    CC16(12) <= GDFX_TEMP_SIGNAL_0(7);
    CC16(11) <= GDFX_TEMP_SIGNAL_0(6);
    CC16(10) <= GDFX_TEMP_SIGNAL_0(5);
    CC16(9) <= GDFX_TEMP_SIGNAL_16(4);
    CC16(8) <= GDFX_TEMP_SIGNAL_16(3);
    CC16(7) <= GDFX_TEMP_SIGNAL_0(4);
    CC16(6) <= GDFX_TEMP_SIGNAL_0(3);
    CC16(5) <= GDFX_TEMP_SIGNAL_0(2);
    CC16(4) <= GDFX_TEMP_SIGNAL_0(1);
    CC16(3) <= GDFX_TEMP_SIGNAL_0(0);
    CC16(2) <= GDFX_TEMP_SIGNAL_16(2);
    CC16(1) <= GDFX_TEMP_SIGNAL_16(1);
    CC16(0) <= GDFX_TEMP_SIGNAL_16(0);
    
    
    GDFX_TEMP_SIGNAL_15 <= (VDMB(55 DOWNTO 0) & VDMA(127 DOWNTO 56));
    GDFX_TEMP_SIGNAL_14 <= (VDMB(63 DOWNTO 0) & VDMA(127 DOWNTO 64));
    GDFX_TEMP_SIGNAL_13 <= (VDMB(71 DOWNTO 0) & VDMA(127 DOWNTO 72));
    GDFX_TEMP_SIGNAL_12 <= (VDMB(79 DOWNTO 0) & VDMA(127 DOWNTO 80));
    GDFX_TEMP_SIGNAL_11 <= (VDMB(87 DOWNTO 0) & VDMA(127 DOWNTO 88));
    GDFX_TEMP_SIGNAL_10 <= (VDMB(95 DOWNTO 0) & VDMA(127 DOWNTO 96));
    GDFX_TEMP_SIGNAL_9 <= (VDMB(103 DOWNTO 0) & VDMA(127 DOWNTO 104));
    GDFX_TEMP_SIGNAL_8 <= (VDMB(111 DOWNTO 0) & VDMA(127 DOWNTO 112));
    GDFX_TEMP_SIGNAL_7 <= (VDMB(119 DOWNTO 0) & VDMA(127 DOWNTO 120));
    GDFX_TEMP_SIGNAL_6 <= (VDMB(7 DOWNTO 0) & VDMA(127 DOWNTO 8));
    GDFX_TEMP_SIGNAL_5 <= (VDMB(15 DOWNTO 0) & VDMA(127 DOWNTO 16));
    GDFX_TEMP_SIGNAL_4 <= (VDMB(23 DOWNTO 0) & VDMA(127 DOWNTO 24));
    GDFX_TEMP_SIGNAL_3 <= (VDMB(31 DOWNTO 0) & VDMA(127 DOWNTO 32));
    GDFX_TEMP_SIGNAL_2 <= (VDMB(39 DOWNTO 0) & VDMA(127 DOWNTO 40));
    GDFX_TEMP_SIGNAL_1 <= (VDMB(47 DOWNTO 0) & VDMA(127 DOWNTO 48));
    
    
    ACP_CLUT_RAM : altdpram2
        PORT MAP
        (
            wren_a => ACP_CLUT_WR(3),
            wren_b => SYNTHESIZED_WIRE_0,
            clock_a => MAIN_CLK,
            clock_b => pixel_clk_i,
            address_a => FB_ADR(9 DOWNTO 2),
            address_b => ZR_C8B,
            data_a => FB_AD(7 DOWNTO 0),
            data_b => (OTHERS => '0'),
            q_a => SYNTHESIZED_WIRE_30,
            q_b => CCA(7 DOWNTO 0)
        );
    
    
    ACP_CLUT_RAM54 : altdpram2
        PORT MAP
        (
            wren_a => ACP_CLUT_WR(2),
            wren_b => SYNTHESIZED_WIRE_1,
            clock_a => MAIN_CLK,
            clock_b => pixel_clk_i,
            address_a => FB_ADR(9 DOWNTO 2),
            address_b => ZR_C8B,
            data_a => FB_AD(15 DOWNTO 8),
            data_b => (OTHERS => '0'),
            q_a => SYNTHESIZED_WIRE_32,
            q_b => CCA(15 DOWNTO 8)
        );
    
    
    ACP_CLUT_RAM55 : altdpram2
        PORT MAP
        (
            wren_a => ACP_CLUT_WR(1),
            wren_b => SYNTHESIZED_WIRE_2,
            clock_a => MAIN_CLK,
            clock_b => pixel_clk_i,
            address_a => FB_ADR(9 DOWNTO 2),
            address_b => ZR_C8B,
            data_a => FB_AD(23 DOWNTO 16),
            data_b => (OTHERS => '0'),
            q_a => SYNTHESIZED_WIRE_33,
            q_b => CCA(23 DOWNTO 16)
        );
    
    
    i_blitter : work.blitter
        PORT MAP
        (
            nRSTO => nRSTO,
            MAIN_CLK => MAIN_CLK,
            FB_ALE => FB_ALE,
            nFB_WR => nFB_WR,
            nFB_OE => nFB_OE,
            FB_SIZE0 => FB_SIZE0,
            FB_SIZE1 => FB_SIZE1,
            BLITTER_ON => BLITTER_ON,
            nFB_CS1 => nFB_CS1,
            nFB_CS2 => nFB_CS2,
            nFB_CS3 => nFB_CS3,
            DDRCLK0 => DDRCLK(0),
            SR_BLITTER_DACK => SR_BLITTER_DACK,
            BLITTER_DACK => BLITTER_DACK,
            BLITTER_DIN => BLITTER_DIN,
            FB_AD => FB_AD,
            FB_ADR => FB_ADR,
            VIDEO_RAM_CTR => VIDEO_RAM_CTR,
            BLITTER_RUN => BLITTER_RUN,
            BLITTER_SIG => BLITTER_SIG,
            BLITTER_WR => BLITTER_WR,
            BLITTER_TA => BLITTER_TA,
            BLITTER_ADR => BLITTER_ADR,
            BLITTER_DOUT => BLITTER_DOUT
        );
    
    
    i_ddr_ctr : ddr_ctr
        PORT MAP
        (
            nFB_CS1 => nFB_CS1,
            nFB_CS2 => nFB_CS2,
            nFB_CS3 => nFB_CS3,
            nFB_OE => nFB_OE,
            FB_SIZE0 => FB_SIZE0,
            FB_SIZE1 => FB_SIZE1,
            nRSTO => nRSTO,
            MAIN_CLK => MAIN_CLK,
            FB_ALE => FB_ALE,
            nFB_WR => nFB_WR,
            DDR_SYNC_66M => DDR_SYNC_66M,
            BLITTER_SIG => BLITTER_SIG,
            BLITTER_WR => BLITTER_WR,
            DDRCLK0 => DDRCLK(0),
            CLK33M => CLK33M,
            CLR_FIFO => CLR_FIFO,
            BLITTER_ADR => BLITTER_ADR,
            FB_AD => FB_AD,
            FB_ADR => FB_ADR,
            FIFO_MW => FIFO_MW,
            VIDEO_RAM_CTR => VIDEO_RAM_CTR,
            nVWE => nVWE,
            nVRAS => nVRAS,
            nVCS => nVCS,
            VCKE => VCKE,
            nVCAS => nVCAS,
            SR_FIFO_WRE => SR_FIFO_WRE,
            SR_DDR_FB => SR_DDR_FB,
            SR_DDR_WR => SR_DDR_WR,
            SR_DDRWR_D_SEL => SR_DDRWR_D_SEL,
            VIDEO_DDR_TA => VIDEO_DDR_TA,
            SR_BLITTER_DACK => SR_BLITTER_DACK,
            DDRWR_D_SEL1 => DDRWR_D_SEL(1),
            BA => BA,
            FB_LE => FB_LE,
            FB_VDOE => FB_VDOE,
            SR_VDMP => SR_VDMP,
            VA => VA,
            VDM_SEL => VDM_SEL
        );
    
    
    FALCON_CLUT_BLUE : altdpram1
        PORT MAP
        (
            wren_a => FALCON_CLUT_WR(3),
            wren_b => SYNTHESIZED_WIRE_3,
            clock_a => MAIN_CLK,
            clock_b => pixel_clk_i,
            address_a => FB_ADR(9 DOWNTO 2),
            address_b => CLUT_ADR,
            data_a => FB_AD(23 DOWNTO 18),
            data_b => (OTHERS => '0'),
            q_a => SYNTHESIZED_WIRE_45,
            q_b => CCF(7 DOWNTO 2)
        );
    
    
    FALCON_CLUT_GREEN : altdpram1
        PORT MAP
        (
            wren_a => FALCON_CLUT_WR(1),
            wren_b => SYNTHESIZED_WIRE_4,
            clock_a => MAIN_CLK,
            clock_b => pixel_clk_i,
            address_a => FB_ADR(9 DOWNTO 2),
            address_b => CLUT_ADR,
            data_a => FB_AD(23 DOWNTO 18),
            data_b => (OTHERS => '0'),
            q_a => SYNTHESIZED_WIRE_44,
            q_b => CCF(15 DOWNTO 10)
        );
    
    
    FALCON_CLUT_RED : altdpram1
        PORT MAP
        (
            wren_a => FALCON_CLUT_WR(0),
            wren_b => SYNTHESIZED_WIRE_5,
            clock_a => MAIN_CLK,
            clock_b => pixel_clk_i,
            address_a => FB_ADR(9 DOWNTO 2),
            address_b => CLUT_ADR,
            data_a => FB_AD(31 DOWNTO 26),
            data_b => (OTHERS => '0'),
            q_a => SYNTHESIZED_WIRE_41,
            q_b => CCF(23 DOWNTO 18)
        );
    
    
    inst : lpm_fifo_dc0
        PORT MAP
        (
            wrreq => FIFO_WRE,
            wrclk => DDRCLK(0),
            rdreq => SYNTHESIZED_WIRE_60,
            rdclk => pixel_clk_i,
            aclr => CLR_FIFO,
            data => VDMC,
            q => SYNTHESIZED_WIRE_63,
            wrusedw => FIFO_MW
        );
    
    
    inst1 : altddio_bidir0
        PORT MAP
        (
            oe => VDOUT_OE,
            inclock => DDRCLK(1),
            outclock => DDRCLK(3),
            datain_h => VDP_OUT(63 DOWNTO 32),
            datain_l => VDP_OUT(31 DOWNTO 0),
            padio => VD,
            combout => SYNTHESIZED_WIRE_15,
            dataout_h => VDP_IN(31 DOWNTO 0),
            dataout_l => VDP_IN(63 DOWNTO 32)
        );
    
    
    inst10 : lpm_ff4
        PORT MAP
        (
            clock => pixel_clk_i,
            data => SYNTHESIZED_WIRE_7,
            q => GDFX_TEMP_SIGNAL_0
        );
    
    
    inst100 : lpm_muxvdm
        PORT MAP
        (
            data0x => VDMB,
            data10x => GDFX_TEMP_SIGNAL_1,
            data11x => GDFX_TEMP_SIGNAL_2,
            data12x => GDFX_TEMP_SIGNAL_3,
            data13x => GDFX_TEMP_SIGNAL_4,
            data14x => GDFX_TEMP_SIGNAL_5,
            data15x => GDFX_TEMP_SIGNAL_6,
            data1x => GDFX_TEMP_SIGNAL_7,
            data2x => GDFX_TEMP_SIGNAL_8,
            data3x => GDFX_TEMP_SIGNAL_9,
            data4x => GDFX_TEMP_SIGNAL_10,
            data5x => GDFX_TEMP_SIGNAL_11,
            data6x => GDFX_TEMP_SIGNAL_12,
            data7x => GDFX_TEMP_SIGNAL_13,
            data8x => GDFX_TEMP_SIGNAL_14,
            data9x => GDFX_TEMP_SIGNAL_15,
            sel => VDM_SEL,
            result => VDMC
        );
    
    
    inst102 : lpm_mux3
        PORT MAP
        (
            data1 => DFF_inst93,
            data0 => ZR_C8(0),
            sel => COLOR1,
            result => ZR_C8B(0)
        );
    
    
    
    CLUT_ADR(2) <= CLUT_ADR2A AND SYNTHESIZED_WIRE_61;    
    CLUT_ADR(4) <= CLUT_OFF(0) OR SYNTHESIZED_WIRE_8;
    CLUT_ADR(6) <= CLUT_OFF(2) OR SYNTHESIZED_WIRE_9;

    SYNTHESIZED_WIRE_61 <= COLOR8 OR COLOR4;
    SYNTHESIZED_WIRE_16 <= COLOR4 OR COLOR8 OR COLOR2;
    
    
    inst108 : lpm_bustri_long
        PORT MAP
        (
            enabledt => FB_VDOE(0),
            data => VDR,
            tridata => FB_AD
        );
    
    
    inst109 : lpm_bustri_long
        PORT MAP
        (
            enabledt => FB_VDOE(1),
            data => SYNTHESIZED_WIRE_11,
            tridata => FB_AD
        );
    
    
    inst11 : lpm_ff5
        PORT MAP
        (
            clock => pixel_clk_i,
            data => SYNTHESIZED_WIRE_12,
            q => ZR_C8
        );
    
    
    inst110 : lpm_bustri_long
        PORT MAP
        (
            enabledt => FB_VDOE(2),
            data => SYNTHESIZED_WIRE_13,
            tridata => FB_AD
        );
    
    
    inst119 : lpm_bustri_long
        PORT MAP
        (
            enabledt => FB_VDOE(3),
            data => SYNTHESIZED_WIRE_14,
            tridata => FB_AD
        );
    
    
    inst12 : lpm_ff1
        PORT MAP
        (
            clock => DDRCLK(0),
            data => VDP_IN(31 DOWNTO 0),
            q => VDVZ(31 DOWNTO 0)
        );
    
    
    inst13 : lpm_ff0
        PORT MAP
        (
            clock => DDR_SYNC_66M,
            enable => FB_LE(0),
            data => FB_AD,
            q => FB_DDR(127 DOWNTO 96)
        );
    
    
    inst14 : lpm_ff0
        PORT MAP
        (
            clock => DDR_SYNC_66M,
            enable => FB_LE(1),
            data => FB_AD,
            q => FB_DDR(95 DOWNTO 64)
        );
    
    
    inst15 : lpm_ff0
        PORT MAP
        (
            clock => DDR_SYNC_66M,
            enable => FB_LE(2),
            data => FB_AD,
            q => FB_DDR(63 DOWNTO 32)
        );
    
    
    inst16 : lpm_ff0
        PORT MAP
        (
            clock => DDR_SYNC_66M,
            enable => FB_LE(3),
            data => FB_AD,
            q => FB_DDR(31 DOWNTO 0)
        );
    
    
    inst17 : lpm_ff0
        PORT MAP
        (
            clock => DDRCLK(0),
            enable => DDR_FB(1),
            data => VDP_IN(31 DOWNTO 0),
            q => SYNTHESIZED_WIRE_11
        );
    
    
    inst18 : lpm_ff0
        PORT MAP
        (
            clock => DDRCLK(0),
            enable => DDR_FB(0),
            data => VDP_IN(63 DOWNTO 32),
            q => SYNTHESIZED_WIRE_13
        );
    
    
    inst19 : lpm_ff0
        PORT MAP
        (
            clock => DDRCLK(0),
            enable => DDR_FB(0),
            data => VDP_IN(31 DOWNTO 0),
            q => SYNTHESIZED_WIRE_14
        );
    
    
    inst2 : altddio_out0
        PORT MAP
        (
            outclock => DDRCLK(3),
            datain_h => VDMP(7 DOWNTO 4),
            datain_l => VDMP(3 DOWNTO 0),
            dataout => VDM
        );
    
    
    inst20 : lpm_ff1
        PORT MAP
        (
            clock => DDRCLK(0),
            data => VDVZ(31 DOWNTO 0),
            q => VDVZ(95 DOWNTO 64)
        );
    
    
    inst21 : lpm_mux0
        PORT MAP
        (
            clock => pixel_clk_i,
            data0x => FIFO_D(127 DOWNTO 96),
            data1x => FIFO_D(95 DOWNTO 64),
            data2x => FIFO_D(63 DOWNTO 32),
            data3x => FIFO_D(31 DOWNTO 0),
            sel => CLUT_MUX_ADR(1 DOWNTO 0),
            result => SYNTHESIZED_WIRE_48
        );
    
    
    inst22 : lpm_mux5
        PORT MAP
        (
            data0x => FB_DDR(127 DOWNTO 64),
            data1x => FB_DDR(63 DOWNTO 0),
            data2x => BLITTER_DOUT(127 DOWNTO 64),
            data3x => BLITTER_DOUT(63 DOWNTO 0),
            sel => DDRWR_D_SEL,
            result => VDP_OUT
        );
    
    
    inst23 : lpm_constant2
        PORT MAP
        (
            result => GDFX_TEMP_SIGNAL_16
        );
    
    
    inst24 : lpm_mux1
        PORT MAP
        (
            clock => pixel_clk_i,
            data0x => FIFO_D(127 DOWNTO 112),
            data1x => FIFO_D(111 DOWNTO 96),
            data2x => FIFO_D(95 DOWNTO 80),
            data3x => FIFO_D(79 DOWNTO 64),
            data4x => FIFO_D(63 DOWNTO 48),
            data5x => FIFO_D(47 DOWNTO 32),
            data6x => FIFO_D(31 DOWNTO 16),
            data7x => FIFO_D(15 DOWNTO 0),
            sel => CLUT_MUX_ADR(2 DOWNTO 0),
            result => SYNTHESIZED_WIRE_7
        );
    
    
    inst25 : lpm_mux2
        PORT MAP
        (
            clock => pixel_clk_i,
            data0x => FIFO_D(127 DOWNTO 120),
            data10x => FIFO_D(47 DOWNTO 40),
            data11x => FIFO_D(39 DOWNTO 32),
            data12x => FIFO_D(31 DOWNTO 24),
            data13x => FIFO_D(23 DOWNTO 16),
            data14x => FIFO_D(15 DOWNTO 8),
            data15x => FIFO_D(7 DOWNTO 0),
            data1x => FIFO_D(119 DOWNTO 112),
            data2x => FIFO_D(111 DOWNTO 104),
            data3x => FIFO_D(103 DOWNTO 96),
            data4x => FIFO_D(95 DOWNTO 88),
            data5x => FIFO_D(87 DOWNTO 80),
            data6x => FIFO_D(79 DOWNTO 72),
            data7x => FIFO_D(71 DOWNTO 64),
            data8x => FIFO_D(63 DOWNTO 56),
            data9x => FIFO_D(55 DOWNTO 48),
            sel => CLUT_MUX_ADR,
            result => SYNTHESIZED_WIRE_12
        );
    
    
    inst26 : lpm_shiftreg4
        PORT MAP
        (
            clock => DDRCLK(0),
            shiftin => SR_FIFO_WRE,
            shiftout => FIFO_WRE
        );
    
    
    inst27 : lpm_latch0
        PORT MAP
        (
            gate => DDR_SYNC_66M,
            data => SYNTHESIZED_WIRE_15,
            q => VDR
        );

    CLUT_ADR(1) <= CLUT_ADR1A AND SYNTHESIZED_WIRE_16;
    
    
    inst3 : lpm_ff1
        PORT MAP
        (
            clock => DDRCLK(0),
            data => VDP_IN(63 DOWNTO 32),
            q => VDVZ(63 DOWNTO 32)
        );
    
    CLUT_ADR(3) <= SYNTHESIZED_WIRE_61 AND CLUT_ADR3A;
    CLUT_ADR(5) <= CLUT_OFF(1) OR SYNTHESIZED_WIRE_18;
    SYNTHESIZED_WIRE_8 <= CLUT_ADR4A AND COLOR8;
    SYNTHESIZED_WIRE_18 <= CLUT_ADR5A AND COLOR8;
    SYNTHESIZED_WIRE_9 <= CLUT_ADR6A AND COLOR8;
    SYNTHESIZED_WIRE_46 <= CLUT_ADR7A AND COLOR8;
      
    inst36 : lpm_ff6
        PORT MAP
        (
            clock => DDRCLK(0),
            enable => BLITTER_DACK(0),
            data => VDVZ,
            q => BLITTER_DIN
        );
    
    VDOUT_OE <= DDR_WR OR SR_DDR_WR;
    VIDEO_TA <= BLITTER_TA OR VIDEO_MOD_TA OR VIDEO_DDR_TA;
    
    inst4 : lpm_ff1
        PORT MAP
        (
            clock => DDRCLK(0),
            data => VDVZ(63 DOWNTO 32),
            q => VDVZ(127 DOWNTO 96)
        );
    
    
    inst40 : mux41_0
        PORT MAP
        (
            S0 => COLOR2,
            S1 => COLOR4,
            D0 => CLUT_ADR6A,
            INH => SYNTHESIZED_WIRE_19,
            D1 => CLUT_ADR7A,
            Q => SYNTHESIZED_WIRE_54
        );
    
    
    inst41 : mux41_1
        PORT MAP
        (
            S0 => COLOR2,
            S1 => COLOR4,
            D0 => CLUT_ADR5A,
            INH => SYNTHESIZED_WIRE_20,
            D1 => CLUT_ADR6A,
            Q => SYNTHESIZED_WIRE_53
        );
    
    
    inst42 : mux41_2
        PORT MAP
        (
            S0 => COLOR2,
            D2 => CLUT_ADR7A,
            S1 => COLOR4,
            D0 => CLUT_ADR4A,
            INH => SYNTHESIZED_WIRE_21,
            D1 => CLUT_ADR5A,
            Q => SYNTHESIZED_WIRE_52
        );
    
    
    inst43 : mux41_3
        PORT MAP
        (
            S0 => COLOR2,
            D2 => CLUT_ADR6A,
            S1 => COLOR4,
            D0 => CLUT_ADR3A,
            INH => SYNTHESIZED_WIRE_22,
            D1 => CLUT_ADR4A,
            Q => SYNTHESIZED_WIRE_51
        );
    
    
    inst44 : mux41_4
        PORT MAP
        (
            S0 => COLOR2,
            D2 => CLUT_ADR5A,
            S1 => COLOR4,
            D0 => CLUT_ADR2A,
            INH => SYNTHESIZED_WIRE_23,
            D1 => CLUT_ADR3A,
            Q => SYNTHESIZED_WIRE_50
        );
    
    
    inst45 : mux41_5
        PORT MAP
        (
            S0 => COLOR2,
            D2 => CLUT_ADR4A,
            S1 => COLOR4,
            D0 => CLUT_ADR1A,
            INH => SYNTHESIZED_WIRE_24,
            D1 => CLUT_ADR2A,
            Q => SYNTHESIZED_WIRE_49
        );
    
    
    inst46 : lpm_ff3
        PORT MAP
        (
            clock => pixel_clk_i,
            data => SYNTHESIZED_WIRE_25,
            q => SYNTHESIZED_WIRE_43
        );
    
    
    inst47 : lpm_ff3
        PORT MAP
        (
            clock => pixel_clk_i,
            data => CCF,
            q => SYNTHESIZED_WIRE_25
        );
    
    
    
    inst49 : lpm_ff3
        PORT MAP
        (
            clock => pixel_clk_i,
            data => SYNTHESIZED_WIRE_26,
            q => SYNTHESIZED_WIRE_42
        );
    
    
    inst5 : altddio_out2
        PORT MAP
        (
            outclock => pixel_clk_i,
            datain_h => SYNTHESIZED_WIRE_62,
            datain_l => SYNTHESIZED_WIRE_62,
            dataout => SYNTHESIZED_WIRE_65
        );
    
    
    
    inst51 : lpm_bustri1
        PORT MAP
        (
            enabledt => ST_CLUT_RD,
            data => SYNTHESIZED_WIRE_29,
            tridata => FB_AD(26 DOWNTO 24)
        );
    
    
    inst52 : lpm_ff3
        PORT MAP
        (
            clock => pixel_clk_i,
            data => CCS,
            q => SYNTHESIZED_WIRE_26
        );
    
    
    inst53 : lpm_bustri_byt
        PORT MAP
        (
            enabledt => ACP_CLUT_RD,
            data => SYNTHESIZED_WIRE_30,
            tridata => FB_AD(7 DOWNTO 0)
        );
    
    
    inst54 : lpm_constant0
        PORT MAP
        (
            result => CCS(20 DOWNTO 16)
        );
    
    
    
    inst56 : lpm_bustri1
        PORT MAP
        (
            enabledt => ST_CLUT_RD,
            data => SYNTHESIZED_WIRE_31,
            tridata => FB_AD(22 DOWNTO 20)
        );
    
    
    inst57 : lpm_bustri_byt
        PORT MAP
        (
            enabledt => ACP_CLUT_RD,
            data => SYNTHESIZED_WIRE_32,
            tridata => FB_AD(15 DOWNTO 8)
        );
    
    
    inst58 : lpm_bustri_byt
        PORT MAP
        (
            enabledt => ACP_CLUT_RD,
            data => SYNTHESIZED_WIRE_33,
            tridata => FB_AD(23 DOWNTO 16)
        );
    
    
    inst59 : lpm_constant0
        PORT MAP
        (
            result => CCS(12 DOWNTO 8)
        );
    
    
    
    
    inst61 : lpm_bustri1
        PORT MAP
        (
            enabledt => ST_CLUT_RD,
            data => SYNTHESIZED_WIRE_34,
            tridata => FB_AD(18 DOWNTO 16)
        );
    
    
    inst62 : lpm_muxdz
        PORT MAP
        (
            clock => pixel_clk_i,
            clken => FIFO_RDE,
            sel => INTER_ZEI,
            data0x => SYNTHESIZED_WIRE_63,
            data1x => SYNTHESIZED_WIRE_36,
            result => FIFO_D
        );
    
    
    inst63 : lpm_fifodz
        PORT MAP
        (
            wrreq => SYNTHESIZED_WIRE_60,
            rdreq => SYNTHESIZED_WIRE_38,
            clock => pixel_clk_i,
            aclr => DOP_FIFO_CLR,
            data => SYNTHESIZED_WIRE_63,
            q => SYNTHESIZED_WIRE_36
        );
    
    
    inst64 : lpm_constant0
        PORT MAP
        (
            result => CCS(4 DOWNTO 0)
        );
    
    
    SYNTHESIZED_WIRE_60 <= FIFO_RDE AND SYNTHESIZED_WIRE_40;
    
    
    inst66 : lpm_bustri3
        PORT MAP
        (
            enabledt => FALCON_CLUT_RDH,
            data => SYNTHESIZED_WIRE_41,
            tridata => FB_AD(31 DOWNTO 26)
        );
    
    
    SYNTHESIZED_WIRE_38 <= FIFO_RDE AND INTER_ZEI;
    SYNTHESIZED_WIRE_40 <= NOT(INTER_ZEI);
    
    inst7 : lpm_mux6
        PORT MAP
        (
            clock => pixel_clk_i,
            data0x => SYNTHESIZED_WIRE_42,
            data1x => SYNTHESIZED_WIRE_43,
            data2x => (OTHERS => '0'),
            data3x => (OTHERS => '0'),
            data4x => CCA,
            data5x => CC16,
            data6x => CC24(23 DOWNTO 0),
            data7x => BORDER_COLOR,
            sel => CCSEL,
            result => SYNTHESIZED_WIRE_62
        );
    
    
    inst70 : lpm_bustri3
        PORT MAP
        (
            enabledt => FALCON_CLUT_RDH,
            data => SYNTHESIZED_WIRE_44,
            tridata => FB_AD(23 DOWNTO 18)
        );
    
    
    inst71 : lpm_ff6
        PORT MAP
        (
            clock => DDRCLK(0),
            enable => FIFO_WRE,
            data => VDVZ,
            q => VDMA
        );
    
    
    
    
    inst74 : lpm_bustri3
        PORT MAP
        (
            enabledt => FALCON_CLUT_RDL,
            data => SYNTHESIZED_WIRE_45,
            tridata => FB_AD(23 DOWNTO 18)
        );
    
    
    
    
    inst77 : lpm_constant1
        PORT MAP
        (
            result => CCF(1 DOWNTO 0)
        );
    
    
    
    CLUT_ADR(7) <= CLUT_OFF(3) OR SYNTHESIZED_WIRE_46;
    
    
    
    inst80 : lpm_constant1
        PORT MAP
        (
            result => CCF(9 DOWNTO 8)
        );
    
    
    inst81 : lpm_mux4
        PORT MAP
        (
            sel => COLOR1,
            data0x => ZR_C8(7 DOWNTO 1),
            data1x => SYNTHESIZED_WIRE_47,
            result => ZR_C8B(7 DOWNTO 1)
        );
    
    
    inst82 : lpm_constant3
        PORT MAP
        (
            result => SYNTHESIZED_WIRE_47
        );
    
    
    inst83 : lpm_constant1
        PORT MAP
        (
            result => CCF(17 DOWNTO 16)
        );
    
    
    PROCESS(DDRCLK(0), DDR_WR)
    BEGIN
        IF (DDR_WR = '1') THEN
            VDQS <= (OTHERS => DDRCLK(0));
        ELSE
            VDQS <= (OTHERS => 'Z');
        END IF;
    END PROCESS;
        
    
    PROCESS(DDRCLK(3))
    BEGIN
        IF (rising_edge(DDRCLK(3))) THEN
            DDRWR_D_SEL(0) <= SR_DDRWR_D_SEL;
            DDR_WR <= SR_DDR_WR;
        END IF;
    END PROCESS;
    
    
    inst89 : lpm_shiftreg6
        PORT MAP
        (
            clock => DDRCLK(0),
            shiftin => SR_BLITTER_DACK,
            q => BLITTER_DACK
        );
    
    
    inst9 : lpm_ff1
        PORT MAP
        (
            clock => pixel_clk_i,
            data => SYNTHESIZED_WIRE_48,
            q => CC24
        );
    
        
    PROCESS(pixel_clk_i)
    BEGIN
        IF (rising_edge(pixel_clk_i)) THEN
            DFF_inst91 <= CLUT_ADR(0);
        END IF;
    END PROCESS;
    
    
    inst92 : lpm_shiftreg6
        PORT MAP
        (
            clock => DDRCLK(0),
            shiftin => SR_DDR_FB,
            q => DDR_FB
        );
    
    
    PROCESS(pixel_clk_i)
    BEGIN
        IF (rising_edge(pixel_clk_i)) THEN
            DFF_inst93 <= DFF_inst91;
        END IF;
    END PROCESS;
    
    
    inst94 : lpm_ff6
        PORT MAP
        (
            clock => DDRCLK(0),
            enable => FIFO_WRE,
            data => VDMA,
            q => VDMB
        );
    
    
    PROCESS(pixel_clk_i)
    BEGIN
        IF (rising_edge(pixel_clk_i)) THEN
            SYNTHESIZED_WIRE_64 <= FIFO_RDE;
        END IF;
    END PROCESS;
    
    
    
    inst97 : lpm_ff5
        PORT MAP
        (
            clock => DDRCLK(2),
            data => SR_VDMP,
            q => VDMP
        );
    
    
    sr0 : lpm_shiftreg0
        PORT MAP
        (
            load => SYNTHESIZED_WIRE_64,
            clock => pixel_clk_i,
            shiftin => SYNTHESIZED_WIRE_49,
            data => FIFO_D(127 DOWNTO 112),
            shiftout => CLUT_ADR(0)
        );
    
    
    sr1 : lpm_shiftreg0
        PORT MAP
        (
            load => SYNTHESIZED_WIRE_64,
            clock => pixel_clk_i,
            shiftin => SYNTHESIZED_WIRE_50,
            data => FIFO_D(111 DOWNTO 96),
            shiftout => CLUT_ADR1A
        );
    
    
    sr2 : lpm_shiftreg0
        PORT MAP
        (
            load => SYNTHESIZED_WIRE_64,
            clock => pixel_clk_i,
            shiftin => SYNTHESIZED_WIRE_51,
            data => FIFO_D(95 DOWNTO 80),
            shiftout => CLUT_ADR2A
        );
    
    
    sr3 : lpm_shiftreg0
        PORT MAP
        (
            load => SYNTHESIZED_WIRE_64,
            clock => pixel_clk_i,
            shiftin => SYNTHESIZED_WIRE_52,
            data => FIFO_D(79 DOWNTO 64),
            shiftout => CLUT_ADR3A
        );
    
    
    sr4 : lpm_shiftreg0
        PORT MAP
        (
            load => SYNTHESIZED_WIRE_64,
            clock => pixel_clk_i,
            shiftin => SYNTHESIZED_WIRE_53,
            data => FIFO_D(63 DOWNTO 48),
            shiftout => CLUT_ADR4A
        );
    
    
    sr5 : lpm_shiftreg0
        PORT MAP
        (
            load => SYNTHESIZED_WIRE_64,
            clock => pixel_clk_i,
            shiftin => SYNTHESIZED_WIRE_54,
            data => FIFO_D(47 DOWNTO 32),
            shiftout => CLUT_ADR5A
        );
    
    
    sr6 : lpm_shiftreg0
        PORT MAP
        (
            load => SYNTHESIZED_WIRE_64,
            clock => pixel_clk_i,
            shiftin => CLUT_ADR7A,
            data => FIFO_D(31 DOWNTO 16),
            shiftout => CLUT_ADR6A
        );
    
    
    sr7 : lpm_shiftreg0
        PORT MAP
        (
            load => SYNTHESIZED_WIRE_64,
            clock => pixel_clk_i,
            shiftin => CLUT_ADR(0),
            data => FIFO_D(15 DOWNTO 0),
            shiftout => CLUT_ADR7A
        );
    
    
    ST_CLUT_BLUE : altdpram0
        PORT MAP
        (
            wren_a => ST_CLUT_WR(1),
            wren_b => '0',
            clock_a => MAIN_CLK,
            clock_b => pixel_clk_i,
            address_a => FB_ADR(4 DOWNTO 1),
            address_b => CLUT_ADR(3 DOWNTO 0),
            data_a => FB_AD(18 DOWNTO 16),
            data_b => (OTHERS => '0'),
            q_a => SYNTHESIZED_WIRE_34,
            q_b => CCS(7 DOWNTO 5)
        );
    
    
    ST_CLUT_GREEN : altdpram0
        PORT MAP
        (
            wren_a => ST_CLUT_WR(1),
            wren_b => '0',
            clock_a => MAIN_CLK,
            clock_b => pixel_clk_i,
            address_a => FB_ADR(4 DOWNTO 1),
            address_b => CLUT_ADR(3 DOWNTO 0),
            data_a => FB_AD(22 DOWNTO 20),
            data_b => (OTHERS => '0'),
            q_a => SYNTHESIZED_WIRE_31,
            q_b => CCS(15 DOWNTO 13)
        );
    
    
    ST_CLUT_RED : altdpram0
        PORT MAP
        (
            wren_a => ST_CLUT_WR(0),
            wren_b => '0',
            clock_a => MAIN_CLK,
            clock_b => pixel_clk_i,
            address_a => FB_ADR(4 DOWNTO 1),
            address_b => CLUT_ADR(3 DOWNTO 0),
            data_a => FB_AD(26 DOWNTO 24),
            data_b => (OTHERS => '0'),
            q_a => SYNTHESIZED_WIRE_29,
            q_b => CCS(23 DOWNTO 21)
        );
    
    
    i_video_mod_mux_clutctr : work.video_mod_mux_clutctr
        PORT MAP
        (
            nRSTO => nRSTO,
            MAIN_CLK => MAIN_CLK,
            nFB_CS1 => nFB_CS1,
            nFB_CS2 => nFB_CS2,
            nFB_CS3 => nFB_CS3,
            nFB_WR => nFB_WR,
            nFB_OE => nFB_OE,
            FB_SIZE0 => FB_SIZE0,
            FB_SIZE1 => FB_SIZE1,
            nFB_BURST => nFB_BURST,
            CLK33M => CLK33M,
            CLK25M => CLK25M,
            BLITTER_RUN => BLITTER_RUN,
            CLK_VIDEO => CLK_VIDEO,
            VR_BUSY => VR_BUSY,
            FB_AD => FB_AD,
            FB_ADR => FB_ADR,
            VR_D => VR_D,
            COLOR8 => COLOR8,
            ACP_CLUT_RD => ACP_CLUT_RD,
            COLOR1 => COLOR1,
            FALCON_CLUT_RDH => FALCON_CLUT_RDH,
            FALCON_CLUT_RDL => FALCON_CLUT_RDL,
            ST_CLUT_RD => ST_CLUT_RD,
            HSYNC => HSYNC,
            VSYNC => VSYNC,
            nBLANK => nBLANK,
            nSYNC => nSYNC,
            nPD_VGA => nPD_VGA,
            FIFO_RDE => FIFO_RDE,
            COLOR2 => COLOR2,
            COLOR4 => COLOR4,
            PIXEL_CLK => pixel_clk_i,
            BLITTER_ON => BLITTER_ON,
            VIDEO_MOD_TA => VIDEO_MOD_TA,
            INTER_ZEI => INTER_ZEI,
            DOP_FIFO_CLR => DOP_FIFO_CLR,
            VIDEO_RECONFIG => VIDEO_RECONFIG,
            VR_WR => VR_WR,
            VR_RD => VR_RD,
            CLR_FIFO => CLR_FIFO,
            ACP_CLUT_WR => ACP_CLUT_WR,
            BORDER_COLOR => BORDER_COLOR,
            CCSEL => CCSEL,
            CLUT_MUX_ADR => CLUT_MUX_ADR,
            CLUT_OFF => CLUT_OFF,
            FALCON_CLUT_WR => FALCON_CLUT_WR,
            ST_CLUT_WR => ST_CLUT_WR,
            VIDEO_RAM_CTR => VIDEO_RAM_CTR
        );
    
    PIXEL_CLK <= pixel_clk_i;
END rtl;