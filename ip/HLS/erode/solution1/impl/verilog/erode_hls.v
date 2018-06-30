// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.4
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="erode_hls,hls_ip_2017_4,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg400-1,HLS_INPUT_CLOCK=6.000000,HLS_INPUT_ARCH=dataflow,HLS_SYN_CLOCK=5.250000,HLS_SYN_LAT=-1,HLS_SYN_TPT=-1,HLS_SYN_MEM=3,HLS_SYN_DSP=12,HLS_SYN_FF=2361,HLS_SYN_LUT=3516}" *)

module erode_hls (
        s_axi_CONTROL_BUS_AWVALID,
        s_axi_CONTROL_BUS_AWREADY,
        s_axi_CONTROL_BUS_AWADDR,
        s_axi_CONTROL_BUS_WVALID,
        s_axi_CONTROL_BUS_WREADY,
        s_axi_CONTROL_BUS_WDATA,
        s_axi_CONTROL_BUS_WSTRB,
        s_axi_CONTROL_BUS_ARVALID,
        s_axi_CONTROL_BUS_ARREADY,
        s_axi_CONTROL_BUS_ARADDR,
        s_axi_CONTROL_BUS_RVALID,
        s_axi_CONTROL_BUS_RREADY,
        s_axi_CONTROL_BUS_RDATA,
        s_axi_CONTROL_BUS_RRESP,
        s_axi_CONTROL_BUS_BVALID,
        s_axi_CONTROL_BUS_BREADY,
        s_axi_CONTROL_BUS_BRESP,
        ap_clk,
        ap_rst_n,
        interrupt,
        AXI_LITE_clk,
        ap_rst_n_AXI_LITE_clk,
        in_stream_TDATA,
        in_stream_TUSER,
        in_stream_TLAST,
        out_stream_TDATA,
        out_stream_TUSER,
        out_stream_TLAST,
        in_stream_TVALID,
        in_stream_TREADY,
        out_stream_TVALID,
        out_stream_TREADY
);

parameter    C_S_AXI_CONTROL_BUS_DATA_WIDTH = 32;
parameter    C_S_AXI_CONTROL_BUS_ADDR_WIDTH = 6;
parameter    C_S_AXI_DATA_WIDTH = 32;
parameter    C_S_AXI_ADDR_WIDTH = 32;

parameter C_S_AXI_CONTROL_BUS_WSTRB_WIDTH = (32 / 8);
parameter C_S_AXI_WSTRB_WIDTH = (32 / 8);

input   s_axi_CONTROL_BUS_AWVALID;
output   s_axi_CONTROL_BUS_AWREADY;
input  [C_S_AXI_CONTROL_BUS_ADDR_WIDTH - 1:0] s_axi_CONTROL_BUS_AWADDR;
input   s_axi_CONTROL_BUS_WVALID;
output   s_axi_CONTROL_BUS_WREADY;
input  [C_S_AXI_CONTROL_BUS_DATA_WIDTH - 1:0] s_axi_CONTROL_BUS_WDATA;
input  [C_S_AXI_CONTROL_BUS_WSTRB_WIDTH - 1:0] s_axi_CONTROL_BUS_WSTRB;
input   s_axi_CONTROL_BUS_ARVALID;
output   s_axi_CONTROL_BUS_ARREADY;
input  [C_S_AXI_CONTROL_BUS_ADDR_WIDTH - 1:0] s_axi_CONTROL_BUS_ARADDR;
output   s_axi_CONTROL_BUS_RVALID;
input   s_axi_CONTROL_BUS_RREADY;
output  [C_S_AXI_CONTROL_BUS_DATA_WIDTH - 1:0] s_axi_CONTROL_BUS_RDATA;
output  [1:0] s_axi_CONTROL_BUS_RRESP;
output   s_axi_CONTROL_BUS_BVALID;
input   s_axi_CONTROL_BUS_BREADY;
output  [1:0] s_axi_CONTROL_BUS_BRESP;
input   ap_clk;
input   ap_rst_n;
output   interrupt;
input   AXI_LITE_clk;
input   ap_rst_n_AXI_LITE_clk;
input  [31:0] in_stream_TDATA;
input  [0:0] in_stream_TUSER;
input  [0:0] in_stream_TLAST;
output  [31:0] out_stream_TDATA;
output  [0:0] out_stream_TUSER;
output  [0:0] out_stream_TLAST;
input   in_stream_TVALID;
output   in_stream_TREADY;
output   out_stream_TVALID;
input   out_stream_TREADY;

