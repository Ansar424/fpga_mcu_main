set_property SRC_FILE_INFO {cfile:/home/kjell/fpga_dev/fpga_mcu_main/proj/mcu_main/mcu_main.srcs/sources_1/bd/mcu/ip/mcu_clk_wiz_1_0/mcu_clk_wiz_1_0.xdc rfile:../../../mcu_main.srcs/sources_1/bd/mcu/ip/mcu_clk_wiz_1_0/mcu_clk_wiz_1_0.xdc id:1 order:EARLY scoped_inst:mcu_i/clk_wiz_1/U0} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:56 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.2
