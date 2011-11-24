library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "adc5g_char_b00/snapshot0/add_gen/edge_detect"

entity edge_detect_entity_20e9d1a092 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end edge_detect_entity_20e9d1a092;

architecture structural of edge_detect_entity_20e9d1a092 is
  signal ce_1_sg_x0: std_logic;
  signal clk_1_sg_x0: std_logic;
  signal delay_q_net: std_logic;
  signal edge_op_y_net_x0: std_logic;
  signal inverter_op_net: std_logic;
  signal slice3_y_net_x0: std_logic;

begin
  ce_1_sg_x0 <= ce_1;
  clk_1_sg_x0 <= clk_1;
  slice3_y_net_x0 <= in_x0;
  out_x0 <= edge_op_y_net_x0;

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      d(0) => slice3_y_net_x0,
      en => '1',
      q(0) => delay_q_net
    );

  edge_op: entity work.logical_f6397bdee1
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => inverter_op_net,
      d1(0) => delay_q_net,
      y(0) => edge_op_y_net_x0
    );

  inverter: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip(0) => slice3_y_net_x0,
      op(0) => inverter_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "adc5g_char_b00/snapshot0/add_gen"

entity add_gen_entity_e815cd5710 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    cont: in std_logic; 
    din: in std_logic_vector(127 downto 0); 
    go: in std_logic; 
    init: in std_logic; 
    we: in std_logic; 
    add: out std_logic_vector(11 downto 0); 
    dout: out std_logic_vector(127 downto 0); 
    status: out std_logic_vector(31 downto 0); 
    we_o: out std_logic
  );
end add_gen_entity_e815cd5710;

architecture structural of add_gen_entity_e815cd5710 is
  signal add_gen_op_net: std_logic_vector(16 downto 0);
  signal ce_1_sg_x1: std_logic;
  signal clk_1_sg_x1: std_logic;
  signal concat_y_net_x0: std_logic_vector(31 downto 0);
  signal convert_dout_net: std_logic_vector(14 downto 0);
  signal data_choice_y_net_x0: std_logic_vector(127 downto 0);
  signal delay1_q_net: std_logic_vector(15 downto 0);
  signal delay3_q_net: std_logic;
  signal delay4_q_net: std_logic;
  signal delay6_q_net_x0: std_logic_vector(127 downto 0);
  signal delay_q_net: std_logic;
  signal edge_op_y_net_x0: std_logic;
  signal edge_op_y_net_x1: std_logic;
  signal inverter1_op_net: std_logic;
  signal inverter_op_net: std_logic;
  signal logical1_y_net: std_logic;
  signal logical4_y_net: std_logic;
  signal logical6_y_net_x0: std_logic;
  signal never_op_net_x0: std_logic;
  signal register5_q_net: std_logic;
  signal register6_q_net_x0: std_logic;
  signal shift_op_net: std_logic_vector(14 downto 0);
  signal slice1_y_net: std_logic_vector(15 downto 0);
  signal slice2_y_net_x0: std_logic_vector(11 downto 0);
  signal slice3_y_net_x0: std_logic;
  signal we_choice_y_net_x0: std_logic;

begin
  ce_1_sg_x1 <= ce_1;
  clk_1_sg_x1 <= clk_1;
  never_op_net_x0 <= cont;
  data_choice_y_net_x0 <= din;
  register6_q_net_x0 <= go;
  edge_op_y_net_x1 <= init;
  we_choice_y_net_x0 <= we;
  add <= slice2_y_net_x0;
  dout <= delay6_q_net_x0;
  status <= concat_y_net_x0;
  we_o <= logical6_y_net_x0;

  add_gen: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_11_0_d1f139f5324467d6",
      op_arith => xlUnsigned,
      op_width => 17
    )
    port map (
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      clr => '0',
      en(0) => logical6_y_net_x0,
      rst(0) => delay4_q_net,
      op => add_gen_op_net
    );

  concat: entity work.concat_1a6baff97c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => shift_op_net,
      in1(0) => inverter_op_net,
      in2 => delay1_q_net,
      y => concat_y_net_x0
    );

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 15,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => register5_q_net,
      dout => convert_dout_net
    );

  delay: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      clr => '0',
      d(0) => delay4_q_net,
      q(0) => delay_q_net
    );

  delay1: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 16
    )
    port map (
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      d => slice1_y_net,
      en => '1',
      q => delay1_q_net
    );

  delay3: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      clr => '0',
      d(0) => never_op_net_x0,
      q(0) => delay3_q_net
    );

  delay4: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      clr => '0',
      d(0) => edge_op_y_net_x1,
      q(0) => delay4_q_net
    );

  delay6: entity work.delay_ee0f706095
    port map (
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      clr => '0',
      d => data_choice_y_net_x0,
      q => delay6_q_net_x0
    );

  edge_detect_20e9d1a092: entity work.edge_detect_entity_20e9d1a092
    port map (
      ce_1 => ce_1_sg_x1,
      clk_1 => clk_1_sg_x1,
      in_x0 => slice3_y_net_x0,
      out_x0 => edge_op_y_net_x0
    );

  inverter: entity work.inverter_6844eee868
    port map (
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      clr => '0',
      ip(0) => register5_q_net,
      op(0) => inverter_op_net
    );

  inverter1: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      clr => '0',
      ip(0) => edge_op_y_net_x0,
      op(0) => inverter1_op_net
    );

  logical1: entity work.logical_799f62af22
    port map (
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      clr => '0',
      d0(0) => we_choice_y_net_x0,
      d1(0) => register6_q_net_x0,
      y(0) => logical1_y_net
    );

  logical4: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay3_q_net,
      d1(0) => inverter1_op_net,
      y(0) => logical4_y_net
    );

  logical6: entity work.logical_954ee29728
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => register5_q_net,
      d1(0) => logical4_y_net,
      d2(0) => logical1_y_net,
      y(0) => logical6_y_net_x0
    );

  register5: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"1"
    )
    port map (
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      d(0) => delay3_q_net,
      en(0) => edge_op_y_net_x0,
      rst(0) => delay_q_net,
      q(0) => register5_q_net
    );

  shift: entity work.shift_8b3da62244
    port map (
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      clr => '0',
      ip => convert_dout_net,
      op => shift_op_net
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 15,
      x_width => 17,
      y_width => 16
    )
    port map (
      x => add_gen_op_net,
      y => slice1_y_net
    );

  slice2: entity work.xlslice
    generic map (
      new_lsb => 4,
      new_msb => 15,
      x_width => 17,
      y_width => 12
    )
    port map (
      x => add_gen_op_net,
      y => slice2_y_net_x0
    );

  slice3: entity work.xlslice
    generic map (
      new_lsb => 16,
      new_msb => 16,
      x_width => 17,
      y_width => 1
    )
    port map (
      x => add_gen_op_net,
      y(0) => slice3_y_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "adc5g_char_b00/snapshot0/basic_ctrl/dram_munge"

entity dram_munge_entity_10fb8332c8 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(127 downto 0); 
    init: in std_logic; 
    we: in std_logic; 
    dout: out std_logic_vector(127 downto 0); 
    we_o: out std_logic
  );
