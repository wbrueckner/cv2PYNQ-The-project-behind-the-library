// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.4
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="canny_edge,hls_ip_2017_4,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xc7z020clg400-1,HLS_INPUT_CLOCK=6.000000,HLS_INPUT_ARCH=dataflow,HLS_SYN_CLOCK=5.250000,HLS_SYN_LAT=-1,HLS_SYN_TPT=-1,HLS_SYN_MEM=19,HLS_SYN_DSP=32,HLS_SYN_FF=5690,HLS_SYN_LUT=9595}" *)

module canny_edge (
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
wire   [31:0] rows_V;
wire   [31:0] cols_V;
wire   [31:0] threshold1;
wire   [31:0] threshold2;
wire    ap_start;
wire    ap_ready;
wire    ap_done;
wire    ap_idle;
reg    ap_rst_n_AXI_LITE_clk_inv;
wire    Block_Mat_exit29637_U0_ap_start;
wire    Block_Mat_exit29637_U0_ap_done;
wire    Block_Mat_exit29637_U0_ap_continue;
wire    Block_Mat_exit29637_U0_ap_idle;
wire    Block_Mat_exit29637_U0_ap_ready;
wire   [8:0] Block_Mat_exit29637_U0_col_packets_out_out_din;
wire    Block_Mat_exit29637_U0_col_packets_out_out_write;
wire   [8:0] Block_Mat_exit29637_U0_col_packets_cast_out_out_din;
wire    Block_Mat_exit29637_U0_col_packets_cast_out_out_write;
wire   [19:0] Block_Mat_exit29637_U0_ap_return;
wire    ap_channel_done_packets_cast_loc_cha;
wire    packets_cast_loc_cha_full_n;
wire    Loop_1_proc_U0_ap_start;
wire    Loop_1_proc_U0_ap_done;
wire    Loop_1_proc_U0_ap_continue;
wire    Loop_1_proc_U0_ap_idle;
wire    Loop_1_proc_U0_ap_ready;
wire    Loop_1_proc_U0_in_stream_TREADY;
wire   [7:0] Loop_1_proc_U0_src_bw_data_stream_0_V_din;
wire    Loop_1_proc_U0_src_bw_data_stream_0_V_write;
wire    GaussianBlur_U0_ap_start;
wire    GaussianBlur_U0_ap_done;
wire    GaussianBlur_U0_ap_continue;
wire    GaussianBlur_U0_ap_idle;
wire    GaussianBlur_U0_ap_ready;
wire    GaussianBlur_U0_p_src_data_stream_V_read;
wire   [7:0] GaussianBlur_U0_p_dst_data_stream_V_din;
wire    GaussianBlur_U0_p_dst_data_stream_V_write;
wire    Duplicate_U0_ap_start;
wire    Duplicate_U0_ap_done;
wire    Duplicate_U0_ap_continue;
wire    Duplicate_U0_ap_idle;
wire    Duplicate_U0_ap_ready;
wire    Duplicate_U0_src_data_stream_V_read;
wire   [7:0] Duplicate_U0_dst1_data_stream_V_din;
wire    Duplicate_U0_dst1_data_stream_V_write;
wire   [7:0] Duplicate_U0_dst2_data_stream_V_din;
wire    Duplicate_U0_dst2_data_stream_V_write;
wire    Sobel_U0_ap_start;
wire    Sobel_U0_ap_done;
wire    Sobel_U0_ap_continue;
wire    Sobel_U0_ap_idle;
wire    Sobel_U0_ap_ready;
wire    Sobel_U0_p_src_data_stream_V_read;
wire   [15:0] Sobel_U0_p_dst_data_stream_V_din;
wire    Sobel_U0_p_dst_data_stream_V_write;
wire    Sobel_1_U0_ap_start;
wire    Sobel_1_U0_ap_done;
wire    Sobel_1_U0_ap_continue;
wire    Sobel_1_U0_ap_idle;
wire    Sobel_1_U0_ap_ready;
wire    Sobel_1_U0_p_src_data_stream_V_read;
wire   [15:0] Sobel_1_U0_p_dst_data_stream_V_din;
wire    Sobel_1_U0_p_dst_data_stream_V_write;
wire    gradient_decompositi_U0_ap_start;
wire    gradient_decompositi_U0_ap_done;
wire    gradient_decompositi_U0_ap_continue;
wire    gradient_decompositi_U0_ap_idle;
wire    gradient_decompositi_U0_ap_ready;
wire    gradient_decompositi_U0_gx_data_stream_V_read;
wire    gradient_decompositi_U0_gy_data_stream_V_read;
wire   [15:0] gradient_decompositi_U0_gd_data_stream_V_din;
wire    gradient_decompositi_U0_gd_data_stream_V_write;
wire    nonmax_suppression_U0_ap_start;
wire    nonmax_suppression_U0_ap_done;
wire    nonmax_suppression_U0_ap_continue;
wire    nonmax_suppression_U0_ap_idle;
wire    nonmax_suppression_U0_ap_ready;
wire    nonmax_suppression_U0_gd_data_stream_V_read;
wire   [15:0] nonmax_suppression_U0_dst_data_stream_V_din;
wire    nonmax_suppression_U0_dst_data_stream_V_write;
wire    hysteresis_U0_ap_start;
wire    hysteresis_U0_ap_done;
wire    hysteresis_U0_ap_continue;
wire    hysteresis_U0_ap_idle;
wire    hysteresis_U0_ap_ready;
wire    hysteresis_U0_src_data_stream_V_read;
wire   [7:0] hysteresis_U0_dst_data_stream_V_din;
wire    hysteresis_U0_dst_data_stream_V_write;
wire    Loop_2_proc_U0_ap_start;
wire    Loop_2_proc_U0_ap_done;
wire    Loop_2_proc_U0_ap_continue;
wire    Loop_2_proc_U0_ap_idle;
wire    Loop_2_proc_U0_ap_ready;
wire    Loop_2_proc_U0_col_packets_cast_loc_read;
wire   [31:0] Loop_2_proc_U0_out_stream_TDATA;
wire    Loop_2_proc_U0_out_stream_TVALID;
wire    Loop_2_proc_U0_canny_edges_data_stream_0_V_read;
wire   [0:0] Loop_2_proc_U0_out_stream_TUSER;
wire   [0:0] Loop_2_proc_U0_out_stream_TLAST;
wire    ap_sync_continue;
wire    col_packets_cast_loc_full_n;
wire   [8:0] col_packets_cast_loc_dout;
wire    col_packets_cast_loc_empty_n;
wire   [19:0] packets_cast_loc_cha_dout;
wire    packets_cast_loc_cha_empty_n;
wire    src_bw_data_stream_0_full_n;
wire   [7:0] src_bw_data_stream_0_dout;
wire    src_bw_data_stream_0_empty_n;
wire    src_blur_data_stream_full_n;
wire   [7:0] src_blur_data_stream_dout;
wire    src_blur_data_stream_empty_n;
wire    src1_data_stream_0_s_full_n;
wire   [7:0] src1_data_stream_0_s_dout;
wire    src1_data_stream_0_s_empty_n;
wire    src2_data_stream_0_s_full_n;
wire   [7:0] src2_data_stream_0_s_dout;
wire    src2_data_stream_0_s_empty_n;
wire    sobel_gx_data_stream_full_n;
wire   [15:0] sobel_gx_data_stream_dout;
wire    sobel_gx_data_stream_empty_n;
wire    sobel_gy_data_stream_full_n;
wire   [15:0] sobel_gy_data_stream_dout;
wire    sobel_gy_data_stream_empty_n;
wire    grad_gd_data_stream_s_full_n;
wire   [15:0] grad_gd_data_stream_s_dout;
wire    grad_gd_data_stream_s_empty_n;
wire    suppressed_data_stre_full_n;
wire   [15:0] suppressed_data_stre_dout;
wire    suppressed_data_stre_empty_n;
wire    canny_edges_data_str_full_n;
wire   [7:0] canny_edges_data_str_dout;
wire    canny_edges_data_str_empty_n;
wire    ap_sync_done;
wire    ap_sync_ready;
reg    ap_sync_reg_Loop_1_proc_U0_ap_ready;
wire    ap_sync_Loop_1_proc_U0_ap_ready;
reg   [1:0] Loop_1_proc_U0_ap_ready_count;
reg    ap_sync_reg_Block_Mat_exit29637_U0_ap_ready;
wire    ap_sync_Block_Mat_exit29637_U0_ap_ready;
reg   [1:0] Block_Mat_exit29637_U0_ap_ready_count;
wire    Block_Mat_exit29637_U0_start_full_n;
wire    Block_Mat_exit29637_U0_start_write;
wire    Loop_1_proc_U0_start_full_n;
wire    Loop_1_proc_U0_start_write;
wire    GaussianBlur_U0_start_full_n;
wire    GaussianBlur_U0_start_write;
wire    Duplicate_U0_start_full_n;
wire    Duplicate_U0_start_write;
wire    Sobel_U0_start_full_n;
wire    Sobel_U0_start_write;
wire    Sobel_1_U0_start_full_n;
wire    Sobel_1_U0_start_write;
wire    gradient_decompositi_U0_start_full_n;
wire    gradient_decompositi_U0_start_write;
wire    nonmax_suppression_U0_start_full_n;
wire    nonmax_suppression_U0_start_write;
wire    hysteresis_U0_start_full_n;
wire    hysteresis_U0_start_write;
wire    Loop_2_proc_U0_start_full_n;
wire    Loop_2_proc_U0_start_write;

// power-on initialization
initial begin
#0 ap_sync_reg_Loop_1_proc_U0_ap_ready = 1'b0;
#0 Loop_1_proc_U0_ap_ready_count = 2'd0;
#0 ap_sync_reg_Block_Mat_exit29637_U0_ap_ready = 1'b0;
#0 Block_Mat_exit29637_U0_ap_ready_count = 2'd0;
end

canny_edge_CONTROL_BUS_s_axi #(
    .C_S_AXI_ADDR_WIDTH( C_S_AXI_CONTROL_BUS_ADDR_WIDTH ),
    .C_S_AXI_DATA_WIDTH( C_S_AXI_CONTROL_BUS_DATA_WIDTH ))
