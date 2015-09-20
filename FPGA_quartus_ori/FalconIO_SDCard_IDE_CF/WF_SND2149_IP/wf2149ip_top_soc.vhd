----------------------------------------------------------------------
----                                                              ----
----  YM2149 compatible sound generator.			              ----
----                                                              ----
---- This file is part of the SUSKA ATARI clone project.          ----
---- http://www.experiment-s.de                                   ----
----                                                              ----
---- Description:                                                 ----
---- Model of the ST or STE's YM2149 sound generator.             ----
---- This IP core of the sound generator differs slightly from    ----
---- the original. Firstly it is a synchronous design without any ----
---- latches (like assumed in the original chip). This required   ----
---- the introduction of a system adequate clock. In detail this  ----
---- SYS_CLK should on the one hand be fast enough to meet the    ----
---- timing requirements of the system's bus cycle and should one ----
---- the other hand drive the PWM modules correctly. To meet both ----
---- a SYS_CLK of 16MHz or above is recommended.                  ----
---- Secondly, the original chip has an implemented DA converter. ----
---- This feature is not possible in today's FPGAs. Therefore the ----
---- converter is replaced by pulse width modulators. This solu-  ----
---- tion is very simple in comparison to other approaches like   ----
---- external DA converters with wave tables etc. The soltution   ----
---- with the pulse width modulators is probably not as accurate  ----
---- DAs with wavetables. For a detailed descrition of the hard-  ----
---- ware PWM filter look at the end of the wave file, where the  ----
---- pulse width modulators can be found.                         ----
---- For a proper operation it is required, that the wave clock   ----
---- is lower than the system clock. A good choice is for example ----
---- 2MHz for the wave clock and 16MHz for the system clock.      ----
----                                                              ----
---- Main module file.                                            ----
---- Top level file for use in systems on programmable chips.     ----
----                                                              ----
----                                                              ----
---- To Do:                                                       ----
---- -                                                            ----
----                                                              ----
---- Author(s):                                                   ----
---- - Wolfgang Foerster, wf@experiment-s.de; wf@inventronik.de   ----
----                                                              ----
----------------------------------------------------------------------
----                                                              ----
---- Copyright (C) 2006 - 2008 Wolfgang Foerster                  ----
----                                                              ----
---- This source file may be used and distributed without         ----
---- restriction provided that this copyright statement is not    ----
---- removed from the file and that any derivative work contains  ----
---- the original copyright notice and the associated disclaimer. ----
----                                                              ----
---- This source file is free software; you can redistribute it   ----
---- and/or modify it under the terms of the GNU Lesser General   ----
---- Public License as published by the Free Software Foundation; ----
---- either version 2.1 of the License, or (at your option) any   ----
---- later version.                                               ----
----                                                              ----
---- This source is distributed in the hope that it will be       ----
---- useful, but WITHOUT ANY WARRANTY; without even the implied   ----
---- warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ----
---- PURPOSE. See the GNU Lesser General Public License for more  ----
---- details.                                                     ----
----                                                              ----
---- You should have received a copy of the GNU Lesser General    ----
---- Public License along with this source; if not, download it   ----
---- from http://www.gnu.org/licenses/lgpl.html                   ----
----                                                              ----
----------------------------------------------------------------------
-- 
-- Revision History
-- 
-- Revision 2K6A  2006/06/03 WF
--   Initial Release.
-- Revision 2K6B  2006/11/07 WF
--   Modified Source to compile with the Xilinx ISE.
--   Top level file provided for SOC (systems on programmable chips).
-- Revision 2K8A  2008/07/14 WF
--   Minor changes.
--

LIBRARY ieee;
    USE ieee.std_logic_1164.ALL;
    USE work.wf2149ip_pkg.ALL;

ENTITY WF2149IP_TOP_SOC IS
	PORT(
		
		SYS_CLK		: IN std_logic; -- Read the inforation in the header!
		RESETn   	: IN bit;

		WAV_CLK		: IN bit; -- Read the inforation in the header!
		SELn		: IN bit;
		
		BDIR		: IN bit;
		BC2, BC1	: IN bit;

		A9n, A8		: IN bit;
		DA_IN		: IN std_logic_vector(7 DOWNTO 0);
		DA_OUT		: OUT std_logic_vector(7 DOWNTO 0);
		DA_EN		: OUT bit;
		
		IO_A_IN		: IN bit_vector(7 DOWNTO 0);
		IO_A_OUT	: OUT bit_vector(7 DOWNTO 0);
		IO_A_EN		: OUT bit;
		IO_B_IN		: IN bit_vector(7 DOWNTO 0);
		IO_B_OUT	: OUT bit_vector(7 DOWNTO 0);
		IO_B_EN		: OUT bit;

		OUT_A		: OUT bit; -- Analog (PWM) outputs.
		OUT_B		: OUT bit;
		OUT_C		: OUT bit
	);
END WF2149IP_TOP_SOC;

ARCHITECTURE rtl OF WF2149IP_TOP_SOC IS
    SIGNAL BUSCYCLE		: BUSCYCLES;
    SIGNAL DATA_OUT_I	: std_logic_vector(7 DOWNTO 0);
    SIGNAL DATA_EN_I	: bit;
    SIGNAL WAV_STRB		: bit;
    SIGNAL ADR_I		: bit_vector(3 DOWNTO 0);
    SIGNAL CTRL_REG		: bit_vector(7 DOWNTO 0);
    SIGNAL PORT_A		: bit_vector(7 DOWNTO 0);
    SIGNAL PORT_B		: bit_vector(7 DOWNTO 0);
