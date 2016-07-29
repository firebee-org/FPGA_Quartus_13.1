library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity flexbus_register is
    generic
    (
        reg_width       : integer := 11;
        match_address   : std_logic_vector(31 downto 0) := (others => '0');
        match_mask      : std_logic_vector(31 downto 0) := (others => '1');
        match_fbcs      : integer := 0
    );
    port
    (
        clk             : in std_logic;
        fb_addr         : in std_logic_vector(31 downto 0);
        fb_data         : inout std_logic_vector(31 downto 0);
        fb_cs           : in std_logic_vector(5 downto 1);
        fb_wr_n         : in std_logic;
        fb_ta_n         : out std_logic;
        reg_value       : inout std_logic_vector(reg_width - 1 downto 0);
        cs              : out std_logic := '0'
    );
end entity flexbus_register;
    
architecture rtl of flexbus_register is
    signal fbcs_match       : std_logic;
    signal address_match    : std_logic;
begin
    fbcs_match <= '1' when fb_cs(match_fbcs) = '1' else '0';
    address_match <= '1' when (fb_addr and match_mask) = (match_address and match_mask) else '0';
    
    p_register_access : process(all)
    begin
        if rising_edge(clk) then
            if fbcs_match = '1' and address_match = '1' then
                cs <= '1';
                if fb_wr_n = '0' then   -- write access
                    reg_value <= fb_data(reg_width - 1 downto 0);
                else                    -- read access
                    fb_data(reg_width - 1 downto 0) <= reg_value;
                    fb_ta_n <= '0';
                end if;
            else
                fb_data <= (others => 'Z');
                fb_ta_n <= 'Z';
                cs <= '0';
            end if;
        end if;
    end process p_register_access;
end architecture rtl;