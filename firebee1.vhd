LIBRARY ieee;
    USE ieee.std_logic_1164.all; 

LIBRARY altera;
    USE altera.altera_primitives_components.all;
    
LIBRARY work;

ENTITY firebee1 IS 
	PORT
	(
		FB_ALE          :  IN std_logic;
		nFB_WR          :  IN std_logic;
		nFB_CS1         :  IN std_logic;
		nFB_CS2         :  IN std_logic;
		nFB_CS3         :  IN std_logic;
		FB_SIZE0        :  IN std_logic;
		FB_SIZE1        :  IN std_logic;
		nFB_BURST       :  IN std_logic;
		LP_BUSY         :  IN std_logic;
		nACSI_DRQ       :  IN std_logic;
		nACSI_INT       :  IN std_logic;
		RxD             :  IN std_logic;
		CTS             :  IN std_logic;
		RI              :  IN std_logic;
		DCD             :  IN std_logic;
		AMKB_RX         :  IN std_logic;
		PIC_AMKB_RX     :  IN std_logic;
		IDE_RDY         :  IN std_logic;
		IDE_INT         :  IN std_logic;
		WP_CF_CARD      :  IN std_logic;
		TRACK00         :  IN std_logic;
		nWP             :  IN std_logic;
		nDCHG           :  IN std_logic;
		SD_DATA0        :  IN std_logic;
		SD_DATA1        :  IN std_logic;
		SD_DATA2        :  IN std_logic;
		SD_CARD_DEDECT  :  IN std_logic;
		nSCSI_DRQ       :  IN std_logic;
		SD_WP           :  IN std_logic;
		nRD_DATA        :  IN std_logic;
		nSCSI_C_D       :  IN std_logic;
		nSCSI_I_O       :  IN std_logic;
		nSCSI_MSG       :  IN std_logic;
		nDACK0          :  IN std_logic;
		PIC_INT         :  IN std_logic;
		nFB_OE          :  IN std_logic;
		TOUT0           :  IN std_logic;
		nMASTER         :  IN std_logic;
		DVI_INT         :  IN std_logic;
		nDACK1          :  IN std_logic;
		nPCI_INTD       :  IN std_logic;
		nPCI_INTC       :  IN std_logic;
		nPCI_INTB       :  IN std_logic;
		nPCI_INTA       :  IN std_logic;
		E0_INT          :  IN std_logic;
		nINDEX          :  IN std_logic;
		HD_DD           :  IN std_logic;
		MAIN_CLK        :  IN std_logic;
		nRSTO_MCF       :  IN std_logic;
		CLK33MDIR       :  IN std_logic;
		SCSI_PAR        :  INOUT std_logic;
		nSCSI_RST       :  INOUT std_logic;
		nSCSI_SEL       :  INOUT std_logic;
		nSCSI_BUSY      :  INOUT std_logic;
		SD_CD_DATA3     :  INOUT std_logic;
		SD_CMD_D1       :  INOUT std_logic;
		MIDI_IN_PIN     :  INOUT std_logic;
		ACSI_D          :  INOUT std_logic_vector(7 DOWNTO 0);
		FB_AD           :  INOUT std_logic_vector(31 DOWNTO 0);
		IO              :  INOUT std_logic_vector(17 DOWNTO 0);
		LP_D            :  INOUT std_logic_vector(7 DOWNTO 0);
		SCSI_D          :  INOUT std_logic_vector(7 DOWNTO 0);
		SRD             :  INOUT std_logic_vector(15 DOWNTO 0);
		VD              :  INOUT std_logic_vector(31 DOWNTO 0);
		VDQS            :  INOUT std_logic_vector(3 DOWNTO 0);
		LP_STR          :  OUT std_logic;
		nACSI_ACK       :  OUT std_logic;
		nACSI_RESET     :  OUT std_logic;
		nACSI_CS        :  OUT std_logic;
		ACSI_DIR        :  OUT std_logic;
		ACSI_A1         :  OUT std_logic;
		nSCSI_ACK       :  OUT std_logic;
		nSCSI_ATN       :  OUT std_logic;
		SCSI_DIR        :  OUT std_logic;
		MIDI_TLR        :  OUT std_logic;
		TxD             :  OUT std_logic;
		RTS             :  OUT std_logic;
		DTR             :  OUT std_logic;
		AMKB_TX         :  OUT std_logic;
		IDE_RES         :  OUT std_logic;
		nIDE_CS0        :  OUT std_logic;
		nIDE_CS1        :  OUT std_logic;
		nIDE_WR         :  OUT std_logic;
		nIDE_RD         :  OUT std_logic;
		nCF_CS0         :  OUT std_logic;
		nCF_CS1         :  OUT std_logic;
		nROM3           :  OUT std_logic;
		nROM4           :  OUT std_logic;
		nRP_UDS         :  OUT std_logic;
		nRP_LDS         :  OUT std_logic;
		nSDSEL          :  OUT std_logic;
		nWR_GATE        :  OUT std_logic;
		nWR             :  OUT std_logic;
		YM_QA           :  OUT std_logic;
		YM_QB           :  OUT std_logic;
		YM_QC           :  OUT std_logic;
		SD_CLK          :  OUT std_logic;
		DSA_D           :  OUT std_logic;
		nVWE            :  OUT std_logic;
		nVCAS           :  OUT std_logic;
		nVRAS           :  OUT std_logic;
		nVCS            :  OUT std_logic;
		nPD_VGA         :  OUT std_logic;
		TIN0            :  OUT std_logic;
		nSRCS           :  OUT std_logic;
		nSRBLE          :  OUT std_logic;
		nSRBHE          :  OUT std_logic;
		nSRWE           :  OUT std_logic;
		nDREQ1          :  OUT std_logic;
		LED_FPGA_OK     :  OUT std_logic;
		nSROE           :  OUT std_logic;
		VCKE            :  OUT std_logic;
		nFB_TA          :  OUT std_logic;
		nDDR_CLK        :  OUT std_logic;
		DDR_CLK         :  OUT std_logic;
		VSYNC_PAD       :  OUT std_logic;
		HSYNC_PAD       :  OUT std_logic;
		nBLANK_PAD      :  OUT std_logic;
		PIXEL_CLK_PAD   :  OUT std_logic;
		nSYNC           :  OUT std_logic;
		nMOT_ON         :  OUT std_logic;
		nSTEP_DIR       :  OUT std_logic;
		nSTEP           :  OUT std_logic;
		LPDIR           :  OUT std_logic;
		MIDI_OLR        :  OUT std_logic;
		CLK25M          :  OUT std_logic;
		CLKUSB          :  OUT std_logic;
		CLK24M576       :  OUT std_logic;
		BA              :  OUT std_logic_vector(1 DOWNTO 0);
		nIRQ            :  OUT std_logic_vector(7 DOWNTO 2);
		VA              :  OUT  std_logic_vector(12 DOWNTO 0);
		VB              :  OUT std_logic_vector(7 DOWNTO 0);
		VDM             :  OUT std_logic_vector(3 DOWNTO 0);
		VG              :  OUT std_logic_vector(7 DOWNTO 0);
		VR              :  OUT std_logic_vector(7 DOWNTO 0)
	);
