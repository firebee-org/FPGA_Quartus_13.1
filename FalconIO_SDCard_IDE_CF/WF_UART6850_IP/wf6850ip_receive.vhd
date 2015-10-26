----------------------------------------------------------------------
----                                                              ----
---- 6850 compatible IP Core    					              ----
----                                                              ----
---- This file is part of the SUSKA ATARI clone project.          ----
---- http://www.experiment-s.de                                   ----
----                                                              ----
---- Description:                                                 ----
---- UART 6850 compatible IP core                                 ----
----                                                              ----
---- 6850's receiver unit.                                        ----
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
-- Revision 2K8A  2008/07/14 WF
--   Minor changes.
--

LIBRARY ieee;
    USE ieee.std_logic_1164.ALL;
    USE ieee.std_logic_unsigned.ALL;

ENTITY WF6850IP_RECEIVE IS
    PORT
    (
        CLK					: IN std_logic;
        RESETn				: IN bit;
		MCLR				: IN bit;

        CS					: IN bit_vector(2 DOWNTO 0);
        E		       		: IN bit;   
        RWn              	: IN bit;
        RS					: IN bit;

        DATA_OUT	        : OUT bit_vector(7 DOWNTO 0);   
		DATA_EN				: OUT bit;
		
		WS					: IN bit_vector(2 DOWNTO 0);
		CDS					: IN bit_vector(1 DOWNTO 0);

        RXCLK				: IN bit;
        RXDATA				: IN bit;

		RDRF				: BUFFER bit;
		OVR					: OUT bit;
		PE					: OUT bit;
		FE					: OUT bit
       );                                              
END ENTITY WF6850IP_RECEIVE;

ARCHITECTURE rtl OF WF6850IP_RECEIVE IS
    TYPE RCV_STATES IS (IDLE, WAIT_START, SAMPLE, PARITY, STOP1, STOP2, SYNC);
    SIGNAL RCV_STATE, RCV_NEXT_STATE	: RCV_STATES;
    SIGNAL RXDATA_I		: bit;
    SIGNAL RXDATA_S		: bit;
    SIGNAL DATA_REG		: bit_vector(7 DOWNTO 0);
    SIGNAL SHIFT_REG	: bit_vector(7 DOWNTO 0);
    SIGNAL CLK_STRB		: bit;
    SIGNAL BITCNT		: std_logic_vector(2 DOWNTO 0);
