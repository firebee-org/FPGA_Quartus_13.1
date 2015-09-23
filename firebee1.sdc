## Generated SDC file "firebee1.sdc"

## Copyright (C) 1991-2014 Altera Corporation
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
## VERSION "Version 13.1.4 Build 182 03/12/2014 SJ Web Edition"

## DATE    "Mon Sep 21 20:39:03 2015"

##
## DEVICE  "EP3C40F484C6"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {MAIN_CLK} -period 30.303 -waveform { 0.000 15.151 } [get_ports {MAIN_CLK}]

# Clocks used:
# MAIN_CLK          33MHz
# 
# PLL1: i_mfp_acia_clk_pll
# input: MAIN_CLK
# c0: 500 kHz
# c1: 2.4576 MHz
# c2: 24.576 MHz
# 
# PLL2: i_ddr_clock_pll
# input: MAIN_CLK
# c0: 132 MHz
# c1: 132 MHz
# c2: 132 MHz
# c3: 132 MHz
# c4: 66 MHz
#
# PLL3: i_atari_clk_pll
# input: MAIN_CLK
# c0: 2 MHz
# c1: 16 MHz
# c2: 25 MHz
# c3: 48 MHz
# 
# PLL4_ i_video_clk_pll
# input: USB_CLK (48 MHz, PLL3 c3)
# c0: 96 MHz, programmable in 1MHz steps
#
#**************************************************************
# Create Generated Clock
#**************************************************************

derive_pll_clocks

# PIXEL_CLK is either
# CLK13M, CLK17M, CLK25M, CLK33M or CLK_VIDEO
# where CLK13M is half of CLK25M,
# CLK17M is half of CLK33M and CLK_VIDEO is the freely programmable
# clock of i_video_clk_pll
#


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {MAIN_CLK}]  2.00  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {MAIN_CLK}]  2.00  
derive_clock_uncertainty


#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay -clock [get_clocks {MAIN_CLK}] 1.000 [get_ports {FB_AD[0]}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {MAIN_CLK}]  1.000 [get_ports {FB_AD[0]}]


#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************

#
# i_videl_clk is freely programmable
#
set_false_path  -from  [get_clocks {MAIN_CLK}]  -to  [get_clocks {i_video_clk_pll|altpll_component|auto_generated|pll1|clk[0]}]

# MAIN_CLK to 16 MHz clk -> false_path
set_false_path  -from  [get_clocks {MAIN_CLK}]  -to  [get_clocks {i_atari_clk_pll|altpll_component|auto_generated|pll1|clk[1]}]
set_false_path  -from  [get_clocks {MAIN_CLK}]  -to  [get_clocks {i_atari_clk_pll|altpll_component|auto_generated|pll1|clk[2]}]

# MAIN_CLK to DDR clk and v.v.
set_false_path -from [get_clocks {MAIN_CLK}] -to [get_clocks {i_ddr_clk_pll|altpll_component|auto_generated|pll1|clk[0]}]
set_false_path -from [get_clocks {i_ddr_clk_pll|altpll_component|auto_generated|pll1|clk[0]}] -to [get_clocks {MAIN_CLK}]
set_false_path -from [get_clocks {MAIN_CLK}] -to [get_clocks {i_ddr_clk_pll|altpll_component|auto_generated|pll1|clk[4]}]
set_false_path -from [get_clocks {i_ddr_clk_pll|altpll_component|auto_generated|pll1|clk[4]}] -to [get_clocks {MAIN_CLK}]


set_false_path  -from  [get_clocks {i_ddr_clk_pll|altpll_component|auto_generated|pll1|clk[4]}]  -to  [get_clocks {i_atari_clk_pll|altpll_component|auto_generated|pll1|clk[1]}]
set_false_path  -from  [get_clocks {i_ddr_clk_pll|altpll_component|auto_generated|pll1|clk[4]}]  -to  [get_clocks {i_ddr_clk_pll|altpll_component|auto_generated|pll1|clk[0]}]
set_false_path  -from  [get_clocks {i_mfp_acia_clk_pll|altpll_component|auto_generated|pll1|clk[0]}]  -to  [get_clocks {MAIN_CLK}]
set_false_path  -from  [get_clocks {i_mfp_acia_clk_pll|altpll_component|auto_generated|pll1|clk[1]}]  -to  [get_clocks {MAIN_CLK}]

# 2 MHz to 33 MHz
set_false_path  -from  [get_clocks {i_atari_clk_pll|altpll_component|auto_generated|pll1|clk[0]}]  -to  [get_clocks {MAIN_CLK}]

# 16 MHz to 33 MHz
set_false_path  -from  [get_clocks {i_atari_clk_pll|altpll_component|auto_generated|pll1|clk[1]}]  -to  [get_clocks {MAIN_CLK}]
set_false_path -from [get_clocks {MAIN_CLK}] -to [get_clocks {i_atari_clk_pll|altpll_component|auto_generated|pll1|clk[1]}]

# 25 MHz to 33 MHz
set_false_path  -from  [get_clocks {i_atari_clk_pll|altpll_component|auto_generated|pll1|clk[2]}]  -to  [get_clocks {MAIN_CLK}]
set_false_path -from [get_clocks {MAIN_CLK}] -to [get_clocks {i_atari_clk_pll|altpll_component|auto_generated|pll1|clk[2]}]