canny_edge_CONTROL_BUS_s_axi_U(
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
    .rows_V(rows_V),
    .cols_V(cols_V),
    .threshold1(threshold1),
    .threshold2(threshold2),
    .ap_start(ap_start),
    .interrupt(interrupt),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .clk(ap_clk),
    .rst(ap_rst_n_AXI_LITE_clk_inv)
);

Block_Mat_exit29637_s Block_Mat_exit29637_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(Block_Mat_exit29637_U0_ap_start),
    .ap_done(Block_Mat_exit29637_U0_ap_done),
    .ap_continue(Block_Mat_exit29637_U0_ap_continue),
    .ap_idle(Block_Mat_exit29637_U0_ap_idle),
    .ap_ready(Block_Mat_exit29637_U0_ap_ready),
    .rows_V(rows_V),
    .cols_V(cols_V),
    .col_packets_out_out_din(Block_Mat_exit29637_U0_col_packets_out_out_din),
    .col_packets_out_out_full_n(1'b1),
    .col_packets_out_out_write(Block_Mat_exit29637_U0_col_packets_out_out_write),
    .col_packets_cast_out_out_din(Block_Mat_exit29637_U0_col_packets_cast_out_out_din),
    .col_packets_cast_out_out_full_n(col_packets_cast_loc_full_n),
    .col_packets_cast_out_out_write(Block_Mat_exit29637_U0_col_packets_cast_out_out_write),
    .ap_return(Block_Mat_exit29637_U0_ap_return)
);

