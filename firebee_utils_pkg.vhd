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
---- - Markus Fröschle, mfro@mubf.de
---- ----
----------------------------------------------------------------------
---- ----
---- Copyright (C) 2015 Markus Fröschle
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

LIBRARY ieee;
    USE ieee.std_logic_1164.ALL;
    USE ieee.numeric_std.ALL;
    
PACKAGE firebee_utils_pkg IS
    FUNCTION f_addr_cmp_l(SIGNAL addr : std_logic_vector; CONSTANT addr_const : std_logic_vector) RETURN std_logic;
    FUNCTION f_addr_cmp_w(SIGNAL addr : std_logic_vector; CONSTANT addr_const : std_logic_vector) RETURN std_logic;
    FUNCTION f_addr_cmp_b(SIGNAL addr : std_logic_vector; CONSTANT addr_const : std_logic_vector) RETURN std_logic;
    FUNCTION f_addr_cmp_mask(SIGNAL addr : std_logic_vector; CONSTANT addr_const : std_logic_vector; CONSTANT num_ignore : integer) RETURN std_logic;
    
    COMPONENT synchronizer IS
        PORT
        (
            -- Input ports
            source_signal   : IN std_logic;

            target_clock    : IN std_logic;
            target_signal   : OUT std_logic
        );
    END COMPONENT synchronizer;

END firebee_utils_pkg;