reg    ap_rst_n_inv;
wire   [31:0] rows;
wire   [31:0] cols;
wire   [31:0] channels;
wire   [31:0] mode;
wire    ap_start;
wire    ap_ready;
wire    ap_done;
wire    ap_idle;
reg    ap_rst_n_AXI_LITE_clk_inv;
wire    Block_Mat_exit406734_U0_ap_start;
wire    Block_Mat_exit406734_U0_ap_done;
wire    Block_Mat_exit406734_U0_ap_continue;
wire    Block_Mat_exit406734_U0_ap_idle;
wire    Block_Mat_exit406734_U0_ap_ready;
wire   [30:0] Block_Mat_exit406734_U0_col_packets_out_out_din;
wire    Block_Mat_exit406734_U0_col_packets_out_out_write;
wire   [29:0] Block_Mat_exit406734_U0_col_packets_cast_out_out_din;
wire    Block_Mat_exit406734_U0_col_packets_cast_out_out_write;
wire   [31:0] Block_Mat_exit406734_U0_ap_return;
wire    ap_channel_done_packets_loc_channel;
wire    packets_loc_channel_full_n;
wire    Loop_1_proc_U0_ap_start;
wire    Loop_1_proc_U0_ap_done;
wire    Loop_1_proc_U0_ap_continue;
wire    Loop_1_proc_U0_ap_idle;
wire    Loop_1_proc_U0_ap_ready;
wire    Loop_1_proc_U0_in_stream_TREADY;
wire   [7:0] Loop_1_proc_U0_g_img_0_data_stream_0_V_din;
wire    Loop_1_proc_U0_g_img_0_data_stream_0_V_write;
wire    Block_arrayctor_loop_U0_ap_start;
wire    Block_arrayctor_loop_U0_ap_done;
wire    Block_arrayctor_loop_U0_ap_continue;
wire    Block_arrayctor_loop_U0_ap_idle;
wire    Block_arrayctor_loop_U0_ap_ready;
wire   [0:0] Block_arrayctor_loop_U0_switch_out_out_din;
wire    Block_arrayctor_loop_U0_switch_out_out_write;
wire   [10:0] Block_arrayctor_loop_U0_tmp_out_out_din;
wire    Block_arrayctor_loop_U0_tmp_out_out_write;
wire   [10:0] Block_arrayctor_loop_U0_rows_cast727_out_out_din;
wire    Block_arrayctor_loop_U0_rows_cast727_out_out_write;
wire   [10:0] Block_arrayctor_loop_U0_tmp_15_out_out_din;
wire    Block_arrayctor_loop_U0_tmp_15_out_out_write;
wire   [10:0] Block_arrayctor_loop_U0_tmp_16_out_out_din;
wire    Block_arrayctor_loop_U0_tmp_16_out_out_write;
wire   [10:0] Block_arrayctor_loop_U0_tmp_16_cast_out_out_din;
wire    Block_arrayctor_loop_U0_tmp_16_cast_out_out_write;
wire   [10:0] Block_arrayctor_loop_U0_p_neg393_i_out_out_din;
wire    Block_arrayctor_loop_U0_p_neg393_i_out_out_write;
wire   [10:0] Block_arrayctor_loop_U0_p_neg393_i_cast_out_out_din;
wire    Block_arrayctor_loop_U0_p_neg393_i_cast_out_out_write;
wire    Loop_loop_height_pro_U0_ap_start;
wire    Loop_loop_height_pro_U0_ap_done;
wire    Loop_loop_height_pro_U0_ap_continue;
wire    Loop_loop_height_pro_U0_ap_idle;
wire    Loop_loop_height_pro_U0_ap_ready;
wire    Loop_loop_height_pro_U0_tmp_15_loc_read;
wire    Loop_loop_height_pro_U0_tmp_loc_read;
wire    Loop_loop_height_pro_U0_rows_cast727_loc_read;
wire    Loop_loop_height_pro_U0_p_neg393_i_loc_read;
wire    Loop_loop_height_pro_U0_p_neg393_i_cast_loc_read;
wire    Loop_loop_height_pro_U0_tmp_16_cast_loc_read;
wire    Loop_loop_height_pro_U0_tmp_16_loc_read;
wire    Loop_loop_height_pro_U0_g_img_0_data_stream_0_V_read;
wire   [7:0] Loop_loop_height_pro_U0_g_img_1_data_stream_0_V_din;
wire    Loop_loop_height_pro_U0_g_img_1_data_stream_0_V_write;
wire    Loop_loop_height_pro_U0_switch_loc_read;
wire   [10:0] Loop_loop_height_pro_U0_p_neg393_i_loc_out_din;
wire    Loop_loop_height_pro_U0_p_neg393_i_loc_out_write;
wire    Loop_3_proc_U0_ap_start;
wire    Loop_3_proc_U0_ap_done;
wire    Loop_3_proc_U0_ap_continue;
wire    Loop_3_proc_U0_ap_idle;
wire    Loop_3_proc_U0_ap_ready;
wire    Loop_3_proc_U0_col_packets_loc_read;
wire   [31:0] Loop_3_proc_U0_out_stream_TDATA;
wire    Loop_3_proc_U0_out_stream_TVALID;
wire    Loop_3_proc_U0_p_neg393_i_loc_read;
wire    Loop_3_proc_U0_g_img_1_data_stream_0_V_read;
wire   [0:0] Loop_3_proc_U0_out_stream_TUSER;
wire   [0:0] Loop_3_proc_U0_out_stream_TLAST;
wire    ap_sync_continue;
wire    col_packets_loc_c_full_n;
wire   [30:0] col_packets_loc_c_dout;
wire    col_packets_loc_c_empty_n;
wire   [31:0] packets_loc_channel_dout;
wire    packets_loc_channel_empty_n;
wire    g_img_0_data_stream_s_full_n;
wire   [7:0] g_img_0_data_stream_s_dout;
wire    g_img_0_data_stream_s_empty_n;
wire    switch_loc_c_full_n;
wire   [0:0] switch_loc_c_dout;
wire    switch_loc_c_empty_n;
wire    tmp_loc_c_full_n;
wire   [10:0] tmp_loc_c_dout;
wire    tmp_loc_c_empty_n;
wire    rows_cast727_loc_c_full_n;
wire   [10:0] rows_cast727_loc_c_dout;
wire    rows_cast727_loc_c_empty_n;
wire    tmp_15_loc_c_full_n;
wire   [10:0] tmp_15_loc_c_dout;
wire    tmp_15_loc_c_empty_n;
wire    tmp_16_loc_c_full_n;
wire   [10:0] tmp_16_loc_c_dout;
wire    tmp_16_loc_c_empty_n;
wire    tmp_16_cast_loc_c_full_n;
wire   [10:0] tmp_16_cast_loc_c_dout;
wire    tmp_16_cast_loc_c_empty_n;
wire    p_neg393_i_loc_c_full_n;
wire   [10:0] p_neg393_i_loc_c_dout;
wire    p_neg393_i_loc_c_empty_n;
wire    p_neg393_i_cast_loc_c_full_n;
wire   [10:0] p_neg393_i_cast_loc_c_dout;
wire    p_neg393_i_cast_loc_c_empty_n;
wire    g_img_1_data_stream_s_full_n;
wire   [7:0] g_img_1_data_stream_s_dout;
wire    g_img_1_data_stream_s_empty_n;
wire    p_neg393_i_loc_c757_full_n;
wire   [10:0] p_neg393_i_loc_c757_dout;
wire    p_neg393_i_loc_c757_empty_n;
wire    ap_sync_done;
wire    ap_sync_ready;
reg    ap_sync_reg_Loop_1_proc_U0_ap_ready;
wire    ap_sync_Loop_1_proc_U0_ap_ready;
reg   [1:0] Loop_1_proc_U0_ap_ready_count;
reg    ap_sync_reg_Block_Mat_exit406734_U0_ap_ready;
wire    ap_sync_Block_Mat_exit406734_U0_ap_ready;
reg   [1:0] Block_Mat_exit406734_U0_ap_ready_count;
reg    ap_sync_reg_Block_arrayctor_loop_U0_ap_ready;
wire    ap_sync_Block_arrayctor_loop_U0_ap_ready;
reg   [1:0] Block_arrayctor_loop_U0_ap_ready_count;
wire    Block_Mat_exit406734_U0_start_full_n;
wire    Block_Mat_exit406734_U0_start_write;
wire    Loop_1_proc_U0_start_full_n;
wire    Loop_1_proc_U0_start_write;
wire    Block_arrayctor_loop_U0_start_full_n;
wire    Block_arrayctor_loop_U0_start_write;
wire    Loop_loop_height_pro_U0_start_full_n;
wire    Loop_loop_height_pro_U0_start_write;
wire    Loop_3_proc_U0_start_full_n;
wire    Loop_3_proc_U0_start_write;

