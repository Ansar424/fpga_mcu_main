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
library UNISIM;
use UNISIM.VComponents.all;

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
        lsm_scl : inout std_logic;
        lsm_sda : inout std_logic;
        lsm_sdo_g : out std_logic;
        lsm_sdo_xm : out std_logic;
        n_lsm_cs_g : out std_logic;
        n_lsm_cs_xm : out std_logic;
        
        -- MS5611 Barometer interface
        bar_clk : inout std_logic;
        bar_ps : out std_logic;
        bar_sdi : inout std_logic;
        n_bar_cs : out std_logic
    
    );
end top_level;

architecture rtl of top_level is
  component mcu is
    port (
        clk_in_50m : in STD_LOGIC;
        nReset : in STD_LOGIC;
        pulse_led : out STD_LOGIC;
        gpio_leds_tri_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
        iic_rtl_scl_i : in STD_LOGIC;
        iic_rtl_scl_o : out STD_LOGIC;
        iic_rtl_scl_t : out STD_LOGIC;
        iic_rtl_sda_i : in STD_LOGIC;
        iic_rtl_sda_o : out STD_LOGIC;
        iic_rtl_sda_t : out STD_LOGIC;
        uart_rtl_rxd : in STD_LOGIC;
        uart_rtl_txd : out STD_LOGIC;
        iic_gpo : out STD_LOGIC_VECTOR ( 7 downto 0 )
    );
  end component mcu;
  
  signal i2c_scl_in : std_logic;
  signal i2c_scl_out : std_logic;
  signal i2c_scl_t : std_logic;
  signal i2c_scl_lsm : std_logic;
  signal i2c_scl_bar : std_logic;
  signal i2c_sda_in : std_logic;
  signal i2c_sda_out : std_logic;
  signal i2c_sda_t : std_logic;
  signal i2c_sda_bar : std_logic;
  signal i2c_sda_lsm : std_logic;
  signal iic_gpo_i : std_logic_vector (7 downto 0);
  
  
begin

    clk50m_en <= '1';

    n_usb_rst <= user_sw;
    n_usb_rts <= '0';
    
    bar_ps <= iic_gpo_i(5);
    n_bar_cs <= iic_gpo_i(4);

    mcu_i: component mcu
        port map (
          clk_in_50m => clk50m,
          nReset => user_sw,
          pulse_led => user_led5,
          gpio_leds_tri_o(0) => user_led1,
          gpio_leds_tri_o(1) => user_led2,
          gpio_leds_tri_o(2) => user_led3,
          gpio_leds_tri_o(3) => user_led4,

          iic_rtl_scl_i => i2c_scl_in,
          iic_rtl_scl_o => i2c_scl_out,
          iic_rtl_scl_t => i2c_scl_t,
          iic_rtl_sda_i => i2c_sda_in,
          iic_rtl_sda_o => i2c_sda_out,
          iic_rtl_sda_t => i2c_sda_t,
          
          iic_gpo => iic_gpo_i,

          uart_rtl_rxd => usb_txd,
          uart_rtl_txd => usb_rxd
        );
    
    
        
    -------------------------------------------------------------------
    -- I2C connections.
    -- Barometer and IMU I2C is connected internally using a NAND port
    -- This will emulate the open drain metwork that is used externally    
        
    n_lsm_cs_g <= iic_gpo_i(0);
        n_lsm_cs_xm <= iic_gpo_i(2);
        lsm_sdo_g <= iic_gpo_i(1);
        lsm_sdo_xm <= iic_gpo_i(3);
    
        i2c_scl_in <= i2c_scl_lsm and i2c_scl_bar;
        i2c_sda_in <= i2c_sda_lsm and i2c_sda_bar;        

    iic_lsm_sda_iobuf: component IOBUF
        port map (
          I => i2c_sda_out,
          IO => lsm_sda,
          O => i2c_sda_lsm,
          T => i2c_sda_t
        );

    iic_bar_sda_iobuf: component IOBUF
        port map (
          I => i2c_sda_out,
          IO => bar_sdi,
          O => i2c_sda_bar,
          T => i2c_sda_t
        );

    iic_lsm_sck_iobuf: component IOBUF
        port map (
          I => i2c_scl_out,
          IO => lsm_scl,
          O => i2c_scl_lsm,
          T => i2c_scl_t
        );
 
     iic_bar_sck_iobuf: component IOBUF
        port map (
          I => i2c_scl_out,
          IO => bar_clk,
          O => i2c_scl_bar,
          T => i2c_scl_t
        );



end rtl;
