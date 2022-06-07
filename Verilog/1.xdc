
set_property IOSTANDARD LVDS [get_ports clk_in1]
set_property PACKAGE_PIN AD12 [get_ports clk_in1]
set_property IOSTANDARD LVDS [get_ports clk_in2]
set_property PACKAGE_PIN AD11 [get_ports clk_in2]
set_property PACKAGE_PIN T21 [get_ports oTXDATA]
set_property IOSTANDARD LVCMOS33 [get_ports oTXDATA]
set_property -dict { PACKAGE_PIN R19   IOSTANDARD LVCMOS33 } [get_ports { ap_rst }];

#set_property IOSTANDARD LVCMOS33 [get_ports {oDATA[7]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {oDATA[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {oDATA[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {oDATA[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {oDATA[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {oDATA[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {oDATA[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {oDATA[0]}]

#set_property PACKAGE_PIN T28 [get_ports {oDATA[7]}]
#set_property PACKAGE_PIN V19 [get_ports {oDATA[6]}]
#set_property PACKAGE_PIN U30 [get_ports {oDATA[5]}]
#set_property PACKAGE_PIN U29 [get_ports {oDATA[4]}]
#set_property PACKAGE_PIN V20 [get_ports {oDATA[3]}]
#set_property PACKAGE_PIN V26 [get_ports {oDATA[2]}]
#set_property PACKAGE_PIN W24 [get_ports {oDATA[1]}]
#set_property PACKAGE_PIN W23 [get_ports {oDATA[0]}]

set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
