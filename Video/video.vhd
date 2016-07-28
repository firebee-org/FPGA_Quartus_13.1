----------------------------------------------------------------------
---- ----
---- This file is part of the 'Firebee' project. ----
---- http://firebee.org ----
---- ----
---- Description: ----
---- This package contains utility functions, procedures and constants
---- for the Firebee project.
----
---- Author(s): ----
----  Fredi Aschwanden
----  Markus Fröschle, mfro@mubf.de
---- ----
----------------------------------------------------------------------
---- ----
---- Copyright (C) 2015 Markus Fröschle & the FireBee project
---- ----
---- This source file is free software; you can redistribute it ----
---- and/or modify it under the terms of the GNU General Public ----
---- License as published by the Free Software Foundation; either ----
---- version 2 of the License, or (at your option) any later ----
---- version. ----
---- ----
---- This program is distributed in the hope that it will be ----
---- useful, but WITHOUT ANY WARRANTY; without even the implied ----
---- warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR ----
---- PURPOSE. See the GNU General Public License for more ----
---- details. ----
---- ----
---- You should have received a copy of the GNU General Public ----
---- License along with this program; if not, write to the Free ----
---- Software Foundation, Inc., 51 Franklin Street, Fifth Floor, ----
---- Boston, MA 02110-1301, USA. ----
---- ----
----------------------------------------------------------------------
--

library ieee;
use ieee.std_logic_1164.all; 

library work;

entity video is 
	port
	(
		MAIN_CLK        : in  std_logic;
		nFB_CS1         : in  std_logic;
		nFB_CS2         : in  std_logic;
		nFB_CS3         : in  std_logic;
		nFB_WR          : in  std_logic;
		FB_SIZE0        : in  std_logic;
		FB_SIZE1        : in  std_logic;
		nRSTO           : in  std_logic;
		nFB_OE          : in  std_logic;
		FB_ALE          : in  std_logic;
		DDR_SYNC_66M    : in  std_logic;
		CLK33M          : in  std_logic;
		CLK25M          : in  std_logic;
		CLK_VIDEO       : in  std_logic;
		VR_BUSY         : in  std_logic;
		ddrclk          : in  std_logic_vector(3 downto 0);
		fb_ad_in        : in  std_logic_vector(31 downto 0);
        fb_ad_out       : out std_logic_vector(31 downto 0);
		FB_ADR          : in  std_logic_vector(31 downto 0);
		VD              : inout  std_logic_vector(31 downto 0);
		vdqs            : inout  std_logic_vector(3 downto 0);
		VR_D            : in  std_logic_vector(8 downto 0);
		nBLANK          : out  std_logic;
		nVWE            : out  std_logic;
		nVCAS           : out  std_logic;
		nVRAS           : out  std_logic;
		nVCS            : out  std_logic;
		nPD_VGA         : out  std_logic;
		VCKE            : out  std_logic;
		VSYNC           : out  std_logic;
		HSYNC           : out  std_logic;
		nSYNC           : out  std_logic;
		VIDEO_TA        : out  std_logic;
		pixel_clk       : out  std_logic;
		VIDEO_RECONFIG  : out  std_logic;
		VR_WR           : out  std_logic;
		VR_RD           : out  std_logic;
		BA              : out  std_logic_vector(1 downto 0);
		VA              : out  std_logic_vector(12 downto 0);
		VB              : out  std_logic_vector(7 downto 0);
		VDM             : out  std_logic_vector(3 downto 0);
		VG              : out  std_logic_vector(7 downto 0);
		VR              : out  std_logic_vector(7 downto 0)
	);
end video;

