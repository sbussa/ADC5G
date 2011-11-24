copy implementation\system.bit ..\bit_files\adc5g_char_b00_2011_Nov_16_1636.bit
mkbof.exe -o implementation\system.bof -s core_info.tab -t 3 implementation\system.bin
copy implementation\system.bof ..\bit_files\adc5g_char_b00_2011_Nov_16_1636.bof