Loop_1_proc_canny Loop_1_proc_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(Loop_1_proc_U0_ap_start),
    .ap_done(Loop_1_proc_U0_ap_done),
    .ap_continue(Loop_1_proc_U0_ap_continue),
    .ap_idle(Loop_1_proc_U0_ap_idle),
    .ap_ready(Loop_1_proc_U0_ap_ready),
    .p_read(packets_cast_loc_cha_dout),
    .in_stream_TDATA(in_stream_TDATA),
    .in_stream_TVALID(in_stream_TVALID),
    .in_stream_TREADY(Loop_1_proc_U0_in_stream_TREADY),
    .src_bw_data_stream_0_V_din(Loop_1_proc_U0_src_bw_data_stream_0_V_din),
    .src_bw_data_stream_0_V_full_n(src_bw_data_stream_0_full_n),
    .src_bw_data_stream_0_V_write(Loop_1_proc_U0_src_bw_data_stream_0_V_write)
);

GaussianBlur GaussianBlur_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(GaussianBlur_U0_ap_start),
    .ap_done(GaussianBlur_U0_ap_done),
    .ap_continue(GaussianBlur_U0_ap_continue),
    .ap_idle(GaussianBlur_U0_ap_idle),
    .ap_ready(GaussianBlur_U0_ap_ready),
    .p_src_rows_V(rows_V),
    .p_src_cols_V(cols_V),
    .p_src_data_stream_V_dout(src_bw_data_stream_0_dout),
    .p_src_data_stream_V_empty_n(src_bw_data_stream_0_empty_n),
    .p_src_data_stream_V_read(GaussianBlur_U0_p_src_data_stream_V_read),
    .p_dst_data_stream_V_din(GaussianBlur_U0_p_dst_data_stream_V_din),
    .p_dst_data_stream_V_full_n(src_blur_data_stream_full_n),
    .p_dst_data_stream_V_write(GaussianBlur_U0_p_dst_data_stream_V_write)
);

