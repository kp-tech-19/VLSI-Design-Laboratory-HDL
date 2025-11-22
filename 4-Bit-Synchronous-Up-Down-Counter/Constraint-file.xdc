## Clock Signal 
set_property -dict { PACKAGE_PIN E3 IOSTANDARD LVCMOS33 } [get_ports { CLK100MHZ }];
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {CLK100MHZ}];

## Switch
set_property -dict { PACKAGE_PIN J15 IOSTANDARD LVCMOS33 } [get_ports { ud }]; 

## LEDs
set_property -dict { PACKAGE_PIN H17 IOSTANDARD LVCMOS33 } [get_ports { counter[0] }];
set_property -dict { PACKAGE_PIN K15 IOSTANDARD LVCMOS33 } [get_ports { counter[1] }];
set_property -dict { PACKAGE_PIN J13 IOSTANDARD LVCMOS33 } [get_ports { counter[2] }];
set_property -dict { PACKAGE_PIN N14 IOSTANDARD LVCMOS33 } [get_ports { counter[3] }];

## Buttons
set_property -dict { PACKAGE_PIN N17 IOSTANDARD LVCMOS33 } [get_ports { clk }]; 
set_property -dict { PACKAGE_PIN M18 IOSTANDARD LVCMOS33 } [get_ports { rst }]; 
set_property clock_DEDICATED_ROUTE FALSE [get_nets clk_IBUF];
