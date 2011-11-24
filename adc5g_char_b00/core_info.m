% adc5g_char_b00/XSG core config
adc5g_char_b00_XSG_core_config_type         = 'xps_xsg';
adc5g_char_b00_XSG_core_config_param        = '';

% adc5g_char_b00/asiaa_adc5g
adc5g_char_b00_asiaa_adc5g_type         = 'xps_adc5g';
adc5g_char_b00_asiaa_adc5g_param        = '';
adc5g_char_b00_asiaa_adc5g_ip_name      = 'adc5g_dmux1_interface';

% adc5g_char_b00/snapshot0/bram
adc5g_char_b00_snapshot0_bram_type         = 'xps_bram';
adc5g_char_b00_snapshot0_bram_param        = '16384';
adc5g_char_b00_snapshot0_bram_ip_name      = 'bram_if';
adc5g_char_b00_snapshot0_bram_addr_start   = hex2dec('01000000');
adc5g_char_b00_snapshot0_bram_addr_end     = hex2dec('0100FFFF');

% adc5g_char_b00/snapshot0/ctrl
adc5g_char_b00_snapshot0_ctrl_type         = 'xps_sw_reg';
adc5g_char_b00_snapshot0_ctrl_param        = 'in';
adc5g_char_b00_snapshot0_ctrl_ip_name      = 'opb_register_ppc2simulink';
adc5g_char_b00_snapshot0_ctrl_addr_start   = hex2dec('01010000');
adc5g_char_b00_snapshot0_ctrl_addr_end     = hex2dec('010100FF');

% adc5g_char_b00/snapshot0/status
adc5g_char_b00_snapshot0_status_type         = 'xps_sw_reg';
adc5g_char_b00_snapshot0_status_param        = 'out';
adc5g_char_b00_snapshot0_status_ip_name      = 'opb_register_simulink2ppc';
adc5g_char_b00_snapshot0_status_addr_start   = hex2dec('01010100');
adc5g_char_b00_snapshot0_status_addr_end     = hex2dec('010101FF');

