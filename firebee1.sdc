## Generated SDC file "ddr.sdc"

## Copyright (C) 1991-2013 Altera Corporation
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, Altera MegaCore Function License 
## Agreement, or other applicable license agreement, including, 
## without limitation, that your use is for the sole purpose of 
## programming logic devices manufactured by Altera and sold by 
## Altera or its authorized distributors.  Please refer to the 
## applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

## DATE    "Fri Aug 22 11:04:42 2014"

##
## DEVICE  "EP3C16F484C8"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {main_clk} -period 30.303 -waveform { 0.000 15.151 } [get_ports {main_clk}]
create_clock -name {clk33m} -period 30.303 -waveform {0.000 15.151} [get_ports {clk33m}]

#**************************************************************
# Create Generated Clock
#**************************************************************

derive_pll_clocks -create_base_clocks


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************
derive_clock_uncertainty


#**************************************************************
# Set Input Delay
#**************************************************************

#**************************************************************
# Set Output Delay
#**************************************************************

#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************

set_false_path -from [get_clocks {clk33m}] -to [get_clocks {main_clk}]
set_false_path -from [get_clocks {main_clk}] -to [get_clocks {clk33m}]

# decouple video clk from all other clocks
set_false_path -from [get_clocks {*}] -to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}]
set_false_path -from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -to [get_clocks {*}]

# the same with clk25m
set_false_path -from [get_clocks {*}] -to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}]
set_false_path -from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -to [get_clocks {*}]




#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