// power-on initialization
initial begin
#0 ap_sync_reg_Loop_1_proc_U0_ap_ready = 1'b0;
#0 Loop_1_proc_U0_ap_ready_count = 2'd0;
#0 ap_sync_reg_Block_Mat_exit406734_U0_ap_ready = 1'b0;
#0 Block_Mat_exit406734_U0_ap_ready_count = 2'd0;
#0 ap_sync_reg_Block_arrayctor_loop_U0_ap_ready = 1'b0;
#0 Block_arrayctor_loop_U0_ap_ready_count = 2'd0;
end

erode_hls_CONTROL_BUS_s_axi #(
    .C_S_AXI_ADDR_WIDTH( C_S_AXI_CONTROL_BUS_ADDR_WIDTH ),
    .C_S_AXI_DATA_WIDTH( C_S_AXI_CONTROL_BUS_DATA_WIDTH ))
erode_hls_CONTROL_BUS_s_axi_U(
    .AWVALID(s_axi_CONTROL_BUS_AWVALID),
    .AWREADY(s_axi_CONTROL_BUS_AWREADY),
    .AWADDR(s_axi_CONTROL_BUS_AWADDR),
    .WVALID(s_axi_CONTROL_BUS_WVALID),
    .WREADY(s_axi_CONTROL_BUS_WREADY),
    .WDATA(s_axi_CONTROL_BUS_WDATA),
    .WSTRB(s_axi_CONTROL_BUS_WSTRB),
    .ARVALID(s_axi_CONTROL_BUS_ARVALID),
    .ARREADY(s_axi_CONTROL_BUS_ARREADY),
    .ARADDR(s_axi_CONTROL_BUS_ARADDR),
    .RVALID(s_axi_CONTROL_BUS_RVALID),
    .RREADY(s_axi_CONTROL_BUS_RREADY),
    .RDATA(s_axi_CONTROL_BUS_RDATA),
    .RRESP(s_axi_CONTROL_BUS_RRESP),
    .BVALID(s_axi_CONTROL_BUS_BVALID),
    .BREADY(s_axi_CONTROL_BUS_BREADY),
    .BRESP(s_axi_CONTROL_BUS_BRESP),
    .ACLK(AXI_LITE_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .rows(rows),
    .cols(cols),
    .channels(channels),
    .mode(mode),
    .ap_start(ap_start),
    .interrupt(interrupt),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .clk(ap_clk),
    .rst(ap_rst_n_AXI_LITE_clk_inv)
);

Block_Mat_exit406734_erode Block_Mat_exit406734_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(Block_Mat_exit406734_U0_ap_start),
    .ap_done(Block_Mat_exit406734_U0_ap_done),
    .ap_continue(Block_Mat_exit406734_U0_ap_continue),
    .ap_idle(Block_Mat_exit406734_U0_ap_idle),
    .ap_ready(Block_Mat_exit406734_U0_ap_ready),
    .rows(rows),
    .cols(cols),
    .channels(channels),
    .col_packets_out_out_din(Block_Mat_exit406734_U0_col_packets_out_out_din),
    .col_packets_out_out_full_n(col_packets_loc_c_full_n),
    .col_packets_out_out_write(Block_Mat_exit406734_U0_col_packets_out_out_write),
    .col_packets_cast_out_out_din(Block_Mat_exit406734_U0_col_packets_cast_out_out_din),
    .col_packets_cast_out_out_full_n(1'b1),
    .col_packets_cast_out_out_write(Block_Mat_exit406734_U0_col_packets_cast_out_out_write),
    .ap_return(Block_Mat_exit406734_U0_ap_return)
);

Loop_1_proc_erode Loop_1_proc_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(Loop_1_proc_U0_ap_start),
    .ap_done(Loop_1_proc_U0_ap_done),
    .ap_continue(Loop_1_proc_U0_ap_continue),
    .ap_idle(Loop_1_proc_U0_ap_idle),
    .ap_ready(Loop_1_proc_U0_ap_ready),
    .p_read(packets_loc_channel_dout),
    .in_stream_TDATA(in_stream_TDATA),
    .in_stream_TVALID(in_stream_TVALID),
    .in_stream_TREADY(Loop_1_proc_U0_in_stream_TREADY),
    .g_img_0_data_stream_0_V_din(Loop_1_proc_U0_g_img_0_data_stream_0_V_din),
    .g_img_0_data_stream_0_V_full_n(g_img_0_data_stream_s_full_n),
    .g_img_0_data_stream_0_V_write(Loop_1_proc_U0_g_img_0_data_stream_0_V_write)
);

