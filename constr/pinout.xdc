
######################################################################################
## Clock related ports

## Clk1 :  100MHz oscillator
#set_property PACKAGE_PIN V4 [get_ports {clk100m}]
#set_property IOSTANDARD LVCMOS33 [get_ports clk100m]

## Clk1_en : Enable 100MHz oscillator output (Active high)
#set_property PACKAGE_PIN Y3 [get_ports clk100m_en]
#set_property IOSTANDARD LVCMOS33 [get_ports clk100m_en]

# Clk2 :  50MHz oscillator
set_property PACKAGE_PIN C18 [get_ports clk50m]
set_property IOSTANDARD LVCMOS33 [get_ports clk50m]

# Clk2_en :  Enable 50MHz oscillator output (Active high)
set_property PACKAGE_PIN A18 [get_ports clk50m_en]
set_property IOSTANDARD LVCMOS33 [get_ports clk50m_en]

######################################################################################
## SPI Flash
## These are the pins related to the config flash that are not dedicated pins.

## n_SpiFlash_CS : 
#set_property PACKAGE_PIN T19 [get_ports n_spiflash_cs]
#set_property IOSTANDARD LVCMOS33 [get_ports n_spiflash_cs]

## SpiFlash_d00
#set_property PACKAGE_PIN P22 [get_ports spiflash_d00]
#set_property IOSTANDARD LVCMOS33 [get_ports spiflash_d00]

## SpiFlash_d01
#set_property PACKAGE_PIN R22 [get_ports spiflash_d01]
#set_property IOSTANDARD LVCMOS33 [get_ports spiflash_d01]

## SpiFlash_d02
#set_property PACKAGE_PIN P21 [get_ports spiflash_d02]
#set_property IOSTANDARD LVCMOS33 [get_ports spiflash_d02]

## SpiFlash_d03
#set_property PACKAGE_PIN R21 [get_ports spiflash_d03]
#set_property IOSTANDARD LVCMOS33 [get_ports spiflash_d03]

######################################################################################
## User LED and Switch

# Led1 : Red
set_property PACKAGE_PIN C14 [get_ports user_led1]
set_property IOSTANDARD LVCMOS33 [get_ports user_led1]

# Led2 : Green
set_property PACKAGE_PIN C13 [get_ports user_led2]
set_property IOSTANDARD LVCMOS33 [get_ports user_led2]

# Led3 : Orange
set_property PACKAGE_PIN B13 [get_ports user_led3]
set_property IOSTANDARD LVCMOS33 [get_ports user_led3]

# Led4 : Blue
set_property PACKAGE_PIN A13 [get_ports user_led4]
set_property IOSTANDARD LVCMOS33 [get_ports user_led4]

# Led5 : White
set_property PACKAGE_PIN A14 [get_ports user_led5]
set_property IOSTANDARD LVCMOS33 [get_ports user_led5]

# User_sw :
set_property PACKAGE_PIN A16 [get_ports user_sw]
set_property IOSTANDARD LVCMOS33 [get_ports user_sw]

######################################################################################
## USB Interface
## Connects to the FTDI FT234XD UART Chip

# USB_rxd :  Data from FPGA to UART Chip
set_property PACKAGE_PIN A1 [get_ports usb_rxd]
set_property IOSTANDARD LVCMOS33 [get_ports usb_rxd]

# USB_txd :  Data from UART Chip to the FPGA
set_property PACKAGE_PIN B1 [get_ports usb_txd]
set_property IOSTANDARD LVCMOS33 [get_ports usb_txd]

# n_USB_cts :
set_property PACKAGE_PIN C2 [get_ports n_usb_cts]
set_property IOSTANDARD LVCMOS33 [get_ports n_usb_cts]

# n_USB_rts :
set_property PACKAGE_PIN B2 [get_ports n_usb_rts]
set_property IOSTANDARD LVCMOS33 [get_ports n_usb_rts]

# n_USB_rst : Reset the USB/UART Chip
set_property PACKAGE_PIN D2 [get_ports n_usb_rst]
set_property IOSTANDARD LVCMOS33 [get_ports n_usb_rst]

## USB_cbus0 :
#set_property PACKAGE_PIN D1 [get_ports usb_cbus0]
#set_property IOSTANDARD LVCMOS33 [get_ports usb_cbus0]



