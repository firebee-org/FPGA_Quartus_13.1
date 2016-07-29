library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.firebee_utils_pkg.all;

entity flexbus_register is
    generic
    (
        reg_width       : integer := 11;
        match_address   : std_logic_vector(31 downto 0) := (others => '0');
        num_ignore      : integer range 0 to 31;
        match_fbcs      : integer := 0
    );
    port
    (
        clk             : in std_logic;
        
        -- FlexBus signals
        fb_addr         : in std_logic_vector(31 downto 0);
        fb_ad_in        : in std_logic_vector(31 downto 0);
        fb_ad_out       : out std_logic_vector(31 downto 0);
        fb_cs_n         : in std_logic_vector(5 downto 1);
        fb_wr_n         : in std_logic;
        fb_oe_n         : in std_logic;
        fb_size         : in std_logic_vector(1 downto 0);
        
        register_ta     : out std_logic
    );
end entity flexbus_register;
    
architecture rtl of flexbus_register is
    signal fbcs_match       : std_logic;
    signal address_match    : std_logic;
    signal fb_b             : std_logic_vector(3 downto 0);         -- byte selects
    signal cs               : std_logic;
    signal reg_value        : std_logic_vector(reg_width - 1 downto 0);
begin
    --  byte selects
    --  HWORD
    --  HHBYT
    --  LONG UND LINE
    fb_b(0) <= (fb_size(1) and (not fb_size(0)) and (not fb_addr(1))) or
               ((not fb_size(1)) and fb_size(0) and (not fb_addr(1)) and (not fb_addr(0))) or
               ((not fb_size(1)) and (not fb_size(0))) or
               (fb_size(1) and fb_size(0));

    --  HWORD
    --  HLBYT
    --  LONG UND LINE
    fb_b(1) <= (fb_size(1) and (not fb_size(0) and (not fb_addr(1)))) or
               ((not fb_size(1)) and fb_size(0) and (not fb_addr(1)) and fb_addr(0)) or
               ((not fb_size(1)) and (not fb_size(0))) or
               (fb_size(1) and fb_size(0));

    --  LWORD
    --  LHBYT
    --  LONG UND LINE
    fb_b(2) <= (fb_size(1) and (not fb_size(0)) and fb_addr(1)) or
               ((not fb_size(1)) and fb_size(0) and fb_addr(1) and (not fb_addr(0))) or
               ((not fb_size(1)) and (not fb_size(0))) or (fb_size(1) and fb_size(0));

    --  LWORD
    --  LLBYT
    --  LONG UND LINE
    fb_b(3) <= (fb_size(1) and (not fb_size(0)) and fb_addr(1)) or
               ((not fb_size(1)) and fb_size(0) and fb_addr(1) and fb_addr(0)) or
               ((not fb_size(1)) and (not fb_size(0))) or
               (fb_size(1) and fb_size(0));

    fbcs_match <= '1' when not(fb_cs_n(match_fbcs)) = '1' else '0';
    address_match <= f_addr_cmp_mask(fb_addr, match_address, num_ignore);
    
    p_register_access : process(all)
    begin
        if rising_edge(clk) then
        end if;
    end process p_register_access;
end architecture rtl;