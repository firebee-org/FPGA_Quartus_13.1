-- Copyright (C) 1991-2014 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 13.1.4 Build 182 03/12/2014 SJ Web Edition"
-- CREATED		"Mon Jan 11 09:20:56 2016"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY altera;
USE altera.maxplus2.all; 

LIBRARY work;

ENTITY mux41_1 IS 
PORT 
( 
	S0	:	IN	 STD_LOGIC;
	S1	:	IN	 STD_LOGIC;
	D0	:	IN	 STD_LOGIC;
	INH	:	IN	 STD_LOGIC;
	D1	:	IN	 STD_LOGIC;
	Q	:	OUT	 STD_LOGIC
); 
END mux41_1;

ARCHITECTURE bdf_type OF mux41_1 IS 
BEGIN 

-- instantiate macrofunction 

b2v_inst41 : work.mux41
PORT MAP(S0 => S0,
		 S1 => S1,
		 D0 => D0,
		 INH => INH,
		 D1 => D1,
         D2 => '0',
         D3 => '0',
		 Q => Q);

END bdf_type; 