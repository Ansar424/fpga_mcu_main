open_bd_design {../proj/mcu_main/mcu_main.srcs/sources_1/bd/mcu/mcu.bd}
write_bd_tcl ../src/bd/mcu.tcl -force
close_bd_design [get_bd_designs mcu]
