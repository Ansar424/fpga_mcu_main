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
        -- Clock signals
        clk50m : in std_logic;
        clk50m_en : out std_logic;
        
        -- Basic IO ports for LEDs and one switch
        -- The switch is used as MCU reset.
        -- Led 5 (white) is a blinking led to indicate that the
        -- system is operational.
        user_led1 : out std_logic;
        user_led2 : out std_logic;
        user_led3 : out std_logic;
        user_led4 : out std_logic;
        user_led5 : out std_logic;
        user_sw : in std_logic;
        
        -- FT234XD USB->UART interface
        usb_rxd : out std_logic;
        usb_txd : in std_logic;
        n_usb_cts : in std_logic;
        n_usb_rts : out std_logic;
        n_usb_rst : out std_logic;
    
        -- LSM9DS0 9DOF IMU interface
        lsm_scl : out std_logic;
        lsm_sda : out std_logic;
        lsm_sdo_g : in std_logic;
        n_lsm_cs_g : out std_logic;
        lsm_sdo_xm : in std_logic;
        n_lsm_cs_xm : out std_logic;
        
        -- MS5611 Barometer interface
        bar_clk : out std_logic;
        bar_ps : out std_logic;
        bar_sdi : out std_logic;
        bar_sdo : in std_logic;
        n_bar_cs : out std_logic
    
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
      uart_rtl_rxd : in STD_LOGIC;
      uart_rtl_txd : out STD_LOGIC;
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
  
  signal spi_sck_i : std_logic;
  signal spi_mosi_i : std_logic;
  signal spi_miso_i : std_logic;
  signal spi_ss_i : std_logic_vector(2 downto 0);
  
  
begin

    n_usb_rst <= user_sw;
    n_usb_rts <= '0';
    
    bar_ps <= '0';
    
    -- SPI logic. 
    -- Must select the MISO pins from 3 sources
    spi_miso_i <= lsm_sdo_g when spi_ss_i = "110" else
                  lsm_sdo_xm when spi_ss_i = "101" else
                  bar_sdo when spi_ss_i = "011" else
                  '0';
    lsm_sda <= spi_mosi_i;
    bar_sdi <= spi_mosi_i;
    lsm_scl <= spi_sck_i;
    bar_clk <= spi_sck_i;
    n_lsm_cs_g <= spi_ss_i(0);
    n_lsm_cs_xm <= spi_ss_i(1);
    n_bar_cs <= spi_ss_i(2);

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
          spi_sense_io0_o => spi_mosi_i,
          spi_sense_io0_t => spi_sense_io0_t,
          spi_sense_io1_i => spi_miso_i,
          spi_sense_io1_o => spi_sense_io1_o,
          spi_sense_io1_t => spi_sense_io1_t,
          spi_sense_sck_i => spi_sense_sck_i,
          spi_sense_sck_o => spi_sck_i,
          spi_sense_sck_t => spi_sense_sck_t,
          spi_sense_ss_i(2) => spi_sense_ss_i_2(2),
          spi_sense_ss_i(1) => spi_sense_ss_i_1(1),
          spi_sense_ss_i(0) => spi_sense_ss_i_0(0),
          spi_sense_ss_o(2) => spi_ss_i(2),
          spi_sense_ss_o(1) => spi_ss_i(1),
          spi_sense_ss_o(0) => spi_ss_i(0),
          spi_sense_ss_t => spi_sense_ss_t,
          uart_rtl_rxd => usb_txd,
          uart_rtl_txd => usb_rxd
        );

end rtl;
