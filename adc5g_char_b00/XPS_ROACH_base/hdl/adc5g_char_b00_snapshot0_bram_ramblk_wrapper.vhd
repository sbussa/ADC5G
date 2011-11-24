-------------------------------------------------------------------------------
-- adc5g_char_b00_snapshot0_bram_ramblk_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity adc5g_char_b00_snapshot0_bram_ramblk_wrapper is
  port (
    clk : in std_logic;
    bram_we : in std_logic;
    bram_addr : in std_logic_vector(11 downto 0);
    bram_rd_data : out std_logic_vector(127 downto 0);
    bram_wr_data : in std_logic_vector(127 downto 0);
    BRAM_Rst_B : in std_logic;
    BRAM_Clk_B : in std_logic;
    BRAM_EN_B : in std_logic;
    BRAM_WEN_B : in std_logic_vector(0 to 3);
    BRAM_Addr_B : in std_logic_vector(0 to 31);
    BRAM_Din_B : out std_logic_vector(0 to 31);
    BRAM_Dout_B : in std_logic_vector(0 to 31)
  );

  attribute x_core_info : STRING;
  attribute x_core_info of adc5g_char_b00_snapshot0_bram_ramblk_wrapper : entity is "bram_block_custom_v1_00_a";

end adc5g_char_b00_snapshot0_bram_ramblk_wrapper;

architecture STRUCTURE of adc5g_char_b00_snapshot0_bram_ramblk_wrapper is

  component bram_block_custom is
    generic (
      C_PORTA_DWIDTH : integer;
      C_PORTA_AWIDTH : integer;
      C_PORTA_NUM_WE : integer;
      C_PORTA_DEPTH : integer;
      C_PORTB_DWIDTH : integer;
      C_PORTB_AWIDTH : integer;
      C_PORTB_NUM_WE : integer;
      C_PORTB_DEPTH : integer
    );
    port (
      clk : in std_logic;
      bram_we : in std_logic;
      bram_addr : in std_logic_vector(C_PORTA_DEPTH -1 downto 0);
      bram_rd_data : out std_logic_vector(C_PORTA_DWIDTH-1 downto 0);
      bram_wr_data : in std_logic_vector(C_PORTA_DWIDTH-1 downto 0);
      BRAM_Rst_B : in std_logic;
      BRAM_Clk_B : in std_logic;
      BRAM_EN_B : in std_logic;
      BRAM_WEN_B : in std_logic_vector(0 to C_PORTB_NUM_WE-1);
      BRAM_Addr_B : in std_logic_vector(0 to C_PORTB_AWIDTH-1);
      BRAM_Din_B : out std_logic_vector(0 to C_PORTB_DWIDTH-1);
      BRAM_Dout_B : in std_logic_vector(0 to C_PORTB_DWIDTH-1)
    );
  end component;

begin

  adc5g_char_b00_snapshot0_bram_ramblk : bram_block_custom
    generic map (
      C_PORTA_DWIDTH => 128,
      C_PORTA_AWIDTH => 32,
      C_PORTA_NUM_WE => 16,
      C_PORTA_DEPTH => 12,
      C_PORTB_DWIDTH => 32,
      C_PORTB_AWIDTH => 32,
      C_PORTB_NUM_WE => 4,
      C_PORTB_DEPTH => 14
    )
    port map (
      clk => clk,
      bram_we => bram_we,
      bram_addr => bram_addr,
      bram_rd_data => bram_rd_data,
      bram_wr_data => bram_wr_data,
      BRAM_Rst_B => BRAM_Rst_B,
      BRAM_Clk_B => BRAM_Clk_B,
      BRAM_EN_B => BRAM_EN_B,
      BRAM_WEN_B => BRAM_WEN_B,
      BRAM_Addr_B => BRAM_Addr_B,
      BRAM_Din_B => BRAM_Din_B,
      BRAM_Dout_B => BRAM_Dout_B
    );

end architecture STRUCTURE;