######################################################################################
## SD Card 

## SD_clk :
#set_property PACKAGE_PIN A19 [get_ports sd_clk]
#set_property IOSTANDARD LVCMOS33 [get_ports sd_clk]

## SD_Cmd :
#set_property PACKAGE_PIN C22 [get_ports sd_cmd]
#set_property IOSTANDARD LVCMOS33 [get_ports sd_cmd]

## SD_dat0 :
#set_property PACKAGE_PIN B22 [get_ports sd_dat0]
#set_property IOSTANDARD LVCMOS33 [get_ports sd_dat0]

## SD_dat1 :
#set_property PACKAGE_PIN A21 [get_ports sd_dat1]
#set_property IOSTANDARD LVCMOS33 [get_ports sd_dat1]

## SD_dat2 :
#set_property PACKAGE_PIN E22 [get_ports sd_dat2]
#set_property IOSTANDARD LVCMOS33 [get_ports sd_dat2]

## SD_dat3 :
#set_property PACKAGE_PIN D22 [get_ports sd_dat3]
#set_property IOSTANDARD LVCMOS33 [get_ports sd_dat3]

## n_SD_detect :
#set_property PACKAGE_PIN A20 [get_ports n_sd_detect]
#set_property IOSTANDARD LVCMOS33 [get_ports n_sd_detect]

######################################################################################
## 9DOF sensor

## LSM_scl :
#set_property PACKAGE_PIN AB5 [get_ports lsm_scl]
#set_property IOSTANDARD LVCMOS33 [get_ports lsm_scl]

## LSM_sda :
#set_property PACKAGE_PIN AA5 [get_ports lsm_sda]
#set_property IOSTANDARD LVCMOS33 [get_ports lsm_sda]

## LSM_sdo_g :
#set_property PACKAGE_PIN AB7 [get_ports lsm_sdo_g]
#set_property IOSTANDARD LVCMOS33 [get_ports lsm_sdo_g]

## n_LSM_cs_g :
#set_property PACKAGE_PIN AB6 [get_ports n_lsm_cs_g]
#set_property IOSTANDARD LVCMOS33 [get_ports n_lsm_cs_g]

## LSM_den_g :
#set_property PACKAGE_PIN Y9 [get_ports lsm_den_g]
#set_property IOSTANDARD LVCMOS33 [get_ports lsm_den_g]

## LSM_drdy_g
#set_property PACKAGE_PIN Y8 [get_ports lsm_drdy_g]
#set_property IOSTANDARD LVCMOS33 [get_ports lsm_drdy_g]

## LSM_int_g :
#set_property PACKAGE_PIN Y7 [get_ports lsm_int_g]
#set_property IOSTANDARD LVCMOS33 [get_ports lsm_int_g]

## LSM_sdo_xm :
#set_property PACKAGE_PIN Y6 [get_ports lsm_sdo_xm]
#set_property IOSTANDARD LVCMOS33 [get_ports lsm_sdo_xm]

## n_LSM_cs_xm :
#set_property PACKAGE_PIN AA6 [get_ports n_lsm_cs_xm]
#set_property IOSTANDARD LVCMOS33 [get_ports n_lsm_cs_xm]

## LSM_int1_xm :
#set_property PACKAGE_PIN AA8 [get_ports lsm_int1_xm]
#set_property IOSTANDARD LVCMOS33 [get_ports lsm_int1_xm]

## LSM_int2_xm :
#set_property PACKAGE_PIN AB8 [get_ports lsm_int2_xm]
#set_property IOSTANDARD LVCMOS33 [get_ports lsm_int2_xm]

######################################################################################
## Barometer IO pins

## BAR_clk :
#set_property PACKAGE_PIN Y1 [get_ports bar_clk]
#set_property IOSTANDARD LVCMOS33 [get_ports bar_clk]

## BAR_ps :
#set_property PACKAGE_PIN T1 [get_ports bar_ps]
#set_property IOSTANDARD LVCMOS33 [get_ports bar_ps]

## BAR_sdi :
#set_property PACKAGE_PIN U1 [get_ports bar_sdi]
#set_property IOSTANDARD LVCMOS33 [get_ports bar_sdi]