Duplicate_canny Duplicate_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(Duplicate_U0_ap_start),
    .ap_done(Duplicate_U0_ap_done),
    .ap_continue(Duplicate_U0_ap_continue),
    .ap_idle(Duplicate_U0_ap_idle),
    .ap_ready(Duplicate_U0_ap_ready),
    .src_rows_V(rows_V),
    .src_cols_V(cols_V),
    .src_data_stream_V_dout(src_blur_data_stream_dout),
    .src_data_stream_V_empty_n(src_blur_data_stream_empty_n),
    .src_data_stream_V_read(Duplicate_U0_src_data_stream_V_read),
    .dst1_data_stream_V_din(Duplicate_U0_dst1_data_stream_V_din),
    .dst1_data_stream_V_full_n(src1_data_stream_0_s_full_n),
    .dst1_data_stream_V_write(Duplicate_U0_dst1_data_stream_V_write),
    .dst2_data_stream_V_din(Duplicate_U0_dst2_data_stream_V_din),
    .dst2_data_stream_V_full_n(src2_data_stream_0_s_full_n),
    .dst2_data_stream_V_write(Duplicate_U0_dst2_data_stream_V_write)
);

Sobel_canny Sobel_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(Sobel_U0_ap_start),
    .ap_done(Sobel_U0_ap_done),
    .ap_continue(Sobel_U0_ap_continue),
    .ap_idle(Sobel_U0_ap_idle),
    .ap_ready(Sobel_U0_ap_ready),
    .p_src_rows_V(rows_V),
    .p_src_cols_V(cols_V),
    .p_src_data_stream_V_dout(src1_data_stream_0_s_dout),
    .p_src_data_stream_V_empty_n(src1_data_stream_0_s_empty_n),
    .p_src_data_stream_V_read(Sobel_U0_p_src_data_stream_V_read),
    .p_dst_data_stream_V_din(Sobel_U0_p_dst_data_stream_V_din),
    .p_dst_data_stream_V_full_n(sobel_gx_data_stream_full_n),
    .p_dst_data_stream_V_write(Sobel_U0_p_dst_data_stream_V_write)
);

Sobel_1_canny Sobel_1_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(Sobel_1_U0_ap_start),
    .ap_done(Sobel_1_U0_ap_done),
    .ap_continue(Sobel_1_U0_ap_continue),
    .ap_idle(Sobel_1_U0_ap_idle),
    .ap_ready(Sobel_1_U0_ap_ready),
    .p_src_rows_V(rows_V),
    .p_src_cols_V(cols_V),
    .p_src_data_stream_V_dout(src2_data_stream_0_s_dout),
    .p_src_data_stream_V_empty_n(src2_data_stream_0_s_empty_n),
    .p_src_data_stream_V_read(Sobel_1_U0_p_src_data_stream_V_read),
    .p_dst_data_stream_V_din(Sobel_1_U0_p_dst_data_stream_V_din),
    .p_dst_data_stream_V_full_n(sobel_gy_data_stream_full_n),
    .p_dst_data_stream_V_write(Sobel_1_U0_p_dst_data_stream_V_write)
);

