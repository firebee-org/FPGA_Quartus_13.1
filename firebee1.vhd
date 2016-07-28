LIBRARY ieee;
    USE ieee.std_logic_1164.all; 

LIBRARY altera;
    USE altera.altera_primitives_components.all;
    
LIBRARY work;

ENTITY firebee1 IS 
	port
	(
		FB_ALE          : in std_logic;
		nFB_WR          : in std_logic;
		nFB_CS1         : in std_logic;
		nFB_CS2         : in std_logic;
		nFB_CS3         : in std_logic;
		FB_SIZE0        : in std_logic;
		FB_SIZE1        : in std_logic;
		nFB_BURST       : in std_logic;
		LP_BUSY         : in std_logic;
		nACSI_DRQ       : in std_logic;
		nACSI_INT       : in std_logic;
		RxD             : in std_logic;
		CTS             : in std_logic;
		RI              : in std_logic;
		DCD             : in std_logic;
		AMKB_RX         : in std_logic;
		PIC_AMKB_RX     : in std_logic;
		IDE_RDY         : in std_logic;
		IDE_INT         : in std_logic;
		WP_CF_CARD      : in std_logic;
		TRACK00         : in std_logic;
		nWP             : in std_logic;
		nDCHG           : in std_logic;
		SD_DATA0        : in std_logic;
		SD_DATA1        : in std_logic;
		SD_DATA2        : in std_logic;
		SD_CARD_DEDECT  : in std_logic;
		nSCSI_DRQ       : in std_logic;
		SD_WP           : in std_logic;
		nRD_DATA        : in std_logic;
		nSCSI_C_D       : in std_logic;
		nSCSI_I_O       : in std_logic;
		nSCSI_MSG       : in std_logic;
		nDACK0          : in std_logic;
		PIC_INT         : in std_logic;
		nFB_OE          : in std_logic;
		TOUT0           : in std_logic;
		nMASTER         : in std_logic;
		DVI_INT         : in std_logic;
		nDACK1          : in std_logic;
		nPCI_INTD       : in std_logic;
		nPCI_INTC       : in std_logic;
		nPCI_INTB       : in std_logic;
		nPCI_INTA       : in std_logic;
		E0_INT          : in std_logic;
		nINDEX          : in std_logic;
		HD_DD           : in std_logic;
		MAIN_CLK        : in std_logic;
		nRSTO_MCF       : in std_logic;
		CLK33MDIR       : in std_logic;
		SCSI_PAR        : inout std_logic;
		nSCSI_RST       : inout std_logic;
		nSCSI_SEL       : inout std_logic;
		nSCSI_BUSY      : inout std_logic;
		SD_CD_DATA3     : inout std_logic;
		SD_CMD_D1       : inout std_logic;
		MIDI_IN_PIN     : inout std_logic;
		ACSI_D          : inout std_logic_vector(7 downto 0);
		FB_AD           : inout std_logic_vector(31 downto 0);
		IO              : inout std_logic_vector(17 downto 0);
		LP_D            : inout std_logic_vector(7 downto 0);
		SCSI_D          : inout std_logic_vector(7 downto 0);
		SRD             : inout std_logic_vector(15 downto 0);
		VD              : inout std_logic_vector(31 downto 0);
		VDQS            : inout std_logic_vector(3 downto 0);
		LP_STR          : out std_logic;
		nACSI_ACK       : out std_logic;
		nACSI_RESET     : out std_logic;
		nACSI_CS        : out std_logic;
		ACSI_DIR        : out std_logic;
		ACSI_A1         : out std_logic;
		nSCSI_ACK       : out std_logic;
		nSCSI_ATN       : out std_logic;
		SCSI_DIR        : out std_logic;
		MIDI_TLR        : out std_logic;
		TxD             : out std_logic;
		RTS             : out std_logic;
		DTR             : out std_logic;
		AMKB_TX         : out std_logic;
		IDE_RES         : out std_logic;
		nIDE_CS0        : out std_logic;
		nIDE_CS1        : out std_logic;
		nIDE_WR         : out std_logic;
		nIDE_RD         : out std_logic;
		nCF_CS0         : out std_logic;
		nCF_CS1         : out std_logic;
		nROM3           : out std_logic;
		nROM4           : out std_logic;
		nRP_UDS         : out std_logic;
		nRP_LDS         : out std_logic;
		nSDSEL          : out std_logic;
		nWR_GATE        : out std_logic;
		nWR             : out std_logic;
		YM_QA           : out std_logic;
		YM_QB           : out std_logic;
		YM_QC           : out std_logic;
		SD_CLK          : out std_logic;
		DSA_D           : out std_logic;
		nVWE            : out std_logic;
		nVCAS           : out std_logic;
		nVRAS           : out std_logic;
		nVCS            : out std_logic;
		nPD_VGA         : out std_logic;
		TIN0            : out std_logic;
		nSRCS           : out std_logic;
		nSRBLE          : out std_logic;
		nSRBHE          : out std_logic;
		nSRWE           : out std_logic;
		nDREQ1          : out std_logic;
		LED_FPGA_OK     : out std_logic;
		nSROE           : out std_logic;
		VCKE            : out std_logic;
		nFB_TA          : out std_logic;
		nDDR_CLK        : out std_logic;
		DDR_CLK         : out std_logic;
		VSYNC_PAD       : out std_logic;
		HSYNC_PAD       : out std_logic;
		nBLANK_PAD      : out std_logic;
		PIXEL_CLK_PAD   : out std_logic;
		nSYNC           : out std_logic;
		nMOT_ON         : out std_logic;
		nSTEP_DIR       : out std_logic;
		nSTEP           : out std_logic;
		LPDIR           : out std_logic;
		MIDI_OLR        : out std_logic;
		CLK25M          : out std_logic;
		CLKUSB          : out std_logic;
		CLK24M576       : out std_logic;
		BA              : out std_logic_vector(1 downto 0);
		nIRQ            : out std_logic_vector(7 downto 2);
		VA              : out  std_logic_vector(12 downto 0);
		VB              : out std_logic_vector(7 downto 0);
		VDM             : out std_logic_vector(3 downto 0);
		VG              : out std_logic_vector(7 downto 0);
		VR              : out std_logic_vector(7 downto 0)
	);