Block_arrayctor_loop Block_arrayctor_loop_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(Block_arrayctor_loop_U0_ap_start),
    .ap_done(Block_arrayctor_loop_U0_ap_done),
    .ap_continue(Block_arrayctor_loop_U0_ap_continue),
    .ap_idle(Block_arrayctor_loop_U0_ap_idle),
    .ap_ready(Block_arrayctor_loop_U0_ap_ready),
    .mode(mode),
    .cols(cols),
    .rows(rows),
    .switch_out_out_din(Block_arrayctor_loop_U0_switch_out_out_din),
    .switch_out_out_full_n(switch_loc_c_full_n),
    .switch_out_out_write(Block_arrayctor_loop_U0_switch_out_out_write),
    .tmp_out_out_din(Block_arrayctor_loop_U0_tmp_out_out_din),
    .tmp_out_out_full_n(tmp_loc_c_full_n),
    .tmp_out_out_write(Block_arrayctor_loop_U0_tmp_out_out_write),
    .rows_cast727_out_out_din(Block_arrayctor_loop_U0_rows_cast727_out_out_din),
    .rows_cast727_out_out_full_n(rows_cast727_loc_c_full_n),
    .rows_cast727_out_out_write(Block_arrayctor_loop_U0_rows_cast727_out_out_write),
    .tmp_15_out_out_din(Block_arrayctor_loop_U0_tmp_15_out_out_din),
    .tmp_15_out_out_full_n(tmp_15_loc_c_full_n),
    .tmp_15_out_out_write(Block_arrayctor_loop_U0_tmp_15_out_out_write),
    .tmp_16_out_out_din(Block_arrayctor_loop_U0_tmp_16_out_out_din),
    .tmp_16_out_out_full_n(tmp_16_loc_c_full_n),
    .tmp_16_out_out_write(Block_arrayctor_loop_U0_tmp_16_out_out_write),
    .tmp_16_cast_out_out_din(Block_arrayctor_loop_U0_tmp_16_cast_out_out_din),
    .tmp_16_cast_out_out_full_n(tmp_16_cast_loc_c_full_n),
    .tmp_16_cast_out_out_write(Block_arrayctor_loop_U0_tmp_16_cast_out_out_write),
    .p_neg393_i_out_out_din(Block_arrayctor_loop_U0_p_neg393_i_out_out_din),
    .p_neg393_i_out_out_full_n(p_neg393_i_loc_c_full_n),
    .p_neg393_i_out_out_write(Block_arrayctor_loop_U0_p_neg393_i_out_out_write),
    .p_neg393_i_cast_out_out_din(Block_arrayctor_loop_U0_p_neg393_i_cast_out_out_din),
    .p_neg393_i_cast_out_out_full_n(p_neg393_i_cast_loc_c_full_n),
    .p_neg393_i_cast_out_out_write(Block_arrayctor_loop_U0_p_neg393_i_cast_out_out_write)
);