## BAR_sdo :
#set_property PACKAGE_PIN W1 [get_ports bar_sdo]
#set_property IOSTANDARD LVCMOS33 [get_ports bar_sdo]

## n_BAR_cs :
#set_property PACKAGE_PIN AA1 [get_ports n_bar_cs]
#set_property IOSTANDARD LVCMOS33 [get_ports n_bar_cs]

######################################################################################
## GPIO Port P05

## P05_0
#set_property PACKAGE_PIN Y22 [get_ports p05_0]
#set_property IOSTANDARD LVCMOS33 [get_ports p05_0]
## P05_1
#set_property PACKAGE_PIN Y21 [get_ports p05_1]
#set_property IOSTANDARD LVCMOS33 [get_ports p05_1]
## P05_2
#set_property PACKAGE_PIN W20 [get_ports p05_2]
#set_property IOSTANDARD LVCMOS33 [get_ports p05_2]
## P05_3
#set_property PACKAGE_PIN W21 [get_ports p05_3]
#set_property IOSTANDARD LVCMOS33 [get_ports p05_3]
## P05_4
#set_property PACKAGE_PIN W22 [get_ports p05_4]
#set_property IOSTANDARD LVCMOS33 [get_ports p05_4]
## P05_5
#set_property PACKAGE_PIN V20 [get_ports p05_5]
#set_property IOSTANDARD LVCMOS33 [get_ports p05_5]
## P05_6
#set_property PACKAGE_PIN V22 [get_ports p05_6]
#set_property IOSTANDARD LVCMOS33 [get_ports p05_6]
## P05_7
#set_property PACKAGE_PIN U20 [get_ports p05_7]
#set_property IOSTANDARD LVCMOS33 [get_ports p05_7]
## P05_8
#set_property PACKAGE_PIN U21 [get_ports p05_8]
#set_property IOSTANDARD LVCMOS33 [get_ports p05_8]
## P05_9
#set_property PACKAGE_PIN U22 [get_ports p05_9]
#set_property IOSTANDARD LVCMOS33 [get_ports p05_9]
## P05_10
#set_property PACKAGE_PIN T20 [get_ports p05_10]
#set_property IOSTANDARD LVCMOS33 [get_ports p05_10]
## P05_11
#set_property PACKAGE_PIN T21 [get_ports p05_11]
#set_property IOSTANDARD LVCMOS33 [get_ports p05_11]
## P05_12
#set_property PACKAGE_PIN P20 [get_ports p05_12]

#set_property IOSTANDARD LVCMOS33 [get_ports p05_12]
## P05_13
#set_property PACKAGE_PIN N20 [get_ports p05_13]
#set_property IOSTANDARD LVCMOS33 [get_ports p05_13]
## P05_14
#set_property PACKAGE_PIN N22 [get_ports p05_14]
#set_property IOSTANDARD LVCMOS33 [get_ports p05_14]
## P05_15
#set_property PACKAGE_PIN M20 [get_ports p05_15]
#set_property IOSTANDARD LVCMOS33 [get_ports p05_15]
## P05_16
#set_property PACKAGE_PIN M21 [get_ports p05_16]
#set_property IOSTANDARD LVCMOS33 [get_ports p05_16]
## P05_17
#set_property PACKAGE_PIN M22 [get_ports p05_17]
#set_property IOSTANDARD LVCMOS33 [get_ports p05_17]
## P05_18
#set_property PACKAGE_PIN L19 [get_ports p05_18]
#set_property IOSTANDARD LVCMOS33 [get_ports p05_18]
## P05_19
#set_property PACKAGE_PIN L20 [get_ports p05_19]
#set_property IOSTANDARD LVCMOS33 [get_ports p05_19]
## P05_20
#set_property PACKAGE_PIN L21 [get_ports p05_20]
#set_property IOSTANDARD LVCMOS33 [get_ports p05_20]
## P05_21
#set_property PACKAGE_PIN K19 [get_ports p05_21]
#set_property IOSTANDARD LVCMOS33 [get_ports p05_21]
## P05_22
#set_property PACKAGE_PIN K21 [get_ports p05_22]
#set_property IOSTANDARD LVCMOS33 [get_ports p05_22]
## P05_23
#set_property PACKAGE_PIN K22 [get_ports p05_23]
#set_property IOSTANDARD LVCMOS33 [get_ports p05_23]
## P05_24
#set_property PACKAGE_PIN J19 [get_ports p05_24]
#set_property IOSTANDARD LVCMOS33 [get_ports p05_24]
## P05_25
#set_property PACKAGE_PIN J20 [get_ports p05_25]
#set_property IOSTANDARD LVCMOS33 [get_ports p05_25]
## P05_26
#set_property PACKAGE_PIN J21 [get_ports p05_26]
#set_property IOSTANDARD LVCMOS33 [get_ports p05_26]
## P05_27
#set_property PACKAGE_PIN J22 [get_ports p05_27]
#set_property IOSTANDARD LVCMOS33 [get_ports p05_27]
## P05_28
#set_property PACKAGE_PIN H19 [get_ports p05_28]
#set_property IOSTANDARD LVCMOS33 [get_ports p05_28]
## P05_29
#set_property PACKAGE_PIN H20 [get_ports p05_29]
#set_property IOSTANDARD LVCMOS33 [get_ports p05_29]
## P05_30
#set_property PACKAGE_PIN H22 [get_ports p05_30]
#set_property IOSTANDARD LVCMOS33 [get_ports p05_30]
## P05_31
#set_property PACKAGE_PIN G20 [get_ports p05_31]
#set_property IOSTANDARD LVCMOS33 [get_ports p05_31]

