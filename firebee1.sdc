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

## DATE    "Sun Sep 20 18:51:37 2015"

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


#**************************************************************
# Create Generated Clock
#**************************************************************

derive_pll_clocks


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {MAIN_CLK}]  0.10  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {MAIN_CLK}]  0.10  


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

set_false_path  -from  [get_clocks {MAIN_CLK}]  -to  [get_clocks {i_video_clock_pll|altpll_component|auto_generated|pll1|clk[0]}]
set_false_path  -from  [get_clocks {i_atari_clk_pll|altpll_component|auto_generated|pll1|clk[2]}]  -to  [get_clocks {i_video_clock_pll|altpll_component|auto_generated|pll1|clk[0]}]
set_false_path  -from  [get_clocks {i_atari_clk_pll|altpll_component|auto_generated|pll1|clk[2]}]  -to  [get_clocks {i_ddr_clk_pll|altpll_component|auto_generated|pll1|clk[0]}]
set_false_path  -from  [get_clocks {i_ddr_clk_pll|altpll_component|auto_generated|pll1|clk[4]}]  -to  [get_clocks {MAIN_CLK}]
set_false_path  -from  [get_clocks {i_video_clock_pll|altpll_component|auto_generated|pll1|clk[0]}]  -to  [get_clocks {i_atari_clk_pll|altpll_component|auto_generated|pll1|clk[2]}]
set_false_path  -from  [get_clocks {i_video_clock_pll|altpll_component|auto_generated|pll1|clk[0]}]  -to  [get_clocks {MAIN_CLK}]
set_false_path  -from  [get_clocks {i_video_clock_pll|altpll_component|auto_generated|pll1|clk[0]}]  -to  [get_clocks {i_ddr_clk_pll|altpll_component|auto_generated|pll1|clk[0]}]

set_false_path -from [get_keepers {*rdptr_g*}] -to [get_keepers {*ws_dgrp|dffpipe_id9:dffpipe17|dffe18a*}]
set_false_path -from [get_keepers {*delayed_wrptr_g*}] -to [get_keepers {*rs_dgwp|dffpipe_hd9:dffpipe12|dffe13a*}]
set_false_path -from [get_keepers {*rdptr_g*}] -to [get_keepers {*ws_dgrp|dffpipe_kd9:dffpipe15|dffe16a*}]
set_false_path -from [get_keepers {*delayed_wrptr_g*}] -to [get_keepers {*rs_dgwp|dffpipe_jd9:dffpipe12|dffe13a*}]
set_false_path -from [get_keepers {*rdptr_g*}] -to [get_keepers {*ws_dgrp|dffpipe_re9:dffpipe19|dffe20a*}]
set_false_path -from [get_keepers {Video:i_video|video_mod_mux_clutctr:i_video_mod_mux_clutctr|nBLANK}] -to [get_keepers {falconio_sdcard_ide_cf:i_falcon_io_sdcard_ide_cf|WF68901IP_TOP_SOC:I_MFP|WF68901IP_INTERRUPTS:I_INTERRUPTS|\EDGE_ENA:LOCK[3]}]


#**************************************************************
# Set Multicycle Path
#**************************************************************

set_multicycle_path -setup -start -from  [get_clocks {MAIN_CLK}]  -to  [get_clocks {i_atari_clk_pll|altpll_component|auto_generated|pll1|clk[2]}] 8
set_multicycle_path -setup -end -from  [get_clocks {MAIN_CLK}]  -to  [get_clocks {i_atari_clk_pll|altpll_component|auto_generated|pll1|clk[1]}] 4
#set_multicycle_path -hold -end -from [get_clocks {MAIN_CLK}] -to [get_keepers {Video:i_video|DDR_CTR:i_ddr_ctr|MCS[0]}] 2
set_multicycle_path -setup -end -from [get_keepers {Video:i_video|video_mod_mux_clutctr:i_video_mod_mux_clutctr|VDL_VMD[2]}] -to [get_keepers {Video:i_video|video_mod_mux_clutctr:i_video_mod_mux_clutctr|DPO_OFF}] 8


#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