gradient_decompositi gradient_decompositi_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(gradient_decompositi_U0_ap_start),
    .ap_done(gradient_decompositi_U0_ap_done),
    .ap_continue(gradient_decompositi_U0_ap_continue),
    .ap_idle(gradient_decompositi_U0_ap_idle),
    .ap_ready(gradient_decompositi_U0_ap_ready),
    .gx_rows_V(rows_V),
    .gx_cols_V(cols_V),
    .gx_data_stream_V_dout(sobel_gx_data_stream_dout),
    .gx_data_stream_V_empty_n(sobel_gx_data_stream_empty_n),
    .gx_data_stream_V_read(gradient_decompositi_U0_gx_data_stream_V_read),
    .gy_data_stream_V_dout(sobel_gy_data_stream_dout),
    .gy_data_stream_V_empty_n(sobel_gy_data_stream_empty_n),
    .gy_data_stream_V_read(gradient_decompositi_U0_gy_data_stream_V_read),
    .gd_data_stream_V_din(gradient_decompositi_U0_gd_data_stream_V_din),
    .gd_data_stream_V_full_n(grad_gd_data_stream_s_full_n),
    .gd_data_stream_V_write(gradient_decompositi_U0_gd_data_stream_V_write)
);

nonmax_suppression nonmax_suppression_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(nonmax_suppression_U0_ap_start),
    .ap_done(nonmax_suppression_U0_ap_done),
    .ap_continue(nonmax_suppression_U0_ap_continue),
    .ap_idle(nonmax_suppression_U0_ap_idle),
    .ap_ready(nonmax_suppression_U0_ap_ready),
    .gd_rows_V(rows_V),
    .gd_cols_V(cols_V),
    .gd_data_stream_V_dout(grad_gd_data_stream_s_dout),
    .gd_data_stream_V_empty_n(grad_gd_data_stream_s_empty_n),
    .gd_data_stream_V_read(nonmax_suppression_U0_gd_data_stream_V_read),
    .dst_data_stream_V_din(nonmax_suppression_U0_dst_data_stream_V_din),
    .dst_data_stream_V_full_n(suppressed_data_stre_full_n),
    .dst_data_stream_V_write(nonmax_suppression_U0_dst_data_stream_V_write)
);

hysteresis hysteresis_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(hysteresis_U0_ap_start),
    .ap_done(hysteresis_U0_ap_done),
    .ap_continue(hysteresis_U0_ap_continue),
    .ap_idle(hysteresis_U0_ap_idle),
    .ap_ready(hysteresis_U0_ap_ready),
    .src_rows_V(rows_V),
    .src_cols_V(cols_V),
    .src_data_stream_V_dout(suppressed_data_stre_dout),
    .src_data_stream_V_empty_n(suppressed_data_stre_empty_n),
    .src_data_stream_V_read(hysteresis_U0_src_data_stream_V_read),
    .dst_data_stream_V_din(hysteresis_U0_dst_data_stream_V_din),
    .dst_data_stream_V_full_n(canny_edges_data_str_full_n),
    .dst_data_stream_V_write(hysteresis_U0_dst_data_stream_V_write),
    .threshold_low(threshold1),
    .threshold_high(threshold2)
);

