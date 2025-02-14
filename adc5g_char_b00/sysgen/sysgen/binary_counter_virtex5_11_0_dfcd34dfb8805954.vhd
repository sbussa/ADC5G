--------------------------------------------------------------------------------
--     This file is owned and controlled by Xilinx and must be used           --
--     solely for design, simulation, implementation and creation of          --
--     design files limited to Xilinx devices or technologies. Use            --
--     with non-Xilinx devices or technologies is expressly prohibited        --
--     and immediately terminates your license.                               --
--                                                                            --
--     XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"          --
--     SOLELY FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR                --
--     XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION        --
--     AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE, APPLICATION            --
--     OR STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS              --
--     IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,                --
--     AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE       --
--     FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY               --
--     WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE                --
--     IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR         --
--     REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF        --
--     INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS        --
--     FOR A PARTICULAR PURPOSE.                                              --
--                                                                            --
--     Xilinx products are not intended for use in life support               --
--     appliances, devices, or systems. Use in such applications are          --
--     expressly prohibited.                                                  --
--                                                                            --
--     (c) Copyright 1995-2009 Xilinx, Inc.                                   --
--     All rights reserved.                                                   --
--------------------------------------------------------------------------------
-- You must compile the wrapper file binary_counter_virtex5_11_0_dfcd34dfb8805954.vhd when simulating
-- the core, binary_counter_virtex5_11_0_dfcd34dfb8805954. When compiling the wrapper file, be sure to
-- reference the XilinxCoreLib VHDL simulation library. For detailed
-- instructions, please refer to the "CORE Generator Help".

-- The synthesis directives "translate_off/translate_on" specified
-- below are supported by Xilinx, Mentor Graphics and Synplicity
-- synthesis tools. Ensure they are correct for your synthesis tool(s).

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- synthesis translate_off
Library XilinxCoreLib;
-- synthesis translate_on
ENTITY binary_counter_virtex5_11_0_dfcd34dfb8805954 IS
	port (
	clk: IN std_logic;
	ce: IN std_logic;
	sinit: IN std_logic;
	q: OUT std_logic_VECTOR(1 downto 0));
END binary_counter_virtex5_11_0_dfcd34dfb8805954;

ARCHITECTURE binary_counter_virtex5_11_0_dfcd34dfb8805954_a OF binary_counter_virtex5_11_0_dfcd34dfb8805954 IS
-- synthesis translate_off
component wrapped_binary_counter_virtex5_11_0_dfcd34dfb8805954
	port (
	clk: IN std_logic;
	ce: IN std_logic;
	sinit: IN std_logic;
	q: OUT std_logic_VECTOR(1 downto 0));
end component;

-- Configuration specification 
	for all : wrapped_binary_counter_virtex5_11_0_dfcd34dfb8805954 use entity XilinxCoreLib.c_counter_binary_v11_0(behavioral)
		generic map(
			c_count_mode => 0,
			c_load_low => 0,
			c_count_to => "1",
			c_implementation => 0,
			c_has_sclr => 0,
			c_ce_overrides_sync => 0,
			c_restrict_count => 0,
			c_width => 2,
			c_verbosity => 0,
			c_has_load => 0,
			c_latency => 1,
			c_has_thresh0 => 0,
			c_ainit_val => "0",
			c_has_ce => 1,
			c_sclr_overrides_sset => 1,
			c_fb_latency => 0,
			c_sinit_val => "0",
			c_has_sset => 0,
			c_has_sinit => 1,
			c_count_by => "1",
			c_xdevicefamily => "virtex5",
			c_thresh0_value => "1");
-- synthesis translate_on
BEGIN
-- synthesis translate_off
U0 : wrapped_binary_counter_virtex5_11_0_dfcd34dfb8805954
		port map (
			clk => clk,
			ce => ce,
			sinit => sinit,
			q => q);
-- synthesis translate_on

END binary_counter_virtex5_11_0_dfcd34dfb8805954_a;

