library ieee;
    use ieee.std_logic_1164.all;


--  Entity Declaration

entity dsp is
	port
	(
		CLK33M      : in std_logic;
		MAIN_CLK    : in std_logic;
		nFB_OE      : in std_logic;
		nFB_WR      : in std_logic;
		nFB_CS1     : in std_logic;
		nFB_CS2     : in std_logic;
		FB_SIZE0    : in std_logic;
		FB_SIZE1    : in std_logic;
		nFB_BURST   : in std_logic;
		FB_ADR      : in std_logic_vector(31 downto 0);
		nRSTO       : in std_logic;
		nFB_CS3     : in std_logic;
		nSRCS       : inout std_logic;
		nSRBLE      : out std_logic;
		nSRBHE      : out std_logic;
		nSRWE       : out std_logic;
		nSROE       : out std_logic;
		DSP_INT     : out std_logic;
		DSP_TA      : out std_logic;
		fb_ad_in    : in std_logic_vector(31 downto 0);
        fb_ad_out   : out std_logic_vector(31 downto 0);
		IO          : inout std_logic_vector(17 downto 0);
		SRD         : inout std_logic_vector(15 downto 0)
	);
end dsp;


--  Architecture Body

architecture rtl of dsp is
begin
	nSRCS  <= '0' when nFB_CS2 = '0' and FB_ADR(27 downto 24) = x"4" else '1';	--nFB_CS3;
	nSRBHE <= '0' when FB_ADR(0 downto 0) = "0" else '1';
	nSRBLE <= '1' when FB_ADR(0 downto 0) = "0" and FB_SIZE1 = '0' and FB_SIZE0 = '1' else '0'; 
	nSRWE <= '0' when nFB_WR = '0' and nSRCS = '0' and MAIN_CLK = '0' else '1';
	nSROE <= '0' when nFB_OE = '0' and nSRCS = '0' else '1';
	DSP_INT <= '0';
	DSP_TA <= '0';
	IO(17 downto 0) <= FB_ADR(18 downto 1);
    SRD(15 downto 0) <= fb_ad_in(31 downto 16) when nFB_WR = '0' and nSRCS = '0' else (others => 'Z');
	-- fb_ad_out(31 downto 16) <= srd(15 DOWNTO 0 )when nFB_OE = '0' AND nSRCS = '0' ELSE (others => 'Z');
    fb_ad_out(31 downto 0) <= (others => 'Z');     -- otherwise we get a constant driver error
end rtl;