ARCHITECTURE rtl OF video IS 
    attribute black_box     : BOOLEAN;
    attribute noopt         : BOOLEAN;
    signal	ACP_CLUT_RD     : std_logic;
    signal	ACP_CLUT_WR     : std_logic_vector(3 downto 0);
    signal	BLITTER_ADR     : std_logic_vector(31 downto 0);
    signal	blitter_dack    : std_logic_vector(4 downto 0);
    signal	blitter_din     : std_logic_vector(127 downto 0);
    signal	BLITTER_DOUT    : std_logic_vector(127 downto 0);
    signal	BLITTER_ON      : std_logic;
    signal	BLITTER_RUN     : std_logic;
    signal	BLITTER_SIG     : std_logic;
    signal	BLITTER_TA      : std_logic;
    signal	BLITTER_WR      : std_logic;
    signal	BORDER_COLOR    : std_logic_vector(23 downto 0);
    signal	CC16            : std_logic_vector(23 downto 0);
    signal	CC24            : std_logic_vector(31 downto 0);
    signal	CCA             : std_logic_vector(23 downto 0);
    signal	ccf             : std_logic_vector(23 downto 0);
    signal	CCS             : std_logic_vector(23 downto 0);
    signal	CCSEL           : std_logic_vector(2 downto 0);
    signal	CLR_FIFO        : std_logic;
    signal	clut_adr        : std_logic_vector(7 downto 0);
    signal	CLUT_ADR1A      : std_logic;
    signal	CLUT_ADR2A      : std_logic;
    signal	CLUT_ADR3A      : std_logic;
    signal	CLUT_ADR4A      : std_logic;
    signal	CLUT_ADR5A      : std_logic;
    signal	CLUT_ADR6A      : std_logic;
    signal	CLUT_ADR7A      : std_logic;
    signal	CLUT_MUX_ADR    : std_logic_vector(3 downto 0);
    signal	CLUT_OFF        : std_logic_vector(3 downto 0);
    signal	color1          : std_logic;
    signal	color2          : std_logic;
    signal	color4          : std_logic;
    signal	color8          : std_logic;
    signal	DDR_FB          : std_logic_vector(4 downto 0);
    signal	ddr_wr          : std_logic;
    signal	ddrwr_d_sel     : std_logic_vector(1 downto 0);
    signal	DOP_FIFO_CLR    : std_logic;
    signal	FALCON_CLUT_RDH : std_logic;
    signal	FALCON_CLUT_RDL : std_logic;
    signal	FALCON_CLUT_WR  : std_logic_vector(3 downto 0);
    signal	FB_DDR          : std_logic_vector(127 downto 0);
    signal	FB_LE           : std_logic_vector(3 downto 0);
    signal	FB_VDOE         : std_logic_vector(3 downto 0);
    signal	FIFO_D          : std_logic_vector(127 downto 0);
    signal	FIFO_MW         : std_logic_vector(8 downto 0);
    signal	FIFO_RDE        : std_logic;
    signal	FIFO_WRE        : std_logic;
    signal	INTER_ZEI       : std_logic;
    signal	nFB_BURST       : std_logic := '0';
    signal	pixel_clk_i     : std_logic;
    signal	SR_BLITTER_DACK : std_logic;
    signal	SR_DDR_FB       : std_logic;
    signal	sr_ddr_wr       : std_logic;
    signal	SR_DDRWR_D_SEL  : std_logic;
    signal	SR_FIFO_WRE     : std_logic;
    signal	SR_VDMP         : std_logic_vector(7 downto 0);
    signal	ST_CLUT_RD      : std_logic;
    signal	ST_CLUT_WR      : std_logic_vector(1 downto 0);
    signal	VDM_SEL         : std_logic_vector(3 downto 0);
    signal	VDMA            : std_logic_vector(127 downto 0);
    signal	VDMB            : std_logic_vector(127 downto 0);
    signal	VDMC            : std_logic_vector(127 downto 0);
    signal	VDMP            : std_logic_vector(7 downto 0);
    signal	vdout_oe        : std_logic;
    signal	VDP_IN          : std_logic_vector(63 downto 0);
    signal	VDP_OUT         : std_logic_vector(63 downto 0);
    signal	VDR             : std_logic_vector(31 downto 0);
    signal	vdvz            : std_logic_vector(127 downto 0);
    signal	VIDEO_DDR_TA    : std_logic;
    signal	VIDEO_MOD_TA    : std_logic;
    signal	VIDEO_RAM_CTR   : std_logic_vector(15 downto 0);
    signal	ZR_C8           : std_logic_vector(7 downto 0);
    signal	ZR_C8B          : std_logic_vector(7 downto 0);
    signal	SYNTHESIZED_WIRE_0 : std_logic;
    signal	SYNTHESIZED_WIRE_1 : std_logic;
    signal	SYNTHESIZED_WIRE_2 : std_logic;
    signal	SYNTHESIZED_WIRE_3 : std_logic;
    signal	SYNTHESIZED_WIRE_4 : std_logic;
    signal	SYNTHESIZED_WIRE_5 : std_logic;
    signal	SYNTHESIZED_WIRE_60 :  std_logic;
    signal	SYNTHESIZED_WIRE_7 : std_logic_vector(15 downto 0);
    signal	DFF_inst93      : std_logic;
    signal	SYNTHESIZED_WIRE_8 : std_logic;
    signal	SYNTHESIZED_WIRE_9 : std_logic;
    signal	SYNTHESIZED_WIRE_61 :  std_logic;
    signal	SYNTHESIZED_WIRE_11 :  std_logic_vector(31 downto 0);
    signal	SYNTHESIZED_WIRE_12 :  std_logic_vector(7 downto 0);
    signal	SYNTHESIZED_WIRE_13 :  std_logic_vector(31 downto 0);
    signal	SYNTHESIZED_WIRE_14 :  std_logic_vector(31 downto 0);
    signal	SYNTHESIZED_WIRE_15 :  std_logic_vector(31 downto 0);
    signal	SYNTHESIZED_WIRE_16 :  std_logic;
    signal	SYNTHESIZED_WIRE_18 :  std_logic;
    signal	SYNTHESIZED_WIRE_19 :  std_logic;
    signal	SYNTHESIZED_WIRE_20 :  std_logic;
    signal	SYNTHESIZED_WIRE_21 :  std_logic;
    signal	SYNTHESIZED_WIRE_22 :  std_logic;
    signal	SYNTHESIZED_WIRE_23 :  std_logic;
    signal	SYNTHESIZED_WIRE_24 :  std_logic;
    signal	SYNTHESIZED_WIRE_25 :  std_logic_vector(23 downto 0);
    signal	SYNTHESIZED_WIRE_26 :  std_logic_vector(23 downto 0);
    signal	SYNTHESIZED_WIRE_62 :  std_logic_vector(23 downto 0);
    signal	SYNTHESIZED_WIRE_29 :  std_logic_vector(2 downto 0);
    signal	SYNTHESIZED_WIRE_30 :  std_logic_vector(7 downto 0);
    signal	SYNTHESIZED_WIRE_31 :  std_logic_vector(2 downto 0);
    signal	SYNTHESIZED_WIRE_32 :  std_logic_vector(7 downto 0);
    signal	SYNTHESIZED_WIRE_33 :  std_logic_vector(7 downto 0);
    signal	SYNTHESIZED_WIRE_34 :  std_logic_vector(2 downto 0);
    signal	SYNTHESIZED_WIRE_63 :  std_logic_vector(127 downto 0);
    signal	SYNTHESIZED_WIRE_36 :  std_logic_vector(127 downto 0);
    signal	SYNTHESIZED_WIRE_38 :  std_logic;
    signal	SYNTHESIZED_WIRE_40 :  std_logic;
    signal	SYNTHESIZED_WIRE_41 :  std_logic_vector(5 downto 0);
    signal	SYNTHESIZED_WIRE_42 :  std_logic_vector(23 downto 0);
    signal	SYNTHESIZED_WIRE_43 :  std_logic_vector(23 downto 0);
    signal	SYNTHESIZED_WIRE_44 :  std_logic_vector(5 downto 0);
    signal	SYNTHESIZED_WIRE_45 :  std_logic_vector(5 downto 0);
    signal	SYNTHESIZED_WIRE_46 :  std_logic;
    signal	SYNTHESIZED_WIRE_47 :  std_logic_vector(6 downto 0);
    signal	SYNTHESIZED_WIRE_48 :  std_logic_vector(31 downto 0);
    signal	DFF_inst91          :  std_logic;
    signal	SYNTHESIZED_WIRE_64 :  std_logic;
    signal	SYNTHESIZED_WIRE_49 :  std_logic;
    signal	SYNTHESIZED_WIRE_50 :  std_logic;
    signal	SYNTHESIZED_WIRE_51 :  std_logic;
    signal	SYNTHESIZED_WIRE_52 :  std_logic;
    signal	SYNTHESIZED_WIRE_53 :  std_logic;
    signal	SYNTHESIZED_WIRE_54 :  std_logic;
    signal	SYNTHESIZED_WIRE_65 :  std_logic_vector(23 downto 0);
    
    signal	GDFX_TEMP_SIGNAL_16 :  std_logic_vector(7 downto 0);
    signal	GDFX_TEMP_SIGNAL_0  :  std_logic_vector(15 downto 0);
    signal	GDFX_TEMP_SIGNAL_6  :  std_logic_vector(127 downto 0);
    signal	GDFX_TEMP_SIGNAL_5  :  std_logic_vector(127 downto 0);
    signal	GDFX_TEMP_SIGNAL_4  :  std_logic_vector(127 downto 0);
    signal	GDFX_TEMP_SIGNAL_3  :  std_logic_vector(127 downto 0);
    signal	GDFX_TEMP_SIGNAL_2  :  std_logic_vector(127 downto 0);
    signal	GDFX_TEMP_SIGNAL_1  :  std_logic_vector(127 downto 0);
    signal	GDFX_TEMP_SIGNAL_15 :  std_logic_vector(127 downto 0);
    signal	GDFX_TEMP_SIGNAL_14 :  std_logic_vector(127 downto 0);
    signal	GDFX_TEMP_SIGNAL_13 :  std_logic_vector(127 downto 0);
    signal	GDFX_TEMP_SIGNAL_12 :  std_logic_vector(127 downto 0);
    signal	GDFX_TEMP_SIGNAL_11 :  std_logic_vector(127 downto 0);
    signal	GDFX_TEMP_SIGNAL_10 :  std_logic_vector(127 downto 0);
    signal	GDFX_TEMP_SIGNAL_9  :  std_logic_vector(127 downto 0);
    signal	GDFX_TEMP_SIGNAL_8  :  std_logic_vector(127 downto 0);
    signal	GDFX_TEMP_SIGNAL_7  :  std_logic_vector(127 downto 0);
    