Loop_loop_height_pro_erode Loop_loop_height_pro_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(Loop_loop_height_pro_U0_ap_start),
    .ap_done(Loop_loop_height_pro_U0_ap_done),
    .ap_continue(Loop_loop_height_pro_U0_ap_continue),
    .ap_idle(Loop_loop_height_pro_U0_ap_idle),
    .ap_ready(Loop_loop_height_pro_U0_ap_ready),
    .tmp_15_loc_dout(tmp_15_loc_c_dout),
    .tmp_15_loc_empty_n(tmp_15_loc_c_empty_n),
    .tmp_15_loc_read(Loop_loop_height_pro_U0_tmp_15_loc_read),
    .tmp_loc_dout(tmp_loc_c_dout),
    .tmp_loc_empty_n(tmp_loc_c_empty_n),
    .tmp_loc_read(Loop_loop_height_pro_U0_tmp_loc_read),
    .rows_cast727_loc_dout(rows_cast727_loc_c_dout),
    .rows_cast727_loc_empty_n(rows_cast727_loc_c_empty_n),
    .rows_cast727_loc_read(Loop_loop_height_pro_U0_rows_cast727_loc_read),
    .p_neg393_i_loc_dout(p_neg393_i_loc_c_dout),
    .p_neg393_i_loc_empty_n(p_neg393_i_loc_c_empty_n),
    .p_neg393_i_loc_read(Loop_loop_height_pro_U0_p_neg393_i_loc_read),
    .rows(rows),
    .p_neg393_i_cast_loc_dout(p_neg393_i_cast_loc_c_dout),
    .p_neg393_i_cast_loc_empty_n(p_neg393_i_cast_loc_c_empty_n),
    .p_neg393_i_cast_loc_read(Loop_loop_height_pro_U0_p_neg393_i_cast_loc_read),
    .tmp_16_cast_loc_dout(tmp_16_cast_loc_c_dout),
    .tmp_16_cast_loc_empty_n(tmp_16_cast_loc_c_empty_n),
    .tmp_16_cast_loc_read(Loop_loop_height_pro_U0_tmp_16_cast_loc_read),
    .cols(cols),
    .tmp_16_loc_dout(tmp_16_loc_c_dout),
    .tmp_16_loc_empty_n(tmp_16_loc_c_empty_n),
    .tmp_16_loc_read(Loop_loop_height_pro_U0_tmp_16_loc_read),
    .g_img_0_data_stream_0_V_dout(g_img_0_data_stream_s_dout),
    .g_img_0_data_stream_0_V_empty_n(g_img_0_data_stream_s_empty_n),
    .g_img_0_data_stream_0_V_read(Loop_loop_height_pro_U0_g_img_0_data_stream_0_V_read),
    .g_img_1_data_stream_0_V_din(Loop_loop_height_pro_U0_g_img_1_data_stream_0_V_din),
    .g_img_1_data_stream_0_V_full_n(g_img_1_data_stream_s_full_n),
    .g_img_1_data_stream_0_V_write(Loop_loop_height_pro_U0_g_img_1_data_stream_0_V_write),
    .switch_loc_dout(switch_loc_c_dout),
    .switch_loc_empty_n(switch_loc_c_empty_n),
    .switch_loc_read(Loop_loop_height_pro_U0_switch_loc_read),
    .p_neg393_i_loc_out_din(Loop_loop_height_pro_U0_p_neg393_i_loc_out_din),
    .p_neg393_i_loc_out_full_n(p_neg393_i_loc_c757_full_n),
    .p_neg393_i_loc_out_write(Loop_loop_height_pro_U0_p_neg393_i_loc_out_write)
);