BEGIN
	P_WAVSTRB: PROCESS(RESETn, SYS_CLK)
        VARIABLE LOCK	: boolean;
        VARIABLE TMP	: bit;
	BEGIN
		IF RESETn = '0' THEN
			LOCK := false;
			TMP := '0';
		ELSIF rising_edge(SYS_CLK) THEN
			IF WAV_CLK = '1' and LOCK = false THEN
				LOCK := true;
				TMP := not TMP; -- Divider by 2.
				
                CASE SELn IS
					WHEN '1' 	=> WAV_STRB <= '1';
					WHEN OTHERS => WAV_STRB <= TMP;
				END CASE;
			ELSIF WAV_CLK = '0' THEN
				LOCK := false;
				WAV_STRB <= '0';
			ELSE
				WAV_STRB <= '0';
			END IF;
		END IF;
	END PROCESS P_WAVSTRB;		

	WITH BDIR & BC2 & BC1 SELECT
		BUSCYCLE <= INACTIVE	WHEN "000" | "010" | "101",
					ADDRESS 	WHEN "001" | "100" | "111",
					R_READ 		WHEN "011",
					R_WRITE 	WHEN "110";

	ADDRESSLATCH: PROCESS(RESETn, SYS_CLK)
	-- This process is responsible to store the desired register
	-- address. The default (after reset) is channel A fine tone 
	-- adjustment.
	BEGIN
		IF RESETn = '0' THEN
			ADR_I <= (OTHERS => '0');
        ELSIF rising_edge(SYS_CLK) THEN
			IF BUSCYCLE = ADDRESS AND A9n = '0' AND A8 = '1' AND DA_IN(7 DOWNTO 4) = x"0" THEN
				ADR_I <= To_BitVector(DA_IN(3 DOWNTO 0));
			END IF;
		END IF;
	END PROCESS ADDRESSLATCH;	

	P_CTRL_REG: PROCESS(RESETn, SYS_CLK)
	-- THIS is the Control register for the mixer and for the I/O ports.
	BEGIN
		IF RESETn = '0' THEN
			CTRL_REG <= x"00";
		ELSIF rising_edge(SYS_CLK) THEN
			IF BUSCYCLE = R_WRITE AND ADR_I = x"7" THEN
				CTRL_REG <= To_BitVector(DA_IN);
			END IF;
		END IF;
	END PROCESS P_CTRL_REG;
	
	DIG_PORTS: PROCESS(RESETn, SYS_CLK)
	BEGIN
		IF RESETn = '0' THEN
			PORT_A <= x"00";
			PORT_B <= x"00";
		ELSIF rising_edge(SYS_CLK) THEN
			IF BUSCYCLE = R_WRITE AND ADR_I = x"E" THEN
				PORT_A <= To_BitVector(DA_IN);
			ELSIF BUSCYCLE = R_WRITE and ADR_I = x"F" THEN
				PORT_B <= To_BitVector(DA_IN);
			END IF;
		END IF;	
	END PROCESS DIG_PORTS;
	-- Set port direction to input or to output:
	IO_A_EN	<= '1' WHEN CTRL_REG(6) = '1' ELSE '0';
	IO_B_EN <= '1' WHEN CTRL_REG(7) = '1' ELSE '0';
	IO_A_OUT <= PORT_A;
	IO_B_OUT <= PORT_B;

	I_PSG_WAVE: WF2149IP_WAVE
		PORT MAP(
			RESETn		=> RESETn,
			SYS_CLK	    => SYS_CLK,

			WAV_STRB	=> WAV_STRB,

			ADR			=> ADR_I,
			DATA_IN		=> DA_IN,
			DATA_OUT	=> DATA_OUT_I,
			DATA_EN		=> DATA_EN_I,
			
			BUSCYCLE	=> BUSCYCLE,
			CTRL_REG	=> CTRL_REG(5 DOWNTO 0),
						
			OUT_A		=> OUT_A,
			OUT_B		=> OUT_B,
			OUT_C		=> OUT_C
		);

	-- Read the ports and registers:
	DA_EN <= 	'1' WHEN DATA_EN_I = '1' ELSE
				'1' WHEN BUSCYCLE = R_READ and ADR_I = x"7" ELSE
				'1' WHEN BUSCYCLE = R_READ and ADR_I = x"E" ELSE
				'1' WHEN BUSCYCLE = R_READ and ADR_I = x"F" ELSE '0';
				
	DA_OUT <= 	DATA_OUT_I WHEN DATA_EN_I = '1' ELSE -- WAV stuff.
				To_StdLogicVector(IO_A_IN) WHEN BUSCYCLE = R_READ and ADR_I = x"E" ELSE
				To_StdLogicVector(IO_B_IN) WHEN BUSCYCLE = R_READ and ADR_I = x"F" ELSE
				To_StdLogicVector(CTRL_REG) WHEN BUSCYCLE = R_READ and ADR_I = x"7" ELSE (OTHERS => '0');

END rtl;
