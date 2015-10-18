----------------------------------------------------------------------
----                                                              ----
---- 6850 compatible IP Core     					              ----
----                                                              ----
---- This file is part of the SUSKA ATARI clone project.          ----
---- http://www.experiment-s.de                                   ----
----                                                              ----
---- Description:                                                 ----
---- UART 6850 compatible IP core                                 ----
----                                                              ----
---- This is the top level file.                                  ----
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
-- Revision 2K9B  2009/12/24 WF
--   Fixed the interrupt logic.
--   Introduced a minor RTSn correction.
--

LIBRARY ieee;
    USE ieee.std_logic_1164.ALL;
    USE ieee.std_logic_unsigned.ALL;

ENTITY WF6850IP_TOP_SOC IS
  PORT (
		CLK					: IN bit;
        RESETn				: in bit;

        CS2n, CS1, CS0		: IN bit;
        E		       		: IN bit;   
        RWn              	: IN bit;
        RS					: in bit;

        DATA_IN		        : IN std_logic_vector(7 DOWNTO 0);   
        DATA_OUT	        : OUT std_logic_vector(7 DOWNTO 0);   
		DATA_EN				: OUT bit;

        TXCLK				: IN bit;
        RXCLK				: IN bit;
        RXDATA				: IN bit;
        CTSn				: IN bit;
        DCDn				: IN bit;
        
        IRQn				: OUT bit;
        TXDATA				: OUT bit;   
        RTSn				: OUT bit
       );                                              
END ENTITY WF6850IP_TOP_SOC;

ARCHITECTURE structure OF WF6850IP_TOP_SOC IS
    COMPONENT WF6850IP_CTRL_STATUS
	PORT (
		CLK			: IN bit;
        RESETn		: IN bit;
        CS			: IN bit_vector(2 DOWNTO 0);
        E			: IN bit;   
        RWn     	: IN bit;
        RS			: IN bit;
        DATA_IN		: IN bit_vector(7 DOWNTO 0);   
        DATA_OUT	: OUT bit_vector(7 DOWNTO 0);  
		DATA_EN		: OUT bit;
		RDRF		: IN bit;
		TDRE		: IN bit;
		DCDn		: IN bit;
		CTSn		: IN bit;
		FE			: IN bit;
		OVR			: IN bit;
		PE			: IN bit;
		MCLR		: OUT bit;
		RTSn		: OUT bit;
		CDS			: OUT bit_vector(1 DOWNTO 0);
		WS			: OUT bit_vector(2 DOWNTO 0);
		TC			: OUT bit_vector(1 DOWNTO 0);
		IRQn		: OUT bit
       );                                              
    END COMPONENT;

    COMPONENT WF6850IP_RECEIVE
        PORT (
            CLK					: IN bit;
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
            RDRF				: OUT bit;
            OVR					: OUT bit;
            PE					: OUT bit;
            FE					: OUT bit
           );                                              
    END COMPONENT;
    
    COMPONENT WF6850IP_TRANSMIT
        PORT (
            CLK					: IN bit;
            RESETn				: IN bit;
            MCLR				: IN bit;
            CS					: IN bit_vector(2 DOWNTO 0);
            E		       		: IN bit;   
            RWn              	: IN bit;
            RS					: IN bit;
            DATA_IN		        : IN bit_vector(7 DOWNTO 0);   
            CTSn				: IN bit;
            TC					: IN bit_vector(1 DOWNTO 0);
            WS					: IN bit_vector(2 DOWNTO 0);
            CDS					: IN bit_vector(1 DOWNTO 0);
            TXCLK				: IN bit;
            TDRE				: OUT bit;        
            TXDATA				: OUT bit
           );                                              
    END COMPONENT;
    
    SIGNAL DATA_IN_I	: bit_vector(7 DOWNTO 0);
    SIGNAL DATA_RX		: bit_vector(7 DOWNTO 0);
    SIGNAL DATA_RX_EN	: bit;
    SIGNAL DATA_CTRL	: bit_vector(7 DOWNTO 0);
    SIGNAL DATA_CTRL_EN	: bit;
    SIGNAL RDRF_I		: bit;
    SIGNAL TDRE_I		: bit;
    SIGNAL FE_I			: bit;
    SIGNAL OVR_I		: bit;
    SIGNAL PE_I			: bit;
    SIGNAL MCLR_I		: bit;
    SIGNAL CDS_I		: bit_vector(1 DOWNTO 0);
    SIGNAL WS_I			: bit_vector(2 DOWNTO 0);
    SIGNAL TC_I			: bit_vector(1 DOWNTO 0);
    SIGNAL IRQ_In		: bit;
BEGIN
	DATA_IN_I <= To_BitVector(DATA_IN);
	DATA_EN <= DATA_RX_EN or DATA_CTRL_EN;
	DATA_OUT <= To_StdLogicVector(DATA_RX) when DATA_RX_EN = '1' else
				To_StdLogicVector(DATA_CTRL) when DATA_CTRL_EN = '1' else (others => '0');
				
	IRQn <= '0' when IRQ_In = '0' else '1';

	I_UART_CTRL_STATUS: WF6850IP_CTRL_STATUS
        PORT MAP
        (
            CLK			=> CLK,
            RESETn		=> RESETn,
            CS(2)		=> CS2n,
            CS(1)		=> CS1,
            CS(0)		=> CS0,
            E			=> E,
	        RWn     	=> RWn,
	        RS			=> RS,
	        DATA_IN		=> DATA_IN_I,
			DATA_OUT	=> DATA_CTRL,
			DATA_EN		=> DATA_CTRL_EN,
			RDRF		=> RDRF_I,
			TDRE		=> TDRE_I,
			DCDn		=> DCDn,
			CTSn		=> CTSn,
			FE			=> FE_I,
			OVR			=> OVR_I,
			PE			=> PE_I,
			MCLR		=> MCLR_I,
			RTSn		=> RTSn,
			CDS			=> CDS_I,
			WS			=> WS_I,
			TC			=> TC_I,
			IRQn		=> IRQ_In
        );                                              

	I_UART_RECEIVE: WF6850IP_RECEIVE
        PORT MAP
        (
			CLK			=> CLK,
	        RESETn		=> RESETn,
			MCLR		=> MCLR_I,
	        CS(2)		=> CS2n,
	        CS(1)		=> CS1,
	        CS(0)		=> CS0,
	        E			=> E,
	        RWn     	=> RWn,
	        RS			=> RS,
	        DATA_OUT	=> DATA_RX,
			DATA_EN		=> DATA_RX_EN,
			WS			=> WS_I,
			CDS			=> CDS_I,
			RXCLK		=> RXCLK,
			RXDATA		=> RXDATA,
			RDRF		=> RDRF_I,
			OVR			=> OVR_I,
			PE			=> PE_I,
			FE			=> FE_I
        );                                              

	I_UART_TRANSMIT: WF6850IP_TRANSMIT
        PORT MAP
        (
			CLK			=> CLK,
	        RESETn		=> RESETn,
			MCLR		=> MCLR_I,
	        CS(2)		=> CS2n,
	        CS(1)		=> CS1,
	        CS(0)		=> CS0,
	        E			=> E,
	        RWn     	=> RWn,
	        RS			=> RS,
	        DATA_IN		=> DATA_IN_I,
			CTSn		=> CTSn,
			TC			=> TC_I,
			WS			=> WS_I,
			CDS			=> CDS_I,
			TDRE		=> TDRE_I,
			TXCLK		=> TXCLK,
			TXDATA		=> TXDATA
        );
END ARCHITECTURE structure;