end firebee1;

architecture rtl OF firebee1 IS 
    signal ACP_CONF         : std_logic_vector(31 downto 0);
    signal clk25m_i         : std_logic;
    signal CLK2M            : std_logic;
    signal CLK2M4576        : std_logic;
    signal CLK33M           : std_logic;
    signal CLK48M           : std_logic;
    signal CLK500k          : std_logic;
    signal CLK_VIDEO        : std_logic;
    signal DDR_SYNC_66M     : std_logic;
    signal DDRCLK           : std_logic_vector(3 downto 0);
    signal DMA_DRQ          : std_logic;
    signal DSP_INT          : std_logic;
    signal DSP_TA           : std_logic;
    signal FALCON_IO_TA     : std_logic;
    signal FB_ADR           : std_logic_vector(31 downto 0);
    signal FDC_CLK          : std_logic;
    signal HSYNC            : std_logic;
    signal INT_HANDLER_TA   : std_logic;
    signal LP_DIR           : std_logic;
    signal MIDI_IN          : std_logic;
    signal MOT_ON           : std_logic;
    signal nBLANK           : std_logic;
    signal nDREQ0           : std_logic;
    signal nMFP_INT         : std_logic;
    signal nRSTO            : std_logic;
    signal PIXEL_CLK        : std_logic;
    signal SD_CDM_D1        : std_logic;
    signal STEP             : std_logic;
    signal STEP_DIR         : std_logic;
    signal TIMEBASE         : std_logic_vector(17 downto 0);
    signal VIDEO_RECONFIG   : std_logic;
    signal Video_TA         : std_logic;
    signal VR_BUSY          : std_logic;
    signal VR_D             : std_logic_vector(8 downto 0);
    signal VR_RD            : std_logic;
    signal VR_WR            : std_logic;
    signal VSYNC            : std_logic;
    signal WR_DATA          : std_logic;
    signal WR_GATE          : std_logic;
    signal scandataout      : std_logic;
    signal scandone         : std_logic;
    signal reset            : std_logic;
    signal pll_reset        : std_logic;
    signal scanclk          : std_logic;
    signal scandata         : std_logic;
    signal scan_clkena      : std_logic;
    signal config_update    : std_logic;
    signal pll3_locked      : std_logic;
    signal pll1_locked      : std_logic;
    signal nSRCS_i          : std_logic;
    signal nFB_WR_i         : std_logic;
    signal nIDE_RD_i        : std_logic;
    signal nIDE_WR_i        : std_logic;

    component altpll_reconfig1
        port
        (
            clock		        : in std_logic ;
            counter_param		: in std_logic_vector (2 downto 0);
            counter_type		: in std_logic_vector (3 downto 0);
            data_in		        : in std_logic_vector (8 downto 0);
            pll_areset_in		: in std_logic  := '0';
            pll_scandataout		: in std_logic ;
            pll_scandone		: in std_logic ;
            read_param		    : in std_logic ;
            reconfig		    : in std_logic ;
            reset		        : in std_logic ;
            write_param		    : in std_logic ;
            busy		        : out std_logic ;
            data_out		    : out std_logic_vector (8 downto 0);
            pll_areset		    : out std_logic ;
            pll_configupdate	: out std_logic ;
            pll_scanclk		    : out std_logic ;
            pll_scanclkena		: out std_logic ;
            pll_scandata		: out std_logic 
        );
    end component altpll_reconfig1;
    
    component altpll4
        port
        (
            areset		    : in std_logic  := '0';
            configupdate	: in std_logic  := '0';
            inclk0		    : in std_logic  := '0';
            scanclk		    : in std_logic  := '1';
            scanclkena		: in std_logic  := '0';
            scandata		: in std_logic  := '0';
            c0		        : out std_logic;
            locked		    : out std_logic;
            scandataout		: out std_logic;
            scandone		: out std_logic 
        );
    end component altpll4;

