create_clock -name ap_clk -period 7.000 -waveform {0.000 3.500} [get_ports ap_clk]

#set_input_delay 0 -clock CLK  [all_inputs]
#set_output_delay 0 -clock CLK [all_outputs]

set_false_path -from [get_cells erode_hls_CONTROL_BUS_s_axi_U/int_rows_reg[*]]
set_false_path -from [get_cells erode_hls_CONTROL_BUS_s_axi_U/int_cols_reg[*]]
set_false_path -from [get_cells erode_hls_CONTROL_BUS_s_axi_U/int_channels_reg[*]]
set_false_path -from [get_cells erode_hls_CONTROL_BUS_s_axi_U/int_mode_reg[*]]

