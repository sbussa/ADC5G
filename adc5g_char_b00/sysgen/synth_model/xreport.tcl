if {[file exists {adc5g_char_b00_cw.ise}] && [file exists {adc5g_char_b00_cw.xise}] && [file exists {adc5g_char_b00_cw.gise}]} {
    project open {adc5g_char_b00_cw}
} else {
    file delete {adc5g_char_b00_cw.ise} {adc5g_char_b00_cw.xise} {adc5g_char_b00_cw.gise}
    project new {adc5g_char_b00_cw}
}
project set "Enable Enhanced Design Summary" true
project set "Enable Message Filtering" true
project set "Display Incremental Messages" true
project set "Message Filter File" {../filter.filter}
project close
