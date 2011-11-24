#
# Created by System Generator     Wed Nov 16 16:35:56 2011
#
# Note: This file is produced automatically, and will be overwritten the next
# time you press "Generate" in System Generator.
#

source SgIseProject.tcl

namespace eval ::xilinx::dsptool::iseproject::param {

    set Project {adc5g_char_b00_cw}
    set Family {Virtex5}
    set Device {xc5vsx95t}
    set Package {ff1136}
    set Speed {-1}
    set HDLLanguage {vhdl}
    set SynthesisTool {XST}
    set Simulator {Modelsim-SE}
    set ReadCores False
    set MapEffortLevel {High}
    set ParEffortLevel {High}
    set Frequency {100}
    set ProjectFiles {
        {{adc5g_char_b00_cw.vhd} -view Implementation}
        {{adc5g_char_b00.vhd} -view Implementation}
        {{adc5g_char_b00_cw.ucf}}
        {{/export/home/blink/scratch/models/adc5g_char_b00.mdl}}
    }
    set TopLevelModule {adc5g_char_b00_cw}
    set SynthesisConstraintsFile {adc5g_char_b00_cw.xcf}
    set ImplementationStopView {Structural}
    set ProjectGenerator {SysgenDSP}
}
::xilinx::dsptool::iseproject::create