end dram_munge_entity_10fb8332c8;

architecture structural of dram_munge_entity_10fb8332c8 is
  signal cast_dout_net_x0: std_logic_vector(127 downto 0);
  signal ce_1_sg_x2: std_logic;
  signal clk_1_sg_x2: std_logic;
  signal con0_op_net: std_logic_vector(1 downto 0);
  signal con1_op_net: std_logic_vector(1 downto 0);
  signal con2_op_net: std_logic_vector(1 downto 0);
  signal con3_op_net: std_logic_vector(1 downto 0);
  signal concat1_y_net: std_logic_vector(271 downto 0);
  signal concat_y_net: std_logic_vector(271 downto 0);
  signal constant_op_net: std_logic_vector(7 downto 0);
  signal data_choice_y_net_x1: std_logic_vector(127 downto 0);
  signal delay1_q_net: std_logic;
  signal delay_q_net: std_logic;
  signal dout_count_op_net: std_logic;
  signal dram_op_net: std_logic;
  signal edge_op_y_net_x2: std_logic;
  signal input_count_op_net: std_logic_vector(1 downto 0);
  signal logical1_y_net: std_logic;
  signal logical_y_net: std_logic;
  signal mux1_y_net_x0: std_logic_vector(271 downto 0);
  signal mux1_y_net_x1: std_logic;
  signal register1_q_net: std_logic_vector(127 downto 0);
  signal register2_q_net: std_logic_vector(127 downto 0);
  signal register3_q_net: std_logic_vector(127 downto 0);
  signal register_q_net: std_logic_vector(127 downto 0);
  signal relational1_op_net: std_logic;
  signal relational2_op_net: std_logic;
  signal relational3_op_net: std_logic;
  signal relational_op_net: std_logic;
  signal we_choice_y_net_x1: std_logic;

begin
  ce_1_sg_x2 <= ce_1;
  clk_1_sg_x2 <= clk_1;
  cast_dout_net_x0 <= din;
  edge_op_y_net_x2 <= init;
  mux1_y_net_x1 <= we;
  dout <= data_choice_y_net_x1;
  we_o <= we_choice_y_net_x1;

  con0: entity work.constant_cda50df78a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => con0_op_net
    );

  con1: entity work.constant_a7e2bb9e12
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => con1_op_net
    );

  con2: entity work.constant_e8ddc079e9
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => con2_op_net
    );

  con3: entity work.constant_3a9a3daeb9
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => con3_op_net
    );

  concat: entity work.concat_fd1ce36c4a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => constant_op_net,
      in1 => register_q_net,
      in2 => constant_op_net,
      in3 => register1_q_net,
      y => concat_y_net
    );

  concat1: entity work.concat_fd1ce36c4a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => constant_op_net,
      in1 => register2_q_net,
      in2 => constant_op_net,
      in3 => register3_q_net,
      y => concat1_y_net
    );

  constant_x0: entity work.constant_91ef1678ca
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  data_choice: entity work.mux_5441ad2d93
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => cast_dout_net_x0,
      d1 => mux1_y_net_x0,
      sel(0) => dram_op_net,
      y => data_choice_y_net_x1
    );

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      d(0) => logical_y_net,
      en => '1',
      q(0) => delay_q_net
    );

  delay1: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      d(0) => logical1_y_net,
      en => '1',
      q(0) => delay1_q_net
    );

  dout_count: entity work.counter_caa2b01eef
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      en(0) => logical1_y_net,
      rst(0) => edge_op_y_net_x2,
      op(0) => dout_count_op_net
    );

  dram: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => dram_op_net
    );

  input_count: entity work.xlcounter_free
    generic map (
      core_name0 => "binary_counter_virtex5_11_0_dfcd34dfb8805954",
      op_arith => xlUnsigned,
      op_width => 2
    )
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      en(0) => mux1_y_net_x1,
      rst(0) => edge_op_y_net_x2,
      op => input_count_op_net
    );

  logical: entity work.logical_799f62af22
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      d0(0) => relational3_op_net,
      d1(0) => mux1_y_net_x1,
      y(0) => logical_y_net
    );

  logical1: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => logical_y_net,
      d1(0) => delay_q_net,
      y(0) => logical1_y_net
    );

  mux1: entity work.mux_ddf27bda35
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      d0 => concat_y_net,
      d1 => concat1_y_net,
      sel(0) => dout_count_op_net,
      y => mux1_y_net_x0
    );

  register1: entity work.xlregister
    generic map (
      d_width => 128,
      init_value => b"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      d => cast_dout_net_x0,
      en(0) => relational1_op_net,
      rst => "0",
      q => register1_q_net
    );

  register2: entity work.xlregister
    generic map (
      d_width => 128,
      init_value => b"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      d => cast_dout_net_x0,
      en(0) => relational2_op_net,
      rst => "0",
      q => register2_q_net
    );

  register3: entity work.xlregister
    generic map (
      d_width => 128,
      init_value => b"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      d => cast_dout_net_x0,
      en(0) => relational3_op_net,
      rst => "0",
      q => register3_q_net
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 128,
      init_value => b"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      d => cast_dout_net_x0,
      en(0) => relational_op_net,
      rst => "0",
      q => register_q_net
    );

  relational: entity work.relational_5f1eb17108
    port map (
      a => input_count_op_net,
      b => con0_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity work.relational_5f1eb17108
    port map (
      a => input_count_op_net,
      b => con1_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational1_op_net
    );

  relational2: entity work.relational_5f1eb17108
    port map (
      a => input_count_op_net,
      b => con2_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational2_op_net
    );

  relational3: entity work.relational_5f1eb17108
    port map (
      a => input_count_op_net,
      b => con3_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational3_op_net
    );

  we_choice: entity work.mux_d99e59b6d4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => mux1_y_net_x1,
      d1(0) => delay1_q_net,
      sel(0) => dram_op_net,
      y(0) => we_choice_y_net_x1
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "adc5g_char_b00/snapshot0/basic_ctrl/edge_detect"

entity edge_detect_entity_e0ab79dfdf is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic; 
    out_x0: out std_logic
  );