Loop_3_proc_erode Loop_3_proc_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(Loop_3_proc_U0_ap_start),
    .ap_done(Loop_3_proc_U0_ap_done),
    .ap_continue(Loop_3_proc_U0_ap_continue),
    .ap_idle(Loop_3_proc_U0_ap_idle),
    .ap_ready(Loop_3_proc_U0_ap_ready),
    .col_packets_loc_dout(col_packets_loc_c_dout),
    .col_packets_loc_empty_n(col_packets_loc_c_empty_n),
    .col_packets_loc_read(Loop_3_proc_U0_col_packets_loc_read),
    .rows(rows),
    .out_stream_TDATA(Loop_3_proc_U0_out_stream_TDATA),
    .out_stream_TVALID(Loop_3_proc_U0_out_stream_TVALID),
    .out_stream_TREADY(out_stream_TREADY),
    .p_neg393_i_loc_dout(p_neg393_i_loc_c757_dout),
    .p_neg393_i_loc_empty_n(p_neg393_i_loc_c757_empty_n),
    .p_neg393_i_loc_read(Loop_3_proc_U0_p_neg393_i_loc_read),
    .g_img_1_data_stream_0_V_dout(g_img_1_data_stream_s_dout),
    .g_img_1_data_stream_0_V_empty_n(g_img_1_data_stream_s_empty_n),
    .g_img_1_data_stream_0_V_read(Loop_3_proc_U0_g_img_1_data_stream_0_V_read),
    .out_stream_TUSER(Loop_3_proc_U0_out_stream_TUSER),
    .out_stream_TLAST(Loop_3_proc_U0_out_stream_TLAST)
);

fifo_w31_d3_A col_packets_loc_c_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_Mat_exit406734_U0_col_packets_out_out_din),
    .if_full_n(col_packets_loc_c_full_n),
    .if_write(Block_Mat_exit406734_U0_col_packets_out_out_write),
    .if_dout(col_packets_loc_c_dout),
    .if_empty_n(col_packets_loc_c_empty_n),
    .if_read(Loop_3_proc_U0_col_packets_loc_read)
);

fifo_w32_d2_A packets_loc_channel_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_Mat_exit406734_U0_ap_return),
    .if_full_n(packets_loc_channel_full_n),
    .if_write(Block_Mat_exit406734_U0_ap_done),
    .if_dout(packets_loc_channel_dout),
    .if_empty_n(packets_loc_channel_empty_n),
    .if_read(Loop_1_proc_U0_ap_ready)
);

fifo_w8_d1_A g_img_0_data_stream_s_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Loop_1_proc_U0_g_img_0_data_stream_0_V_din),
    .if_full_n(g_img_0_data_stream_s_full_n),
    .if_write(Loop_1_proc_U0_g_img_0_data_stream_0_V_write),
    .if_dout(g_img_0_data_stream_s_dout),
    .if_empty_n(g_img_0_data_stream_s_empty_n),
    .if_read(Loop_loop_height_pro_U0_g_img_0_data_stream_0_V_read)
);

fifo_w1_d2_A switch_loc_c_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_arrayctor_loop_U0_switch_out_out_din),
    .if_full_n(switch_loc_c_full_n),
    .if_write(Block_arrayctor_loop_U0_switch_out_out_write),
    .if_dout(switch_loc_c_dout),
    .if_empty_n(switch_loc_c_empty_n),
    .if_read(Loop_loop_height_pro_U0_switch_loc_read)
);

fifo_w11_d2_A tmp_loc_c_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_arrayctor_loop_U0_tmp_out_out_din),
    .if_full_n(tmp_loc_c_full_n),
    .if_write(Block_arrayctor_loop_U0_tmp_out_out_write),
    .if_dout(tmp_loc_c_dout),
    .if_empty_n(tmp_loc_c_empty_n),
    .if_read(Loop_loop_height_pro_U0_tmp_loc_read)
);

fifo_w11_d2_A rows_cast727_loc_c_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_arrayctor_loop_U0_rows_cast727_out_out_din),
    .if_full_n(rows_cast727_loc_c_full_n),
    .if_write(Block_arrayctor_loop_U0_rows_cast727_out_out_write),
    .if_dout(rows_cast727_loc_c_dout),
    .if_empty_n(rows_cast727_loc_c_empty_n),
    .if_read(Loop_loop_height_pro_U0_rows_cast727_loc_read)
);

fifo_w11_d2_A tmp_15_loc_c_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_arrayctor_loop_U0_tmp_15_out_out_din),
    .if_full_n(tmp_15_loc_c_full_n),
    .if_write(Block_arrayctor_loop_U0_tmp_15_out_out_write),
    .if_dout(tmp_15_loc_c_dout),
    .if_empty_n(tmp_15_loc_c_empty_n),
    .if_read(Loop_loop_height_pro_U0_tmp_15_loc_read)
);