Loop_2_proc_canny Loop_2_proc_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(Loop_2_proc_U0_ap_start),
    .ap_done(Loop_2_proc_U0_ap_done),
    .ap_continue(Loop_2_proc_U0_ap_continue),
    .ap_idle(Loop_2_proc_U0_ap_idle),
    .ap_ready(Loop_2_proc_U0_ap_ready),
    .col_packets_cast_loc_dout(col_packets_cast_loc_dout),
    .col_packets_cast_loc_empty_n(col_packets_cast_loc_empty_n),
    .col_packets_cast_loc_read(Loop_2_proc_U0_col_packets_cast_loc_read),
    .rows_V(rows_V),
    .out_stream_TDATA(Loop_2_proc_U0_out_stream_TDATA),
    .out_stream_TVALID(Loop_2_proc_U0_out_stream_TVALID),
    .out_stream_TREADY(out_stream_TREADY),
    .canny_edges_data_stream_0_V_dout(canny_edges_data_str_dout),
    .canny_edges_data_stream_0_V_empty_n(canny_edges_data_str_empty_n),
    .canny_edges_data_stream_0_V_read(Loop_2_proc_U0_canny_edges_data_stream_0_V_read),
    .out_stream_TUSER(Loop_2_proc_U0_out_stream_TUSER),
    .out_stream_TLAST(Loop_2_proc_U0_out_stream_TLAST)
);

fifo_w9_d8_A col_packets_cast_loc_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_Mat_exit29637_U0_col_packets_cast_out_out_din),
    .if_full_n(col_packets_cast_loc_full_n),
    .if_write(Block_Mat_exit29637_U0_col_packets_cast_out_out_write),
    .if_dout(col_packets_cast_loc_dout),
    .if_empty_n(col_packets_cast_loc_empty_n),
    .if_read(Loop_2_proc_U0_col_packets_cast_loc_read)
);

fifo_w20_d2_A packets_cast_loc_cha_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_Mat_exit29637_U0_ap_return),
    .if_full_n(packets_cast_loc_cha_full_n),
    .if_write(Block_Mat_exit29637_U0_ap_done),
    .if_dout(packets_cast_loc_cha_dout),
    .if_empty_n(packets_cast_loc_cha_empty_n),
    .if_read(Loop_1_proc_U0_ap_ready)
);

fifo_w8_d1_A src_bw_data_stream_0_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Loop_1_proc_U0_src_bw_data_stream_0_V_din),
    .if_full_n(src_bw_data_stream_0_full_n),
    .if_write(Loop_1_proc_U0_src_bw_data_stream_0_V_write),
    .if_dout(src_bw_data_stream_0_dout),
    .if_empty_n(src_bw_data_stream_0_empty_n),
    .if_read(GaussianBlur_U0_p_src_data_stream_V_read)
);

fifo_w8_d1_A src_blur_data_stream_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(GaussianBlur_U0_p_dst_data_stream_V_din),
    .if_full_n(src_blur_data_stream_full_n),
    .if_write(GaussianBlur_U0_p_dst_data_stream_V_write),
    .if_dout(src_blur_data_stream_dout),
    .if_empty_n(src_blur_data_stream_empty_n),
    .if_read(Duplicate_U0_src_data_stream_V_read)
);

fifo_w8_d1_A src1_data_stream_0_s_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Duplicate_U0_dst1_data_stream_V_din),
    .if_full_n(src1_data_stream_0_s_full_n),
    .if_write(Duplicate_U0_dst1_data_stream_V_write),
    .if_dout(src1_data_stream_0_s_dout),
    .if_empty_n(src1_data_stream_0_s_empty_n),
    .if_read(Sobel_U0_p_src_data_stream_V_read)
);

fifo_w8_d1_A src2_data_stream_0_s_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Duplicate_U0_dst2_data_stream_V_din),
    .if_full_n(src2_data_stream_0_s_full_n),
    .if_write(Duplicate_U0_dst2_data_stream_V_write),
    .if_dout(src2_data_stream_0_s_dout),
    .if_empty_n(src2_data_stream_0_s_empty_n),
    .if_read(Sobel_1_U0_p_src_data_stream_V_read)
);

fifo_w16_d1_A sobel_gx_data_stream_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Sobel_U0_p_dst_data_stream_V_din),
    .if_full_n(sobel_gx_data_stream_full_n),
    .if_write(Sobel_U0_p_dst_data_stream_V_write),
    .if_dout(sobel_gx_data_stream_dout),
    .if_empty_n(sobel_gx_data_stream_empty_n),
    .if_read(gradient_decompositi_U0_gx_data_stream_V_read)
);