begin 
    VB(7 downto 0) <= SYNTHESIZED_WIRE_65(7 downto 0);
    VG(7 downto 0) <= SYNTHESIZED_WIRE_65(15 downto 8);
    VR(7 downto 0) <= SYNTHESIZED_WIRE_65(23 downto 16);

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
    
    
    GDFX_TEMP_SIGNAL_15 <= (VDMB(55 downto 0) & VDMA(127 downto 56));
    GDFX_TEMP_SIGNAL_14 <= (VDMB(63 downto 0) & VDMA(127 downto 64));
    GDFX_TEMP_SIGNAL_13 <= (VDMB(71 downto 0) & VDMA(127 downto 72));
    GDFX_TEMP_SIGNAL_12 <= (VDMB(79 downto 0) & VDMA(127 downto 80));
    GDFX_TEMP_SIGNAL_11 <= (VDMB(87 downto 0) & VDMA(127 downto 88));
    GDFX_TEMP_SIGNAL_10 <= (VDMB(95 downto 0) & VDMA(127 downto 96));
    GDFX_TEMP_SIGNAL_9 <= (VDMB(103 downto 0) & VDMA(127 downto 104));
    GDFX_TEMP_SIGNAL_8 <= (VDMB(111 downto 0) & VDMA(127 downto 112));
    GDFX_TEMP_SIGNAL_7 <= (VDMB(119 downto 0) & VDMA(127 downto 120));
    GDFX_TEMP_SIGNAL_6 <= (VDMB(7 downto 0) & VDMA(127 downto 8));
    GDFX_TEMP_SIGNAL_5 <= (VDMB(15 downto 0) & VDMA(127 downto 16));
    GDFX_TEMP_SIGNAL_4 <= (VDMB(23 downto 0) & VDMA(127 downto 24));
    GDFX_TEMP_SIGNAL_3 <= (VDMB(31 downto 0) & VDMA(127 downto 32));
    GDFX_TEMP_SIGNAL_2 <= (VDMB(39 downto 0) & VDMA(127 downto 40));
    GDFX_TEMP_SIGNAL_1 <= (VDMB(47 downto 0) & VDMA(127 downto 48));
    
    
    acp_clut_ram : entity work.altdpram2
        port map
        (
            wren_a => ACP_CLUT_WR(3),
            wren_b => SYNTHESIZED_WIRE_0,
            clock_a => MAIN_CLK,
            clock_b => pixel_clk_i,
            address_a => FB_ADR(9 downto 2),
            address_b => ZR_C8B,
            data_a => fb_ad_in(7 downto 0),
            data_b => (others => '0'),
            q_a => SYNTHESIZED_WIRE_30,
            q_b => CCA(7 downto 0)
        );
    
    
    acp_clut_ram_54 : entity work.altdpram2
        port map
        (
            wren_a => ACP_CLUT_WR(2),
            wren_b => SYNTHESIZED_WIRE_1,
            clock_a => MAIN_CLK,
            clock_b => pixel_clk_i,
            address_a => FB_ADR(9 downto 2),
            address_b => ZR_C8B,
            data_a => fb_ad_in(15 downto 8),
            data_b => (others => '0'),
            q_a => SYNTHESIZED_WIRE_32,
            q_b => CCA(15 downto 8)
        );
    
    
    acp_clut_ram55 : entity work.altdpram2
        port map
        (
            wren_a => ACP_CLUT_WR(1),
            wren_b => SYNTHESIZED_WIRE_2,
            clock_a => MAIN_CLK,
            clock_b => pixel_clk_i,
            address_a => FB_ADR(9 downto 2),
            address_b => ZR_C8B,
            data_a => fb_ad_in(23 downto 16),
            data_b => (others => '0'),
            q_a => SYNTHESIZED_WIRE_33,
            q_b => CCA(23 downto 16)
        );
    
    i_blitter : entity work.blitter
        port map
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
            DDRCLK0 => ddrclk(0),
            SR_BLITTER_DACK => SR_BLITTER_DACK,
            blitter_dack => blitter_dack,
            blitter_din => blitter_din,
            fb_ad_in => fb_ad_in,
            fb_ad_out => fb_ad_out,
            FB_ADR => FB_ADR,
            VIDEO_RAM_CTR => VIDEO_RAM_CTR,
            BLITTER_RUN => BLITTER_RUN,
            BLITTER_SIG => BLITTER_SIG,
            BLITTER_WR => BLITTER_WR,
            blitter_ta => blitter_ta,
            BLITTER_ADR => BLITTER_ADR,
            BLITTER_DOUT => BLITTER_DOUT
        );    

    i_ddr_ctr : entity work.ddr_ctr
        port map
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
            DDRCLK0 => ddrclk(0),
            CLK33M => CLK33M,
            CLR_FIFO => CLR_FIFO,
            BLITTER_ADR => BLITTER_ADR,
            fb_ad_in => fb_ad_in,
            fb_ad_out => fb_ad_out,
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
            sr_ddr_wr => sr_ddr_wr,
            SR_DDRWR_D_SEL => SR_DDRWR_D_SEL,
            VIDEO_DDR_TA => VIDEO_DDR_TA,
            SR_BLITTER_DACK => SR_BLITTER_DACK,
            DDRWR_D_SEL1 => ddrwr_d_sel(1),
            BA => BA,
            FB_LE => FB_LE,
            FB_VDOE => FB_VDOE,
            SR_VDMP => SR_VDMP,
            VA => VA,
            VDM_SEL => VDM_SEL
        );   

    
    falcon_clut_blue : entity work.altdpram1
        port map
        (
            wren_a => FALCON_CLUT_WR(3),
            wren_b => SYNTHESIZED_WIRE_3,
            clock_a => MAIN_CLK,
            clock_b => pixel_clk_i,
            address_a => FB_ADR(9 downto 2),
            address_b => clut_adr,
            data_a => fb_ad_in(23 downto 18),
            data_b => (others => '0'),
            q_a => SYNTHESIZED_WIRE_45,
            q_b => ccf(7 downto 2)
        );
    
    
    falcon_clut_green : entity work.altdpram1
        port map
        (
            wren_a => FALCON_CLUT_WR(1),
            wren_b => SYNTHESIZED_WIRE_4,
            clock_a => MAIN_CLK,
            clock_b => pixel_clk_i,
            address_a => FB_ADR(9 downto 2),
            address_b => clut_adr,
            data_a => fb_ad_in(23 downto 18),
            data_b => (others => '0'),
            q_a => SYNTHESIZED_WIRE_44,
            q_b => ccf(15 downto 10)
        );
    
    
    falcon_clut_red : entity work.altdpram1
        port map
        (
            wren_a => FALCON_CLUT_WR(0),
            wren_b => SYNTHESIZED_WIRE_5,
            clock_a => MAIN_CLK,
            clock_b => pixel_clk_i,
            address_a => FB_ADR(9 downto 2),
            address_b => clut_adr,
            data_a => fb_ad_in(31 downto 26),
            data_b => (others => '0'),
            q_a => SYNTHESIZED_WIRE_41,
            q_b => ccf(23 downto 18)
        );
    
    
    inst : entity work.lpm_fifo_dc0
        port map
        (
            wrreq => FIFO_WRE,
            wrclk => ddrclk(0),
            rdreq => SYNTHESIZED_WIRE_60,
            rdclk => pixel_clk_i,
            aclr => CLR_FIFO,
            data => VDMC,
            q => SYNTHESIZED_WIRE_63,
            wrusedw => FIFO_MW
        );
    
    
    inst1 : entity work.altddio_bidir0
        port map
        (
            oe => vdout_oe,
            inclock => ddrclk(1),
            outclock => ddrclk(3),
            datain_h => VDP_OUT(63 downto 32),
            datain_l => VDP_OUT(31 downto 0),
            padio => VD,
            combout => SYNTHESIZED_WIRE_15,
            dataout_h => VDP_IN(31 downto 0),
            dataout_l => VDP_IN(63 downto 32)
        );
    
    
    inst10 : entity work.lpm_ff4
        port map
        (
            clock => pixel_clk_i,
            data => SYNTHESIZED_WIRE_7,
            q => GDFX_TEMP_SIGNAL_0
        );
    
    
    inst100 : entity work.lpm_muxvdm
        port map
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
    
    
    inst102 : entity work.lpm_mux3
        port map
        (
            data1 => DFF_inst93,
            data0 => ZR_C8(0),
            sel => color1,
            result => ZR_C8B(0)
        );
    
    
    
    clut_adr(2) <= CLUT_ADR2A AND SYNTHESIZED_WIRE_61;    
    clut_adr(4) <= CLUT_OFF(0) OR SYNTHESIZED_WIRE_8;
    clut_adr(6) <= CLUT_OFF(2) OR SYNTHESIZED_WIRE_9;

    SYNTHESIZED_WIRE_61 <= color8 OR color4;
    SYNTHESIZED_WIRE_16 <= color4 OR color8 OR color2;
    
   
    fb_ad_out <= vdr when fb_vdoe(0) else (others => 'Z');
    fb_ad_out <= synthesized_wire_11 when fb_vdoe(1) else (others => 'Z');
    
    
    inst11 : entity work.lpm_ff5
        port map
        (
            clock => pixel_clk_i,
            data => SYNTHESIZED_WIRE_12,
            q => ZR_C8
        );
    
    fb_ad_out <= synthesized_wire_13 when fb_vdoe(2) else (others => 'Z');
    fb_ad_out <= synthesized_wire_14 when fb_vdoe(3) else (others => 'Z');
    
    
    inst12 : entity work.lpm_ff1
        port map
        (
            clock => ddrclk(0),
            data => VDP_IN(31 downto 0),
            q => vdvz(31 downto 0)
        );
    
    
    inst13 : entity work.lpm_ff0
        port map
        (
            clock => DDR_SYNC_66M,
            enable => FB_LE(0),
            data => fb_ad_in,
            q => FB_DDR(127 downto 96)
        );
    
    
    inst14 : entity work.lpm_ff0
        port map
        (
            clock => DDR_SYNC_66M,
            enable => FB_LE(1),
            data => fb_ad_in,
            q => FB_DDR(95 downto 64)
        );
    
    
    inst15 : entity work.lpm_ff0
        port map
        (
            clock => DDR_SYNC_66M,
            enable => FB_LE(2),
            data => fb_ad_in,
            q => FB_DDR(63 downto 32)
        );
    
    
    inst16 : entity work.lpm_ff0
        port map
        (
            clock => DDR_SYNC_66M,
            enable => FB_LE(3),
            data => fb_ad_in,
            q => FB_DDR(31 downto 0)
        );
    
    
    inst17 : entity work.lpm_ff0
        port map
        (
            clock => ddrclk(0),
            enable => DDR_FB(1),
            data => VDP_IN(31 downto 0),
            q => SYNTHESIZED_WIRE_11
        );
    
    
    inst18 : entity work.lpm_ff0
        port map
        (
            clock => ddrclk(0),
            enable => DDR_FB(0),
            data => VDP_IN(63 downto 32),
            q => SYNTHESIZED_WIRE_13
        );
    
    
    inst19 : entity work.lpm_ff0
        port map
        (
            clock => ddrclk(0),
            enable => DDR_FB(0),
            data => VDP_IN(31 downto 0),
            q => SYNTHESIZED_WIRE_14
        );
    
    
    inst2 : entity work.altddio_out0
        port map
        (
            outclock => ddrclk(3),
            datain_h => VDMP(7 downto 4),
            datain_l => VDMP(3 downto 0),
            dataout => VDM
        );
    
    
    inst20 : entity work.lpm_ff1
        port map
        (
            clock => ddrclk(0),
            data => vdvz(31 downto 0),
            q => vdvz(95 downto 64)
        );
    
    
    inst21 : entity work.lpm_mux0
        port map
        (
            clock => pixel_clk_i,
            data0x => FIFO_D(127 downto 96),
            data1x => FIFO_D(95 downto 64),
            data2x => FIFO_D(63 downto 32),
            data3x => FIFO_D(31 downto 0),
            sel => CLUT_MUX_ADR(1 downto 0),
            result => SYNTHESIZED_WIRE_48
        );
    
    
    inst22 : entity work.lpm_mux5
        port map
        (
            data0x => FB_DDR(127 downto 64),
            data1x => FB_DDR(63 downto 0),
            data2x => BLITTER_DOUT(127 downto 64),
            data3x => BLITTER_DOUT(63 downto 0),
            sel => ddrwr_d_sel,
            result => VDP_OUT
        );
    
    
    inst23 : entity work.lpm_constant2
        port map
        (
            result => GDFX_TEMP_SIGNAL_16
        );
    
    
    inst24 : entity work.lpm_mux1
        port map
        (
            clock => pixel_clk_i,
            data0x => FIFO_D(127 downto 112),
            data1x => FIFO_D(111 downto 96),
            data2x => FIFO_D(95 downto 80),
            data3x => FIFO_D(79 downto 64),
            data4x => FIFO_D(63 downto 48),
            data5x => FIFO_D(47 downto 32),
            data6x => FIFO_D(31 downto 16),
            data7x => FIFO_D(15 downto 0),
            sel => CLUT_MUX_ADR(2 downto 0),
            result => SYNTHESIZED_WIRE_7
        );
    
    
    inst25 : entity work.lpm_mux2
        port map
        (
            clock => pixel_clk_i,
            data0x => FIFO_D(127 downto 120),
            data10x => FIFO_D(47 downto 40),
            data11x => FIFO_D(39 downto 32),
            data12x => FIFO_D(31 downto 24),
            data13x => FIFO_D(23 downto 16),
            data14x => FIFO_D(15 downto 8),
            data15x => FIFO_D(7 downto 0),
            data1x => FIFO_D(119 downto 112),
            data2x => FIFO_D(111 downto 104),
            data3x => FIFO_D(103 downto 96),
            data4x => FIFO_D(95 downto 88),
            data5x => FIFO_D(87 downto 80),
            data6x => FIFO_D(79 downto 72),
            data7x => FIFO_D(71 downto 64),
            data8x => FIFO_D(63 downto 56),
            data9x => FIFO_D(55 downto 48),
            sel => CLUT_MUX_ADR,
            result => SYNTHESIZED_WIRE_12
        );
    
    
    inst26 : entity work.lpm_shiftreg4
        port map
        (
            clock => ddrclk(0),
            shiftin => SR_FIFO_WRE,
            shiftout => FIFO_WRE
        );
    
    
    inst27 : entity work.lpm_latch0
        port map
        (
            gate => DDR_SYNC_66M,
            data => SYNTHESIZED_WIRE_15,
            q => VDR
        );

    clut_adr(1) <= CLUT_ADR1A AND SYNTHESIZED_WIRE_16;
    
    
    inst3 : entity work.lpm_ff1
        port map
        (
            clock => ddrclk(0),
            data => VDP_IN(63 downto 32),
            q => vdvz(63 downto 32)
        );
    
    clut_adr(3) <= SYNTHESIZED_WIRE_61 AND CLUT_ADR3A;
    clut_adr(5) <= CLUT_OFF(1) OR SYNTHESIZED_WIRE_18;
    SYNTHESIZED_WIRE_8 <= CLUT_ADR4A AND color8;
    SYNTHESIZED_WIRE_18 <= CLUT_ADR5A AND color8;
    SYNTHESIZED_WIRE_9 <= CLUT_ADR6A AND color8;
    SYNTHESIZED_WIRE_46 <= CLUT_ADR7A AND color8;
      
    inst36 : entity work.lpm_ff6
        port map
        (
            clock => ddrclk(0),
            enable => blitter_dack(0),
            data => vdvz,
            q => blitter_din
        );
    
    vdout_oe <= ddr_wr OR sr_ddr_wr;
    video_ta <= blitter_ta or video_mod_ta or video_ddr_ta;
    
    inst4 : entity work.lpm_ff1
        port map
        (
            clock => ddrclk(0),
            data => vdvz(63 downto 32),
            q => vdvz(127 downto 96)
        );
    
    
    inst40 : entity work.mux41_0
        port map
        (
            S0 => color2,
            S1 => color4,
            D0 => CLUT_ADR6A,
            INH => SYNTHESIZED_WIRE_19,
            D1 => CLUT_ADR7A,
            Q => SYNTHESIZED_WIRE_54
        );
    
    
    inst41 : entity work.mux41_1
        port map
        (
            S0 => color2,
            S1 => color4,
            D0 => CLUT_ADR5A,
            INH => SYNTHESIZED_WIRE_20,
            D1 => CLUT_ADR6A,
            Q => SYNTHESIZED_WIRE_53
        );
    
    
    inst42 : entity work.mux41_2
        port map
        (
            S0 => color2,
            D2 => CLUT_ADR7A,
            S1 => color4,
            D0 => CLUT_ADR4A,
            INH => SYNTHESIZED_WIRE_21,
            D1 => CLUT_ADR5A,
            Q => SYNTHESIZED_WIRE_52
        );
    
    
    inst43 : entity work.mux41_3
        port map
        (
            S0 => color2,
            D2 => CLUT_ADR6A,
            S1 => color4,
            D0 => CLUT_ADR3A,
            INH => SYNTHESIZED_WIRE_22,
            D1 => CLUT_ADR4A,
            Q => SYNTHESIZED_WIRE_51
        );
    
    
    inst44 : entity work.mux41_4
        port map
        (
            S0 => color2,
            D2 => CLUT_ADR5A,
            S1 => color4,
            D0 => CLUT_ADR2A,
            INH => SYNTHESIZED_WIRE_23,
            D1 => CLUT_ADR3A,
            Q => SYNTHESIZED_WIRE_50
        );
    
    
    inst45 : entity work.mux41_5
        port map
        (
            S0 => color2,
            D2 => CLUT_ADR4A,
            S1 => color4,
            D0 => CLUT_ADR1A,
            INH => SYNTHESIZED_WIRE_24,
            D1 => CLUT_ADR2A,
            Q => SYNTHESIZED_WIRE_49
        );
    
    
    inst46 : entity work.lpm_ff3
        port map
        (
            clock => pixel_clk_i,
            data => SYNTHESIZED_WIRE_25,
            q => SYNTHESIZED_WIRE_43
        );
    
    
    inst47 : entity work.lpm_ff3
        port map
        (
            clock => pixel_clk_i,
            data => ccf,
            q => SYNTHESIZED_WIRE_25
        );
    
    
    
    inst49 : entity work.lpm_ff3
        port map
        (
            clock => pixel_clk_i,
            data => SYNTHESIZED_WIRE_26,
            q => SYNTHESIZED_WIRE_42
        );
    
    
    inst5 : entity work.altddio_out2
        port map
        (
            outclock => pixel_clk_i,
            datain_h => SYNTHESIZED_WIRE_62,
            datain_l => SYNTHESIZED_WIRE_62,
            dataout => SYNTHESIZED_WIRE_65
        );
    
    fb_ad_out(26 downto 24) <= synthesized_wire_29 when st_clut_rd else (others => 'Z');
    
    
    inst52 : entity work.lpm_ff3
        port map
        (
            clock => pixel_clk_i,
            data => CCS,
            q => SYNTHESIZED_WIRE_26
        );
    
    fb_ad_out(7 downto 0) <= synthesized_wire_30 when acp_clut_rd else (others => 'Z');
    
    
    inst54 : entity work.lpm_constant0
        port map
        (
            result => CCS(20 downto 16)
        );
    
    
    fb_ad_out(22 downto 20) <= synthesized_wire_31 when st_clut_rd else (others => 'Z');
    fb_ad_out(15 downto 8) <= synthesized_wire_32 when acp_clut_rd else (others => 'Z');
    
    fb_ad_out(23 downto 16) <= synthesized_wire_33 when acp_clut_rd else (others => 'Z');
    
    
    inst59 : entity work.lpm_constant0
        port map
        (
            result => CCS(12 downto 8)
        );
    
    fb_ad_out(18 downto 16) <= synthesized_wire_34 when st_clut_rd else (others => 'Z');
    
    
    inst62 : entity work.lpm_muxdz
        port map
        (
            clock => pixel_clk_i,
            clken => FIFO_RDE,
            sel => INTER_ZEI,
            data0x => SYNTHESIZED_WIRE_63,
            data1x => SYNTHESIZED_WIRE_36,
            result => FIFO_D
        );
    
    
    inst63 : entity work.lpm_fifodz
        port map
        (
            wrreq => SYNTHESIZED_WIRE_60,
            rdreq => SYNTHESIZED_WIRE_38,
            clock => pixel_clk_i,
            aclr => DOP_FIFO_CLR,
            data => SYNTHESIZED_WIRE_63,
            q => SYNTHESIZED_WIRE_36
        );
    
    
    inst64 : entity work.lpm_constant0
        port map
        (
            result => CCS(4 downto 0)
        );
    
    
    SYNTHESIZED_WIRE_60 <= FIFO_RDE AND SYNTHESIZED_WIRE_40;
    
    fb_ad_out(31 downto 26) <= synthesized_wire_41 when falcon_clut_rdh else (others => 'Z');
    fb_ad_out(23 downto 18) <= synthesized_wire_44 when falcon_clut_rdh else (others => 'Z');
    
    SYNTHESIZED_WIRE_38 <= FIFO_RDE AND INTER_ZEI;
    SYNTHESIZED_WIRE_40 <= NOT(INTER_ZEI);
    
    inst7 : entity work.lpm_mux6
        port map
        (
            clock => pixel_clk_i,
            data0x => SYNTHESIZED_WIRE_42,
            data1x => SYNTHESIZED_WIRE_43,
            data2x => (others => '0'),
            data3x => (others => '0'),
            data4x => CCA,
            data5x => CC16,
            data6x => CC24(23 downto 0),
            data7x => BORDER_COLOR,
            sel => CCSEL,
            result => SYNTHESIZED_WIRE_62
        );
    
    
    inst71 : entity work.lpm_ff6
        port map
        (
            clock => ddrclk(0),
            enable => FIFO_WRE,
            data => vdvz,
            q => VDMA
        );
    
    fb_ad_out(23 downto 18) <= synthesized_wire_45 when falcon_clut_rdl else (others => 'Z');    
    
    
    
    inst77 : entity work.lpm_constant1
        port map
        (
            result => ccf(1 downto 0)
        );
    
    
    
    clut_adr(7) <= CLUT_OFF(3) OR SYNTHESIZED_WIRE_46;
    
    
    
    inst80 : entity work.lpm_constant1
        port map
        (
            result => ccf(9 downto 8)
        );
    
    
    inst81 : entity work.lpm_mux4
        port map
        (
            sel => color1,
            data0x => ZR_C8(7 downto 1),
            data1x => SYNTHESIZED_WIRE_47,
            result => ZR_C8B(7 downto 1)
        );
    
    
    inst82 : entity work.lpm_constant3
        port map
        (
            result => SYNTHESIZED_WIRE_47
        );
    
    
    inst83 : entity work.lpm_constant1
        port map
        (
            result => ccf(17 downto 16)
        );
    
    
    process(ddrclk(0), ddr_wr)
    begin
        if (ddr_wr = '1') then
            vdqs <= (others => ddrclk(0));
        ELSE
            vdqs <= (others => 'Z');
        end if;
    end process;
        
    
    process(ddrclk(3))
    begin
        if (rising_edge(ddrclk(3))) then
            ddrwr_d_sel(0) <= SR_DDRWR_D_SEL;
            ddr_wr <= sr_ddr_wr;
        end if;
    end process;
    
    
    inst89 : entity work.lpm_shiftreg6
        port map
        (
            clock => ddrclk(0),
            shiftin => SR_BLITTER_DACK,
            q => blitter_dack
        );
    
    
    inst9 : entity work.lpm_ff1
        port map
        (
            clock => pixel_clk_i,
            data => SYNTHESIZED_WIRE_48,
            q => CC24
        );
    
        
    process(pixel_clk_i)
    begin
        if (rising_edge(pixel_clk_i)) then
            DFF_inst91 <= clut_adr(0);
        end if;
    end process;
    
    
    inst92 : entity work.lpm_shiftreg6
        port map
        (
            clock => ddrclk(0),
            shiftin => SR_DDR_FB,
            q => DDR_FB
        );
    
    
    process(pixel_clk_i)
    begin
        if (rising_edge(pixel_clk_i)) then
            DFF_inst93 <= DFF_inst91;
        end if;
    end process;
    
    
    inst94 : entity work.lpm_ff6
        port map
        (
            clock => ddrclk(0),
            enable => FIFO_WRE,
            data => VDMA,
            q => VDMB
        );
    
    
    process(pixel_clk_i)
    begin
        if (rising_edge(pixel_clk_i)) then
            SYNTHESIZED_WIRE_64 <= FIFO_RDE;
        end if;
    end process;
    
    
    
    inst97 : entity work.lpm_ff5
        port map
        (
            clock => ddrclk(2),
            data => SR_VDMP,
            q => VDMP
        );
    
    
    sr0 : entity work.lpm_shiftreg0
        port map
        (
            load => SYNTHESIZED_WIRE_64,
            clock => pixel_clk_i,
            shiftin => SYNTHESIZED_WIRE_49,
            data => FIFO_D(127 downto 112),
            shiftout => clut_adr(0)
        );
    
    
    sr1 : entity work.lpm_shiftreg0
        port map
        (
            load => SYNTHESIZED_WIRE_64,
            clock => pixel_clk_i,
            shiftin => SYNTHESIZED_WIRE_50,
            data => FIFO_D(111 downto 96),
            shiftout => CLUT_ADR1A
        );
    
    
    sr2 : entity work.lpm_shiftreg0
        port map
        (
            load => SYNTHESIZED_WIRE_64,
            clock => pixel_clk_i,
            shiftin => SYNTHESIZED_WIRE_51,
            data => FIFO_D(95 downto 80),
            shiftout => CLUT_ADR2A
        );
    
    
    sr3 : entity work.lpm_shiftreg0
        port map
        (
            load => SYNTHESIZED_WIRE_64,
            clock => pixel_clk_i,
            shiftin => SYNTHESIZED_WIRE_52,
            data => FIFO_D(79 downto 64),
            shiftout => CLUT_ADR3A
        );
    
    
    sr4 : entity work.lpm_shiftreg0
        port map
        (
            load => SYNTHESIZED_WIRE_64,
            clock => pixel_clk_i,
            shiftin => SYNTHESIZED_WIRE_53,
            data => FIFO_D(63 downto 48),
            shiftout => CLUT_ADR4A
        );
    
    
    sr5 : entity work.lpm_shiftreg0
        port map
        (
            load => SYNTHESIZED_WIRE_64,
            clock => pixel_clk_i,
            shiftin => SYNTHESIZED_WIRE_54,
            data => FIFO_D(47 downto 32),
            shiftout => CLUT_ADR5A
        );
    
    
    sr6 : entity work.lpm_shiftreg0
        port map
        (
            load => SYNTHESIZED_WIRE_64,
            clock => pixel_clk_i,
            shiftin => CLUT_ADR7A,
            data => FIFO_D(31 downto 16),
            shiftout => CLUT_ADR6A
        );
    
    
    sr7 : entity work.lpm_shiftreg0
        port map
        (
            load => SYNTHESIZED_WIRE_64,
            clock => pixel_clk_i,
            shiftin => clut_adr(0),
            data => FIFO_D(15 downto 0),
            shiftout => CLUT_ADR7A
        );
    
    
    ST_CLUT_BLUE : entity work.altdpram0
        port map
        (
            wren_a => ST_CLUT_WR(1),
            wren_b => '0',
            clock_a => MAIN_CLK,
            clock_b => pixel_clk_i,
            address_a => FB_ADR(4 downto 1),
            address_b => clut_adr(3 downto 0),
            data_a => fb_ad_in(18 downto 16),
            data_b => (others => '0'),
            q_a => SYNTHESIZED_WIRE_34,
            q_b => CCS(7 downto 5)
        );
    
    
    ST_CLUT_GREEN : entity work.altdpram0
        port map
        (
            wren_a => ST_CLUT_WR(1),
            wren_b => '0',
            clock_a => MAIN_CLK,
            clock_b => pixel_clk_i,
            address_a => FB_ADR(4 downto 1),
            address_b => clut_adr(3 downto 0),
            data_a => fb_ad_in(22 downto 20),
            data_b => (others => '0'),
            q_a => SYNTHESIZED_WIRE_31,
            q_b => CCS(15 downto 13)
        );
    
    
    ST_CLUT_RED : entity work.altdpram0
        port map
        (
            wren_a => ST_CLUT_WR(0),
            wren_b => '0',
            clock_a => MAIN_CLK,
            clock_b => pixel_clk_i,
            address_a => FB_ADR(4 downto 1),
            address_b => clut_adr(3 downto 0),
            data_a => fb_ad_in(26 downto 24),
            data_b => (others => '0'),
            q_a => SYNTHESIZED_WIRE_29,
            q_b => CCS(23 downto 21)
        );
    
    
    i_video_mod_mux_clutctr : entity work.video_mod_mux_clutctr
        port map
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
            fb_ad_in => fb_ad_in,
            fb_ad_out => fb_ad_out,
            FB_ADR => FB_ADR,
            VR_D => VR_D,
            color8 => color8,
            ACP_CLUT_RD => ACP_CLUT_RD,
            color1 => color1,
            FALCON_CLUT_RDH => FALCON_CLUT_RDH,
            FALCON_CLUT_RDL => FALCON_CLUT_RDL,
            ST_CLUT_RD => ST_CLUT_RD,
            HSYNC => HSYNC,
            VSYNC => VSYNC,
            nBLANK => nBLANK,
            nSYNC => nSYNC,
            nPD_VGA => nPD_VGA,
            FIFO_RDE => FIFO_RDE,
            color2 => color2,
            color4 => color4,
            pixel_clk => pixel_clk_i,
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
    
    pixel_clk <= pixel_clk_i;
end rtl;