END firebee1;

ARCHITECTURE rtl OF firebee1 IS 
    SIGNAL ACP_CONF         : std_logic_vector(31 DOWNTO 0);
    SIGNAL clk25m_i         : std_logic;
    SIGNAL CLK2M            : std_logic;
    SIGNAL CLK2M4576        : std_logic;
    SIGNAL CLK33M           : std_logic;
    SIGNAL CLK48M           : std_logic;
    SIGNAL CLK500k          : std_logic;
    SIGNAL CLK_VIDEO        : std_logic;
    SIGNAL DDR_SYNC_66M     : std_logic;
    SIGNAL DDRCLK           : std_logic_vector(3 DOWNTO 0);
    SIGNAL DMA_DRQ          : std_logic;
    SIGNAL DSP_INT          : std_logic;
    SIGNAL DSP_TA           : std_logic;
    SIGNAL FALCON_IO_TA     : std_logic;
    SIGNAL FB_ADR           : std_logic_vector(31 DOWNTO 0);
    SIGNAL FDC_CLK          : std_logic;
    SIGNAL HSYNC            : std_logic;
    SIGNAL INT_HANDLER_TA   : std_logic;
    SIGNAL LP_DIR           : std_logic;
    SIGNAL MIDI_IN          : std_logic;
    SIGNAL MOT_ON           : std_logic;
    SIGNAL nBLANK           : std_logic;
    SIGNAL nDREQ0           : std_logic;
    SIGNAL nMFP_INT         : std_logic;
    SIGNAL nRSTO            : std_logic;
    SIGNAL PIXEL_CLK        : std_logic;
    SIGNAL SD_CDM_D1        : std_logic;
    SIGNAL STEP             : std_logic;
    SIGNAL STEP_DIR         : std_logic;
    SIGNAL TIMEBASE         : std_logic_vector(17 DOWNTO 0);
    SIGNAL VIDEO_RECONFIG   : std_logic;
    SIGNAL Video_TA         : std_logic;
    SIGNAL VR_BUSY          : std_logic;
    SIGNAL VR_D             : std_logic_vector(8 DOWNTO 0);
    SIGNAL VR_RD            : std_logic;
    SIGNAL VR_WR            : std_logic;
    SIGNAL VSYNC            : std_logic;
    SIGNAL WR_DATA          : std_logic;
    SIGNAL WR_GATE          : std_logic;
    SIGNAL scandataout      : std_logic;
    SIGNAL scandone         : std_logic;
    SIGNAL reset            : std_logic;
    SIGNAL pll_reset        : std_logic;
    SIGNAL scanclk          : std_logic;
    SIGNAL scandata         : std_logic;
    SIGNAL scan_clkena      : std_logic;
    SIGNAL config_update    : std_logic;
    SIGNAL pll3_locked      : std_logic;
    SIGNAL pll1_locked      : std_logic;
    SIGNAL nSRCS_i          : std_logic;
    SIGNAL nFB_WR_i         : std_logic;
    SIGNAL nIDE_RD_i        : std_logic;
    SIGNAL nIDE_WR_i        : std_logic;

    COMPONENT altpll_reconfig1
        PORT
        (
            clock		        : IN STD_LOGIC ;
            counter_param		: IN STD_LOGIC_VECTOR (2 DOWNTO 0);
            counter_type		: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            data_in		        : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
            pll_areset_in		: IN STD_LOGIC  := '0';
            pll_scandataout		: IN STD_LOGIC ;
            pll_scandone		: IN STD_LOGIC ;
            read_param		    : IN STD_LOGIC ;
            reconfig		    : IN STD_LOGIC ;
            reset		        : IN STD_LOGIC ;
            write_param		    : IN STD_LOGIC ;
            busy		        : OUT STD_LOGIC ;
            data_out		    : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
            pll_areset		    : OUT STD_LOGIC ;
            pll_configupdate	: OUT STD_LOGIC ;
            pll_scanclk		    : OUT STD_LOGIC ;
            pll_scanclkena		: OUT STD_LOGIC ;
            pll_scandata		: OUT STD_LOGIC 
        );
    END COMPONENT altpll_reconfig1;
    
    COMPONENT altpll4
        PORT
        (
            areset		    : IN STD_LOGIC  := '0';
            configupdate	: IN STD_LOGIC  := '0';
            inclk0		    : IN STD_LOGIC  := '0';
            scanclk		    : IN STD_LOGIC  := '1';
            scanclkena		: IN STD_LOGIC  := '0';
            scandata		: IN STD_LOGIC  := '0';
            c0		        : OUT STD_LOGIC ;
            locked		    : OUT STD_LOGIC ;
            scandataout		: OUT STD_LOGIC ;
            scandone		: OUT STD_LOGIC 
        );
    END COMPONENT altpll4;

    COMPONENT Video
	PORT
	(
		FB_ADR		:	 IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		MAIN_CLK		:	 IN STD_LOGIC;
		nFB_CS1		:	 IN STD_LOGIC;
		nFB_CS2		:	 IN STD_LOGIC;
		nFB_CS3		:	 IN STD_LOGIC;
		nFB_WR		:	 IN STD_LOGIC;
		FB_SIZE0		:	 IN STD_LOGIC;
		FB_SIZE1		:	 IN STD_LOGIC;
		nRSTO		:	 IN STD_LOGIC;
		nFB_OE		:	 IN STD_LOGIC;
		FB_ALE		:	 IN STD_LOGIC;
		DDRCLK		:	 IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		DDR_SYNC_66M		:	 IN STD_LOGIC;
		CLK33M		:	 IN STD_LOGIC;
		CLK25M		:	 IN STD_LOGIC;
		CLK_VIDEO		:	 IN STD_LOGIC;
		VR_D		:	 IN STD_LOGIC_VECTOR(8 DOWNTO 0);
		VR_BUSY		:	 IN STD_LOGIC;
		VG		:	 OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		VB		:	 OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		VR		:	 OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		nBLANK		:	 OUT STD_LOGIC;
		VA		:	 OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
		nVWE		:	 OUT STD_LOGIC;
		nVCAS		:	 OUT STD_LOGIC;
		nVRAS		:	 OUT STD_LOGIC;
		nVCS		:	 OUT STD_LOGIC;
		VDM		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		nPD_VGA		:	 OUT STD_LOGIC;
		VCKE		:	 OUT STD_LOGIC;
		VSYNC		:	 OUT STD_LOGIC;
		HSYNC		:	 OUT STD_LOGIC;
		nSYNC		:	 OUT STD_LOGIC;
		VIDEO_TA		:	 OUT STD_LOGIC;
		PIXEL_CLK		:	 OUT STD_LOGIC;
		BA		:	 OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		VIDEO_RECONFIG		:	 OUT STD_LOGIC;
		VR_WR		:	 OUT STD_LOGIC;
		VR_RD		:	 OUT STD_LOGIC;
		VDQS		:	 INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		FB_AD		:	 INOUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		VD		:	 INOUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;
BEGIN 
    nDREQ1 <= nDACK1;
    
    i_atari_clk_pll : work.altpll3
        PORT MAP
        (
            inclk0 => MAIN_CLK,
            c0 => clk25m_i,
            c1 => CLK2M,
            c2 => CLK500k,
            c3 => CLK2M4576,
            locked => pll3_locked
        );
    
    
    i_ddr_clk_pll : work.altpll2
        PORT MAP
        (
            inclk0 => MAIN_CLK,
            c0 => DDRCLK(0),
            c1 => DDRCLK(1),
            c2 => DDRCLK(2),
            c3 => DDRCLK(3),
            c4 => DDR_SYNC_66M
        );
    
    
    i_dsp : work.dsp
        PORT MAP
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
    
    
    i_falcioio_sdcard_ide_cf : work.falconio_sdcard_ide_cf
        PORT MAP
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
            ACP_CONF => ACP_CONF(31 DOWNTO 24),
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
        PORT MAP
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
        PORT MAP
        (
            inclk0 => MAIN_CLK,
            c0 => CLK48M,
            c1 => FDC_CLK,
            c2 => CLK24M576,
            locked => pll1_locked
        );
    
    
    i_pll_reconfig : altpll_reconfig1
        PORT MAP
        (
            reconfig => VIDEO_RECONFIG,
            read_param => VR_RD,
            write_param => VR_WR,
            pll_areset_in => '0',
            pll_scandataout => scandataout,
            pll_scandone => scandone,
            clock => MAIN_CLK,
            reset => reset,
            counter_param => FB_ADR(8 DOWNTO 6),
            counter_type => FB_ADR(5 DOWNTO 2),
            data_in => FB_AD(24 DOWNTO 16),
            busy => VR_BUSY,
            pll_scandata => scandata,
            pll_scanclk => scanclk,
            pll_scanclkena => scan_clkena,
            pll_configupdate => config_update,
            pll_areset => pll_reset,
            data_out => VR_D
        );
    
    
    i_video : video
        PORT MAP
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
        PORT MAP
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
        PORT MAP
        (
            clock => DDR_SYNC_66M,
            enable => FB_ALE,
            data => FB_AD,
            q => FB_ADR
        );
    
    nMOT_ON <= NOT(MOT_ON);
    nSTEP_DIR <= NOT(STEP_DIR);
    nSTEP <= NOT(STEP);
    nWR <= NOT(WR_DATA);
    
    inst18 : work.lpm_counter0
        PORT MAP
        (
            clock => CLK500k,
            q => TIMEBASE
        );
    
    
    nWR_GATE <= NOT(WR_GATE);

    nFB_TA <= NOT(Video_TA OR INT_HANDLER_TA OR DSP_TA OR FALCON_IO_TA);
    
    CLK33M <= MAIN_CLK;

    reset <= NOT(nRSTO);
    nRSTO <= pll3_locked AND pll1_locked AND nRSTO_MCF;
    
    inst29 : alt_iobuf
        PORT MAP
        (
            i => CLK2M,
            oe => CLK2M,
            io => MIDI_IN_PIN,
            o => MIDI_IN
        );
    
    LED_FPGA_OK <= TIMEBASE(17);
    
    nDDR_CLK <= NOT(DDRCLK(0));
    
    inst5 : work.altddio_out3
        PORT MAP
        (
            datain_h => VSYNC,
            datain_l => VSYNC,
            outclock => PIXEL_CLK,
            dataout => VSYNC_PAD
        );
    
    
    inst6 : work.altddio_out3
        PORT MAP
        (
            datain_h => HSYNC,
            datain_l => HSYNC,
            outclock => PIXEL_CLK,
            dataout => HSYNC_PAD
        );
    
    
    inst8 : work.altddio_out3
        PORT MAP
        (
            datain_h => nBLANK,
            datain_l => nBLANK,
            outclock => PIXEL_CLK,
            dataout => nBLANK_PAD
        );
    
    inst9 : work.altddio_out3
        PORT MAP
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
END rtl;