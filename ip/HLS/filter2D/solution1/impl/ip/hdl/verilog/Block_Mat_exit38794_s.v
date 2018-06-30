// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.4
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module Block_Mat_exit38794_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        rows,
        cols,
        channels,
        col_packets_out_out_din,
        col_packets_out_out_full_n,
        col_packets_out_out_write,
        col_packets_cast_out_out_din,
        col_packets_cast_out_out_full_n,
        col_packets_cast_out_out_write,
        ap_return
);

parameter    ap_ST_fsm_state1 = 12'd1;
parameter    ap_ST_fsm_state2 = 12'd2;
parameter    ap_ST_fsm_state3 = 12'd4;
parameter    ap_ST_fsm_state4 = 12'd8;
parameter    ap_ST_fsm_state5 = 12'd16;
parameter    ap_ST_fsm_state6 = 12'd32;
parameter    ap_ST_fsm_state7 = 12'd64;
parameter    ap_ST_fsm_state8 = 12'd128;
parameter    ap_ST_fsm_state9 = 12'd256;
parameter    ap_ST_fsm_state10 = 12'd512;
parameter    ap_ST_fsm_state11 = 12'd1024;
parameter    ap_ST_fsm_state12 = 12'd2048;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [31:0] rows;
input  [31:0] cols;
input  [31:0] channels;
output  [30:0] col_packets_out_out_din;
input   col_packets_out_out_full_n;
output   col_packets_out_out_write;
output  [29:0] col_packets_cast_out_out_din;
input   col_packets_cast_out_out_full_n;
output   col_packets_cast_out_out_write;
output  [31:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg col_packets_out_out_write;
reg col_packets_cast_out_out_write;
reg[31:0] ap_return;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [11:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    col_packets_out_out_blk_n;
wire    ap_CS_fsm_state7;
reg    col_packets_cast_out_out_blk_n;
reg    ap_block_state1;
wire   [31:0] grp_fu_90_p2;
wire    ap_CS_fsm_state5;
wire   [0:0] tmp_62_fu_96_p3;
wire   [29:0] tmp_s_fu_104_p4;
wire   [30:0] p_neg_t_i_fu_133_p2;
wire  signed [30:0] col_packets_fu_142_p3;
reg    ap_block_state7;
wire    ap_CS_fsm_state8;
wire   [31:0] p_neg_i_fu_114_p2;
wire   [29:0] tmp_fu_119_p4;
wire   [30:0] p_lshr_cast_i_fu_129_p1;
wire   [30:0] p_lshr_f_cast_i_fu_139_p1;
reg    grp_fu_90_ce;
wire    ap_CS_fsm_state2;
wire    ap_CS_fsm_state3;
wire    ap_CS_fsm_state4;
wire   [31:0] grp_fu_157_p2;
reg   [31:0] ap_return_preg;
wire    ap_CS_fsm_state12;
reg   [11:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 12'd1;
#0 ap_return_preg = 32'd0;
end

filter2D_hls_mul_bkb #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
filter2D_hls_mul_bkb_U1(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(channels),
    .din1(cols),
    .ce(grp_fu_90_ce),
    .dout(grp_fu_90_p2)
);

filter2D_hls_mul_cud #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 31 ),
    .dout_WIDTH( 32 ))
filter2D_hls_mul_cud_U2(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(rows),
    .din1(col_packets_fu_142_p3),
    .ce(1'b1),
    .dout(grp_fu_157_p2)
);

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
        end else if ((1'b1 == ap_CS_fsm_state12)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_preg <= 32'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state12)) begin
            ap_return_preg <= grp_fu_157_p2;
        end
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state12)) begin
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
    if ((1'b1 == ap_CS_fsm_state12)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state12)) begin
        ap_return = grp_fu_157_p2;
    end else begin
        ap_return = ap_return_preg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        col_packets_cast_out_out_blk_n = col_packets_cast_out_out_full_n;
    end else begin
        col_packets_cast_out_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((col_packets_cast_out_out_full_n == 1'b0) | (col_packets_out_out_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state7))) begin
        col_packets_cast_out_out_write = 1'b1;
    end else begin
        col_packets_cast_out_out_write = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        col_packets_out_out_blk_n = col_packets_out_out_full_n;
    end else begin
        col_packets_out_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((col_packets_cast_out_out_full_n == 1'b0) | (col_packets_out_out_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state7))) begin
        col_packets_out_out_write = 1'b1;
    end else begin
        col_packets_out_out_write = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2) | (~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1)))) begin
        grp_fu_90_ce = 1'b1;
    end else begin
        grp_fu_90_ce = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            if ((~((col_packets_cast_out_out_full_n == 1'b0) | (col_packets_out_out_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state7))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state10;
        end
        ap_ST_fsm_state10 : begin
            ap_NS_fsm = ap_ST_fsm_state11;
        end
        ap_ST_fsm_state11 : begin
            ap_NS_fsm = ap_ST_fsm_state12;
        end
        ap_ST_fsm_state12 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state12 = ap_CS_fsm[32'd11];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1));
end

always @ (*) begin
    ap_block_state7 = ((col_packets_cast_out_out_full_n == 1'b0) | (col_packets_out_out_full_n == 1'b0));
end

assign col_packets_cast_out_out_din = col_packets_fu_142_p3[29:0];

assign col_packets_fu_142_p3 = ((tmp_62_fu_96_p3[0:0] === 1'b1) ? p_neg_t_i_fu_133_p2 : p_lshr_f_cast_i_fu_139_p1);

assign col_packets_out_out_din = col_packets_fu_142_p3;

assign p_lshr_cast_i_fu_129_p1 = tmp_fu_119_p4;

assign p_lshr_f_cast_i_fu_139_p1 = tmp_s_fu_104_p4;

assign p_neg_i_fu_114_p2 = (32'd0 - grp_fu_90_p2);

assign p_neg_t_i_fu_133_p2 = (31'd0 - p_lshr_cast_i_fu_129_p1);

assign tmp_62_fu_96_p3 = grp_fu_90_p2[32'd31];

assign tmp_fu_119_p4 = {{p_neg_i_fu_114_p2[31:2]}};

assign tmp_s_fu_104_p4 = {{grp_fu_90_p2[31:2]}};

endmodule //Block_Mat_exit38794_s
