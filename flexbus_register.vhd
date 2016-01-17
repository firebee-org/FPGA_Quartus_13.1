LIBRARY ieee;
    USE ieee.std_logic_1164.all;
    USE ieee.numeric_std.all;

ENTITY flexbus_register IS
    GENERIC
    (
        reg_width       : integer := 11;
        match_address   : std_logic_vector(31 DOWNTO 0) := (OTHERS => '0');
        match_mask      : std_logic_vector(31 DOWNTO 0) := (OTHERS => '1');
        match_fbcs      : integer := 0
    );
    PORT
    (
        clk             : IN std_logic;
        fb_addr         : IN std_logic_vector(31 DOWNTO 0);
        fb_data         : INOUT std_logic_vector(31 DOWNTO 0);
        fb_cs           : IN std_logic_vector(5 DOWNTO 1);
        fb_wr_n         : IN std_logic;
        fb_ta_n         : OUT std_logic;
        reg_value       : INOUT std_logic_vector(reg_width - 1 DOWNTO 0);
        cs              : OUT std_logic := '0'
    );
END ENTITY flexbus_register;
    
ARCHITECTURE rtl OF flexbus_register IS
    SIGNAL fbcs_match       : std_logic;
    SIGNAL address_match    : std_logic;
BEGIN
    fbcs_match <= '1' WHEN fb_cs(match_fbcs) = '1' ELSE '0';
    address_match <= '1' WHEN (fb_addr and match_mask) = (match_address and match_mask) ELSE '0';
    
    p_register_access : PROCESS(ALL)
    BEGIN
        IF rising_edge(clk) THEN
            IF fbcs_match = '1' and address_match = '1' THEN
                cs <= '1';
                IF fb_wr_n = '0' THEN   -- write access
                    reg_value <= fb_data(reg_width - 1 DOWNTO 0);
                ELSE                    -- read access
                    fb_data(reg_width - 1 DOWNTO 0) <= reg_value;
                    fb_ta_n <= '0';
                END IF;
            ELSE
                fb_data <= (OTHERS => 'Z');
                fb_ta_n <= 'Z';
                cs <= '0';
            END IF;
        END IF;
    END PROCESS p_register_access;
END ARCHITECTURE rtl;