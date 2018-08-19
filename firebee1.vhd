library ieee;
use ieee.std_logic_1164.all; 

library altera;
use altera.altera_primitives_components.all;
    
library work;

entity firebee1 is
	port
	(
		MAIN_CLK            : in std_logic;
		nRSTO_MCF           : in std_logic;
		CLK33MDIR           : in std_logic;

        -- the ColdFire FlexBus signals
		FB_ALE              : in std_logic;
		FB_AD               : inout std_logic_vector(31 downto 0);
		nFB_OE              : in std_logic;
		nFB_WR              : in std_logic;
		nFB_TA              : out std_logic;
		nFB_CS1             : in std_logic;
		nFB_CS2             : in std_logic;
		nFB_CS3             : in std_logic;
		FB_SIZE0            : in std_logic;
		FB_SIZE1            : in std_logic;
		nFB_BURST           : in std_logic;
        
        
        -- serial port pins
		RxD                 : in std_logic;
		CTS                 : in std_logic;
		RI                  : in std_logic;
		DCD                 : in std_logic;
		TxD                 : out std_logic;
		RTS                 : out std_logic;
		DTR                 : out std_logic;
        
        -- parallel port
		LP_D                : inout std_logic_vector(7 downto 0);
		LP_STR              : out std_logic;
		LPDIR               : out std_logic;
		LP_BUSY             : in std_logic;

		AMKB_RX             : in std_logic;
		PIC_AMKB_RX         : in std_logic;

		IDE_RDY             : in std_logic;
		IDE_INT             : in std_logic;
		WP_CF_CARD          : in std_logic;
		TRACK00             : in std_logic;
		nWP                 : in std_logic;
		nDCHG               : in std_logic;
		SD_DATA0            : in std_logic;
		SD_DATA1            : in std_logic;
		SD_DATA2            : in std_logic;
		sd_card_detect      : in std_logic;
		nSCSI_DRQ           : in std_logic;
		SD_WP               : in std_logic;
		nRD_DATA            : in std_logic;
        
		nSCSI_C_D           : in std_logic;
		nSCSI_I_O           : in std_logic;
		nSCSI_MSG           : in std_logic;
		nDACK0              : in std_logic;
        
		PIC_INT             : in std_logic;
		TOUT0               : in std_logic;
		nMASTER             : in std_logic;
		DVI_INT             : in std_logic;
		nDACK1              : in std_logic;
        
		nPCI_INTD           : in std_logic;
		nPCI_INTC           : in std_logic;
		nPCI_INTB           : in std_logic;
		nPCI_INTA           : in std_logic;
        
		E0_INT              : in std_logic;
        
		nINDEX              : in std_logic;
		HD_DD               : in std_logic;

		SCSI_PAR            : inout std_logic;
		nSCSI_RST           : inout std_logic;
		nSCSI_SEL           : inout std_logic;
		nSCSI_BUSY          : inout std_logic;
		SCSI_D              : inout std_logic_vector(7 downto 0);
		nSCSI_ACK           : out std_logic;
		nSCSI_ATN           : out std_logic;
		SCSI_DIR            : out std_logic;

		SD_CD_DATA3         : inout std_logic;
		SD_CMD_D1           : inout std_logic;
		MIDI_IN_PIN         : inout std_logic;


		IO                  : inout std_logic_vector(17 downto 0);

		SRD                 : inout std_logic_vector(15 downto 0);
		VD                  : inout std_logic_vector(31 downto 0);
		VDQS                : inout std_logic_vector(3 downto 0);

		nACSI_DRQ           : in std_logic;
		nACSI_INT           : in std_logic;
		nACSI_ACK           : out std_logic;
		nACSI_RESET         : out std_logic;
		nACSI_CS            : out std_logic;
		ACSI_DIR            : out std_logic;
		ACSI_A1             : out std_logic;
		ACSI_D              : inout std_logic_vector(7 downto 0);

		MIDI_TLR            : out std_logic;
		AMKB_TX             : out std_logic;

		IDE_RES             : out std_logic;
		nIDE_CS0            : out std_logic;
		nIDE_CS1            : out std_logic;
		nIDE_WR             : out std_logic;
		nIDE_RD             : out std_logic;
		nCF_CS0             : out std_logic;
		nCF_CS1             : out std_logic;
		nROM3               : out std_logic;
		nROM4               : out std_logic;
		nRP_UDS             : out std_logic;
		nRP_LDS             : out std_logic;
		nSDSEL              : out std_logic;
		nWR_GATE            : out std_logic;
		nWR                 : out std_logic;
		
        YM_QA               : out std_logic;
		YM_QB               : out std_logic;
		YM_QC               : out std_logic;
        
		SD_CLK              : out std_logic;
		DSA_D               : out std_logic;
		nPD_VGA             : out std_logic;
		TIN0                : out std_logic;
		nSRCS               : out std_logic;
		nSRBLE              : out std_logic;
		nSRBHE              : out std_logic;
		nSRWE               : out std_logic;
		nDREQ1              : out std_logic;

		LED_FPGA_OK         : out std_logic;

		nSROE               : out std_logic;
		nSYNC               : out std_logic;
		nMOT_ON             : out std_logic;
		nSTEP_DIR           : out std_logic;
		nSTEP               : out std_logic;

		MIDI_OLR            : out std_logic;
		CLK25M              : out std_logic;
		CLKUSB              : out std_logic;
		CLK24M576           : out std_logic;

		nIRQ                : out std_logic_vector(7 downto 2);

        -- DDR memory signals
		BA                  : out std_logic_vector(1 downto 0);
		VA                  : out std_logic_vector(12 downto 0);
		VDM                 : out std_logic_vector(3 downto 0);
		VCKE                : out std_logic;
		nDDR_CLK            : out std_logic;
		DDR_CLK             : out std_logic;
		nVWE                : out std_logic;
		nVCAS               : out std_logic;
		nVRAS               : out std_logic;
		nVCS                : out std_logic;
        
        -- video signals
		VR                  : out std_logic_vector(7 downto 0);
		VG                  : out std_logic_vector(7 downto 0);
		VB                  : out std_logic_vector(7 downto 0);
		VSYNC_PAD           : out std_logic;
		HSYNC_PAD           : out std_logic;
		nBLANK_PAD          : out std_logic;
		PIXEL_CLK_PAD       : out std_logic
	);
