----------------------------------------------------------------------
---- ----
---- This file is part of the 'Firebee' project. ----
---- http://acp.atari.org ----
---- ----
---- Description: ----
---- This package contains utility functions, procedures and constants
---- for the Firebee project.
----
---- Author(s): ----
---- - Markus Froeschle, mfro@mubf.de
---- ----
----------------------------------------------------------------------
---- ----
---- Copyright (C) 2015 Markus Froeschle
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
    use ieee.numeric_std.all;
    
package firebee_utils_pkg is
    function f_addr_cmp_l(signal addr : std_logic_vector; constant addr_const : std_logic_vector) return std_logic;
    function f_addr_cmp_w(signal addr : std_logic_vector; constant addr_const : std_logic_vector) return std_logic;
    function f_addr_cmp_b(signal addr : std_logic_vector; constant addr_const : std_logic_vector) return std_logic;
    function f_addr_cmp_mask(signal addr : std_logic_vector; constant addr_const : std_logic_vector; constant num_ignore : integer) return std_logic;
    
    function max(left : integer; right : integer) return integer;
    function min(left : integer; right : integer) return integer;
    
    component synchronizer IS
        PORT
        (
            -- Input ports
            source_signal   : in std_logic;

            target_clock    : in std_logic;
            target_signal   : out std_logic
        );
    end component synchronizer;
    
        -- size constants for the TSIZE vector
    type tsize_t is (SIZE_LONG, SIZE_WORD, SIZE_BYTE, SIZE_LINE, SIZE_TRISTATE);
        attribute enum_encoding : string;
        attribute enum_encoding of tsize_t: type is "00 10 01 11 ZZ"; 
--    constant SIZE_LONG : std_logic_vector(1 downto 0) := "00";
--    constant SIZE_WORD : std_logic_vector(1 downto 0) := "10";
--    constant SIZE_BYTE : std_logic_vector(1 downto 0) := "01";
--    constant SIZE_LINE : std_logic_vector(1 downto 0) := "11";    
end firebee_utils_pkg;

package body firebee_utils_pkg is
    -- returns the smaller of two integers
    function min(left : integer; right : integer) return integer is
    begin
        if left < right then
            return left;
        else
            return right;
        end if;
    end function min;
    
    -- returns the larger of two integers
    function max(left : integer; right : integer) return integer is
    begin
        if left > right then
            return left;
        else
            return right;
        end if;
    end function max;
    
    -- returns the number of bits needed to represent n
    function log2ceil(n : natural) return natural is
        variable n_bit : unsigned(31 downto 0);
    begin  -- log2ceil
        if n = 0 then
            return 0;
        end if;
        n_bit := to_unsigned(n-1,32);
        for i in 31 downto 0 loop
            if n_bit(i) = '1' then
                return i + 1;
          end if;
        end loop;  -- i
        return 1;
    end log2ceil;
      
    -- this is for arbitrary sized address compares. It compares from the highest bit of addr_const to the lowest - num_ignore
    -- bit, thus allowing any size of comparision.
    function f_addr_cmp_mask(signal addr : std_logic_vector;
                             constant addr_const : std_logic_vector;
                             constant num_ignore : integer
                            ) return std_logic is
        variable ret    : std_logic := '1';
        variable hi     : integer;
        variable lo     : integer;
    begin
        hi := min(addr_const'high, addr'high);
        lo := max(addr_const'low, addr'low);
            
        -- report("faddr_cmp_mask(): hi = " & to_string(hi) & " lo = " & to_string(lo) & " log2ceil(num_ignore) = " & to_string(log2ceil(num_ignore)));
        l_loop: for i in hi downto lo + log2ceil(num_ignore) - 1 loop
            if addr(i) /= addr_const(i) then
                
                -- synthesis translate_off
                -- report("f_addr_cmp_mask(): addr = " & to_hstring(unsigned(addr)) & " differs from addr_const = " & to_hstring(unsigned(addr_const)) &
                --       " at bit = " & integer'image(i));
                -- report("addr(" & integer'image(i) & ") (" & to_string(addr) & ") = " & to_string(addr(i)) & 
                --       " addr_const(" & integer'image(i) & ") ( " & to_string(addr_const) & ") = " & to_string(addr_const(i)));
                -- synthesis translate_on
                    
                ret := '0';
                exit l_loop;
            else
                -- pragma synthesis off
                -- report("f_addr_cmp_mask(): addr = " & to_hstring(unsigned(addr)) & " equals to addr_const = " & to_hstring(unsigned(addr_const)) &
                --        " at bit = " & integer'image(i));
                -- report("addr(" & integer'image(i) & ") (" & to_string(addr) & ") = " & to_string(addr(i)) &
                --       " addr_const(" & integer'image(i) & ") ( " & to_string(addr_const) & ") = " & to_string(addr_const(i)));
                -- pragma synthesis on
            end if;
        end loop;
        -- pragma synthesis off
        report("f_addr_cmp_mask(" & to_hstring(unsigned(addr)) & ", " & to_hstring(unsigned(addr_const)) & "): return " & to_string(ret));
        -- pragma synthesis on
        return ret;
    end function f_addr_cmp_mask;

    
    function f_addr_cmp_l(signal addr : std_logic_vector;
                          constant addr_const : std_logic_vector
                         ) return std_logic is
    begin
        return f_addr_cmp_mask(addr, addr_const, 2);
    end function f_addr_cmp_l;
    
    function f_addr_cmp_w(signal addr : std_logic_vector;
                          constant addr_const : std_logic_vector
                         ) return std_logic is
    begin
        return f_addr_cmp_mask(addr, addr_const, 1);
    end function f_addr_cmp_w;
    
    function f_addr_cmp_b(signal addr : std_logic_vector;
                          constant addr_const : std_logic_vector
                         ) return std_logic is
    begin
        return f_addr_cmp_mask(addr, addr_const, 0);
    end function f_addr_cmp_b;
end package body firebee_utils_pkg;