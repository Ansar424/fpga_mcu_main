
# Remove some IO buffers from SPI signals
#set_property IOB false [get_cells mcu_i/axi_quad_spi_0/U0/IO1_I_REG]
#set_property IOB false [get_cells mcu_i/axi_quad_spi_0/U0/QSPI_ENHANCED_MD_GEN.QSPI_CORE_INTERFACE_I/LOGIC_FOR_MD_0_GEN.SPI_MODULE_I/RATIO_NOT_EQUAL_4_GENERATE.SCK_O_NQ_4_NO_STARTUP_USED.SCK_O_NE_4_FDRE_INST ]