######################################################################################
## GPIO Port P14

## P14_0
#set_property PACKAGE_PIN R1 [get_ports P14_0]
#set_property IOSTANDARD LVCMOS33 [get_ports P14_0]
## P14_1
#set_property PACKAGE_PIN P1 [get_ports P14_1]
#set_property IOSTANDARD LVCMOS33 [get_ports P14_1]
## P14_2
#set_property PACKAGE_PIN P2 [get_ports P14_2]
#set_property IOSTANDARD LVCMOS33 [get_ports P14_2]
## P14_3
#set_property PACKAGE_PIN P4 [get_ports P14_3]
#set_property IOSTANDARD LVCMOS33 [get_ports P14_3]
## P14_4
#set_property PACKAGE_PIN N2 [get_ports P14_4]
#set_property IOSTANDARD LVCMOS33 [get_ports P14_4]
## P14_5
#set_property PACKAGE_PIN N3 [get_ports P14_5]
#set_property IOSTANDARD LVCMOS33 [get_ports P14_5]
## P14_6
#set_property PACKAGE_PIN N4 [get_ports P14_6]
#set_property IOSTANDARD LVCMOS33 [get_ports P14_6]
## P14_7
#set_property PACKAGE_PIN M3 [get_ports P14_7]
#set_property IOSTANDARD LVCMOS33 [get_ports P14_7]

######################################################################################
## GPIO Port P16

## P16_0
#set_property PACKAGE_PIN J2 [get_ports P16_0]
#set_property IOSTANDARD LVCMOS33 [get_ports P16_0]
## P16_1
#set_property PACKAGE_PIN G2 [get_ports P16_1]
#set_property IOSTANDARD LVCMOS33 [get_ports P16_1]
## P16_2
#set_property PACKAGE_PIN H2 [get_ports P16_2]
#set_property IOSTANDARD LVCMOS33 [get_ports P16_2]
## P16_3
#set_property PACKAGE_PIN E2 [get_ports P16_3]
#set_property IOSTANDARD LVCMOS33 [get_ports P16_3]

######################################################################################
## GPIO Port P19

## P19_0
#set_property PACKAGE_PIN E1 [get_ports P19_0]
#set_property IOSTANDARD LVCMOS33 [get_ports P19_0]
## P19_1
#set_property PACKAGE_PIN F1 [get_ports P19_1]
#set_property IOSTANDARD LVCMOS33 [get_ports P19_1]
## P19_2
#set_property PACKAGE_PIN G1 [get_ports P19_2]
#set_property IOSTANDARD LVCMOS33 [get_ports P19_2]
## P19_3
#set_property PACKAGE_PIN J1 [get_ports P19_3]
#set_property IOSTANDARD LVCMOS33 [get_ports P19_3]

######################################################################################
## GPIO Port P17

