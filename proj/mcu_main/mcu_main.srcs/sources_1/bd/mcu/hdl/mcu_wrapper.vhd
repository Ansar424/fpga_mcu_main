--Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2014.4 (lin64) Build 1071353 Tue Nov 18 16:47:07 MST 2014
--Date        : Tue Feb 24 21:27:51 2015
--Host        : ubuntu running 64-bit Ubuntu 14.04.1 LTS
--Command     : generate_target mcu_wrapper.bd
--Design      : mcu_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mcu_wrapper is
  port (
    clk_in_50m : in STD_LOGIC;
    gpio_leds_tri_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    iic_gpo : out STD_LOGIC_VECTOR ( 7 downto 0 );
    iic_rtl_scl_io : inout STD_LOGIC;
    iic_rtl_sda_io : inout STD_LOGIC;
    nReset : in STD_LOGIC;
    pulse_led : out STD_LOGIC;
    uart_rtl_rxd : in STD_LOGIC;
    uart_rtl_txd : out STD_LOGIC
  );
end mcu_wrapper;

architecture STRUCTURE of mcu_wrapper is
  component mcu is
  port (
    gpio_leds_tri_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    iic_rtl_scl_i : in STD_LOGIC;
    iic_rtl_scl_o : out STD_LOGIC;
    iic_rtl_scl_t : out STD_LOGIC;
    iic_rtl_sda_i : in STD_LOGIC;
    iic_rtl_sda_o : out STD_LOGIC;
    iic_rtl_sda_t : out STD_LOGIC;
    uart_rtl_rxd : in STD_LOGIC;
    uart_rtl_txd : out STD_LOGIC;
    clk_in_50m : in STD_LOGIC;
    nReset : in STD_LOGIC;
    pulse_led : out STD_LOGIC;
    iic_gpo : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component mcu;
  component IOBUF is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component IOBUF;
  signal iic_rtl_scl_i : STD_LOGIC;
  signal iic_rtl_scl_o : STD_LOGIC;
  signal iic_rtl_scl_t : STD_LOGIC;
  signal iic_rtl_sda_i : STD_LOGIC;
  signal iic_rtl_sda_o : STD_LOGIC;
  signal iic_rtl_sda_t : STD_LOGIC;
begin
iic_rtl_scl_iobuf: component IOBUF
    port map (
      I => iic_rtl_scl_o,
      IO => iic_rtl_scl_io,
      O => iic_rtl_scl_i,
      T => iic_rtl_scl_t
    );
iic_rtl_sda_iobuf: component IOBUF
    port map (
      I => iic_rtl_sda_o,
      IO => iic_rtl_sda_io,
      O => iic_rtl_sda_i,
      T => iic_rtl_sda_t
    );
mcu_i: component mcu
    port map (
      clk_in_50m => clk_in_50m,
      gpio_leds_tri_o(3 downto 0) => gpio_leds_tri_o(3 downto 0),
      iic_gpo(7 downto 0) => iic_gpo(7 downto 0),
      iic_rtl_scl_i => iic_rtl_scl_i,
      iic_rtl_scl_o => iic_rtl_scl_o,
      iic_rtl_scl_t => iic_rtl_scl_t,
      iic_rtl_sda_i => iic_rtl_sda_i,
      iic_rtl_sda_o => iic_rtl_sda_o,
      iic_rtl_sda_t => iic_rtl_sda_t,
      nReset => nReset,
      pulse_led => pulse_led,
      uart_rtl_rxd => uart_rtl_rxd,
      uart_rtl_txd => uart_rtl_txd
    );
end STRUCTURE;
