import corr
fpga=corr.katcp_wrapper.FpgaClient('169.254.128.41',7147)
fpga.progdev('')
fpga.progdev('adc5g_char_b00_2011_Nov_16_1619.bof')

fpga.write_int('snapshot0_ctrl',1)
a=fpga.snapshot_get('snapshot0')
b=a['data']

file=open('filename.bin','wb')
file.write(b)
file.close()