BEGIN
	p_sample : PROCESS(CLK)
        -- This filter provides a synchronisation to the system
        -- clock, even for random baud rates of the received data
        -- stream.
        VARIABLE FLT_TMP	: integer RANGE 0 TO 2;
	BEGIN
		IF rising_edge(CLK) THEN
            --
            RXDATA_I <= RXDATA;
            --
            IF RXDATA_I = '1' and FLT_TMP < 2 THEN
                FLT_TMP := FLT_TMP + 1;
            ELSIF RXDATA_I = '1' THEN
                RXDATA_S <= '1';
            ELSIF RXDATA_I = '0' and FLT_TMP > 0 THEN
                FLT_TMP := FLT_TMP - 1;
            ELSIF RXDATA_I = '0' THEN
                RXDATA_S <= '0';
            END IF;
        END IF;
	END PROCESS p_sample;
    
	clkdiv : PROCESS(CLK)
        VARIABLE CLK_LOCK	: boolean;
        VARIABLE STRB_LOCK	: boolean;
        VARIABLE CLK_DIVCNT	: std_logic_vector(6 DOWNTO 0);
	BEGIN
		IF rising_edge(CLK) THEN
            IF CDS = "00" THEN -- Divider off.
                IF RXCLK = '1' and STRB_LOCK = false THEN
                    CLK_STRB <= '1';
                    STRB_LOCK := true;
                ELSIF RXCLK = '0' THEN
                    CLK_STRB <= '0';
                    STRB_LOCK := false;
                ELSE
                    CLK_STRB <= '0';
                END IF;
            ELSIF RCV_STATE = IDLE THEN
                -- Preset the CLKDIV with the start delays.
                IF CDS = "01" THEN
                    CLK_DIVCNT := "0001000"; -- Half of div by 16 mode.
                ELSIF CDS = "10" THEN
                    CLK_DIVCNT := "0100000"; -- Half of div by 64 mode.
                END IF;
                CLK_STRB <= '0';
            ELSE
                IF CLK_DIVCNT > "0000000" and RXCLK = '1' and CLK_LOCK = false THEN
                    CLK_DIVCNT := CLK_DIVCNT - '1';
                    CLK_STRB <= '0';
                    CLK_LOCK := true;
                ELSIF CDS = "01" and CLK_DIVCNT = "0000000" THEN
                    CLK_DIVCNT := "0010000"; -- Div by 16 mode.
                    --
                    IF STRB_LOCK = false THEN
                        STRB_LOCK := true;
                        CLK_STRB <= '1';
                    ELSE
                        CLK_STRB <= '0';
                    END IF;
                ELSIF CDS = "10" and CLK_DIVCNT = "0000000" THEN
                    CLK_DIVCNT := "1000000"; -- Div by 64 mode.
                    IF STRB_LOCK = false THEN
                        STRB_LOCK := true;
                        CLK_STRB <= '1';
                    ELSE
                        CLK_STRB <= '0';
                    END IF;
                ELSIF RXCLK = '0' THEN
                    CLK_LOCK := false;
                    STRB_LOCK := false;
                    CLK_STRB <= '0';
                ELSE
                    CLK_STRB <= '0';
                END IF;
            END IF;
		END IF;
	END PROCESS clkdiv;
	
	datareg : PROCESS(RESETn, CLK)
	BEGIN
		IF RESETn = '0' or MCLR = '1' THEN
				DATA_REG <= x"00";
		ELSE
			IF rising_edge(CLK) THEN
				IF RCV_STATE = SYNC and WS(2) = '0' and RDRF = '0' THEN -- 7 bit data.
                    -- Transfer from shift- to data register only if
                    -- data register is empty (RDRF = '0').
                    DATA_REG <= '0' & SHIFT_REG(7 downto 1);
                ELSIF RCV_STATE = SYNC and WS(2) = '1' and RDRF = '0' THEN -- 8 bit data.
                    -- Transfer from shift- to data register only if
                    -- data register is empty (RDRF = '0').
                    DATA_REG <= SHIFT_REG;
                END IF;
            END IF;
		END IF;
	END PROCESS datareg;	
    
    DATA_OUT <= DATA_REG WHEN CS = "011" and RWn = '1' and RS = '1' ELSE (OTHERS => '0');
    DATA_EN <= '1' WHEN CS = "011" and RWn = '1' and RS = '1' ELSE '0';
	
	shiftreg : PROCESS(RESETn, CLK)
	BEGIN
		IF RESETn = '0' or MCLR = '1' THEN
				SHIFT_REG <= x"00";
		ELSE
			IF rising_edge(CLK) THEN
				IF RCV_STATE = SAMPLE and CLK_STRB = '1' THEN
                    SHIFT_REG <= RXDATA_S & SHIFT_REG(7 DOWNTO 1); -- Shift right.
                END IF;
            END IF;
		END IF;
	END PROCESS shiftreg;	

	p_bitcnt : PROCESS(CLK)
	BEGIN
		IF rising_edge(CLK) THEN
            IF RCV_STATE = SAMPLE and CLK_STRB = '1' THEN
                BITCNT <= BITCNT + '1';
            ELSIF RCV_STATE /= SAMPLE THEN
                BITCNT <= (OTHERS => '0');
            END IF;
		END IF;
	END PROCESS p_bitcnt;

	p_frame_err: PROCESS(RESETn, CLK)
	-- This module detects a framing error
	-- during stop bit 1 and stop bit 2.
        VARIABLE FE_I: bit;
	BEGIN
		IF RESETn = '0' THEN
			FE_I := '0';
			FE <= '0';
		ELSE
			IF rising_edge(CLK) THEN
                IF MCLR = '1' THEN
                    FE_I := '0';
                    FE <= '0';
                ELSIF CLK_STRB = '1' THEN
                    IF RCV_STATE = STOP1 and RXDATA_S = '0' THEN
                        FE_I := '1';
                    ELSIF RCV_STATE = STOP2 and RXDATA_S = '0' THEN
                        FE_I := '1';
                    ELSIF RCV_STATE = STOP1 or RCV_STATE = STOP2 THEN
                        FE_I := '0'; -- Error resets when correct data appears.
                    END IF;
                END IF;
                IF RCV_STATE = SYNC THEN
                    FE <= FE_I; -- Update the FE every SYNC time.
                END IF;
            END IF;
		END IF;
	END PROCESS p_frame_err;

	p_overrun : PROCESS(RESETn, CLK)
        VARIABLE OVR_I		: bit;
        VARIABLE FIRST_READ	: boolean;
	BEGIN
		IF rising_edge(CLK) THEN
			IF RESETn = '0'  or MCLR = '1' THEN
				OVR_I := '0';
				OVR <= '0';
				FIRST_READ := false;
			ELSE
				IF CLK_STRB = '1' and RCV_STATE = STOP1 THEN
                    -- Overrun appears if RDRF is '1' in this state.
                    OVR_I := RDRF;
                END IF;
				IF CS = "011" and RWn = '1' and RS = '1' THEN
                    -- If an overrun was detected, the concerning flag is
                    -- set when the valid data word in the receiver data
                    -- register is read. Thereafter the RDRF flag is reset
                    -- and the overrun disappears (OVR_I goes low) after 
                    -- a second read (in time) of the receiver data register.
                    IF FIRST_READ = false THEN
						IF OVR_I = '1' THEN
                            OVR <= '1';
							OVR_I := '0';
                            FIRST_READ := true;
                        ELSE
                            OVR <= '0';
						END IF;
					END IF;
				ELSE
					FIRST_READ := false;
				END IF;
			END IF;
		END IF;
	END PROCESS p_overrun;
	
	p_parity_test : PROCESS(RESETn,MCLR,CLK)
        VARIABLE PAR_TMP	: bit;
        VARIABLE PE_I	    : bit;
	BEGIN
		IF RESETn = '0' or MCLR = '1' THEN
			PE <= '0';
		ELSE
			IF rising_edge(CLK) THEN
				IF CLK_STRB = '1' THEN -- Sample parity on clock strobe.
                    PE_I := '0'; -- Initialise.
                    IF RCV_STATE = PARITY THEN
                        FOR i in 1 TO 7 LOOP
                            IF i = 1 THEN
                                PAR_TMP := SHIFT_REG(i - 1) xor SHIFT_REG(i);
                            ELSE
                                PAR_TMP := PAR_TMP xor SHIFT_REG(i);
                            END IF;
                        END LOOP;
                        IF WS = "000" or WS = "010" or WS = "110" THEN -- Even parity.
                            PE_I := PAR_TMP xor RXDATA_S;
                        ELSIF WS = "001" or WS = "011" or WS = "111" THEN -- Odd parity.
                            PE_I := not PAR_TMP xor RXDATA_S;
                        ELSE -- No parity for WS = "100" and WS = "101".
                            PE_I := '0';		
                        END IF;
                    END IF;
                END IF;
			END IF;
			-- Transmit the parity flag together with the data
			-- In other words: no parity to the status register
			-- when RDRF inhibits the data transfer to the
			-- receiver data register.
			IF RCV_STATE = SYNC and RDRF = '0' THEN
				PE <= PE_I;
			ELSIF CS = "011" and RWn = '1' and RS = '1' THEN
				PE <= '0'; -- Clear when reading the data register.
			END IF;
		END IF;
	END PROCESS p_parity_test;

	p_rdrf : process(RESETn, CLK)
	-- Receive data register full flag.
	BEGIN
		IF rising_edge(CLK) THEN
			IF RESETn = '0' or MCLR = '1' THEN
                RDRF <= '0';
			ELSE
				IF RCV_STATE = SYNC THEN
                    RDRF <= '1'; -- Data register is full until now!
				END IF;
				IF CS = "011" and RWn = '1' and RS = '1' THEN
					RDRF <= '0'; -- when reading the data register ...
				END IF;
			END IF;
		END IF;
	END PROCESS p_rdrf;
	
	p_rcv_statereg : PROCESS(RESETn, CLK)
	BEGIN
		IF RESETn = '0' THEN
			RCV_STATE <= IDLE;
		ELSE
			IF rising_edge(CLK) THEN
                IF MCLR = '1' THEN
                    RCV_STATE <= IDLE;
                ELSE
                    RCV_STATE <= RCV_NEXT_STATE;
                END IF;
            END IF;
		END IF;
	END PROCESS p_rcv_statereg;
	
	p_rcv_statedec : PROCESS(RCV_STATE, RXDATA_S, CDS, WS, BITCNT, CLK_STRB)
	BEGIN
		CASE RCV_STATE IS
			WHEN IDLE =>
				IF RXDATA_S = '0' and CDS = "00" THEN
					RCV_NEXT_STATE <= SAMPLE; -- Startbit detected in div by 1 mode.
				ELSIF RXDATA_S = '0' and CDS = "01" THEN
					RCV_NEXT_STATE <= WAIT_START; -- Startbit detected in div by 16 mode.
				ELSIF RXDATA_S = '0' and CDS = "10" THEN
					RCV_NEXT_STATE <= WAIT_START; -- Startbit detected in div by 64 mode.
				ELSE
					RCV_NEXT_STATE <= IDLE; -- No startbit; sleep well :-)
				END IF;
			
            WHEN WAIT_START =>
				IF CLK_STRB = '1' THEN
					IF RXDATA_S = '0' THEN
						RCV_NEXT_STATE <= SAMPLE; -- Start condition in no div by 1 modes.
					ELSE
						RCV_NEXT_STATE <= IDLE; -- No valid start condition, go back.
					END IF;
				ELSE
					RCV_NEXT_STATE <= WAIT_START; -- Stay.
				END IF;
			
            WHEN SAMPLE =>
				IF CLK_STRB = '1' THEN
					IF BITCNT < "110" and WS(2) = '0' THEN
						RCV_NEXT_STATE <= SAMPLE; -- Go on sampling 7 data bits.
					ELSIF BITCNT < "111" and WS(2) = '1' THEN
						RCV_NEXT_STATE <= SAMPLE; -- Go on sampling 8 data bits.
					ELSIF WS = "100" or WS = "101" THEN
						RCV_NEXT_STATE <= STOP1; -- No parity check enabled.
					ELSE
						RCV_NEXT_STATE <= PARITY; -- Parity enabled.
					END IF;
				ELSE
					RCV_NEXT_STATE <= SAMPLE; -- Stay in sample mode.
				END IF;
                
			WHEN PARITY =>
				IF CLK_STRB = '1' THEN
					RCV_NEXT_STATE <= STOP1;
				ELSE
					RCV_NEXT_STATE <= PARITY;
				END IF;				
			
            WHEN STOP1 =>
				IF CLK_STRB = '1' THEN
					IF RXDATA_S = '0' THEN
						RCV_NEXT_STATE <= SYNC; -- Framing error detected.
					ELSIF WS = "000" or WS = "001" or WS = "100" THEN
						RCV_NEXT_STATE <= STOP2; -- Two stop bits selected.
					ELSE
						RCV_NEXT_STATE <= SYNC; -- One stop bit selected.
					END IF;
				ELSE
					RCV_NEXT_STATE <= STOP1;
				END IF;	
                
            WHEN STOP2 =>
				IF CLK_STRB = '1' THEN
					RCV_NEXT_STATE <= SYNC;
				ELSE
					RCV_NEXT_STATE <= STOP2;
				END IF;				
			WHEN SYNC =>
				RCV_NEXT_STATE <= IDLE;
		END CASE;
	END PROCESS p_rcv_statedec;
END ARCHITECTURE rtl;

