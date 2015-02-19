----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2015 11:19:47 PM
-- Design Name: 
-- Module Name: top_level - rtl
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_level is
    Port ( 
        clk50m : in std_logic;
        clk50m_en : out std_logic;
        nReset : in std_logic;
        
        user_led1 : out std_logic;
        user_led2 : out std_logic;
        user_led3 : out std_logic;
        user_led4 : out std_logic;
        user_led5 : out std_logic;
        user_sw : in std_logic;
        
        usb_rxd : out std_logic;
        usb_txd : in std_logic;
        n_usb_cts : in std_logic;
        n_usb_rts : out std_logic;
        n_usb_rst : out std_logic
    
    );
end top_level;

architecture rtl of top_level is
  component mcu is
    port (
      spi_sense_io0_i : in STD_LOGIC;
      spi_sense_io0_o : out STD_LOGIC;
      spi_sense_io0_t : out STD_LOGIC;
      spi_sense_io1_i : in STD_LOGIC;
      spi_sense_io1_o : out STD_LOGIC;
      spi_sense_io1_t : out STD_LOGIC;
      spi_sense_sck_i : in STD_LOGIC;
      spi_sense_sck_o : out STD_LOGIC;
      spi_sense_sck_t : out STD_LOGIC;
      spi_sense_ss_i : in STD_LOGIC_VECTOR ( 2 downto 0 );
      spi_sense_ss_o : out STD_LOGIC_VECTOR ( 2 downto 0 );
      spi_sense_ss_t : out STD_LOGIC;
      uart_ft234_baudoutn : out STD_LOGIC;
      uart_ft234_ctsn : in STD_LOGIC;
      uart_ft234_dcdn : in STD_LOGIC;
      uart_ft234_ddis : out STD_LOGIC;
      uart_ft234_dsrn : in STD_LOGIC;
      uart_ft234_dtrn : out STD_LOGIC;
      uart_ft234_out1n : out STD_LOGIC;
      uart_ft234_out2n : out STD_LOGIC;
      uart_ft234_ri : in STD_LOGIC;
      uart_ft234_rtsn : out STD_LOGIC;
      uart_ft234_rxd : in STD_LOGIC;
      uart_ft234_rxrdyn : out STD_LOGIC;
      uart_ft234_txd : out STD_LOGIC;
      uart_ft234_txrdyn : out STD_LOGIC;
      gpio_leds_tri_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
      clk_in_50m : in STD_LOGIC;
      nReset : in STD_LOGIC;
      pulse_led : out STD_LOGIC
    );
  end component mcu;
  
  signal spi_sense_io0_i : STD_LOGIC;
  signal spi_sense_io0_o : STD_LOGIC;
  signal spi_sense_io0_t : STD_LOGIC;
  signal spi_sense_io1_i : STD_LOGIC;
  signal spi_sense_io1_o : STD_LOGIC;
  signal spi_sense_io1_t : STD_LOGIC;
  signal spi_sense_sck_i : STD_LOGIC;
  signal spi_sense_sck_o : STD_LOGIC;
  signal spi_sense_sck_t : STD_LOGIC;
  signal spi_sense_ss_i_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal spi_sense_ss_i_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal spi_sense_ss_i_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal spi_sense_ss_io_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal spi_sense_ss_io_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal spi_sense_ss_io_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal spi_sense_ss_o_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal spi_sense_ss_o_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal spi_sense_ss_o_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal spi_sense_ss_t : STD_LOGIC;  
  
  signal uart_ft234_baudoutn : STD_LOGIC;
  signal uart_ft234_dcdn : STD_LOGIC;
  signal uart_ft234_ddis : STD_LOGIC;
  signal uart_ft234_dsrn : STD_LOGIC;
  signal uart_ft234_dtrn : STD_LOGIC;
  signal uart_ft234_out1n : STD_LOGIC;
  signal uart_ft234_out2n : STD_LOGIC;
  signal uart_ft234_ri : STD_LOGIC;
  signal uart_ft234_rxrdyn : STD_LOGIC;
  signal uart_ft234_txrdyn : STD_LOGIC;  
  
  
  
begin

    n_usb_rst <= user_sw;

    mcu_i: component mcu
        port map (
          clk_in_50m => clk50m,
          nReset => user_sw,
          pulse_led => user_led5,
          gpio_leds_tri_o(0) => user_led1,
          gpio_leds_tri_o(1) => user_led2,
          gpio_leds_tri_o(2) => user_led3,
          gpio_leds_tri_o(3) => user_led4,
          spi_sense_io0_i => spi_sense_io0_i,
          spi_sense_io0_o => spi_sense_io0_o,
          spi_sense_io0_t => spi_sense_io0_t,
          spi_sense_io1_i => spi_sense_io1_i,
          spi_sense_io1_o => spi_sense_io1_o,
          spi_sense_io1_t => spi_sense_io1_t,
          spi_sense_sck_i => spi_sense_sck_i,
          spi_sense_sck_o => spi_sense_sck_o,
          spi_sense_sck_t => spi_sense_sck_t,
          spi_sense_ss_i(2) => spi_sense_ss_i_2(2),
          spi_sense_ss_i(1) => spi_sense_ss_i_1(1),
          spi_sense_ss_i(0) => spi_sense_ss_i_0(0),
          spi_sense_ss_o(2) => spi_sense_ss_o_2(2),
          spi_sense_ss_o(1) => spi_sense_ss_o_1(1),
          spi_sense_ss_o(0) => spi_sense_ss_o_0(0),
          spi_sense_ss_t => spi_sense_ss_t,
          uart_ft234_baudoutn => uart_ft234_baudoutn,
          uart_ft234_ctsn => n_usb_cts,
          uart_ft234_dcdn => uart_ft234_dcdn,
          uart_ft234_ddis => uart_ft234_ddis,
          uart_ft234_dsrn => uart_ft234_dsrn,
          uart_ft234_dtrn => uart_ft234_dtrn,
          uart_ft234_out1n => uart_ft234_out1n,
          uart_ft234_out2n => uart_ft234_out2n,
          uart_ft234_ri => uart_ft234_ri,
          uart_ft234_rtsn => n_usb_rts,
          uart_ft234_rxd => usb_txd,
          uart_ft234_rxrdyn => uart_ft234_rxrdyn,
          uart_ft234_txd => usb_rxd,
          uart_ft234_txrdyn => uart_ft234_txrdyn
        );

end rtl;
