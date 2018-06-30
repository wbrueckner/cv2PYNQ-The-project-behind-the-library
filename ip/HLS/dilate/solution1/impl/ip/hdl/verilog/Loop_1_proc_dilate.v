// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.4
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module Loop_1_proc_dilate (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        p_read,
        in_stream_TDATA,
        in_stream_TVALID,
        in_stream_TREADY,
        g_img_0_data_stream_0_V_din,
        g_img_0_data_stream_0_V_full_n,
        g_img_0_data_stream_0_V_write
);

parameter    ap_ST_fsm_state1 = 6'd1;
parameter    ap_ST_fsm_pp0_stage0 = 6'd2;
parameter    ap_ST_fsm_pp0_stage1 = 6'd4;
parameter    ap_ST_fsm_pp0_stage2 = 6'd8;
parameter    ap_ST_fsm_pp0_stage3 = 6'd16;
parameter    ap_ST_fsm_state8 = 6'd32;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [31:0] p_read;
input  [31:0] in_stream_TDATA;
input   in_stream_TVALID;
output   in_stream_TREADY;
output  [7:0] g_img_0_data_stream_0_V_din;
input   g_img_0_data_stream_0_V_full_n;
output   g_img_0_data_stream_0_V_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[7:0] g_img_0_data_stream_0_V_din;
reg g_img_0_data_stream_0_V_write;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [5:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [31:0] in_stream_data_V_0_data_out;
wire    in_stream_data_V_0_vld_in;
wire    in_stream_data_V_0_vld_out;
wire    in_stream_data_V_0_ack_in;
reg    in_stream_data_V_0_ack_out;
reg   [31:0] in_stream_data_V_0_payload_A;
reg   [31:0] in_stream_data_V_0_payload_B;
reg    in_stream_data_V_0_sel_rd;
reg    in_stream_data_V_0_sel_wr;
wire    in_stream_data_V_0_sel;
wire    in_stream_data_V_0_load_A;
wire    in_stream_data_V_0_load_B;
reg   [1:0] in_stream_data_V_0_state;
wire    in_stream_data_V_0_state_cmp_full;
reg    in_stream_TDATA_blk_n;
wire    ap_CS_fsm_pp0_stage2;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_pp0_stage2;
reg   [0:0] tmp_5_i_reg_159;
reg    g_img_0_data_stream_0_V_blk_n;
wire    ap_CS_fsm_pp0_stage3;
wire    ap_block_pp0_stage3;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage0;
wire    ap_CS_fsm_pp0_stage1;
wire    ap_block_pp0_stage1;
reg   [0:0] ap_reg_pp0_iter1_tmp_5_i_reg_159;
reg   [30:0] p_024_rec_i_reg_93;
reg    ap_block_state1;
wire   [0:0] tmp_5_i_fu_108_p2;
wire    ap_block_state2_pp0_stage0_iter0;
reg    ap_block_state6_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_11001;
wire   [30:0] r_fu_113_p2;
reg   [30:0] r_reg_163;
reg   [7:0] tmp_11_reg_168;
reg    ap_block_state4_pp0_stage2_iter0;
reg    ap_block_pp0_stage2_11001;
reg   [7:0] tmp_12_reg_173;
reg   [7:0] tmp_13_reg_178;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
reg    ap_block_state5_pp0_stage3_iter0;
reg    ap_block_pp0_stage3_subdone;
wire    ap_block_state3_pp0_stage1_iter0;
reg    ap_block_state7_pp0_stage1_iter1;
reg    ap_block_pp0_stage1_subdone;
reg   [30:0] ap_phi_mux_p_024_rec_i_phi_fu_97_p4;
reg    ap_block_pp0_stage3_11001;
reg    ap_block_pp0_stage1_11001;
wire   [7:0] tmp_fu_119_p1;
reg    ap_block_pp0_stage2_01001;
reg    ap_block_pp0_stage3_01001;
reg    ap_block_pp0_stage0_01001;
reg    ap_block_pp0_stage1_01001;
wire   [31:0] r_cast_i_fu_104_p1;
wire    ap_CS_fsm_state8;
reg   [5:0] ap_NS_fsm;
reg    ap_block_pp0_stage2_subdone;
reg    ap_idle_pp0;
wire    ap_enable_pp0;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 6'd1;
#0 in_stream_data_V_0_sel_rd = 1'b0;
#0 in_stream_data_V_0_sel_wr = 1'b0;
#0 in_stream_data_V_0_state = 2'd0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_state8)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b1 == ap_condition_pp0_exit_iter0_state2) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b1 == ap_condition_pp0_exit_iter0_state2) & (((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1)) | ((1'b0 == ap_block_pp0_stage3_subdone) & (1'b1 == ap_CS_fsm_pp0_stage3))))) begin
            ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state2);
        end else if ((((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1)) | ((1'b0 == ap_block_pp0_stage3_subdone) & (1'b1 == ap_CS_fsm_pp0_stage3)))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        in_stream_data_V_0_sel_rd <= 1'b0;
    end else begin
        if (((in_stream_data_V_0_ack_out == 1'b1) & (in_stream_data_V_0_vld_out == 1'b1))) begin
            in_stream_data_V_0_sel_rd <= ~in_stream_data_V_0_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        in_stream_data_V_0_sel_wr <= 1'b0;
    end else begin
        if (((in_stream_data_V_0_ack_in == 1'b1) & (in_stream_data_V_0_vld_in == 1'b1))) begin
            in_stream_data_V_0_sel_wr <= ~in_stream_data_V_0_sel_wr;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        in_stream_data_V_0_state <= 2'd0;
    end else begin
        if ((((in_stream_data_V_0_state == 2'd2) & (in_stream_data_V_0_vld_in == 1'b0)) | ((in_stream_data_V_0_state == 2'd3) & (in_stream_data_V_0_vld_in == 1'b0) & (in_stream_data_V_0_ack_out == 1'b1)))) begin
            in_stream_data_V_0_state <= 2'd2;
        end else if ((((in_stream_data_V_0_state == 2'd1) & (in_stream_data_V_0_ack_out == 1'b0)) | ((in_stream_data_V_0_state == 2'd3) & (in_stream_data_V_0_ack_out == 1'b0) & (in_stream_data_V_0_vld_in == 1'b1)))) begin
            in_stream_data_V_0_state <= 2'd1;
        end else if (((~((in_stream_data_V_0_vld_in == 1'b0) & (in_stream_data_V_0_ack_out == 1'b1)) & ~((in_stream_data_V_0_ack_out == 1'b0) & (in_stream_data_V_0_vld_in == 1'b1)) & (in_stream_data_V_0_state == 2'd3)) | ((in_stream_data_V_0_state == 2'd1) & (in_stream_data_V_0_ack_out == 1'b1)) | ((in_stream_data_V_0_state == 2'd2) & (in_stream_data_V_0_vld_in == 1'b1)))) begin
            in_stream_data_V_0_state <= 2'd3;
        end else begin
            in_stream_data_V_0_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_5_i_reg_159 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        p_024_rec_i_reg_93 <= r_reg_163;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        p_024_rec_i_reg_93 <= 31'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ap_reg_pp0_iter1_tmp_5_i_reg_159 <= tmp_5_i_reg_159;
        tmp_5_i_reg_159 <= tmp_5_i_fu_108_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((in_stream_data_V_0_load_A == 1'b1)) begin
        in_stream_data_V_0_payload_A <= in_stream_TDATA;
    end
end

always @ (posedge ap_clk) begin
    if ((in_stream_data_V_0_load_B == 1'b1)) begin
        in_stream_data_V_0_payload_B <= in_stream_TDATA;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        r_reg_163 <= r_fu_113_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_5_i_reg_159 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2_11001))) begin
        tmp_11_reg_168 <= {{in_stream_data_V_0_data_out[15:8]}};
        tmp_12_reg_173 <= {{in_stream_data_V_0_data_out[23:16]}};
        tmp_13_reg_178 <= {{in_stream_data_V_0_data_out[31:24]}};
    end
end

always @ (*) begin
    if ((tmp_5_i_fu_108_p2 == 1'd0)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_5_i_reg_159 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_p_024_rec_i_phi_fu_97_p4 = r_reg_163;
    end else begin
        ap_phi_mux_p_024_rec_i_phi_fu_97_p4 = p_024_rec_i_reg_93;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_reg_pp0_iter1_tmp_5_i_reg_159 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage1)) | ((tmp_5_i_reg_159 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)) | ((tmp_5_i_reg_159 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage3) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3)) | ((tmp_5_i_reg_159 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2)))) begin
        g_img_0_data_stream_0_V_blk_n = g_img_0_data_stream_0_V_full_n;
    end else begin
        g_img_0_data_stream_0_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_reg_pp0_iter1_tmp_5_i_reg_159 == 1'd1) & (1'b0 == ap_block_pp0_stage1_01001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        g_img_0_data_stream_0_V_din = tmp_13_reg_178;
    end else if (((tmp_5_i_reg_159 == 1'd1) & (1'b0 == ap_block_pp0_stage0_01001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        g_img_0_data_stream_0_V_din = tmp_12_reg_173;
    end else if (((tmp_5_i_reg_159 == 1'd1) & (1'b0 == ap_block_pp0_stage3_01001) & (1'b1 == ap_CS_fsm_pp0_stage3) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        g_img_0_data_stream_0_V_din = tmp_11_reg_168;
    end else if (((tmp_5_i_reg_159 == 1'd1) & (1'b0 == ap_block_pp0_stage2_01001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        g_img_0_data_stream_0_V_din = tmp_fu_119_p1;
    end else begin
        g_img_0_data_stream_0_V_din = 'bx;
    end
end

always @ (*) begin
    if ((((ap_reg_pp0_iter1_tmp_5_i_reg_159 == 1'd1) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((tmp_5_i_reg_159 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((tmp_5_i_reg_159 == 1'd1) & (1'b0 == ap_block_pp0_stage3_11001) & (1'b1 == ap_CS_fsm_pp0_stage3) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((tmp_5_i_reg_159 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2_11001)))) begin
        g_img_0_data_stream_0_V_write = 1'b1;
    end else begin
        g_img_0_data_stream_0_V_write = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_5_i_reg_159 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2))) begin
        in_stream_TDATA_blk_n = in_stream_data_V_0_state[1'd0];
    end else begin
        in_stream_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_5_i_reg_159 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2_11001))) begin
        in_stream_data_V_0_ack_out = 1'b1;
    end else begin
        in_stream_data_V_0_ack_out = 1'b0;
    end
end

always @ (*) begin
    if ((in_stream_data_V_0_sel == 1'b1)) begin
        in_stream_data_V_0_data_out = in_stream_data_V_0_payload_B;
    end else begin
        in_stream_data_V_0_data_out = in_stream_data_V_0_payload_A;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((tmp_5_i_fu_108_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0)) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else if (((tmp_5_i_fu_108_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage1 : begin
            if ((~((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (ap_enable_reg_pp0_iter0 == 1'b0)) & (1'b0 == ap_block_pp0_stage1_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end else if (((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end
        end
        ap_ST_fsm_pp0_stage2 : begin
            if ((1'b0 == ap_block_pp0_stage2_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end
        end
        ap_ST_fsm_pp0_stage3 : begin
            if ((1'b0 == ap_block_pp0_stage3_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            end
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_pp0_stage2 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_pp0_stage3 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd5];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((tmp_5_i_reg_159 == 1'd1) & (g_img_0_data_stream_0_V_full_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((tmp_5_i_reg_159 == 1'd1) & (g_img_0_data_stream_0_V_full_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((tmp_5_i_reg_159 == 1'd1) & (g_img_0_data_stream_0_V_full_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage1_01001 = ((ap_reg_pp0_iter1_tmp_5_i_reg_159 == 1'd1) & (g_img_0_data_stream_0_V_full_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage1_11001 = ((ap_reg_pp0_iter1_tmp_5_i_reg_159 == 1'd1) & (g_img_0_data_stream_0_V_full_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage1_subdone = ((ap_reg_pp0_iter1_tmp_5_i_reg_159 == 1'd1) & (g_img_0_data_stream_0_V_full_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

assign ap_block_pp0_stage2 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage2_01001 = ((ap_enable_reg_pp0_iter0 == 1'b1) & (((tmp_5_i_reg_159 == 1'd1) & (in_stream_data_V_0_vld_out == 1'b0)) | ((tmp_5_i_reg_159 == 1'd1) & (g_img_0_data_stream_0_V_full_n == 1'b0))));
end

always @ (*) begin
    ap_block_pp0_stage2_11001 = ((ap_enable_reg_pp0_iter0 == 1'b1) & (((tmp_5_i_reg_159 == 1'd1) & (in_stream_data_V_0_vld_out == 1'b0)) | ((tmp_5_i_reg_159 == 1'd1) & (g_img_0_data_stream_0_V_full_n == 1'b0))));
end

always @ (*) begin
    ap_block_pp0_stage2_subdone = ((ap_enable_reg_pp0_iter0 == 1'b1) & (((tmp_5_i_reg_159 == 1'd1) & (in_stream_data_V_0_vld_out == 1'b0)) | ((tmp_5_i_reg_159 == 1'd1) & (g_img_0_data_stream_0_V_full_n == 1'b0))));
end

assign ap_block_pp0_stage3 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage3_01001 = ((tmp_5_i_reg_159 == 1'd1) & (g_img_0_data_stream_0_V_full_n == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage3_11001 = ((tmp_5_i_reg_159 == 1'd1) & (g_img_0_data_stream_0_V_full_n == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage3_subdone = ((tmp_5_i_reg_159 == 1'd1) & (g_img_0_data_stream_0_V_full_n == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage1_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state4_pp0_stage2_iter0 = (((tmp_5_i_reg_159 == 1'd1) & (in_stream_data_V_0_vld_out == 1'b0)) | ((tmp_5_i_reg_159 == 1'd1) & (g_img_0_data_stream_0_V_full_n == 1'b0)));
end

always @ (*) begin
    ap_block_state5_pp0_stage3_iter0 = ((tmp_5_i_reg_159 == 1'd1) & (g_img_0_data_stream_0_V_full_n == 1'b0));
end

always @ (*) begin
    ap_block_state6_pp0_stage0_iter1 = ((tmp_5_i_reg_159 == 1'd1) & (g_img_0_data_stream_0_V_full_n == 1'b0));
end

always @ (*) begin
    ap_block_state7_pp0_stage1_iter1 = ((ap_reg_pp0_iter1_tmp_5_i_reg_159 == 1'd1) & (g_img_0_data_stream_0_V_full_n == 1'b0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign in_stream_TREADY = in_stream_data_V_0_state[1'd1];

assign in_stream_data_V_0_ack_in = in_stream_data_V_0_state[1'd1];

assign in_stream_data_V_0_load_A = (in_stream_data_V_0_state_cmp_full & ~in_stream_data_V_0_sel_wr);

assign in_stream_data_V_0_load_B = (in_stream_data_V_0_state_cmp_full & in_stream_data_V_0_sel_wr);

assign in_stream_data_V_0_sel = in_stream_data_V_0_sel_rd;

assign in_stream_data_V_0_state_cmp_full = ((in_stream_data_V_0_state != 2'd1) ? 1'b1 : 1'b0);

assign in_stream_data_V_0_vld_in = in_stream_TVALID;

assign in_stream_data_V_0_vld_out = in_stream_data_V_0_state[1'd0];

assign r_cast_i_fu_104_p1 = ap_phi_mux_p_024_rec_i_phi_fu_97_p4;

assign r_fu_113_p2 = (ap_phi_mux_p_024_rec_i_phi_fu_97_p4 + 31'd1);

assign tmp_5_i_fu_108_p2 = (($signed(r_cast_i_fu_104_p1) < $signed(p_read)) ? 1'b1 : 1'b0);

assign tmp_fu_119_p1 = in_stream_data_V_0_data_out[7:0];

endmodule //Loop_1_proc