set_false_path  -from  [get_clocks {i_atari_clk_pll|altpll_component|auto_generated|pll1|clk[2]}]  -to  [get_clocks {i_video_clk_pll|altpll_component|auto_generated|pll1|clk[0]}]
set_false_path  -from  [get_clocks {i_atari_clk_pll|altpll_component|auto_generated|pll1|clk[2]}]  -to  [get_clocks {i_ddr_clk_pll|altpll_component|auto_generated|pll1|clk[0]}]

set_false_path  -from  [get_clocks {i_video_clk_pll|altpll_component|auto_generated|pll1|clk[0]}]  -to  [get_clocks {i_atari_clk_pll|altpll_component|auto_generated|pll1|clk[2]}]

set_false_path  -from  [get_clocks {i_video_clk_pll|altpll_component|auto_generated|pll1|clk[0]}]  -to  [get_clocks {MAIN_CLK}]
set_false_path -from [get_clocks {MAIN_CLK}] -to [get_clocks {i_video_clk_pll|altpll_component|auto_generated|pll1|clk[0]}]

set_false_path  -from  [get_clocks {i_video_clk_pll|altpll_component|auto_generated|pll1|clk[0]}]  -to  [get_clocks {i_ddr_clk_pll|altpll_component|auto_generated|pll1|clk[0]}]

set_false_path -from [get_keepers {*rdptr_g*}] -to [get_keepers {*ws_dgrp|dffpipe_id9:dffpipe17|dffe18a*}]
set_false_path -from [get_keepers {*delayed_wrptr_g*}] -to [get_keepers {*rs_dgwp|dffpipe_hd9:dffpipe12|dffe13a*}]
set_false_path -from [get_keepers {*rdptr_g*}] -to [get_keepers {*ws_dgrp|dffpipe_kd9:dffpipe15|dffe16a*}]
set_false_path -from [get_keepers {*delayed_wrptr_g*}] -to [get_keepers {*rs_dgwp|dffpipe_jd9:dffpipe12|dffe13a*}]
set_false_path -from [get_keepers {*rdptr_g*}] -to [get_keepers {*ws_dgrp|dffpipe_re9:dffpipe19|dffe20a*}]


#**************************************************************
# Set Multicycle Path
#**************************************************************

# Clocks used:
# MAIN_CLK          33MHz
# 
# PLL1: i_mfp_acia_clk_pll
# input: MAIN_CLK
# c0: 500 kHz
# c1: 2.4576 MHz
# c2: 24.576 MHz
# 
# PLL2: i_ddr_clock_pll
# input: MAIN_CLK
# c0: 132 MHz
# c1: 132 MHz
# c2: 132 MHz
# c3: 132 MHz
# c4: 66 MHz
#
# PLL3: i_atari_clk_pll
# input: MAIN_CLK
# c0: 2 MHz
# c1: 16 MHz
# c2: 25 MHz
# c3: 48 MHz
# 
# PLL4_ i_video_clk_pll
# input: USB_CLK (48 MHz, PLL3 c3)
# c0: 96 MHz, programmable in 1MHz steps


# 66 MHz to 33 MHz
set_multicycle_path -setup -start -from  [get_clocks {i_ddr_clk_pll|altpll_component|auto_generated|pll1|clk[4]}]  -to  [get_clocks {MAIN_CLK}] 2
set_multicycle_path -hold -start -from  [get_clocks {i_ddr_clk_pll|altpll_component|auto_generated|pll1|clk[4]}]  -to  [get_clocks {MAIN_CLK}] 2
# 33 MHz to 66 MHz 
set_multicycle_path -setup -end -from [get_clocks {MAIN_CLK}] -to [get_clocks {i_ddr_clk_pll|altpll_component|auto_generated|pll1|clk[4]}] 2
set_multicycle_path -hold -end -from [get_clocks {MAIN_CLK}] -to [get_clocks {i_ddr_clk_pll|altpll_component|auto_generated|pll1|clk[4]}] 2
# 132 MHz to 33 MHz 
set_multicycle_path -setup -end -from [get_clocks {i_ddr_clk_pll|altpll_component|auto_generated|pll1|clk[4]}] -to [get_clocks {MAIN_CLK}] 4
set_multicycle_path -hold -end -from [get_clocks {i_ddr_clk_pll|altpll_component|auto_generated|pll1|clk[4]}] -to [get_clocks {MAIN_CLK}] 4
# 33 MHz to 132 MHz 
set_multicycle_path -setup -start -from [get_clocks {MAIN_CLK}] -to [get_clocks {i_ddr_clk_pll|altpll_component|auto_generated|pll1|clk[4]}] 4
set_multicycle_path -hold -start -from [get_clocks {MAIN_CLK}] -to [get_clocks {i_ddr_clk_pll|altpll_component|auto_generated|pll1|clk[4]}] 4

#**************************************************************
# Set Maximum Delay
#**************************************************************

# from here to the end of the file statements are just an experiment

#set_max_delay 25 -from [get_ports {*}]

#**************************************************************
# Set Minimum Delay
#**************************************************************

#set_min_delay 0.5 -from [get_ports {*}]

#**************************************************************
# Set Input Transition
#**************************************************************
#set_input_delay -max -clock [get_clocks {MAIN_CLK}] [get_pins {*}] 25
#set_input_delay -min -clock [get_clocks {MAIN_CLK}] [get_pins {*}] .5
#set_output_delay -max -clock [get_clocks {MAIN_CLK}] [get_pins {*}] 25
#set_output_delay -min -clock [get_clocks {MAIN_CLK}] [get_pins {*}] .5