end edge_detect_entity_e0ab79dfdf;

architecture structural of edge_detect_entity_e0ab79dfdf is
  signal ce_1_sg_x3: std_logic;
  signal clk_1_sg_x3: std_logic;
  signal delay1_q_net_x0: std_logic;
  signal delay_q_net: std_logic;
  signal edge_op_y_net_x3: std_logic;
  signal inverter_op_net: std_logic;

begin
  ce_1_sg_x3 <= ce_1;
  clk_1_sg_x3 <= clk_1;
  delay1_q_net_x0 <= in_x0;
  out_x0 <= edge_op_y_net_x3;

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x3,
      clk => clk_1_sg_x3,
      d(0) => delay1_q_net_x0,
      en => '1',
      q(0) => delay_q_net
    );

  edge_op: entity work.logical_dfe2dded7f
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => inverter_op_net,
      d1(0) => delay_q_net,
      y(0) => edge_op_y_net_x3
    );

  inverter: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x3,
      clk => clk_1_sg_x3,
      clr => '0',
      ip(0) => delay1_q_net_x0,
      op(0) => inverter_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "adc5g_char_b00/snapshot0/basic_ctrl"

entity basic_ctrl_entity_ffd61ab2af is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    ctrl: in std_logic_vector(31 downto 0); 
    din: in std_logic_vector(127 downto 0); 
    trig: in std_logic; 
    we: in std_logic; 
    dout: out std_logic_vector(127 downto 0); 
    go: out std_logic; 
    init: out std_logic; 
    we_o: out std_logic
  );
end basic_ctrl_entity_ffd61ab2af;

architecture structural of basic_ctrl_entity_ffd61ab2af is
  signal adc5g_char_b00_snapshot0_ctrl_user_data_out_net_x0: std_logic_vector(31 downto 0);
  signal cast_dout_net_x1: std_logic_vector(127 downto 0);
  signal ce_1_sg_x4: std_logic;
  signal clk_1_sg_x4: std_logic;
  signal constant1_op_net_x0: std_logic;
  signal constant1_op_net_x1: std_logic;
  signal constant2_op_net: std_logic;
  signal constant3_op_net_x0: std_logic;
  signal constant_op_net: std_logic;
  signal data_choice_y_net_x2: std_logic_vector(127 downto 0);
  signal delay1_q_net_x0: std_logic;
  signal delay2_q_net: std_logic;
  signal delay3_q_net: std_logic;
  signal edge_op_y_net_x4: std_logic;
  signal enable_y_net: std_logic;
  signal inverter_op_net: std_logic;
  signal logical_y_net: std_logic;
  signal mux1_y_net_x1: std_logic;
  signal mux2_y_net: std_logic;
  signal register1_q_net: std_logic;
  signal register6_q_net_x1: std_logic;
  signal trig_src_y_net: std_logic;
  signal valid_src_y_net: std_logic;
  signal we_choice_y_net_x2: std_logic;

begin
  ce_1_sg_x4 <= ce_1;
  clk_1_sg_x4 <= clk_1;
  adc5g_char_b00_snapshot0_ctrl_user_data_out_net_x0 <= ctrl;
  cast_dout_net_x1 <= din;
  constant1_op_net_x1 <= trig;
  constant3_op_net_x0 <= we;
  dout <= data_choice_y_net_x2;
  go <= register6_q_net_x1;
  init <= edge_op_y_net_x4;
  we_o <= we_choice_y_net_x2;

  constant1: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant1_op_net_x0
    );

  constant2: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant2_op_net
    );

  constant_x0: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant_op_net
    );

  delay1: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x4,
      clk => clk_1_sg_x4,
      d(0) => enable_y_net,
      en => '1',
      q(0) => delay1_q_net_x0
    );

  delay2: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x4,
      clk => clk_1_sg_x4,
      d(0) => trig_src_y_net,
      en => '1',
      q(0) => delay2_q_net
    );

  delay3: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x4,
      clk => clk_1_sg_x4,
      d(0) => valid_src_y_net,
      en => '1',
      q(0) => delay3_q_net
    );

  dram_munge_10fb8332c8: entity work.dram_munge_entity_10fb8332c8
    port map (
      ce_1 => ce_1_sg_x4,
      clk_1 => clk_1_sg_x4,
      din => cast_dout_net_x1,
      init => edge_op_y_net_x4,
      we => mux1_y_net_x1,
      dout => data_choice_y_net_x2,
      we_o => we_choice_y_net_x2
    );

  edge_detect_e0ab79dfdf: entity work.edge_detect_entity_e0ab79dfdf
    port map (
      ce_1 => ce_1_sg_x4,
      clk_1 => clk_1_sg_x4,
      in_x0 => delay1_q_net_x0,
      out_x0 => edge_op_y_net_x4
    );

  enable: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 0,
      x_width => 32,
      y_width => 1
    )
    port map (
      x => adc5g_char_b00_snapshot0_ctrl_user_data_out_net_x0,
      y(0) => enable_y_net
    );

  inverter: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x4,
      clk => clk_1_sg_x4,
      clr => '0',
      ip(0) => edge_op_y_net_x4,
      op(0) => inverter_op_net
    );

  logical: entity work.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => mux2_y_net,
      d1(0) => inverter_op_net,
      y(0) => logical_y_net
    );

  mux1: entity work.mux_d99e59b6d4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => constant3_op_net_x0,
      d1(0) => constant2_op_net,
      sel(0) => delay3_q_net,
      y(0) => mux1_y_net_x1
    );

  mux2: entity work.mux_d99e59b6d4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => constant1_op_net_x1,
      d1(0) => constant1_op_net_x0,
      sel(0) => delay2_q_net,
      y(0) => mux2_y_net
    );

  register1: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x4,
      clk => clk_1_sg_x4,
      d(0) => constant_op_net,
      en(0) => edge_op_y_net_x4,
      rst(0) => logical_y_net,
      q(0) => register1_q_net
    );

  register6: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x4,
      clk => clk_1_sg_x4,
      d(0) => mux2_y_net,
      en(0) => register1_q_net,
      rst(0) => edge_op_y_net_x4,
      q(0) => register6_q_net_x1
    );

  trig_src: entity work.xlslice
    generic map (
      new_lsb => 1,
      new_msb => 1,
      x_width => 32,
      y_width => 1
    )
    port map (
      x => adc5g_char_b00_snapshot0_ctrl_user_data_out_net_x0,
      y(0) => trig_src_y_net
    );

  valid_src: entity work.xlslice
    generic map (
      new_lsb => 2,
      new_msb => 2,
      x_width => 32,
      y_width => 1
    )
    port map (
      x => adc5g_char_b00_snapshot0_ctrl_user_data_out_net_x0,
      y(0) => valid_src_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "adc5g_char_b00/snapshot0/bram/calc_add"

entity calc_add_entity_852e351bf6 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    in_x0: in std_logic_vector(11 downto 0); 
    out_x0: out std_logic_vector(11 downto 0)
  );