PACKAGE BODY firebee_utils_pkg IS

    FUNCTION f_addr_cmp_l(SIGNAL addr : std_logic_vector; CONSTANT addr_const : std_logic_vector) RETURN std_logic IS
        VARIABLE ret    : std_logic := '1';
        VARIABLE c_low  : integer;
        VARIABLE c_hi   : integer;
    BEGIN
        c_hi := addr_const'HIGH;
        c_low := addr_const'LOW;
        
        -- synthesis translate_off
        REPORT("addr_const'HIGH = " & integer'IMAGE(c_hi) & " addr_const'LOW = " & integer'IMAGE(c_low)) SEVERITY WARNING;
        REPORT("addr'HIGH = " & integer'IMAGE(addr'HIGH) & " addr'LOW = " & integer'IMAGE(addr'LOW)) SEVERITY WARNING;
        -- synthesis translate_on
        
        FOR i IN c_hi DOWNTO c_low + 2 LOOP
            IF addr(i) /= addr_const(c_hi - i) THEN
            
                -- synthesis translate_off
                REPORT("f_addr_cmp_l(): addr = " & to_hstring(unsigned(addr)) & " differs from addr_const = " & to_hstring(unsigned(addr_const)) &
                       " at bit = " & integer'IMAGE(i)) SEVERITY WARNING;
                REPORT("addr(" & integer'IMAGE(i) & ") (" & to_string(addr) & ") = " & to_string(addr(i)) & 
                       " addr_const(" & integer'IMAGE(i) & ") ( " & to_string(addr_const) & ") = " & to_string(addr_const(i)));
                -- synthesis translate_on
                
                ret := '0';
                EXIT;
            END IF;
        END LOOP;
        RETURN ret;
    END FUNCTION f_addr_cmp_l;

    FUNCTION f_addr_cmp_w(SIGNAL addr : std_logic_vector; CONSTANT addr_const : std_logic_vector) RETURN std_logic IS
        VARIABLE ret    : std_logic := '1';
        VARIABLE c_hi   : integer;
        VARIABLE c_low  : integer;
    BEGIN
        REPORT("f_addr_cmp_w(): addr_const'HIGH = " & integer'IMAGE(addr_const'HIGH) & " addr_const'LOW = " & integer'IMAGE(addr_const'LOW)) SEVERITY WARNING;
        REPORT("f_addr_cmp_w(): addr'HIGH = " & integer'IMAGE(addr'HIGH) & " addr'LOW = " & integer'IMAGE(addr'LOW)) SEVERITY WARNING;
        
        c_hi := addr_const'HIGH;
        c_low := addr_const'LOW;
        FOR i IN c_hi DOWNTO c_low + 1 LOOP
            IF addr(i) /= addr_const(c_hi - i) THEN
                
                -- synthesis translate_off
                REPORT("f_addr_cmp_w(): addr = " & to_hstring(unsigned(addr)) & " differs from addr_const = " & to_hstring(unsigned(addr_const)) &
                       " at bit = " & integer'IMAGE(i)) SEVERITY WARNING;
                REPORT("f_addr_cmp_w(): addr(" & integer'IMAGE(i) & ") (" & to_string(addr) & ") = " & to_string(addr(i)) & 
                       " addr_const(" & integer'IMAGE(i) & ") ( " & to_string(addr_const) & ") = " & to_string(addr_const(i)));
                -- synthesis translate_on
                
                ret := '0';
                EXIT;
            END IF;
        END LOOP;
        RETURN ret;
    END FUNCTION f_addr_cmp_w;

    -- this is just for completeness
    FUNCTION f_addr_cmp_b(SIGNAL addr : std_logic_vector; CONSTANT addr_const : std_logic_vector) RETURN std_logic IS
        VARIABLE ret    : std_logic := '1';
        VARIABLE c_hi   : integer;
        VARIABLE c_low  : integer;
    BEGIN
        c_hi := addr_const'HIGH;
        c_low := addr_const'LOW;
        
        FOR i IN c_hi DOWNTO c_low LOOP
            IF addr(i) /= addr_const(c_hi - i) THEN
            
                -- synthesis translate_off
                REPORT("f_addr_cmp_l(): addr = " & to_hstring(unsigned(addr)) & " differs from addr_const = " & to_hstring(unsigned(addr_const)) &
                       " at bit = " & integer'IMAGE(i)) SEVERITY WARNING;
                REPORT("addr(" & integer'IMAGE(i) & ") (" & to_string(addr) & ") = " & to_string(addr(i)) & 
                       " addr_const(" & integer'IMAGE(i) & ") ( " & to_string(addr_const) & ") = " & to_string(addr_const(i)));
                -- synthesis translate_on
                
                ret := '0';
                EXIT;
            END IF;
        END LOOP;
        RETURN ret;
    END FUNCTION f_addr_cmp_b;
    
    -- this is for arbitrary sized address compares. It compares from the highest bit of addr_const to the lowest - num_ignore
    -- bit, thus allowing any size of comparision.
    FUNCTION f_addr_cmp_mask(SIGNAL addr : std_logic_vector; CONSTANT addr_const : std_logic_vector; CONSTANT num_ignore : integer) RETURN std_logic IS
        VARIABLE ret    : std_logic := '1';
        VARIABLE c_hi   : integer;
        VARIABLE c_low  : integer;
    BEGIN
        c_hi := addr_const'HIGH;
        c_low := addr_const'LOW;
        
        FOR i IN addr_const'HIGH DOWNTO addr_const'LOW + num_ignore LOOP
            IF addr(i) /= addr_const(c_hi - i) THEN
            
                -- synthesis translate_off
                REPORT("f_addr_cmp_l(): addr = " & to_hstring(unsigned(addr)) & " differs from addr_const = " & to_hstring(unsigned(addr_const)) &
                       " at bit = " & integer'IMAGE(i)) SEVERITY WARNING;
                REPORT("addr(" & integer'IMAGE(i) & ") (" & to_string(addr) & ") = " & to_string(addr(i)) & 
                       " addr_const(" & integer'IMAGE(i) & ") ( " & to_string(addr_const) & ") = " & to_string(addr_const(i)));
                -- synthesis translate_on
                
                ret := '0';
                EXIT;
            END IF;
        END LOOP;
        RETURN ret;
    END FUNCTION f_addr_cmp_mask;
END PACKAGE BODY firebee_utils_pkg;