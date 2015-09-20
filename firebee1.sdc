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

## DATE    "Sun Sep 20 08:38:08 2015"

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

create_clock -name {CLK33M} -period 30.303 -waveform { 0.000 15.151 } [get_ports {CLK33M}]
create_clock -name {MAIN_CLK} -period 30.303 -waveform { 0.000 15.151 } [get_ports {MAIN_CLK}]
create_clock -name {E0_INT} -period 1.000 -waveform { 0.000 0.500 } [get_ports {E0_INT}]
create_clock -name {nPCI_INTB} -period 1.000 -waveform { 0.000 0.500 } [get_ports {nPCI_INTB}]
create_clock -name {nPCI_INTA} -period 1.000 -waveform { 0.000 0.500 } [get_ports {nPCI_INTA}]
create_clock -name {DVI_INT} -period 1.000 -waveform { 0.000 0.500 } [get_ports {DVI_INT}]
create_clock -name {nPCI_INTC} -period 1.000 -waveform { 0.000 0.500 } [get_ports {nPCI_INTC}]
create_clock -name {nPCI_INTD} -period 1.000 -waveform { 0.000 0.500 } [get_ports {nPCI_INTD}]
create_clock -name {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC} -period 1.000 -waveform { 0.000 0.500 } [get_registers {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}]
create_clock -name {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC} -period 1.000 -waveform { 0.000 0.500 } [get_registers {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}]
create_clock -name {PIC_INT} -period 1.000 -waveform { 0.000 0.500 } [get_ports {PIC_INT}]