end calc_add_entity_852e351bf6;

architecture structural of calc_add_entity_852e351bf6 is
  signal add_del_q_net_x0: std_logic_vector(11 downto 0);
  signal add_sub_s_net: std_logic;
  signal ce_1_sg_x5: std_logic;
  signal clk_1_sg_x5: std_logic;
  signal concat_y_net: std_logic_vector(11 downto 0);
  signal const_op_net: std_logic;
  signal convert_addr_dout_net: std_logic_vector(11 downto 0);
  signal lsw_y_net: std_logic;
  signal manipulate_op_net: std_logic;
  signal msw_y_net: std_logic_vector(10 downto 0);
  signal mux_y_net_x0: std_logic_vector(11 downto 0);

begin
  ce_1_sg_x5 <= ce_1;
  clk_1_sg_x5 <= clk_1;
  add_del_q_net_x0 <= in_x0;
  out_x0 <= mux_y_net_x0;

  add_sub: entity work.addsub_c13097e33e
    port map (
      a(0) => const_op_net,
      b(0) => lsw_y_net,
      ce => ce_1_sg_x5,
      clk => clk_1_sg_x5,
      clr => '0',
      s(0) => add_sub_s_net
    );

  concat: entity work.concat_e2aa47955c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => msw_y_net,
      in1(0) => add_sub_s_net,
      y => concat_y_net
    );

  const: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => const_op_net
    );

  convert_addr: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 12,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 12,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => add_del_q_net_x0,
      dout => convert_addr_dout_net
    );

  lsw: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 0,
      x_width => 12,
      y_width => 1
    )
    port map (
      x => convert_addr_dout_net,
      y(0) => lsw_y_net
    );

  manipulate: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => manipulate_op_net
    );

  msw: entity work.xlslice
    generic map (
      new_lsb => 1,
      new_msb => 11,
      x_width => 12,
      y_width => 11
    )
    port map (
      x => convert_addr_dout_net,
      y => msw_y_net
    );

  mux: entity work.mux_c3e1ddb86e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => convert_addr_dout_net,
      d1 => concat_y_net,
      sel(0) => manipulate_op_net,
      y => mux_y_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "adc5g_char_b00/snapshot0/bram/munge_in/join"

entity join_entity_f33272f3dc is
  port (
    in1: in std_logic_vector(31 downto 0); 
    in2: in std_logic_vector(31 downto 0); 
    in3: in std_logic_vector(31 downto 0); 
    in4: in std_logic_vector(31 downto 0); 
    bus_out: out std_logic_vector(127 downto 0)
  );
end join_entity_f33272f3dc;

architecture structural of join_entity_f33272f3dc is
  signal concatenate_y_net_x0: std_logic_vector(127 downto 0);
  signal reinterpret1_output_port_net: std_logic_vector(31 downto 0);
  signal reinterpret1_output_port_net_x1: std_logic_vector(31 downto 0);
  signal reinterpret2_output_port_net: std_logic_vector(31 downto 0);
  signal reinterpret2_output_port_net_x1: std_logic_vector(31 downto 0);
  signal reinterpret3_output_port_net: std_logic_vector(31 downto 0);
  signal reinterpret3_output_port_net_x1: std_logic_vector(31 downto 0);
  signal reinterpret4_output_port_net: std_logic_vector(31 downto 0);
  signal reinterpret4_output_port_net_x1: std_logic_vector(31 downto 0);

begin
  reinterpret1_output_port_net_x1 <= in1;
  reinterpret2_output_port_net_x1 <= in2;
  reinterpret3_output_port_net_x1 <= in3;
  reinterpret4_output_port_net_x1 <= in4;
  bus_out <= concatenate_y_net_x0;

  concatenate: entity work.concat_b11ec1c0d4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => reinterpret1_output_port_net,
      in1 => reinterpret2_output_port_net,
      in2 => reinterpret3_output_port_net,
      in3 => reinterpret4_output_port_net,
      y => concatenate_y_net_x0
    );

  reinterpret1: entity work.reinterpret_c5d4d59b73
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => reinterpret1_output_port_net_x1,
      output_port => reinterpret1_output_port_net
    );

  reinterpret2: entity work.reinterpret_c5d4d59b73
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => reinterpret2_output_port_net_x1,
      output_port => reinterpret2_output_port_net
    );

  reinterpret3: entity work.reinterpret_c5d4d59b73
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => reinterpret3_output_port_net_x1,
      output_port => reinterpret3_output_port_net
    );

  reinterpret4: entity work.reinterpret_c5d4d59b73
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => reinterpret4_output_port_net_x1,
      output_port => reinterpret4_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "adc5g_char_b00/snapshot0/bram/munge_in/split"

entity split_entity_7d7928af0b is
  port (
    bus_in: in std_logic_vector(127 downto 0); 
    lsb_out1: out std_logic_vector(31 downto 0); 
    msb_out4: out std_logic_vector(31 downto 0); 
    out2: out std_logic_vector(31 downto 0); 
    out3: out std_logic_vector(31 downto 0)
  );
end split_entity_7d7928af0b;