end firebee1;

architecture rtl of firebee1 is
    signal acp_conf         : std_logic_vector(31 downto 0);
    signal clk25m_i         : std_logic;
    signal clk2m            : std_logic;
    signal clk2m4576        : std_logic;
    signal clk33m           : std_logic;
    signal clk48m           : std_logic;
    signal clk500k          : std_logic;
    signal clk_video        : std_logic;
    signal ddr_sync_66m     : std_logic;
    signal ddrclk           : std_logic_vector(3 downto 0);
    signal dma_drq          : std_logic;
    signal dsp_int          : std_logic;
    signal dsp_ta           : std_logic;
    signal falcon_io_ta     : std_logic;
    signal fb_adr           : std_logic_vector(31 downto 0);
    signal fdc_clk          : std_logic;
    signal hsync            : std_logic;
    signal int_handler_ta   : std_logic;
    signal lp_dir           : std_logic;
    signal midi_in          : std_logic;
    signal mot_on           : std_logic;
    signal blank_n          : std_logic;
    signal dreq0_n          : std_logic;
    signal mfp_int_n        : std_logic;
    signal rsto_n           : std_logic;
    signal pixel_clk        : std_logic;
    signal sd_cdm_d1        : std_logic;
    signal step             : std_logic;
    signal step_dir         : std_logic;
    signal timebase         : std_logic_vector(17 downto 0);
    signal video_reconfig   : std_logic;
    signal video_ta         : std_logic;
    signal vr_busy          : std_logic;
    signal vr_d             : std_logic_vector(8 downto 0);
    signal vr_rd            : std_logic;
    signal vr_wr            : std_logic;
    signal vsync            : std_logic;
    signal wr_data          : std_logic;
    signal wr_gate          : std_logic;
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
    signal srcs_n_i         : std_logic;
    signal fb_wr_n_i        : std_logic;
    signal ide_rd_n_i       : std_logic;
    signal ide_wr_n_i       : std_logic;
    signal fb_ad_in         : std_logic_vector(31 downto 0);
    signal fb_ad_out        : std_logic_vector(31 downto 0);

    component altpll_reconfig1
        port
        (
            clock		        : in std_logic;
            counter_param		: in std_logic_vector (2 downto 0);
            counter_type		: in std_logic_vector (3 downto 0);
            data_in		        : in std_logic_vector (8 downto 0);
            pll_areset_in		: in std_logic := '0';
            pll_scandataout		: in std_logic;
            pll_scandone		: in std_logic;
            read_param		    : in std_logic;
            reconfig		    : in std_logic;
            reset		        : in std_logic;
            write_param		    : in std_logic;
            busy		        : out std_logic;
            data_out		    : out std_logic_vector (8 downto 0);
            pll_areset		    : out std_logic;
            pll_configupdate	: out std_logic;
            pll_scanclk		    : out std_logic;
            pll_scanclkena		: out std_logic;
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
            inclk0          => MAIN_CLK,
            c0              => clk25m_i,
            c1              => clk2m,
            c2              => clk500k,
            c3              => clk2m4576,
            locked          => pll3_locked
        );
    
    
    i_ddr_clk_pll : work.altpll2
        port map
        (
            inclk0          => MAIN_CLK,
            c0              => ddrclk(0),
            c1              => ddrclk(1),
            c2              => ddrclk(2),
            c3              => ddrclk(3),
            c4              => ddr_sync_66m
        );
        
    i_dsp : work.dsp
        port map
        (
            clk33m          => main_clk,
            MAIN_CLK        => MAIN_CLK,
            nFB_OE          => nFB_OE,
            nFB_WR          => nFB_WR,
            nFB_CS1         => nFB_CS1,
            nFB_CS2         => nFB_CS2,
            FB_SIZE0        => FB_SIZE0,
            FB_SIZE1        => FB_SIZE1,
            nFB_BURST       => nFB_BURST,
            nrsto           => rsto_n,
            nFB_CS3         => nFB_CS3,
            fb_ad_in        => fb_ad_in,
            fb_ad_out       => fb_ad_out,
            fb_adr          => fb_adr,
            IO              => IO,
            SRD             => SRD,
            nSRCS           => srcs_n_i,
            nSRBLE          => nSRBLE,
            nSRBHE          => nSRBHE,
            nSRWE           => nSRWE,
            nSROE           => nSROE,
            dsp_int         => dsp_int,
            dsp_ta          => dsp_ta
        );

    i_falconio_sdcard_ide_cf : entity work.falconio_sdcard_ide_cf
        port map
        (
            clk33m          => main_clk,
            MAIN_CLK        => MAIN_CLK,
            clk2m           => clk2m,
            clk500k         => clk500k,
            nFB_CS1         => nFB_CS1,
            FB_SIZE0        => FB_SIZE0,
            FB_SIZE1        => FB_SIZE1,
            nFB_BURST       => nFB_BURST,
            LP_BUSY         => LP_BUSY,
            nACSI_DRQ       => nACSI_DRQ,
            nACSI_INT       => nACSI_INT,
            nSCSI_DRQ       => nSCSI_DRQ,
            nSCSI_MSG       => nSCSI_MSG,
            midi_in         => midi_in,
            RxD             => RxD,
            CTS             => CTS,
            RI              => RI,
            DCD             => DCD,
            AMKB_RX         => AMKB_RX,
            PIC_AMKB_RX     => PIC_AMKB_RX,
            IDE_RDY         => IDE_RDY,
            IDE_INT         => IDE_INT,
            WP_CS_CARD      => '0',
            nINDEX          => nINDEX,
            TRACK00         => TRACK00,
            nRD_DATA        => nRD_DATA,
            nDCHG           => nDCHG,
            SD_DATA0        => SD_DATA0,
            SD_DATA1        => SD_DATA1,
            SD_DATA2        => SD_DATA2,
            sd_card_dedect  => sd_card_detect,
            SD_WP           => SD_WP,
            nDACK0          => nDACK0,
            nFB_WR          => nFB_WR,
            WP_CF_CARD      => WP_CF_CARD,
            nWP             => nWP,
            nFB_CS2         => nFB_CS2,
            nrsto           => rsto_n,
            nSCSI_C_D       => nSCSI_C_D,
            nSCSI_I_O       => nSCSI_I_O,
            clk2m4576       => clk2m4576,
            nFB_OE          => nFB_OE,
            vsync           => vsync,
            hsync           => hsync,
            dsp_int         => dsp_int,
            nblank          => blank_n,
            fdc_clk         => fdc_clk,
            FB_ALE          => FB_ALE,
            HD_DD           => HD_DD,
            SCSI_PAR        => SCSI_PAR,
            nSCSI_SEL       => nSCSI_SEL,
            nSCSI_BUSY      => nSCSI_BUSY,
            nSCSI_RST       => nSCSI_RST,
            SD_CD_DATA3     => SD_CD_DATA3,
            sd_cdm_d1       => sd_cdm_d1,
            acp_conf        => acp_conf(31 downto 24),
            ACSI_D          => ACSI_D,
            fb_ad_in        => fb_ad_in,
            fb_ad_out       => fb_ad_out,
            fb_adr          => fb_adr,
            LP_D            => LP_D,
            SCSI_D          => SCSI_D,
            nIDE_CS1        => nIDE_CS1,
            nIDE_CS0        => nIDE_CS0,
            LP_STR          => LP_STR,
            lp_dir          => lp_dir,
            nACSI_ACK       => nACSI_ACK,
            nACSI_RESET     => nACSI_RESET,
            nACSI_CS        => nACSI_CS,
            ACSI_DIR        => ACSI_DIR,
            ACSI_A1         => ACSI_A1,
            nSCSI_ACK       => nSCSI_ACK,
            nSCSI_ATN       => nSCSI_ATN,
            SCSI_DIR        => SCSI_DIR,
            SD_CLK          => SD_CLK,
            YM_QA           => YM_QA,
            YM_QC           => YM_QC,
            YM_QB           => YM_QB,
            nSDSEL          => nSDSEL,
            step            => step,
            mot_on          => mot_on,
            nRP_LDS         => nRP_LDS,
            nRP_UDS         => nRP_UDS,
            nROM4           => nROM4,
            nROM3           => nROM3,
            nCF_CS1         => nCF_CS1,
            nCF_CS0         => nCF_CS0,
            nIDE_RD         => ide_rd_n_i,
            nIDE_WR         => ide_wr_n_i,
            AMKB_TX         => AMKB_TX,
            IDE_RES         => IDE_RES,
            DTR             => DTR,
            RTS             => RTS,
            TxD             => TxD,
            MIDI_OLR        => MIDI_OLR,
            DSA_D           => DSA_D,
            nmfp_int        => mfp_int_n,
            falcon_io_ta    => falcon_io_ta,
            step_dir        => step_dir,
            wr_data         => wr_data,
            wr_gate         => wr_gate,
            dma_drq         => dma_drq,
            MIDI_TLR        => MIDI_TLR
        );

    
    i_interrupt_handler : entity work.interrupt_handler
        port map
        (
            MAIN_CLK        => MAIN_CLK,
            nFB_WR          => nFB_WR,
            nFB_CS1         => nFB_CS1,
            nFB_CS2         => nFB_CS2,
            FB_SIZE0        => FB_SIZE0,
            FB_SIZE1        => FB_SIZE1,
            PIC_INT         => PIC_INT,
            E0_INT          => E0_INT,
            DVI_INT         => DVI_INT,
            nPCI_INTA       => nPCI_INTA,
            nPCI_INTB       => nPCI_INTB,
            nPCI_INTC       => nPCI_INTC,
            nPCI_INTD       => nPCI_INTD,
            nmfp_int        => mfp_int_n,
            nFB_OE          => nFB_OE,
            dsp_int         => dsp_int,
            vsync           => vsync,
            hsync           => hsync,
            dma_drq         => dma_drq,
            nrsto           => rsto_n,
            fb_ad_in        => fb_ad_in,
            fb_ad_out       => fb_ad_out,
            fb_adr          => fb_adr,
            int_handler_ta  => int_handler_ta,
            TIN0            => TIN0,
            acp_conf        => acp_conf,
            nIRQ            => nIRQ
        );    
        
    i_mfp_acia_clk_pll : entity work.altpll1
        port map
        (
            inclk0          => MAIN_CLK,
            c0              => clk48m,
            c1              => fdc_clk,
            c2              => CLK24M576,
            locked          => pll1_locked
        );
    
    
    i_pll_reconfig : altpll_reconfig1
        port map
        (
            reconfig        => video_reconfig,
            read_param      => vr_rd,
            write_param     => vr_wr,
            pll_areset_in   => '0',
            pll_scandataout => scandataout,
            pll_scandone    => scandone,
            clock           => MAIN_CLK,
            reset           => reset,
            counter_param   => fb_adr(8 downto 6),
            counter_type    => fb_adr(5 downto 2),
            data_in         => FB_AD(24 downto 16),
            busy            => vr_busy,
            pll_scandata    => scandata,
            pll_scanclk     => scanclk,
            pll_scanclkena  => scan_clkena,
            pll_configupdate => config_update,
            pll_areset      => pll_reset,
            data_out        => vr_d
        );
    
    i_video : entity work.video
        port map
        (
            MAIN_CLK        => MAIN_CLK,
            nFB_CS1         => nFB_CS1,
            nFB_CS2         => nFB_CS2,
            nFB_CS3         => nFB_CS3,
            nFB_WR          => nFB_WR,
            FB_SIZE0        => FB_SIZE0,
            FB_SIZE1        => FB_SIZE1,
            nrsto           => rsto_n,
            nFB_OE          => nFB_OE,
            FB_ALE          => FB_ALE,
            ddr_sync_66m    => ddr_sync_66m,
            -- clk33m => clk33m,
            clk33m          => main_clk,
            CLK25M          => clk25m_i,
            clk_video       => clk_video,
            vr_busy         => vr_busy,
            ddrclk          => ddrclk,
            fb_ad_in        => fb_ad_in,
            fb_ad_out       => fb_ad_out,
            fb_adr          => fb_adr,
            VD              => VD,
            VDQS            => VDQS,
            vr_d            => vr_d,
            vr_rd           => vr_rd,
            nblank          => blank_n,
            nVWE            => nVWE,
            nVCAS           => nVCAS,
            nVRAS           => nVRAS,
            nVCS            => nVCS,
            nPD_VGA         => nPD_VGA,
            VCKE            => VCKE,
            vsync           => vsync,
            hsync           => hsync,
            nSYNC           => nSYNC,
            VIDEO_TA        => video_ta,
            pixel_clk       => pixel_clk,
            video_reconfig  => video_reconfig,
            vr_wr           => vr_wr,
            BA              => BA,
            VA              => VA,
            VB              => VB,
            VDM             => VDM,
            VG              => VG,
            VR              => VR
        );
    
    i_video_clk_pll : altpll4
        port map
        (
            inclk0          => clk48m,
            areset          => pll_reset,
            scanclk         => scanclk,
            scandata        => scandata,
            scanclkena      => scan_clkena,
            configupdate    => config_update,
            c0              => clk_video,
            scandataout     => scandataout,
            scandone        => scandone
        );
    
    
    i_fb_adr_latch : entity work.lpm_ff0
        port map
        (
            clock           => ddr_sync_66m,
            enable          => FB_ALE,
            data            => FB_AD,
            q               => fb_adr
        );
    
    nMOT_ON <= not(mot_on);
    nSTEP_DIR <= not(step_dir);
    nSTEP <= not(step);
    nWR <= not(wr_data);
    
    inst18 : entity work.lpm_counter0
        port map
        (
            clock           => clk500k,
            q               => timebase
        );
    
    
    nWR_GATE <= not(wr_gate);

    nFB_TA <= not(video_ta or int_handler_ta or dsp_ta or falcon_io_ta);
    fb_ad_in <= FB_AD;
    FB_AD <= fb_ad_out when (video_ta or int_handler_ta or dsp_ta or falcon_io_ta) else (others => 'Z');
    
    clk33m <= MAIN_CLK;

    reset <= not(rsto_n);
    rsto_n <= pll3_locked and pll1_locked and nRSTO_MCF;
    
    inst29 : alt_iobuf
        port map
        (
            i               => clk2m,
            oe              => clk2m,
            io              => MIDI_IN_PIN,
            o               => midi_in
        );
    
    led_fpga_ok <= timebase(17);
    
    nDDR_CLK <= not(ddrclk(0));
    
    inst5 : entity work.altddio_out3
        port map
        (
            datain_h        => vsync,
            datain_l        => vsync,
            outclock        => pixel_clk,
            dataout         => VSYNC_PAD
        );
    
    
    inst6 : entity work.altddio_out3
        port map
        (
            datain_h        => hsync,
            datain_l        => hsync,
            outclock        => pixel_clk,
            dataout         => HSYNC_PAD
        );
    
    
    inst8 : entity work.altddio_out3
        port map
        (
            datain_h        => blank_n,
            datain_l        => blank_n,
            outclock        => pixel_clk,
            dataout         => nBLANK_PAD
        );
    
    inst9 : entity work.altddio_out3
        port map
        (
            datain_h        => '0',
            datain_l        => '1',
            outclock        => pixel_clk,
            dataout         => PIXEL_CLK_PAD
        );
    
    SD_CMD_D1 <= sd_cdm_d1;
    DDR_CLK <= ddrclk(0);
    LPDIR <= lp_dir;
    CLK25M <= clk25m_i;
    CLKUSB <= clk48m;
    nSRCS <= srcs_n_i;
    
    nIDE_RD <= ide_rd_n_i;
    nIDE_WR <= ide_wr_n_i;
end rtl;