## P17_0
#set_property PACKAGE_PIN K1 [get_ports P17_0]
#set_property IOSTANDARD LVCMOS33 [get_ports P17_0]
## P17_1
#set_property PACKAGE_PIN K2 [get_ports P17_1]
#set_property IOSTANDARD LVCMOS33 [get_ports P17_1]
## P17_2
#set_property PACKAGE_PIN K3 [get_ports P17_2]
#set_property IOSTANDARD LVCMOS33 [get_ports P17_2]
## P17_3
#set_property PACKAGE_PIN L1 [get_ports P17_3]
#set_property IOSTANDARD LVCMOS33 [get_ports P17_3]
## P17_4
#set_property PACKAGE_PIN L3 [get_ports P17_4]
#set_property IOSTANDARD LVCMOS33 [get_ports P17_4]
## P17_5
#set_property PACKAGE_PIN L4 [get_ports P17_5]
#set_property IOSTANDARD LVCMOS33 [get_ports P17_5]
## P17_6
#set_property PACKAGE_PIN M1 [get_ports P17_6]
#set_property IOSTANDARD LVCMOS33 [get_ports P17_6]
## P17_7
#set_property PACKAGE_PIN M2 [get_ports P17_7]
#set_property IOSTANDARD LVCMOS33 [get_ports P17_7]

######################################################################################
## GPIO Port P06

## P06_0
#set_property PACKAGE_PIN AB22 [get_ports P06_0]
#set_property IOSTANDARD LVCMOS33 [get_ports P06_0]
## P06_1
#set_property PACKAGE_PIN AB21 [get_ports P06_1]
#set_property IOSTANDARD LVCMOS33 [get_ports P06_1]

######################################################################################
## GPIO Port P07

## P07_0
#set_property PACKAGE_PIN AB20 [get_ports P07_0]
#set_property IOSTANDARD LVCMOS33 [get_ports P07_0]
## P07_1
#set_property PACKAGE_PIN AA19 [get_ports P07_1]
#set_property IOSTANDARD LVCMOS33 [get_ports P07_1]

######################################################################################
## GPIO Port P08

## P08_0
#set_property PACKAGE_PIN AA20 [get_ports P08_0]
#set_property IOSTANDARD LVCMOS33 [get_ports P08_0]
## P08_1
#set_property PACKAGE_PIN AA21 [get_ports P08_1]
#set_property IOSTANDARD LVCMOS33 [get_ports P08_1]

######################################################################################
## GPIO Port P09

## P09_0
#set_property PACKAGE_PIN W19 [get_ports P09_0]
#set_property IOSTANDARD LVCMOS33 [get_ports P09_0]
## P09_1
#set_property PACKAGE_PIN Y19 [get_ports P09_1]
#set_property IOSTANDARD LVCMOS33 [get_ports P09_1]

######################################################################################
## GPIO Port P10

## P10_0
#set_property PACKAGE_PIN V18 [get_ports P10_0]
#set_property IOSTANDARD LVCMOS33 [get_ports P10_0]
## P10_1
#set_property PACKAGE_PIN W17 [get_ports P10_1]
#set_property IOSTANDARD LVCMOS33 [get_ports P10_1]

######################################################################################
## GPIO Port P11

## P11_0
#set_property PACKAGE_PIN AB18 [get_ports P11_0]
#set_property IOSTANDARD LVCMOS33 [get_ports P11_0]
## P11_1
#set_property PACKAGE_PIN AA18 [get_ports P11_1]
#set_property IOSTANDARD LVCMOS33 [get_ports P11_1]

######################################################################################
## GPIO Port P12

## P12_0
#set_property PACKAGE_PIN U17 [get_ports P12_0]
#set_property IOSTANDARD LVCMOS33 [get_ports P12_0]
## P12_1
#set_property PACKAGE_PIN V17 [get_ports P12_1]
#set_property IOSTANDARD LVCMOS33 [get_ports P12_1]

######################################################################################
## GPIO Port P13

## P13_0
#set_property PACKAGE_PIN V19 [get_ports P13_0]
#set_property IOSTANDARD LVCMOS33 [get_ports P13_0]
## P13_1
#set_property PACKAGE_PIN Y18 [get_ports P13_1]
#set_property IOSTANDARD LVCMOS33 [get_ports P13_1]