architecture structural of split_entity_7d7928af0b is
  signal reinterpret1_output_port_net_x2: std_logic_vector(31 downto 0);
  signal reinterpret2_output_port_net_x2: std_logic_vector(31 downto 0);
  signal reinterpret3_output_port_net_x2: std_logic_vector(31 downto 0);
  signal reinterpret4_output_port_net_x2: std_logic_vector(31 downto 0);
  signal reinterpret_output_port_net_x0: std_logic_vector(127 downto 0);
  signal slice1_y_net: std_logic_vector(31 downto 0);
  signal slice2_y_net: std_logic_vector(31 downto 0);
  signal slice3_y_net: std_logic_vector(31 downto 0);
  signal slice4_y_net: std_logic_vector(31 downto 0);

begin
  reinterpret_output_port_net_x0 <= bus_in;
  lsb_out1 <= reinterpret1_output_port_net_x2;
  msb_out4 <= reinterpret4_output_port_net_x2;
  out2 <= reinterpret2_output_port_net_x2;
  out3 <= reinterpret3_output_port_net_x2;

  reinterpret1: entity work.reinterpret_c5d4d59b73
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice1_y_net,
      output_port => reinterpret1_output_port_net_x2
    );

  reinterpret2: entity work.reinterpret_c5d4d59b73
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice2_y_net,
      output_port => reinterpret2_output_port_net_x2
    );

  reinterpret3: entity work.reinterpret_c5d4d59b73
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice3_y_net,
      output_port => reinterpret3_output_port_net_x2
    );

  reinterpret4: entity work.reinterpret_c5d4d59b73
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice4_y_net,
      output_port => reinterpret4_output_port_net_x2
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 31,
      x_width => 128,
      y_width => 32
    )
    port map (
      x => reinterpret_output_port_net_x0,
      y => slice1_y_net
    );

  slice2: entity work.xlslice
    generic map (
      new_lsb => 32,
      new_msb => 63,
      x_width => 128,
      y_width => 32
    )
    port map (
      x => reinterpret_output_port_net_x0,
      y => slice2_y_net
    );

  slice3: entity work.xlslice
    generic map (
      new_lsb => 64,
      new_msb => 95,
      x_width => 128,
      y_width => 32
    )
    port map (
      x => reinterpret_output_port_net_x0,
      y => slice3_y_net
    );

  slice4: entity work.xlslice
    generic map (
      new_lsb => 96,
      new_msb => 127,
      x_width => 128,
      y_width => 32
    )
    port map (
      x => reinterpret_output_port_net_x0,
      y => slice4_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "adc5g_char_b00/snapshot0/bram/munge_in"

entity munge_in_entity_55031b9d05 is
  port (
    din: in std_logic_vector(127 downto 0); 
    dout: out std_logic_vector(127 downto 0)
  );
end munge_in_entity_55031b9d05;

architecture structural of munge_in_entity_55031b9d05 is
  signal concatenate_y_net_x1: std_logic_vector(127 downto 0);
  signal convert_din_dout_net_x0: std_logic_vector(127 downto 0);
  signal reinterpret1_output_port_net_x2: std_logic_vector(31 downto 0);
  signal reinterpret2_output_port_net_x2: std_logic_vector(31 downto 0);
  signal reinterpret3_output_port_net_x2: std_logic_vector(31 downto 0);
  signal reinterpret4_output_port_net_x2: std_logic_vector(31 downto 0);
  signal reinterpret_output_port_net_x0: std_logic_vector(127 downto 0);

begin
  convert_din_dout_net_x0 <= din;
  dout <= concatenate_y_net_x1;

  join_f33272f3dc: entity work.join_entity_f33272f3dc
    port map (
      in1 => reinterpret1_output_port_net_x2,
      in2 => reinterpret2_output_port_net_x2,
      in3 => reinterpret3_output_port_net_x2,
      in4 => reinterpret4_output_port_net_x2,
      bus_out => concatenate_y_net_x1
    );

  reinterpret: entity work.reinterpret_28b9ecc6fc
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => convert_din_dout_net_x0,
      output_port => reinterpret_output_port_net_x0
    );

  split_7d7928af0b: entity work.split_entity_7d7928af0b
    port map (
      bus_in => reinterpret_output_port_net_x0,
      lsb_out1 => reinterpret1_output_port_net_x2,
      msb_out4 => reinterpret4_output_port_net_x2,
      out2 => reinterpret2_output_port_net_x2,
      out3 => reinterpret3_output_port_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "adc5g_char_b00/snapshot0/bram"

entity bram_entity_06393653e3 is
  port (
    addr: in std_logic_vector(11 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(127 downto 0); 
    we: in std_logic; 
    convert_addr_x0: out std_logic_vector(11 downto 0); 
    convert_din1_x0: out std_logic_vector(127 downto 0); 
    convert_we_x0: out std_logic
  );
end bram_entity_06393653e3;

architecture structural of bram_entity_06393653e3 is
  signal add_del_q_net_x1: std_logic_vector(11 downto 0);
  signal ce_1_sg_x6: std_logic;
  signal clk_1_sg_x6: std_logic;
  signal concatenate_y_net_x1: std_logic_vector(127 downto 0);
  signal convert_addr_dout_net_x0: std_logic_vector(11 downto 0);
  signal convert_din1_dout_net_x0: std_logic_vector(127 downto 0);
  signal convert_din_dout_net_x0: std_logic_vector(127 downto 0);
  signal convert_we_dout_net_x0: std_logic;
  signal dat_del_q_net_x0: std_logic_vector(127 downto 0);
  signal mux_y_net_x0: std_logic_vector(11 downto 0);
  signal we_del_q_net_x0: std_logic;

begin
  add_del_q_net_x1 <= addr;
  ce_1_sg_x6 <= ce_1;
  clk_1_sg_x6 <= clk_1;
  dat_del_q_net_x0 <= data_in;
  we_del_q_net_x0 <= we;
  convert_addr_x0 <= convert_addr_dout_net_x0;
  convert_din1_x0 <= convert_din1_dout_net_x0;
  convert_we_x0 <= convert_we_dout_net_x0;

  calc_add_852e351bf6: entity work.calc_add_entity_852e351bf6
    port map (
      ce_1 => ce_1_sg_x6,
      clk_1 => clk_1_sg_x6,
      in_x0 => add_del_q_net_x1,
      out_x0 => mux_y_net_x0
    );

  convert_addr: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 12,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 12,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => mux_y_net_x0,
      dout => convert_addr_dout_net_x0
    );

  convert_din: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 128,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 128,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => dat_del_q_net_x0,
      dout => convert_din_dout_net_x0
    );

  convert_din1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 128,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 128,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => concatenate_y_net_x1,
      dout => convert_din1_dout_net_x0
    );

  convert_we: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din(0) => we_del_q_net_x0,
      dout(0) => convert_we_dout_net_x0
    );

  munge_in_55031b9d05: entity work.munge_in_entity_55031b9d05
    port map (
      din => convert_din_dout_net_x0,
      dout => concatenate_y_net_x1
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "adc5g_char_b00/snapshot0/status"

entity status_entity_01be868a58 is
  port (
    reg_out: in std_logic_vector(31 downto 0); 
    convert_x0: out std_logic_vector(31 downto 0)
  );
end status_entity_01be868a58;

architecture structural of status_entity_01be868a58 is
  signal concat_y_net_x1: std_logic_vector(31 downto 0);
  signal convert_dout_net_x0: std_logic_vector(31 downto 0);

begin
  concat_y_net_x1 <= reg_out;
  convert_x0 <= convert_dout_net_x0;

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 32,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 32,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => concat_y_net_x1,
      dout => convert_dout_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "adc5g_char_b00/snapshot0"

entity snapshot0_entity_33718b74d5 is
  port (
    adc5g_char_b00_snapshot0_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(127 downto 0); 
    trig: in std_logic; 
    we: in std_logic; 
    bram: out std_logic_vector(11 downto 0); 
    bram_x0: out std_logic_vector(127 downto 0); 
    bram_x1: out std_logic; 
    status: out std_logic_vector(31 downto 0)
  );
end snapshot0_entity_33718b74d5;

architecture structural of snapshot0_entity_33718b74d5 is
  signal adc5g_char_b00_snapshot0_ctrl_user_data_out_net_x1: std_logic_vector(31 downto 0);
  signal add_del_q_net_x1: std_logic_vector(11 downto 0);
  signal cast_dout_net_x1: std_logic_vector(127 downto 0);
  signal ce_1_sg_x7: std_logic;
  signal clk_1_sg_x7: std_logic;
  signal concat_y_net_x0: std_logic_vector(127 downto 0);
  signal concat_y_net_x1: std_logic_vector(31 downto 0);
  signal constant1_op_net_x2: std_logic;
  signal constant3_op_net_x1: std_logic;
  signal convert_addr_dout_net_x1: std_logic_vector(11 downto 0);
  signal convert_din1_dout_net_x1: std_logic_vector(127 downto 0);
  signal convert_dout_net_x1: std_logic_vector(31 downto 0);
  signal convert_we_dout_net_x1: std_logic;
  signal dat_del_q_net_x0: std_logic_vector(127 downto 0);
  signal data_choice_y_net_x2: std_logic_vector(127 downto 0);
  signal delay6_q_net_x0: std_logic_vector(127 downto 0);
  signal edge_op_y_net_x4: std_logic;
  signal logical6_y_net_x0: std_logic;
  signal never_op_net_x0: std_logic;
  signal register6_q_net_x1: std_logic;
  signal ri_output_port_net: std_logic_vector(127 downto 0);
  signal slice2_y_net_x0: std_logic_vector(11 downto 0);
  signal we_choice_y_net_x2: std_logic;
  signal we_del_q_net_x0: std_logic;

begin
  adc5g_char_b00_snapshot0_ctrl_user_data_out_net_x1 <= adc5g_char_b00_snapshot0_ctrl_user_data_out;
  ce_1_sg_x7 <= ce_1;
  clk_1_sg_x7 <= clk_1;
  concat_y_net_x0 <= din;
  constant1_op_net_x2 <= trig;
  constant3_op_net_x1 <= we;
  bram <= convert_addr_dout_net_x1;
  bram_x0 <= convert_din1_dout_net_x1;
  bram_x1 <= convert_we_dout_net_x1;
  status <= convert_dout_net_x1;

  add_del: entity work.delay_87cc993d41
    port map (
      ce => ce_1_sg_x7,
      clk => clk_1_sg_x7,
      clr => '0',
      d => slice2_y_net_x0,
      q => add_del_q_net_x1
    );

  add_gen_e815cd5710: entity work.add_gen_entity_e815cd5710
    port map (
      ce_1 => ce_1_sg_x7,
      clk_1 => clk_1_sg_x7,
      cont => never_op_net_x0,
      din => data_choice_y_net_x2,
      go => register6_q_net_x1,
      init => edge_op_y_net_x4,
      we => we_choice_y_net_x2,
      add => slice2_y_net_x0,
      dout => delay6_q_net_x0,
      status => concat_y_net_x1,
      we_o => logical6_y_net_x0
    );

  basic_ctrl_ffd61ab2af: entity work.basic_ctrl_entity_ffd61ab2af
    port map (
      ce_1 => ce_1_sg_x7,
      clk_1 => clk_1_sg_x7,
      ctrl => adc5g_char_b00_snapshot0_ctrl_user_data_out_net_x1,
      din => cast_dout_net_x1,
      trig => constant1_op_net_x2,
      we => constant3_op_net_x1,
      dout => data_choice_y_net_x2,
      go => register6_q_net_x1,
      init => edge_op_y_net_x4,
      we_o => we_choice_y_net_x2
    );

  bram_06393653e3: entity work.bram_entity_06393653e3
    port map (
      addr => add_del_q_net_x1,
      ce_1 => ce_1_sg_x7,
      clk_1 => clk_1_sg_x7,
      data_in => dat_del_q_net_x0,
      we => we_del_q_net_x0,
      convert_addr_x0 => convert_addr_dout_net_x1,
      convert_din1_x0 => convert_din1_dout_net_x1,
      convert_we_x0 => convert_we_dout_net_x1
    );

  cast: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 128,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 128,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => ri_output_port_net,
      dout => cast_dout_net_x1
    );

  dat_del: entity work.delay_ee0f706095
    port map (
      ce => ce_1_sg_x7,
      clk => clk_1_sg_x7,
      clr => '0',
      d => delay6_q_net_x0,
      q => dat_del_q_net_x0
    );

  never: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => never_op_net_x0
    );

  ri: entity work.reinterpret_28b9ecc6fc
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => concat_y_net_x0,
      output_port => ri_output_port_net
    );

  status_01be868a58: entity work.status_entity_01be868a58
    port map (
      reg_out => concat_y_net_x1,
      convert_x0 => convert_dout_net_x1
    );

  we_del: entity work.delay_9f02caa990
    port map (
      ce => ce_1_sg_x7,
      clk => clk_1_sg_x7,
      clr => '0',
      d(0) => logical6_y_net_x0,
      q(0) => we_del_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "adc5g_char_b00"

entity adc5g_char_b00 is
  port (
    adc5g_char_b00_asiaa_adc5g_sync: in std_logic; 
    adc5g_char_b00_asiaa_adc5g_user_data_i0: in std_logic_vector(7 downto 0); 
    adc5g_char_b00_asiaa_adc5g_user_data_i1: in std_logic_vector(7 downto 0); 
    adc5g_char_b00_asiaa_adc5g_user_data_i2: in std_logic_vector(7 downto 0); 
    adc5g_char_b00_asiaa_adc5g_user_data_i3: in std_logic_vector(7 downto 0); 
    adc5g_char_b00_asiaa_adc5g_user_data_i4: in std_logic_vector(7 downto 0); 
    adc5g_char_b00_asiaa_adc5g_user_data_i5: in std_logic_vector(7 downto 0); 
    adc5g_char_b00_asiaa_adc5g_user_data_i6: in std_logic_vector(7 downto 0); 
    adc5g_char_b00_asiaa_adc5g_user_data_i7: in std_logic_vector(7 downto 0); 
    adc5g_char_b00_asiaa_adc5g_user_data_q0: in std_logic_vector(7 downto 0); 
    adc5g_char_b00_asiaa_adc5g_user_data_q1: in std_logic_vector(7 downto 0); 
    adc5g_char_b00_asiaa_adc5g_user_data_q2: in std_logic_vector(7 downto 0); 
    adc5g_char_b00_asiaa_adc5g_user_data_q3: in std_logic_vector(7 downto 0); 
    adc5g_char_b00_asiaa_adc5g_user_data_q4: in std_logic_vector(7 downto 0); 
    adc5g_char_b00_asiaa_adc5g_user_data_q5: in std_logic_vector(7 downto 0); 
    adc5g_char_b00_asiaa_adc5g_user_data_q6: in std_logic_vector(7 downto 0); 
    adc5g_char_b00_asiaa_adc5g_user_data_q7: in std_logic_vector(7 downto 0); 
    adc5g_char_b00_snapshot0_bram_data_out: in std_logic_vector(127 downto 0); 
    adc5g_char_b00_snapshot0_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    adc5g_char_b00_snapshot0_bram_addr: out std_logic_vector(11 downto 0); 
    adc5g_char_b00_snapshot0_bram_data_in: out std_logic_vector(127 downto 0); 
    adc5g_char_b00_snapshot0_bram_we: out std_logic; 
    adc5g_char_b00_snapshot0_status_user_data_in: out std_logic_vector(31 downto 0)
  );
end adc5g_char_b00;

architecture structural of adc5g_char_b00 is
  attribute core_generation_info: string;
  attribute core_generation_info of structural : architecture is "adc5g_char_b00,sysgen_core_11_3_2055,{total_blocks=427,xilinx_adder_subtracter_block=2,xilinx_arithmetic_relational_operator_block=4,xilinx_binary_shift_operator_block=1,xilinx_bit_slice_extractor_block=26,xilinx_bus_concatenator_block=10,xilinx_bus_multiplexer_block=8,xilinx_constant_block_block=17,xilinx_counter_block=3,xilinx_delay_block=18,xilinx_disregard_subsystem_for_generation_block=1,xilinx_gateway_in_block=22,xilinx_gateway_out_block=5,xilinx_inverter_block=5,xilinx_logical_block_block=10,xilinx_register_block=11,xilinx_single_port_random_access_memory_block=1,xilinx_system_generator_block=1,xilinx_type_converter_block=9,xilinx_type_reinterpreter_block=37,}";

  signal adc5g_char_b00_asiaa_adc5g_sync_net: std_logic;
  signal adc5g_char_b00_asiaa_adc5g_user_data_i0_net: std_logic_vector(7 downto 0);
  signal adc5g_char_b00_asiaa_adc5g_user_data_i1_net: std_logic_vector(7 downto 0);
  signal adc5g_char_b00_asiaa_adc5g_user_data_i2_net: std_logic_vector(7 downto 0);
  signal adc5g_char_b00_asiaa_adc5g_user_data_i3_net: std_logic_vector(7 downto 0);
  signal adc5g_char_b00_asiaa_adc5g_user_data_i4_net: std_logic_vector(7 downto 0);
  signal adc5g_char_b00_asiaa_adc5g_user_data_i5_net: std_logic_vector(7 downto 0);
  signal adc5g_char_b00_asiaa_adc5g_user_data_i6_net: std_logic_vector(7 downto 0);
  signal adc5g_char_b00_asiaa_adc5g_user_data_i7_net: std_logic_vector(7 downto 0);
  signal adc5g_char_b00_asiaa_adc5g_user_data_q0_net: std_logic_vector(7 downto 0);
  signal adc5g_char_b00_asiaa_adc5g_user_data_q1_net: std_logic_vector(7 downto 0);
  signal adc5g_char_b00_asiaa_adc5g_user_data_q2_net: std_logic_vector(7 downto 0);
  signal adc5g_char_b00_asiaa_adc5g_user_data_q3_net: std_logic_vector(7 downto 0);
  signal adc5g_char_b00_asiaa_adc5g_user_data_q4_net: std_logic_vector(7 downto 0);
  signal adc5g_char_b00_asiaa_adc5g_user_data_q5_net: std_logic_vector(7 downto 0);
  signal adc5g_char_b00_asiaa_adc5g_user_data_q6_net: std_logic_vector(7 downto 0);
  signal adc5g_char_b00_asiaa_adc5g_user_data_q7_net: std_logic_vector(7 downto 0);
  signal adc5g_char_b00_snapshot0_bram_addr_net: std_logic_vector(11 downto 0);
  signal adc5g_char_b00_snapshot0_bram_data_in_net: std_logic_vector(127 downto 0);
  signal adc5g_char_b00_snapshot0_bram_data_out_net: std_logic_vector(127 downto 0);
  signal adc5g_char_b00_snapshot0_bram_we_net: std_logic;
  signal adc5g_char_b00_snapshot0_ctrl_user_data_out_net: std_logic_vector(31 downto 0);
  signal adc5g_char_b00_snapshot0_status_user_data_in_net: std_logic_vector(31 downto 0);
  signal ce_1_sg_x8: std_logic;
  signal clk_1_sg_x8: std_logic;
  signal concat_y_net_x0: std_logic_vector(127 downto 0);
  signal constant1_op_net_x2: std_logic;
  signal constant3_op_net_x1: std_logic;

begin
  adc5g_char_b00_asiaa_adc5g_sync_net <= adc5g_char_b00_asiaa_adc5g_sync;
  adc5g_char_b00_asiaa_adc5g_user_data_i0_net <= adc5g_char_b00_asiaa_adc5g_user_data_i0;
  adc5g_char_b00_asiaa_adc5g_user_data_i1_net <= adc5g_char_b00_asiaa_adc5g_user_data_i1;
  adc5g_char_b00_asiaa_adc5g_user_data_i2_net <= adc5g_char_b00_asiaa_adc5g_user_data_i2;
  adc5g_char_b00_asiaa_adc5g_user_data_i3_net <= adc5g_char_b00_asiaa_adc5g_user_data_i3;
  adc5g_char_b00_asiaa_adc5g_user_data_i4_net <= adc5g_char_b00_asiaa_adc5g_user_data_i4;
  adc5g_char_b00_asiaa_adc5g_user_data_i5_net <= adc5g_char_b00_asiaa_adc5g_user_data_i5;
  adc5g_char_b00_asiaa_adc5g_user_data_i6_net <= adc5g_char_b00_asiaa_adc5g_user_data_i6;
  adc5g_char_b00_asiaa_adc5g_user_data_i7_net <= adc5g_char_b00_asiaa_adc5g_user_data_i7;
  adc5g_char_b00_asiaa_adc5g_user_data_q0_net <= adc5g_char_b00_asiaa_adc5g_user_data_q0;
  adc5g_char_b00_asiaa_adc5g_user_data_q1_net <= adc5g_char_b00_asiaa_adc5g_user_data_q1;
  adc5g_char_b00_asiaa_adc5g_user_data_q2_net <= adc5g_char_b00_asiaa_adc5g_user_data_q2;
  adc5g_char_b00_asiaa_adc5g_user_data_q3_net <= adc5g_char_b00_asiaa_adc5g_user_data_q3;
  adc5g_char_b00_asiaa_adc5g_user_data_q4_net <= adc5g_char_b00_asiaa_adc5g_user_data_q4;
  adc5g_char_b00_asiaa_adc5g_user_data_q5_net <= adc5g_char_b00_asiaa_adc5g_user_data_q5;
  adc5g_char_b00_asiaa_adc5g_user_data_q6_net <= adc5g_char_b00_asiaa_adc5g_user_data_q6;
  adc5g_char_b00_asiaa_adc5g_user_data_q7_net <= adc5g_char_b00_asiaa_adc5g_user_data_q7;
  adc5g_char_b00_snapshot0_bram_data_out_net <= adc5g_char_b00_snapshot0_bram_data_out;
  adc5g_char_b00_snapshot0_ctrl_user_data_out_net <= adc5g_char_b00_snapshot0_ctrl_user_data_out;
  ce_1_sg_x8 <= ce_1;
  clk_1_sg_x8 <= clk_1;
  adc5g_char_b00_snapshot0_bram_addr <= adc5g_char_b00_snapshot0_bram_addr_net;
  adc5g_char_b00_snapshot0_bram_data_in <= adc5g_char_b00_snapshot0_bram_data_in_net;
  adc5g_char_b00_snapshot0_bram_we <= adc5g_char_b00_snapshot0_bram_we_net;
  adc5g_char_b00_snapshot0_status_user_data_in <= adc5g_char_b00_snapshot0_status_user_data_in_net;

  concat: entity work.concat_96b2f1cb93
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => adc5g_char_b00_asiaa_adc5g_user_data_i0_net,
      in1 => adc5g_char_b00_asiaa_adc5g_user_data_i1_net,
      in10 => adc5g_char_b00_asiaa_adc5g_user_data_q2_net,
      in11 => adc5g_char_b00_asiaa_adc5g_user_data_q3_net,
      in12 => adc5g_char_b00_asiaa_adc5g_user_data_q4_net,
      in13 => adc5g_char_b00_asiaa_adc5g_user_data_q5_net,
      in14 => adc5g_char_b00_asiaa_adc5g_user_data_q6_net,
      in15 => adc5g_char_b00_asiaa_adc5g_user_data_q7_net,
      in2 => adc5g_char_b00_asiaa_adc5g_user_data_i2_net,
      in3 => adc5g_char_b00_asiaa_adc5g_user_data_i3_net,
      in4 => adc5g_char_b00_asiaa_adc5g_user_data_i4_net,
      in5 => adc5g_char_b00_asiaa_adc5g_user_data_i5_net,
      in6 => adc5g_char_b00_asiaa_adc5g_user_data_i6_net,
      in7 => adc5g_char_b00_asiaa_adc5g_user_data_i7_net,
      in8 => adc5g_char_b00_asiaa_adc5g_user_data_q0_net,
      in9 => adc5g_char_b00_asiaa_adc5g_user_data_q1_net,
      y => concat_y_net_x0
    );

  constant1: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant1_op_net_x2
    );

  constant3: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant3_op_net_x1
    );

  snapshot0_33718b74d5: entity work.snapshot0_entity_33718b74d5
    port map (
      adc5g_char_b00_snapshot0_ctrl_user_data_out => adc5g_char_b00_snapshot0_ctrl_user_data_out_net,
      ce_1 => ce_1_sg_x8,
      clk_1 => clk_1_sg_x8,
      din => concat_y_net_x0,
      trig => constant1_op_net_x2,
      we => constant3_op_net_x1,
      bram => adc5g_char_b00_snapshot0_bram_addr_net,
      bram_x0 => adc5g_char_b00_snapshot0_bram_data_in_net,
      bram_x1 => adc5g_char_b00_snapshot0_bram_we_net,
      status => adc5g_char_b00_snapshot0_status_user_data_in_net
    );

end structural;