#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {inst|altpll_component|auto_generated|pll1|clk[0]} -source [get_pins {inst|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 1 -divide_by 66 -master_clock {CLK33M} [get_pins {inst|altpll_component|auto_generated|pll1|clk[0]}] 
create_generated_clock -name {inst|altpll_component|auto_generated|pll1|clk[1]} -source [get_pins {inst|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 67 -divide_by 900 -master_clock {CLK33M} [get_pins {inst|altpll_component|auto_generated|pll1|clk[1]}] 
create_generated_clock -name {inst|altpll_component|auto_generated|pll1|clk[2]} -source [get_pins {inst|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 67 -divide_by 90 -master_clock {CLK33M} [get_pins {inst|altpll_component|auto_generated|pll1|clk[2]}] 
create_generated_clock -name {inst13|altpll_component|auto_generated|pll1|clk[0]} -source [get_pins {inst13|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 109 -divide_by 1800 -master_clock {CLK33M} [get_pins {inst13|altpll_component|auto_generated|pll1|clk[0]}] 
create_generated_clock -name {inst13|altpll_component|auto_generated|pll1|clk[1]} -source [get_pins {inst13|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 109 -divide_by 225 -master_clock {CLK33M} [get_pins {inst13|altpll_component|auto_generated|pll1|clk[1]}] 
create_generated_clock -name {inst13|altpll_component|auto_generated|pll1|clk[2]} -source [get_pins {inst13|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 109 -divide_by 144 -master_clock {CLK33M} [get_pins {inst13|altpll_component|auto_generated|pll1|clk[2]}] 
create_generated_clock -name {inst13|altpll_component|auto_generated|pll1|clk[3]} -source [get_pins {inst13|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 109 -divide_by 75 -master_clock {CLK33M} [get_pins {inst13|altpll_component|auto_generated|pll1|clk[3]}] 
create_generated_clock -name {inst12|altpll_component|auto_generated|pll1|clk[0]} -source [get_pins {inst12|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 4 -phase 240.000 -master_clock {MAIN_CLK} [get_pins {inst12|altpll_component|auto_generated|pll1|clk[0]}] 
create_generated_clock -name {inst12|altpll_component|auto_generated|pll1|clk[1]} -source [get_pins {inst12|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 4 -master_clock {MAIN_CLK} [get_pins {inst12|altpll_component|auto_generated|pll1|clk[1]}] 
create_generated_clock -name {inst12|altpll_component|auto_generated|pll1|clk[2]} -source [get_pins {inst12|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 4 -phase 180.000 -master_clock {MAIN_CLK} [get_pins {inst12|altpll_component|auto_generated|pll1|clk[2]}] 
create_generated_clock -name {inst12|altpll_component|auto_generated|pll1|clk[3]} -source [get_pins {inst12|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 4 -phase 105.000 -master_clock {MAIN_CLK} [get_pins {inst12|altpll_component|auto_generated|pll1|clk[3]}] 
create_generated_clock -name {inst12|altpll_component|auto_generated|pll1|clk[4]} -source [get_pins {inst12|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 2 -phase 270.000 -master_clock {MAIN_CLK} [get_pins {inst12|altpll_component|auto_generated|pll1|clk[4]}] 
create_generated_clock -name {inst22|altpll_component|auto_generated|pll1|clk[0]} -source [get_pins {inst22|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 2 -master_clock {inst13|altpll_component|auto_generated|pll1|clk[3]} [get_pins {inst22|altpll_component|auto_generated|pll1|clk[0]}] 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {MAIN_CLK}] -setup 0.110  
set_clock_uncertainty -rise_from [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {MAIN_CLK}] -hold 0.080  
set_clock_uncertainty -rise_from [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {MAIN_CLK}] -setup 0.110  
set_clock_uncertainty -rise_from [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {MAIN_CLK}] -hold 0.080  
set_clock_uncertainty -fall_from [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {MAIN_CLK}] -setup 0.110  
set_clock_uncertainty -fall_from [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {MAIN_CLK}] -hold 0.080  
set_clock_uncertainty -fall_from [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {MAIN_CLK}] -setup 0.110  
set_clock_uncertainty -fall_from [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {MAIN_CLK}] -hold 0.080  
set_clock_uncertainty -rise_from [get_clocks {PIC_INT}] -rise_to [get_clocks {MAIN_CLK}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {PIC_INT}] -fall_to [get_clocks {MAIN_CLK}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {PIC_INT}] -rise_to [get_clocks {MAIN_CLK}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {PIC_INT}] -fall_to [get_clocks {MAIN_CLK}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}] -rise_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.080  
set_clock_uncertainty -rise_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}] -rise_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.130  
set_clock_uncertainty -rise_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}] -fall_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.080  
set_clock_uncertainty -rise_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}] -fall_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.130  
set_clock_uncertainty -rise_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}] -rise_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}] -rise_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.090  
set_clock_uncertainty -rise_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}] -fall_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}] -fall_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.090  
set_clock_uncertainty -rise_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}] -rise_to [get_clocks {CLK33M}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}] -fall_to [get_clocks {CLK33M}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}] -rise_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.080  
set_clock_uncertainty -fall_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}] -rise_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.130  
set_clock_uncertainty -fall_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}] -fall_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.080  
set_clock_uncertainty -fall_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}] -fall_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.130  
set_clock_uncertainty -fall_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}] -rise_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}] -rise_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.090  
set_clock_uncertainty -fall_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}] -fall_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}] -fall_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.090  
set_clock_uncertainty -fall_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}] -rise_to [get_clocks {CLK33M}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}] -fall_to [get_clocks {CLK33M}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}] -rise_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.080  
set_clock_uncertainty -rise_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}] -rise_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.130  
set_clock_uncertainty -rise_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}] -fall_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.080  
set_clock_uncertainty -rise_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}] -fall_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.130  
set_clock_uncertainty -rise_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}] -rise_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}] -rise_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.090  
set_clock_uncertainty -rise_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}] -fall_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}] -fall_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.090  
set_clock_uncertainty -rise_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}] -rise_to [get_clocks {CLK33M}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}] -fall_to [get_clocks {CLK33M}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}] -rise_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.080  
set_clock_uncertainty -fall_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}] -rise_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.130  
set_clock_uncertainty -fall_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}] -fall_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.080  
set_clock_uncertainty -fall_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}] -fall_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.130  
set_clock_uncertainty -fall_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}] -rise_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}] -rise_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.090  
set_clock_uncertainty -fall_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}] -fall_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}] -fall_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.090  
set_clock_uncertainty -fall_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}] -rise_to [get_clocks {CLK33M}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}] -fall_to [get_clocks {CLK33M}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}] -setup 0.130  
set_clock_uncertainty -rise_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}] -hold 0.080  
set_clock_uncertainty -rise_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}] -setup 0.130  
set_clock_uncertainty -rise_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}] -hold 0.080  
set_clock_uncertainty -rise_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}] -setup 0.130  
set_clock_uncertainty -rise_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}] -hold 0.080  
set_clock_uncertainty -rise_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}] -setup 0.130  
set_clock_uncertainty -rise_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}] -hold 0.080  
set_clock_uncertainty -rise_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {MAIN_CLK}] -setup 0.140  
set_clock_uncertainty -rise_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {MAIN_CLK}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {MAIN_CLK}] -setup 0.140  
set_clock_uncertainty -rise_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {MAIN_CLK}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.190  
set_clock_uncertainty -rise_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.180  
set_clock_uncertainty -rise_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.190  
set_clock_uncertainty -rise_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.180  
set_clock_uncertainty -rise_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.080  
set_clock_uncertainty -rise_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.080  
set_clock_uncertainty -rise_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {CLK33M}] -setup 0.130  
set_clock_uncertainty -rise_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {CLK33M}] -hold 0.090  
set_clock_uncertainty -rise_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {CLK33M}] -setup 0.130  
set_clock_uncertainty -rise_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {CLK33M}] -hold 0.090  
set_clock_uncertainty -fall_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}] -setup 0.130  
set_clock_uncertainty -fall_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}] -hold 0.080  
set_clock_uncertainty -fall_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}] -setup 0.130  
set_clock_uncertainty -fall_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}] -hold 0.080  
set_clock_uncertainty -fall_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}] -setup 0.130  
set_clock_uncertainty -fall_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}] -hold 0.080  
set_clock_uncertainty -fall_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}] -setup 0.130  
set_clock_uncertainty -fall_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}] -hold 0.080  
set_clock_uncertainty -fall_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {MAIN_CLK}] -setup 0.140  
set_clock_uncertainty -fall_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {MAIN_CLK}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {MAIN_CLK}] -setup 0.140  
set_clock_uncertainty -fall_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {MAIN_CLK}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.190  
set_clock_uncertainty -fall_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.180  
set_clock_uncertainty -fall_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.190  
set_clock_uncertainty -fall_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.180  
set_clock_uncertainty -fall_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.080  
set_clock_uncertainty -fall_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.080  
set_clock_uncertainty -fall_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {CLK33M}] -setup 0.130  
set_clock_uncertainty -fall_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {CLK33M}] -hold 0.090  
set_clock_uncertainty -fall_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {CLK33M}] -setup 0.130  
set_clock_uncertainty -fall_from [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {CLK33M}] -hold 0.090  
set_clock_uncertainty -rise_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}] -rise_to [get_clocks {MAIN_CLK}] -setup 0.090  
set_clock_uncertainty -rise_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}] -rise_to [get_clocks {MAIN_CLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}] -fall_to [get_clocks {MAIN_CLK}] -setup 0.090  
set_clock_uncertainty -rise_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}] -fall_to [get_clocks {MAIN_CLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}] -rise_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[1]}] -setup 0.150  
set_clock_uncertainty -rise_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}] -rise_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[1]}] -hold 0.160  
set_clock_uncertainty -rise_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}] -fall_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[1]}] -setup 0.150  
set_clock_uncertainty -rise_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}] -fall_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[1]}] -hold 0.160  
set_clock_uncertainty -fall_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}] -rise_to [get_clocks {MAIN_CLK}] -setup 0.090  
set_clock_uncertainty -fall_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}] -rise_to [get_clocks {MAIN_CLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}] -fall_to [get_clocks {MAIN_CLK}] -setup 0.090  
set_clock_uncertainty -fall_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}] -fall_to [get_clocks {MAIN_CLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}] -rise_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[1]}] -setup 0.150  
set_clock_uncertainty -fall_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}] -rise_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[1]}] -hold 0.160  
set_clock_uncertainty -fall_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}] -fall_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[1]}] -setup 0.150  
set_clock_uncertainty -fall_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}] -fall_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[1]}] -hold 0.160  
set_clock_uncertainty -rise_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[3]}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[3]}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[3]}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[3]}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {PIC_INT}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {PIC_INT}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {nPCI_INTD}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {nPCI_INTD}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {nPCI_INTC}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {nPCI_INTC}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {DVI_INT}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {DVI_INT}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {nPCI_INTA}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {nPCI_INTA}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {nPCI_INTB}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {nPCI_INTB}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {E0_INT}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {E0_INT}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.140  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.140  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}] -hold 0.090  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}] -hold 0.090  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.090  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.090  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[1]}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[1]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[1]}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[1]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {CLK33M}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {CLK33M}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {PIC_INT}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {PIC_INT}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {nPCI_INTD}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {nPCI_INTD}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {nPCI_INTC}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {nPCI_INTC}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {DVI_INT}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {DVI_INT}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {nPCI_INTA}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {nPCI_INTA}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {nPCI_INTB}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {nPCI_INTB}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {E0_INT}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {E0_INT}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.140  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.140  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}] -hold 0.090  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}] -hold 0.090  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.090  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.090  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[1]}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[1]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[1]}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[1]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -rise_to [get_clocks {CLK33M}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {MAIN_CLK}] -fall_to [get_clocks {CLK33M}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {MAIN_CLK}] -setup 0.090  
set_clock_uncertainty -rise_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {MAIN_CLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {MAIN_CLK}] -setup 0.090  
set_clock_uncertainty -rise_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {MAIN_CLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[4]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {MAIN_CLK}] -setup 0.090  
set_clock_uncertainty -fall_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {MAIN_CLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {MAIN_CLK}] -setup 0.090  
set_clock_uncertainty -fall_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {MAIN_CLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}] -setup 0.090  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}] -setup 0.090  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}] -setup 0.090  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}] -setup 0.090  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.080  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.080  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {MAIN_CLK}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {MAIN_CLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {MAIN_CLK}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {MAIN_CLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.150  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.150  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {CLK33M}] -setup 0.090  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {CLK33M}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {CLK33M}] -setup 0.090  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {CLK33M}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}] -setup 0.090  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}] -setup 0.090  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}] -setup 0.090  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}] -setup 0.090  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.080  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.080  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {MAIN_CLK}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {MAIN_CLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {MAIN_CLK}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {MAIN_CLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.150  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.150  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {CLK33M}] -setup 0.090  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {CLK33M}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {CLK33M}] -setup 0.090  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {CLK33M}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {MAIN_CLK}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {MAIN_CLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {MAIN_CLK}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {MAIN_CLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {MAIN_CLK}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {MAIN_CLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {MAIN_CLK}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {MAIN_CLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {MAIN_CLK}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {MAIN_CLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {MAIN_CLK}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {MAIN_CLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {MAIN_CLK}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {MAIN_CLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {MAIN_CLK}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {MAIN_CLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {inst|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {MAIN_CLK}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {inst|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {MAIN_CLK}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {inst|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {MAIN_CLK}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {inst|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {MAIN_CLK}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {CLK33M}] -rise_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CLK33M}] -fall_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CLK33M}] -rise_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CLK33M}] -fall_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CLK33M}] -rise_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.090  
set_clock_uncertainty -rise_from [get_clocks {CLK33M}] -rise_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.130  
set_clock_uncertainty -rise_from [get_clocks {CLK33M}] -fall_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.090  
set_clock_uncertainty -rise_from [get_clocks {CLK33M}] -fall_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.130  
set_clock_uncertainty -rise_from [get_clocks {CLK33M}] -rise_to [get_clocks {MAIN_CLK}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {CLK33M}] -fall_to [get_clocks {MAIN_CLK}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {CLK33M}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.090  
set_clock_uncertainty -rise_from [get_clocks {CLK33M}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.110  
set_clock_uncertainty -rise_from [get_clocks {CLK33M}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.090  
set_clock_uncertainty -rise_from [get_clocks {CLK33M}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.110  
set_clock_uncertainty -rise_from [get_clocks {CLK33M}] -rise_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {CLK33M}] -rise_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.090  
set_clock_uncertainty -rise_from [get_clocks {CLK33M}] -fall_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {CLK33M}] -fall_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.090  
set_clock_uncertainty -rise_from [get_clocks {CLK33M}] -rise_to [get_clocks {CLK33M}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CLK33M}] -fall_to [get_clocks {CLK33M}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CLK33M}] -rise_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CLK33M}] -fall_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|HSYNC}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CLK33M}] -rise_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CLK33M}] -fall_to [get_clocks {Video:Fredi_Aschwanden|VIDEO_MOD_MUX_CLUTCTR:VIDEO_MOD_MUX_CLUTCTR|VSYNC}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CLK33M}] -rise_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.090  
set_clock_uncertainty -fall_from [get_clocks {CLK33M}] -rise_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.130  
set_clock_uncertainty -fall_from [get_clocks {CLK33M}] -fall_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.090  
set_clock_uncertainty -fall_from [get_clocks {CLK33M}] -fall_to [get_clocks {inst22|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.130  
set_clock_uncertainty -fall_from [get_clocks {CLK33M}] -rise_to [get_clocks {MAIN_CLK}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {CLK33M}] -fall_to [get_clocks {MAIN_CLK}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {CLK33M}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.090  
set_clock_uncertainty -fall_from [get_clocks {CLK33M}] -rise_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.110  
set_clock_uncertainty -fall_from [get_clocks {CLK33M}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.090  
set_clock_uncertainty -fall_from [get_clocks {CLK33M}] -fall_to [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.110  
set_clock_uncertainty -fall_from [get_clocks {CLK33M}] -rise_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {CLK33M}] -rise_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.090  
set_clock_uncertainty -fall_from [get_clocks {CLK33M}] -fall_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {CLK33M}] -fall_to [get_clocks {inst13|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.090  
set_clock_uncertainty -fall_from [get_clocks {CLK33M}] -rise_to [get_clocks {CLK33M}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CLK33M}] -fall_to [get_clocks {CLK33M}]  0.020  


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

set_false_path  -from  [get_clocks {CLK33M}]  -to  [get_clocks {inst12|altpll_component|auto_generated|pll1|clk[0]}]
set_false_path -from [get_keepers {*rdptr_g*}] -to [get_keepers {*ws_dgrp|dffpipe_id9:dffpipe17|dffe18a*}]
set_false_path -from [get_keepers {*delayed_wrptr_g*}] -to [get_keepers {*rs_dgwp|dffpipe_hd9:dffpipe12|dffe13a*}]
set_false_path -from [get_keepers {*rdptr_g*}] -to [get_keepers {*ws_dgrp|dffpipe_kd9:dffpipe15|dffe16a*}]
set_false_path -from [get_keepers {*delayed_wrptr_g*}] -to [get_keepers {*rs_dgwp|dffpipe_jd9:dffpipe12|dffe13a*}]
set_false_path -from [get_keepers {*rdptr_g*}] -to [get_keepers {*ws_dgrp|dffpipe_re9:dffpipe19|dffe20a*}]


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

