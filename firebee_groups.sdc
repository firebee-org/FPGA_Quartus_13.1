#--------------------------------------------------------------#
#                                                              #
# Synopsis design constraints for the Firebee project          #
#                                                              #
# This file is part of the Firebee ACP project.                #
# http://www.experiment-s.de                                   #
#                                                              #
# Description:                                                 #
#   timing constraints for the Firebee VHDL config             #
#                                                              #
#                                                              #
#                                                              #
# To Do:                                                       #
# -                                                            #
#                                                              #
# Author(s):                                                   #
# Markus Fröschle, mfro@mubf.de                                #
#                                                              #
#--------------------------------------------------------------#
#                                                              #
# Copyright (C) 2015 Markus Fröschle & the ACP project         #
#                                                              #
# This source file may be used and distributed without         #
# restriction provided that this copyright statement is not    #
# removed from the file and that any derivative work contains  #
# the original copyright notice and the associated disclaimer. #
#                                                              #
# This source file is free software; you can redistribute it   #
# and/or modify it under the terms of the GNU Lesser General   #
# Public License as published by the Free Software Foundation; #
# either version 2.1 of the License, or (at your option) any   #
# later version.                                               #
#                                                              #
# This source is distributed in the hope that it will be       #
# useful, but WITHOUT ANY WARRANTY; without even the implied   #
# warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      #
# PURPOSE. See the GNU Lesser General Public License for more  #
# details.                                                     #
#                                                              #
# You should have received a copy of the GNU Lesser General    #
# Public License along with this source; if not, download it   #
# from http://www.gnu.org/licenses/lgpl.html                   #
#                                                              #
################################################################

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
# c0: 132 MHz   240°
# c1: 132 MHz   0°
# c2: 132 MHz   180°
# c3: 132 MHz   105°
# c4: 66 MHz    270°
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

create_generated_clock -divide_by 2 -source MAIN_CLK i_video|i_video_mod_mux_clutctr|CLK17M_q
create_generated_clock -divide_by 2 -source i_atari_clk_pll|altpll_component|auto_generated|pll1|clk[0] i_video|i_video_mod_mux_clutctr|CLK13M_q

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

set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {MAIN_CLK}]  0.5  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {MAIN_CLK}]  0.5  
derive_clock_uncertainty


#**************************************************************
# Set Input Delay
#**************************************************************

#set_input_delay -add_delay -clock [get_clocks {MAIN_CLK}] -max 1.500 [all_inputs]
#set_input_delay -add_delay -clock [get_clocks {MAIN_CLK}] -min 0.500 [all_inputs]


#**************************************************************
# Set Output Delay
#**************************************************************

#set_output_delay -add_delay -clock [get_clocks {MAIN_CLK}] -max 2.500 [all_outputs]
#set_output_delay -add_delay -clock [get_clocks {MAIN_CLK}] -min 0.500 [all_outputs]


#**************************************************************
# Set Clock Groups
#**************************************************************
                   
set_clock_groups -asynchronous -group [get_clocks {MAIN_CLK}] \
                                      [get_clocks {i_ddr_clk_pll|altpll_component|auto_generated|pll1|clk[4]}] \
                               -group [get_clocks {i_ddr_clk_pll|altpll_component|auto_generated|pll1|clk[0]}] \
                                      [get_clocks {i_ddr_clk_pll|altpll_component|auto_generated|pll1|clk[1]}] \
                                      [get_clocks {i_ddr_clk_pll|altpll_component|auto_generated|pll1|clk[2]}] \
                                      [get_clocks {i_ddr_clk_pll|altpll_component|auto_generated|pll1|clk[3]}] \
                               -group [get_clocks {i_atari_clk_pll|altpll_component|auto_generated|pll1|clk[0]}] \
                               -group [get_clocks {i_atari_clk_pll|altpll_component|auto_generated|pll1|clk[1]}] \
                               -group [get_clocks {i_atari_clk_pll|altpll_component|auto_generated|pll1|clk[2]}] \
                               -group [get_clocks {i_atari_clk_pll|altpll_component|auto_generated|pll1|clk[3]}] \
                               -group [get_clocks {i_mfp_acia_clk_pll|altpll_component|auto_generated|pll1|clk[0]}] \
                               -group [get_clocks {i_mfp_acia_clk_pll|altpll_component|auto_generated|pll1|clk[1]}] \
                               -group [get_clocks {i_mfp_acia_clk_pll|altpll_component|auto_generated|pll1|clk[2]}] \
                               -group [get_clocks {i_video_clk_pll|altpll_component|auto_generated|pll1|clk[0]}] \
                               -group [get_clocks {video:i_video|video_mod_mux_clutctr:i_video_mod_mux_clutctr|CLK17M_q}] \
                               -group [get_clocks {video:i_video|video_mod_mux_clutctr:i_video_mod_mux_clutctr|CLK13M_q}]
                               
                                
#**************************************************************
# Set False Path
#**************************************************************

#**************************************************************
# Set Multicycle Path
#**************************************************************

#set_multicycle_path -start -from video:i_video|video_mod_mux_clutctr:i_video_mod_mux_clutctr|CLK17M_q -to i_atari_clk_pll|altpll_component|auto_generated|pll1|clk[0] 2
#set_multicycle_path -start -from video:i_video|video_mod_mux_clutctr:i_video_mod_mux_clutctr|CLK13M_q -to i_atari_clk_pll|altpll_component|auto_generated|pll1|clk[0] 2

#set_multicycle_path -end -from video:i_video|video_mod_mux_clutctr:i_video_mod_mux_clutctr|CLK13M_q -to MAIN_CLK 2

#set_multicycle_path -start -from MAIN_CLK -to i_video_clk_pll|altpll_component|auto_generated|pll1|clk[0] 2
#set_multicycle_path -start -from MAIN_CLK -to i_mfp_acia_clk_pll|altpll_component|auto_generated|pll1|clk[1] 2
#set_multicycle_path -start -from MAIN_CLK -to i_atari_clk_pll|altpll_component|auto_generated|pll1|clk[0] 2

# set_multicycle_path -start -from [get_clocks {MAIN_CLK}] -to [get_clocks {i_ddr_clk_pll|altpll_component|auto_generated|pll1|clk[4]}] 2

#**************************************************************
# Set Maximum Delay
#**************************************************************

#**************************************************************
# Set Minimum Delay
#**************************************************************

#**************************************************************
# Set Input Transition
#**************************************************************
