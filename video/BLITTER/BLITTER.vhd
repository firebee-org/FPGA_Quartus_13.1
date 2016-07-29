library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity blitter is
	port
	(
		nRSTO           : in std_logic;
		MAIN_CLK        : in std_logic;
		FB_ALE          : in std_logic;
		nFB_WR          : in std_logic;
		nFB_OE          : in std_logic;
		FB_SIZE0        : in std_logic;
		FB_SIZE1        : in std_logic;
		VIDEO_RAM_CTR   : in std_logic_vector(15 downto 0);
		BLITTER_ON      : in std_logic;
		FB_ADR          : in std_logic_vector(31 downto 0);
		nFB_CS1         : in std_logic;
		nFB_CS2         : in std_logic;
		nFB_CS3         : in std_logic;
		DDRCLK0         : in std_logic;
		BLITTER_DIN     : in std_logic_vector(127 downto 0);
		BLITTER_DACK    : in std_logic_vector(4 downto 0);
        SR_BLITTER_DACK : in std_logic;
		blitter_run     : out std_logic;
		blitter_dout    : out std_logic_vector(127 downto 0);
		blitter_adr     : out std_logic_vector(31 downto 0);
		blitter_sig     : out std_logic;
		blitter_wr      : out std_logic;
		blitter_ta      : out std_logic;
		fb_ad_in        : in std_logic_vector(31 downto 0);
        fb_ad_out       : out std_logic_vector(31 downto 0)
	);
end BLITTER;


architecture rtl of blitter is

begin
	blitter_run <= '0';
	blitter_dout <= x"FEDCBA9876543210F0F0F0F0F0F0F0F0";
	blitter_adr <=  x"76543210";
	blitter_sig <= '0';
	blitter_wr <= '0';
	blitter_ta <= '0';
    fb_ad_out <= (others => 'Z');
end rtl;
