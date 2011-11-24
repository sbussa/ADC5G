-------------------------------------------------------------------------------
-- adc5g_char_b00_xsg_core_config_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity adc5g_char_b00_xsg_core_config_wrapper is
  port (
    clk : in std_logic;
    adc5g_char_b00_asiaa_adc5g_sync : in std_logic;
    adc5g_char_b00_asiaa_adc5g_user_data_i0 : in std_logic_vector(7 downto 0);
    adc5g_char_b00_asiaa_adc5g_user_data_i1 : in std_logic_vector(7 downto 0);
    adc5g_char_b00_asiaa_adc5g_user_data_i2 : in std_logic_vector(7 downto 0);
    adc5g_char_b00_asiaa_adc5g_user_data_i3 : in std_logic_vector(7 downto 0);
    adc5g_char_b00_asiaa_adc5g_user_data_i4 : in std_logic_vector(7 downto 0);
    adc5g_char_b00_asiaa_adc5g_user_data_i5 : in std_logic_vector(7 downto 0);
    adc5g_char_b00_asiaa_adc5g_user_data_i6 : in std_logic_vector(7 downto 0);
    adc5g_char_b00_asiaa_adc5g_user_data_i7 : in std_logic_vector(7 downto 0);
    adc5g_char_b00_asiaa_adc5g_user_data_q0 : in std_logic_vector(7 downto 0);
    adc5g_char_b00_asiaa_adc5g_user_data_q1 : in std_logic_vector(7 downto 0);
    adc5g_char_b00_asiaa_adc5g_user_data_q2 : in std_logic_vector(7 downto 0);
    adc5g_char_b00_asiaa_adc5g_user_data_q3 : in std_logic_vector(7 downto 0);
    adc5g_char_b00_asiaa_adc5g_user_data_q4 : in std_logic_vector(7 downto 0);
    adc5g_char_b00_asiaa_adc5g_user_data_q5 : in std_logic_vector(7 downto 0);
    adc5g_char_b00_asiaa_adc5g_user_data_q6 : in std_logic_vector(7 downto 0);
    adc5g_char_b00_asiaa_adc5g_user_data_q7 : in std_logic_vector(7 downto 0);
    adc5g_char_b00_snapshot0_bram_data_out : in std_logic_vector(127 downto 0);
    adc5g_char_b00_snapshot0_bram_addr : out std_logic_vector(11 downto 0);
    adc5g_char_b00_snapshot0_bram_data_in : out std_logic_vector(127 downto 0);
    adc5g_char_b00_snapshot0_bram_we : out std_logic;
    adc5g_char_b00_snapshot0_ctrl_user_data_out : in std_logic_vector(31 downto 0);
    adc5g_char_b00_snapshot0_status_user_data_in : out std_logic_vector(31 downto 0)
  );

  attribute x_core_info : STRING;
  attribute x_core_info of adc5g_char_b00_xsg_core_config_wrapper : entity is "adc5g_char_b00_v1_00_a";

end adc5g_char_b00_xsg_core_config_wrapper;

architecture STRUCTURE of adc5g_char_b00_xsg_core_config_wrapper is

  component adc5g_char_b00 is
    port (
      clk : in std_logic;
      adc5g_char_b00_asiaa_adc5g_sync : in std_logic;
      adc5g_char_b00_asiaa_adc5g_user_data_i0 : in std_logic_vector(7 downto 0);
      adc5g_char_b00_asiaa_adc5g_user_data_i1 : in std_logic_vector(7 downto 0);
      adc5g_char_b00_asiaa_adc5g_user_data_i2 : in std_logic_vector(7 downto 0);
      adc5g_char_b00_asiaa_adc5g_user_data_i3 : in std_logic_vector(7 downto 0);
      adc5g_char_b00_asiaa_adc5g_user_data_i4 : in std_logic_vector(7 downto 0);
      adc5g_char_b00_asiaa_adc5g_user_data_i5 : in std_logic_vector(7 downto 0);
      adc5g_char_b00_asiaa_adc5g_user_data_i6 : in std_logic_vector(7 downto 0);
      adc5g_char_b00_asiaa_adc5g_user_data_i7 : in std_logic_vector(7 downto 0);
      adc5g_char_b00_asiaa_adc5g_user_data_q0 : in std_logic_vector(7 downto 0);
      adc5g_char_b00_asiaa_adc5g_user_data_q1 : in std_logic_vector(7 downto 0);
      adc5g_char_b00_asiaa_adc5g_user_data_q2 : in std_logic_vector(7 downto 0);
      adc5g_char_b00_asiaa_adc5g_user_data_q3 : in std_logic_vector(7 downto 0);
      adc5g_char_b00_asiaa_adc5g_user_data_q4 : in std_logic_vector(7 downto 0);
      adc5g_char_b00_asiaa_adc5g_user_data_q5 : in std_logic_vector(7 downto 0);
      adc5g_char_b00_asiaa_adc5g_user_data_q6 : in std_logic_vector(7 downto 0);
      adc5g_char_b00_asiaa_adc5g_user_data_q7 : in std_logic_vector(7 downto 0);
      adc5g_char_b00_snapshot0_bram_data_out : in std_logic_vector(127 downto 0);
      adc5g_char_b00_snapshot0_bram_addr : out std_logic_vector(11 downto 0);
      adc5g_char_b00_snapshot0_bram_data_in : out std_logic_vector(127 downto 0);
      adc5g_char_b00_snapshot0_bram_we : out std_logic;
      adc5g_char_b00_snapshot0_ctrl_user_data_out : in std_logic_vector(31 downto 0);
      adc5g_char_b00_snapshot0_status_user_data_in : out std_logic_vector(31 downto 0)
    );
  end component;

  attribute BOX_TYPE : STRING;
  attribute BOX_TYPE of adc5g_char_b00 : component is "user_black_box";