fifo_w11_d2_A tmp_16_loc_c_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_arrayctor_loop_U0_tmp_16_out_out_din),
    .if_full_n(tmp_16_loc_c_full_n),
    .if_write(Block_arrayctor_loop_U0_tmp_16_out_out_write),
    .if_dout(tmp_16_loc_c_dout),
    .if_empty_n(tmp_16_loc_c_empty_n),
    .if_read(Loop_loop_height_pro_U0_tmp_16_loc_read)
);

fifo_w11_d2_A tmp_16_cast_loc_c_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_arrayctor_loop_U0_tmp_16_cast_out_out_din),
    .if_full_n(tmp_16_cast_loc_c_full_n),
    .if_write(Block_arrayctor_loop_U0_tmp_16_cast_out_out_write),
    .if_dout(tmp_16_cast_loc_c_dout),
    .if_empty_n(tmp_16_cast_loc_c_empty_n),
    .if_read(Loop_loop_height_pro_U0_tmp_16_cast_loc_read)
);

fifo_w11_d2_A p_neg393_i_loc_c_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_arrayctor_loop_U0_p_neg393_i_out_out_din),
    .if_full_n(p_neg393_i_loc_c_full_n),
    .if_write(Block_arrayctor_loop_U0_p_neg393_i_out_out_write),
    .if_dout(p_neg393_i_loc_c_dout),
    .if_empty_n(p_neg393_i_loc_c_empty_n),
    .if_read(Loop_loop_height_pro_U0_p_neg393_i_loc_read)
);

fifo_w11_d2_A p_neg393_i_cast_loc_c_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_arrayctor_loop_U0_p_neg393_i_cast_out_out_din),
    .if_full_n(p_neg393_i_cast_loc_c_full_n),
    .if_write(Block_arrayctor_loop_U0_p_neg393_i_cast_out_out_write),
    .if_dout(p_neg393_i_cast_loc_c_dout),
    .if_empty_n(p_neg393_i_cast_loc_c_empty_n),
    .if_read(Loop_loop_height_pro_U0_p_neg393_i_cast_loc_read)
);

fifo_w8_d1_A g_img_1_data_stream_s_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Loop_loop_height_pro_U0_g_img_1_data_stream_0_V_din),
    .if_full_n(g_img_1_data_stream_s_full_n),
    .if_write(Loop_loop_height_pro_U0_g_img_1_data_stream_0_V_write),
    .if_dout(g_img_1_data_stream_s_dout),
    .if_empty_n(g_img_1_data_stream_s_empty_n),
    .if_read(Loop_3_proc_U0_g_img_1_data_stream_0_V_read)
);

