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
    cs <= '1' when fbcs_match and address_match else '0';
    
    p_copy_data_in : process (all)
    begin
        reg_value <= reg_value;
        if cs and not fb_wr_n then
            if reg_width > 24 and fb_b(0) = '1' then      -- HH byte
                reg_value(reg_width - 1 downto 24) <= fb_ad_in(work.firebee_utils_pkg.min(31, reg_width - 1) downto 24);
            end if;
            if reg_width > 16 and fb_b(1) = '1' then      -- HL byte
                reg_value(work.firebee_utils_pkg.min(23, reg_width - 1) downto 16) <= fb_ad_in(work.firebee_utils_pkg.min(23, reg_width - 1) downto 16);
            end if;
            if reg_width > 8 and fb_b(2) = '1' then       -- LH byte
                reg_value(work.firebee_utils_pkg.min(15, reg_width - 1) downto 8) <= fb_ad_in(work.firebee_utils_pkg.min(15, reg_width - 1) downto 8);
            end if;
            if reg_width > 0 and fb_b(3) = '1' then       -- LL byte
                reg_value(work.firebee_utils_pkg.min(7, reg_width - 1) downto 0) <= fb_ad_in(work.firebee_utils_pkg.min(7, reg_width - 1) downto 0);
            end if;
        end if;
    end process p_copy_data_in;
    
    p_copy_data_out : process (all)
    begin
        fb_ad_out <= (others => 'Z');
        if cs and not fb_oe_n then
            if reg_width > 24 and fb_b(0) = '1' then      -- HH byte
                fb_ad_out(work.firebee_utils_pkg.min(31, reg_width - 1) downto 24) <= reg_value(work.firebee_utils_pkg.min(31, reg_width - 1) downto 24);
            end if;
            if reg_width > 16 and fb_b(1) = '1' then      -- HL byte
                fb_ad_out(work.firebee_utils_pkg.min(23, reg_width - 1) downto 16) <= reg_value(work.firebee_utils_pkg.min(23, reg_width - 1) downto 16);
            end if;
            if reg_width > 8 and fb_b(2) = '1' then       -- LH byte
                fb_ad_out(work.firebee_utils_pkg.min(15, reg_width - 1) downto 8) <= reg_value(work.firebee_utils_pkg.min(15, reg_width - 1) downto 8);
            end if;
            if reg_width > 0 and fb_b(3) = '1' then       -- LL byte
                fb_ad_out(work.firebee_utils_pkg.min(7, reg_width - 1) downto 0) <= reg_value(work.firebee_utils_pkg.min(7, reg_width - 1) downto 0);
            end if;
        end if;            
    end process p_copy_data_out;
    
    register_ta <= cs;
end architecture rtl;