begin

  adc5g_char_b00_XSG_core_config : adc5g_char_b00
    port map (
      clk => clk,
      adc5g_char_b00_asiaa_adc5g_sync => adc5g_char_b00_asiaa_adc5g_sync,
      adc5g_char_b00_asiaa_adc5g_user_data_i0 => adc5g_char_b00_asiaa_adc5g_user_data_i0,
      adc5g_char_b00_asiaa_adc5g_user_data_i1 => adc5g_char_b00_asiaa_adc5g_user_data_i1,
      adc5g_char_b00_asiaa_adc5g_user_data_i2 => adc5g_char_b00_asiaa_adc5g_user_data_i2,
      adc5g_char_b00_asiaa_adc5g_user_data_i3 => adc5g_char_b00_asiaa_adc5g_user_data_i3,
      adc5g_char_b00_asiaa_adc5g_user_data_i4 => adc5g_char_b00_asiaa_adc5g_user_data_i4,
      adc5g_char_b00_asiaa_adc5g_user_data_i5 => adc5g_char_b00_asiaa_adc5g_user_data_i5,
      adc5g_char_b00_asiaa_adc5g_user_data_i6 => adc5g_char_b00_asiaa_adc5g_user_data_i6,
      adc5g_char_b00_asiaa_adc5g_user_data_i7 => adc5g_char_b00_asiaa_adc5g_user_data_i7,
      adc5g_char_b00_asiaa_adc5g_user_data_q0 => adc5g_char_b00_asiaa_adc5g_user_data_q0,
      adc5g_char_b00_asiaa_adc5g_user_data_q1 => adc5g_char_b00_asiaa_adc5g_user_data_q1,
      adc5g_char_b00_asiaa_adc5g_user_data_q2 => adc5g_char_b00_asiaa_adc5g_user_data_q2,
      adc5g_char_b00_asiaa_adc5g_user_data_q3 => adc5g_char_b00_asiaa_adc5g_user_data_q3,
      adc5g_char_b00_asiaa_adc5g_user_data_q4 => adc5g_char_b00_asiaa_adc5g_user_data_q4,
      adc5g_char_b00_asiaa_adc5g_user_data_q5 => adc5g_char_b00_asiaa_adc5g_user_data_q5,
      adc5g_char_b00_asiaa_adc5g_user_data_q6 => adc5g_char_b00_asiaa_adc5g_user_data_q6,
      adc5g_char_b00_asiaa_adc5g_user_data_q7 => adc5g_char_b00_asiaa_adc5g_user_data_q7,
      adc5g_char_b00_snapshot0_bram_data_out => adc5g_char_b00_snapshot0_bram_data_out,
      adc5g_char_b00_snapshot0_bram_addr => adc5g_char_b00_snapshot0_bram_addr,
      adc5g_char_b00_snapshot0_bram_data_in => adc5g_char_b00_snapshot0_bram_data_in,
      adc5g_char_b00_snapshot0_bram_we => adc5g_char_b00_snapshot0_bram_we,
      adc5g_char_b00_snapshot0_ctrl_user_data_out => adc5g_char_b00_snapshot0_ctrl_user_data_out,
      adc5g_char_b00_snapshot0_status_user_data_in => adc5g_char_b00_snapshot0_status_user_data_in
    );

end architecture STRUCTURE;