fifo_w16_d1_A sobel_gy_data_stream_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Sobel_1_U0_p_dst_data_stream_V_din),
    .if_full_n(sobel_gy_data_stream_full_n),
    .if_write(Sobel_1_U0_p_dst_data_stream_V_write),
    .if_dout(sobel_gy_data_stream_dout),
    .if_empty_n(sobel_gy_data_stream_empty_n),
    .if_read(gradient_decompositi_U0_gy_data_stream_V_read)
);

fifo_w16_d1_A grad_gd_data_stream_s_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(gradient_decompositi_U0_gd_data_stream_V_din),
    .if_full_n(grad_gd_data_stream_s_full_n),
    .if_write(gradient_decompositi_U0_gd_data_stream_V_write),
    .if_dout(grad_gd_data_stream_s_dout),
    .if_empty_n(grad_gd_data_stream_s_empty_n),
    .if_read(nonmax_suppression_U0_gd_data_stream_V_read)
);

fifo_w16_d1_A suppressed_data_stre_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(nonmax_suppression_U0_dst_data_stream_V_din),
    .if_full_n(suppressed_data_stre_full_n),
    .if_write(nonmax_suppression_U0_dst_data_stream_V_write),
    .if_dout(suppressed_data_stre_dout),
    .if_empty_n(suppressed_data_stre_empty_n),
    .if_read(hysteresis_U0_src_data_stream_V_read)
);