begin 
    nDREQ1 <= nDACK1;
    
    i_atari_clk_pll : work.altpll3
        port map
        (
            inclk0 => MAIN_CLK,
            c0 => clk25m_i,
            c1 => CLK2M,
            c2 => CLK500k,
            c3 => CLK2M4576,
            locked => pll3_locked
        );
    
    
    i_ddr_clk_pll : work.altpll2
        port map
        (
            inclk0 => MAIN_CLK,
            c0 => DDRCLK(0),
            c1 => DDRCLK(1),
            c2 => DDRCLK(2),
            c3 => DDRCLK(3),
            c4 => DDR_SYNC_66M
        );
    
    
    i_dsp : work.dsp
        port map
        (
            CLK33M => CLK33M,
            MAIN_CLK => MAIN_CLK,
            nFB_OE => nFB_OE,
            nFB_WR => nFB_WR,
            nFB_CS1 => nFB_CS1,
            nFB_CS2 => nFB_CS2,
            FB_SIZE0 => FB_SIZE0,
            FB_SIZE1 => FB_SIZE1,
            nFB_BURST => nFB_BURST,
            nRSTO => nRSTO,
            nFB_CS3 => nFB_CS3,
            FB_AD => FB_AD,
            FB_ADR => FB_ADR,
            IO => IO,
            SRD => SRD,
            nSRCS => nSRCS_i,
            nSRBLE => nSRBLE,
            nSRBHE => nSRBHE,
            nSRWE => nSRWE,
            nSROE => nSROE,
            DSP_INT => DSP_INT,
            DSP_TA => DSP_TA
        );
    
    
    i_falconio_sdcard_ide_cf : work.falconio_sdcard_ide_cf
        port map
        (
            CLK33M => CLK33M,
            MAIN_CLK => MAIN_CLK,
            CLK2M => CLK2M,
            CLK500k => CLK500k,
            nFB_CS1 => nFB_CS1,
            FB_SIZE0 => FB_SIZE0,
            FB_SIZE1 => FB_SIZE1,
            nFB_BURST => nFB_BURST,
            LP_BUSY => LP_BUSY,
            nACSI_DRQ => nACSI_DRQ,
            nACSI_INT => nACSI_INT,
            nSCSI_DRQ => nSCSI_DRQ,
            nSCSI_MSG => nSCSI_MSG,
            MIDI_IN => MIDI_IN,
            RxD => RxD,
            CTS => CTS,
            RI => RI,
            DCD => DCD,
            AMKB_RX => AMKB_RX,
            PIC_AMKB_RX => PIC_AMKB_RX,
            IDE_RDY => IDE_RDY,
            IDE_INT => IDE_INT,
            WP_CS_CARD => '0',
            nINDEX => nINDEX,
            TRACK00 => TRACK00,
            nRD_DATA => nRD_DATA,
            nDCHG => nDCHG,
            SD_DATA0 => SD_DATA0,
            SD_DATA1 => SD_DATA1,
            SD_DATA2 => SD_DATA2,
            SD_CARD_DEDECT => SD_CARD_DEDECT,
            SD_WP => SD_WP,
            nDACK0 => nDACK0,
            nFB_WR => nFB_WR,
            WP_CF_CARD => WP_CF_CARD,
            nWP => nWP,
            nFB_CS2 => nFB_CS2,
            nRSTO => nRSTO,
            nSCSI_C_D => nSCSI_C_D,
            nSCSI_I_O => nSCSI_I_O,
            CLK2M4576 => CLK2M4576,
            nFB_OE => nFB_OE,
            VSYNC => VSYNC,
            HSYNC => HSYNC,
            DSP_INT => DSP_INT,
            nBLANK => nBLANK,
            FDC_CLK => FDC_CLK,
            FB_ALE => FB_ALE,
            HD_DD => HD_DD,
            SCSI_PAR => SCSI_PAR,
            nSCSI_SEL => nSCSI_SEL,
            nSCSI_BUSY => nSCSI_BUSY,
            nSCSI_RST => nSCSI_RST,
            SD_CD_DATA3 => SD_CD_DATA3,
            SD_CDM_D1 => SD_CDM_D1,
            ACP_CONF => ACP_CONF(31 downto 24),
            ACSI_D => ACSI_D,
            FB_AD => FB_AD,
            FB_ADR => FB_ADR,
            LP_D => LP_D,
            SCSI_D => SCSI_D,
            nIDE_CS1 => nIDE_CS1,
            nIDE_CS0 => nIDE_CS0,
            LP_STR => LP_STR,
            LP_DIR => LP_DIR,
            nACSI_ACK => nACSI_ACK,
            nACSI_RESET => nACSI_RESET,
            nACSI_CS => nACSI_CS,
            ACSI_DIR => ACSI_DIR,
            ACSI_A1 => ACSI_A1,
            nSCSI_ACK => nSCSI_ACK,
            nSCSI_ATN => nSCSI_ATN,
            SCSI_DIR => SCSI_DIR,
            SD_CLK => SD_CLK,
            YM_QA => YM_QA,
            YM_QC => YM_QC,
            YM_QB => YM_QB,
            nSDSEL => nSDSEL,
            STEP => STEP,
            MOT_ON => MOT_ON,
            nRP_LDS => nRP_LDS,
            nRP_UDS => nRP_UDS,
            nROM4 => nROM4,
            nROM3 => nROM3,
            nCF_CS1 => nCF_CS1,
            nCF_CS0 => nCF_CS0,
            nIDE_RD => nIDE_RD_i,
            nIDE_WR => nIDE_WR_i,
            AMKB_TX => AMKB_TX,
            IDE_RES => IDE_RES,
            DTR => DTR,
            RTS => RTS,
            TxD => TxD,
            MIDI_OLR => MIDI_OLR,
            DSA_D => DSA_D,
            nMFP_INT => nMFP_INT,
            FALCON_IO_TA => FALCON_IO_TA,
            STEP_DIR => STEP_DIR,
            WR_DATA => WR_DATA,
            WR_GATE => WR_GATE,
            DMA_DRQ => DMA_DRQ,
            MIDI_TLR => MIDI_TLR
        );
    
    
    i_interrupt_handler : work.interrupt_handler
        port map
        (
            MAIN_CLK => MAIN_CLK,
            nFB_WR => nFB_WR,
            nFB_CS1 => nFB_CS1,
            nFB_CS2 => nFB_CS2,
            FB_SIZE0 => FB_SIZE0,
            FB_SIZE1 => FB_SIZE1,
            PIC_INT => PIC_INT,
            E0_INT => E0_INT,
            DVI_INT => DVI_INT,
            nPCI_INTA => nPCI_INTA,
            nPCI_INTB => nPCI_INTB,
            nPCI_INTC => nPCI_INTC,
            nPCI_INTD => nPCI_INTD,
            nMFP_INT => nMFP_INT,
            nFB_OE => nFB_OE,
            DSP_INT => DSP_INT,
            VSYNC => VSYNC,
            HSYNC => HSYNC,
            DMA_DRQ => DMA_DRQ,
            nRSTO => nRSTO,
            FB_AD => FB_AD,
            FB_ADR => FB_ADR,
            INT_HANDLER_TA => INT_HANDLER_TA,
            TIN0 => TIN0,
            ACP_CONF => ACP_CONF,
            nIRQ => nIRQ
        );
    
    
    i_mfp_acia_clk_pll : work.altpll1
        port map
        (
            inclk0 => MAIN_CLK,
            c0 => CLK48M,
            c1 => FDC_CLK,
            c2 => CLK24M576,
            locked => pll1_locked
        );
    
    
    i_pll_reconfig : altpll_reconfig1
        port map
        (
            reconfig => VIDEO_RECONFIG,
            read_param => VR_RD,
            write_param => VR_WR,
            pll_areset_in => '0',
            pll_scandataout => scandataout,
            pll_scandone => scandone,
            clock => MAIN_CLK,
            reset => reset,
            counter_param => FB_ADR(8 downto 6),
            counter_type => FB_ADR(5 downto 2),
            data_in => FB_AD(24 downto 16),
            busy => VR_BUSY,
            pll_scandata => scandata,
            pll_scanclk => scanclk,
            pll_scanclkena => scan_clkena,
            pll_configupdate => config_update,
            pll_areset => pll_reset,
            data_out => VR_D
        );
    
    
    i_video : entity work.video
        port map
        (
            MAIN_CLK => MAIN_CLK,
            nFB_CS1 => nFB_CS1,
            nFB_CS2 => nFB_CS2,
            nFB_CS3 => nFB_CS3,
            nFB_WR => nFB_WR,
            FB_SIZE0 => FB_SIZE0,
            FB_SIZE1 => FB_SIZE1,
            nRSTO => nRSTO,
            nFB_OE => nFB_OE,
            FB_ALE => FB_ALE,
            DDR_SYNC_66M => DDR_SYNC_66M,
            CLK33M => CLK33M,
            CLK25M => clk25m_i,
            CLK_VIDEO => CLK_VIDEO,
            VR_BUSY => VR_BUSY,
            DDRCLK => DDRCLK,
            FB_AD => FB_AD,
            FB_ADR => FB_ADR,
            VD => VD,
            VDQS => VDQS,
            VR_D => VR_D,
            VR_RD => VR_RD,
            nBLANK => nBLANK,
            nVWE => nVWE,
            nVCAS => nVCAS,
            nVRAS => nVRAS,
            nVCS => nVCS,
            nPD_VGA => nPD_VGA,
            VCKE => VCKE,
            VSYNC => VSYNC,
            HSYNC => HSYNC,
            nSYNC => nSYNC,
            VIDEO_TA => Video_TA,
            PIXEL_CLK => PIXEL_CLK,
            VIDEO_RECONFIG => VIDEO_RECONFIG,
            VR_WR => VR_WR,
            BA => BA,
            VA => VA,
            VB => VB,
            VDM => VDM,
            VG => VG,
            VR => VR
        );
    
    
    i_video_clk_pll : altpll4
        port map
        (
            inclk0 => CLK48M,
            areset => pll_reset,
            scanclk => scanclk,
            scandata => scandata,
            scanclkena => scan_clkena,
            configupdate => config_update,
            c0 => CLK_VIDEO,
            scandataout => scandataout,
            scandone => scandone
        );
    
    
    inst1 : work.lpm_ff0
        port map
        (
            clock => DDR_SYNC_66M,
            enable => FB_ALE,
            data => FB_AD,
            q => FB_ADR
        );
    
    nMOT_ON <= not(MOT_ON);
    nSTEP_DIR <= not(STEP_DIR);
    nSTEP <= not(STEP);
    nWR <= not(WR_DATA);
    
    inst18 : work.lpm_counter0
        port map
        (
            clock => CLK500k,
            q => TIMEBASE
        );
    
    
    nWR_GATE <= not(WR_GATE);

    nFB_TA <= not(video_ta or int_handler_ta or dsp_ta or falcon_io_ta);
    
    CLK33M <= MAIN_CLK;

    reset <= not(nRSTO);
    nRSTO <= pll3_locked and pll1_locked and nRSTO_MCF;
    
    inst29 : alt_iobuf
        port map
        (
            i => CLK2M,
            oe => CLK2M,
            io => MIDI_IN_PIN,
            o => MIDI_IN
        );
    
    LED_FPGA_OK <= TIMEBASE(17);
    
    nDDR_CLK <= not(DDRCLK(0));
    
    inst5 : work.altddio_out3
        port map
        (
            datain_h => VSYNC,
            datain_l => VSYNC,
            outclock => PIXEL_CLK,
            dataout => VSYNC_PAD
        );
    
    
    inst6 : work.altddio_out3
        port map
        (
            datain_h => HSYNC,
            datain_l => HSYNC,
            outclock => PIXEL_CLK,
            dataout => HSYNC_PAD
        );
    
    
    inst8 : work.altddio_out3
        port map
        (
            datain_h => nBLANK,
            datain_l => nBLANK,
            outclock => PIXEL_CLK,
            dataout => nBLANK_PAD
        );
    
    inst9 : work.altddio_out3
        port map
        (
            datain_h => '0',
            datain_l => '1',
            outclock => PIXEL_CLK,
            dataout => PIXEL_CLK_PAD
        );
    
    SD_CMD_D1 <= SD_CDM_D1;
    DDR_CLK <= DDRCLK(0);
    LPDIR <= LP_DIR;
    CLK25M <= clk25m_i;
    CLKUSB <= CLK48M;
    nSRCS <= nSRCS_i;
    
    nIDE_RD <= nIDE_RD_i;
    nIDE_WR <= nIDE_WR_i;
end rtl;