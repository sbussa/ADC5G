-- If you see error messages concerning missing libraries for
-- XilinxCoreLib, unisims, or simprims, you may not have set
-- up your ModelSim environment correctly.  See the Xilinx
-- Support Website for instructions telling how to compile
-- these libraries.

vlib work

vcom  -nowarn 1 -novopt adc5g_char_b00.vhd
vcom  -nowarn 1 -novopt adc5g_char_b00_cw.vhd