fifo_w8_d1_A canny_edges_data_str_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(hysteresis_U0_dst_data_stream_V_din),
    .if_full_n(canny_edges_data_str_full_n),
    .if_write(hysteresis_U0_dst_data_stream_V_write),
    .if_dout(canny_edges_data_str_dout),
    .if_empty_n(canny_edges_data_str_empty_n),
    .if_read(Loop_2_proc_U0_canny_edges_data_stream_0_V_read)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_Block_Mat_exit29637_U0_ap_ready <= 1'b0;
    end else begin
        if (((ap_sync_ready & ap_start) == 1'b1)) begin
            ap_sync_reg_Block_Mat_exit29637_U0_ap_ready <= 1'b0;
        end else begin
            ap_sync_reg_Block_Mat_exit29637_U0_ap_ready <= ap_sync_Block_Mat_exit29637_U0_ap_ready;
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
    if (((1'b0 == Block_Mat_exit29637_U0_ap_ready) & (ap_sync_ready == 1'b1))) begin
        Block_Mat_exit29637_U0_ap_ready_count <= (Block_Mat_exit29637_U0_ap_ready_count - 2'd1);
    end else if (((1'b1 == Block_Mat_exit29637_U0_ap_ready) & (ap_sync_ready == 1'b0))) begin
        Block_Mat_exit29637_U0_ap_ready_count <= (Block_Mat_exit29637_U0_ap_ready_count + 2'd1);
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == Loop_1_proc_U0_ap_ready) & (ap_sync_ready == 1'b1))) begin
        Loop_1_proc_U0_ap_ready_count <= (Loop_1_proc_U0_ap_ready_count - 2'd1);
    end else if (((1'b1 == Loop_1_proc_U0_ap_ready) & (ap_sync_ready == 1'b0))) begin
        Loop_1_proc_U0_ap_ready_count <= (Loop_1_proc_U0_ap_ready_count + 2'd1);
    end
end

assign Block_Mat_exit29637_U0_ap_continue = packets_cast_loc_cha_full_n;

assign Block_Mat_exit29637_U0_ap_start = ((ap_sync_reg_Block_Mat_exit29637_U0_ap_ready ^ 1'b1) & ap_start);

assign Block_Mat_exit29637_U0_start_full_n = 1'b1;

assign Block_Mat_exit29637_U0_start_write = 1'b0;

assign Duplicate_U0_ap_continue = 1'b1;

assign Duplicate_U0_ap_start = ap_start;

assign Duplicate_U0_start_full_n = 1'b1;

assign Duplicate_U0_start_write = 1'b0;

assign GaussianBlur_U0_ap_continue = 1'b1;

assign GaussianBlur_U0_ap_start = ap_start;

assign GaussianBlur_U0_start_full_n = 1'b1;

assign GaussianBlur_U0_start_write = 1'b0;

assign Loop_1_proc_U0_ap_continue = 1'b1;

assign Loop_1_proc_U0_ap_start = (packets_cast_loc_cha_empty_n & (ap_sync_reg_Loop_1_proc_U0_ap_ready ^ 1'b1) & ap_start);

assign Loop_1_proc_U0_start_full_n = 1'b1;

assign Loop_1_proc_U0_start_write = 1'b0;

assign Loop_2_proc_U0_ap_continue = 1'b1;

assign Loop_2_proc_U0_ap_start = ap_start;

assign Loop_2_proc_U0_start_full_n = 1'b1;

assign Loop_2_proc_U0_start_write = 1'b0;

assign Sobel_1_U0_ap_continue = 1'b1;

assign Sobel_1_U0_ap_start = ap_start;

assign Sobel_1_U0_start_full_n = 1'b1;

assign Sobel_1_U0_start_write = 1'b0;

assign Sobel_U0_ap_continue = 1'b1;

assign Sobel_U0_ap_start = ap_start;

assign Sobel_U0_start_full_n = 1'b1;

assign Sobel_U0_start_write = 1'b0;

assign ap_channel_done_packets_cast_loc_cha = Block_Mat_exit29637_U0_ap_done;

assign ap_done = Loop_2_proc_U0_ap_done;

assign ap_idle = (nonmax_suppression_U0_ap_idle & hysteresis_U0_ap_idle & gradient_decompositi_U0_ap_idle & (packets_cast_loc_cha_empty_n ^ 1'b1) & Sobel_U0_ap_idle & Sobel_1_U0_ap_idle & Loop_2_proc_U0_ap_idle & Loop_1_proc_U0_ap_idle & GaussianBlur_U0_ap_idle & Duplicate_U0_ap_idle & Block_Mat_exit29637_U0_ap_idle);

assign ap_ready = ap_sync_ready;

always @ (*) begin
    ap_rst_n_AXI_LITE_clk_inv = ~ap_rst_n_AXI_LITE_clk;
end

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign ap_sync_Block_Mat_exit29637_U0_ap_ready = (ap_sync_reg_Block_Mat_exit29637_U0_ap_ready | Block_Mat_exit29637_U0_ap_ready);

assign ap_sync_Loop_1_proc_U0_ap_ready = (ap_sync_reg_Loop_1_proc_U0_ap_ready | Loop_1_proc_U0_ap_ready);

assign ap_sync_continue = 1'b1;

assign ap_sync_done = Loop_2_proc_U0_ap_done;

assign ap_sync_ready = (ap_sync_Loop_1_proc_U0_ap_ready & ap_sync_Block_Mat_exit29637_U0_ap_ready);

assign gradient_decompositi_U0_ap_continue = 1'b1;

assign gradient_decompositi_U0_ap_start = ap_start;

assign gradient_decompositi_U0_start_full_n = 1'b1;

assign gradient_decompositi_U0_start_write = 1'b0;

assign hysteresis_U0_ap_continue = 1'b1;

assign hysteresis_U0_ap_start = ap_start;

assign hysteresis_U0_start_full_n = 1'b1;

assign hysteresis_U0_start_write = 1'b0;

assign in_stream_TREADY = Loop_1_proc_U0_in_stream_TREADY;

assign nonmax_suppression_U0_ap_continue = 1'b1;

assign nonmax_suppression_U0_ap_start = ap_start;

assign nonmax_suppression_U0_start_full_n = 1'b1;

assign nonmax_suppression_U0_start_write = 1'b0;

assign out_stream_TDATA = Loop_2_proc_U0_out_stream_TDATA;

assign out_stream_TLAST = Loop_2_proc_U0_out_stream_TLAST;

assign out_stream_TUSER = Loop_2_proc_U0_out_stream_TUSER;

assign out_stream_TVALID = Loop_2_proc_U0_out_stream_TVALID;

endmodule //canny_edge
