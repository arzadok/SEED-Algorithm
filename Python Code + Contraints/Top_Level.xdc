# Clock CONNECTED TO INTERNAL CLOCK

##clk
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name clk -waveform {0.000 5.000} [get_ports clk]


#### RESET CONNECTED TO BUTTON CENTER ####

##rst
set_property PACKAGE_PIN U18 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]


###############
# INPUT DELAY #
###############

set_input_delay -clock clk -add_delay 0.000 [get_ports part_msg*]
set_input_delay -clock clk -add_delay 0.000 [get_ports reset]
set_input_delay -clock clk -add_delay 0.000 [get_ports in_en]
set_input_delay -clock clk -add_delay 0.000 [get_ports start]
set_input_delay -clock clk -add_delay 0.000 [get_ports load]
set_input_delay -clock clk -add_delay 0.000 [get_ports Enc_Dec]



################
# OUTPUT DELAY #
################

set_output_delay -clock clk -add_delay 0.000 [get_ports part_SEED*]
set_output_delay -clock clk -add_delay 0.000 [get_ports load_rpi3]
set_output_delay -clock clk -add_delay 0.000 [get_ports done]
set_output_delay -clock clk -add_delay 0.000 [get_ports reset_out]





#### PMODs CONNENCTED TO PMOD C ####

## INPUT

##JC1
set_property PACKAGE_PIN K17 [get_ports {part_msg[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {part_msg[0]}]
set_property PACKAGE_PIN M18 [get_ports {part_msg[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {part_msg[1]}]
set_property PACKAGE_PIN N17 [get_ports {part_msg[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {part_msg[2]}]
set_property PACKAGE_PIN P18 [get_ports {part_msg[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {part_msg[3]}]
set_property PACKAGE_PIN L17 [get_ports {part_msg[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {part_msg[4]}]
set_property PACKAGE_PIN M19 [get_ports {part_msg[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {part_msg[5]}]
set_property PACKAGE_PIN P17 [get_ports {part_msg[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {part_msg[6]}]
##JC1
set_property PACKAGE_PIN R18 [get_ports {part_msg[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {part_msg[7]}]




#### PMODs CONNENCTED TO PMOD B ####

##INPUT

##JB1
set_property PACKAGE_PIN A14 [get_ports in_en]
set_property IOSTANDARD LVCMOS33 [get_ports in_en]

##JB2
set_property PACKAGE_PIN A16 [get_ports start]
set_property IOSTANDARD LVCMOS33 [get_ports start]

##JB3
set_property PACKAGE_PIN B15 [get_ports load]
set_property IOSTANDARD LVCMOS33 [get_ports load]

##JB4
set_property PACKAGE_PIN B16 [get_ports Enc_Dec]
set_property IOSTANDARD LVCMOS33 [get_ports Enc_Dec]

##OUTPUT

##JB7
set_property PACKAGE_PIN A15 [get_ports load_rpi3]
set_property IOSTANDARD LVCMOS33 [get_ports load_rpi3]

##JB8
set_property PACKAGE_PIN A17 [get_ports done]
set_property IOSTANDARD LVCMOS33 [get_ports done]

##JB9
set_property PACKAGE_PIN C15 [get_ports reset_out]
set_property IOSTANDARD LVCMOS33 [get_ports reset_out]

#### PMODs CONNENCTED TO PMOD A ####

##OUTPUT
##JA
set_property PACKAGE_PIN J1 [get_ports {part_SEED[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {part_SEED[0]}]
set_property PACKAGE_PIN L2 [get_ports {part_SEED[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {part_SEED[1]}]
set_property PACKAGE_PIN J2 [get_ports {part_SEED[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {part_SEED[2]}]
set_property PACKAGE_PIN G2 [get_ports {part_SEED[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {part_SEED[3]}]
set_property PACKAGE_PIN H1 [get_ports {part_SEED[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {part_SEED[4]}]
set_property PACKAGE_PIN K2 [get_ports {part_SEED[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {part_SEED[5]}]
set_property PACKAGE_PIN H2 [get_ports {part_SEED[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {part_SEED[6]}]
##JA10
set_property PACKAGE_PIN G3 [get_ports {part_SEED[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {part_SEED[7]}]