fifo_w11_d1_A p_neg393_i_loc_c757_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Loop_loop_height_pro_U0_p_neg393_i_loc_out_din),
    .if_full_n(p_neg393_i_loc_c757_full_n),
    .if_write(Loop_loop_height_pro_U0_p_neg393_i_loc_out_write),
    .if_dout(p_neg393_i_loc_c757_dout),
    .if_empty_n(p_neg393_i_loc_c757_empty_n),
    .if_read(Loop_3_proc_U0_p_neg393_i_loc_read)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_Block_Mat_exit406734_U0_ap_ready <= 1'b0;
    end else begin
        if (((ap_sync_ready & ap_start) == 1'b1)) begin
            ap_sync_reg_Block_Mat_exit406734_U0_ap_ready <= 1'b0;
        end else begin
            ap_sync_reg_Block_Mat_exit406734_U0_ap_ready <= ap_sync_Block_Mat_exit406734_U0_ap_ready;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_Block_arrayctor_loop_U0_ap_ready <= 1'b0;
    end else begin
        if (((ap_sync_ready & ap_start) == 1'b1)) begin
            ap_sync_reg_Block_arrayctor_loop_U0_ap_ready <= 1'b0;
        end else begin
            ap_sync_reg_Block_arrayctor_loop_U0_ap_ready <= ap_sync_Block_arrayctor_loop_U0_ap_ready;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_Loop_1_proc_U0_ap_ready <= 1'b0;
    end else begin
        if (((ap_sync_ready & ap_start) == 1'b1)) begin
            ap_sync_reg_Loop_1_proc_U0_ap_ready <= 1'b0;
        end else begin
            ap_sync_reg_Loop_1_proc_U0_ap_ready <= ap_sync_Loop_1_proc_U0_ap_ready;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == Block_Mat_exit406734_U0_ap_ready) & (ap_sync_ready == 1'b1))) begin
        Block_Mat_exit406734_U0_ap_ready_count <= (Block_Mat_exit406734_U0_ap_ready_count - 2'd1);
    end else if (((1'b1 == Block_Mat_exit406734_U0_ap_ready) & (ap_sync_ready == 1'b0))) begin
        Block_Mat_exit406734_U0_ap_ready_count <= (Block_Mat_exit406734_U0_ap_ready_count + 2'd1);
    end
end

always @ (posedge ap_clk) begin
    if (((ap_sync_ready == 1'b1) & (1'b0 == Block_arrayctor_loop_U0_ap_ready))) begin
        Block_arrayctor_loop_U0_ap_ready_count <= (Block_arrayctor_loop_U0_ap_ready_count - 2'd1);
    end else if (((1'b1 == Block_arrayctor_loop_U0_ap_ready) & (ap_sync_ready == 1'b0))) begin
        Block_arrayctor_loop_U0_ap_ready_count <= (Block_arrayctor_loop_U0_ap_ready_count + 2'd1);
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == Loop_1_proc_U0_ap_ready) & (ap_sync_ready == 1'b1))) begin
        Loop_1_proc_U0_ap_ready_count <= (Loop_1_proc_U0_ap_ready_count - 2'd1);
    end else if (((1'b1 == Loop_1_proc_U0_ap_ready) & (ap_sync_ready == 1'b0))) begin
        Loop_1_proc_U0_ap_ready_count <= (Loop_1_proc_U0_ap_ready_count + 2'd1);
    end
end

assign Block_Mat_exit406734_U0_ap_continue = packets_loc_channel_full_n;

assign Block_Mat_exit406734_U0_ap_start = ((ap_sync_reg_Block_Mat_exit406734_U0_ap_ready ^ 1'b1) & ap_start);

assign Block_Mat_exit406734_U0_start_full_n = 1'b1;

assign Block_Mat_exit406734_U0_start_write = 1'b0;

assign Block_arrayctor_loop_U0_ap_continue = 1'b1;

assign Block_arrayctor_loop_U0_ap_start = ((ap_sync_reg_Block_arrayctor_loop_U0_ap_ready ^ 1'b1) & ap_start);

assign Block_arrayctor_loop_U0_start_full_n = 1'b1;

assign Block_arrayctor_loop_U0_start_write = 1'b0;

assign Loop_1_proc_U0_ap_continue = 1'b1;

assign Loop_1_proc_U0_ap_start = (packets_loc_channel_empty_n & (ap_sync_reg_Loop_1_proc_U0_ap_ready ^ 1'b1) & ap_start);

assign Loop_1_proc_U0_start_full_n = 1'b1;

assign Loop_1_proc_U0_start_write = 1'b0;

assign Loop_3_proc_U0_ap_continue = 1'b1;

assign Loop_3_proc_U0_ap_start = ap_start;

assign Loop_3_proc_U0_start_full_n = 1'b1;

assign Loop_3_proc_U0_start_write = 1'b0;

assign Loop_loop_height_pro_U0_ap_continue = 1'b1;

assign Loop_loop_height_pro_U0_ap_start = ap_start;

assign Loop_loop_height_pro_U0_start_full_n = 1'b1;

assign Loop_loop_height_pro_U0_start_write = 1'b0;

assign ap_channel_done_packets_loc_channel = Block_Mat_exit406734_U0_ap_done;

assign ap_done = Loop_3_proc_U0_ap_done;

assign ap_idle = ((packets_loc_channel_empty_n ^ 1'b1) & Loop_loop_height_pro_U0_ap_idle & Loop_3_proc_U0_ap_idle & Loop_1_proc_U0_ap_idle & Block_arrayctor_loop_U0_ap_idle & Block_Mat_exit406734_U0_ap_idle);

assign ap_ready = ap_sync_ready;

always @ (*) begin
    ap_rst_n_AXI_LITE_clk_inv = ~ap_rst_n_AXI_LITE_clk;
end

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign ap_sync_Block_Mat_exit406734_U0_ap_ready = (ap_sync_reg_Block_Mat_exit406734_U0_ap_ready | Block_Mat_exit406734_U0_ap_ready);

assign ap_sync_Block_arrayctor_loop_U0_ap_ready = (ap_sync_reg_Block_arrayctor_loop_U0_ap_ready | Block_arrayctor_loop_U0_ap_ready);

assign ap_sync_Loop_1_proc_U0_ap_ready = (ap_sync_reg_Loop_1_proc_U0_ap_ready | Loop_1_proc_U0_ap_ready);

assign ap_sync_continue = 1'b1;

assign ap_sync_done = Loop_3_proc_U0_ap_done;

assign ap_sync_ready = (ap_sync_Loop_1_proc_U0_ap_ready & ap_sync_Block_arrayctor_loop_U0_ap_ready & ap_sync_Block_Mat_exit406734_U0_ap_ready);

assign in_stream_TREADY = Loop_1_proc_U0_in_stream_TREADY;

assign out_stream_TDATA = Loop_3_proc_U0_out_stream_TDATA;

assign out_stream_TLAST = Loop_3_proc_U0_out_stream_TLAST;

assign out_stream_TUSER = Loop_3_proc_U0_out_stream_TUSER;

assign out_stream_TVALID = Loop_3_proc_U0_out_stream_TVALID;

endmodule //erode_hls
