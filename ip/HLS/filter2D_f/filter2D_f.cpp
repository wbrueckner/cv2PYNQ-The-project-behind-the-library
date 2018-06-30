#include "filter2D_f.h"

void filter2D_f(wide_stream* in_stream, wide_stream* out_stream,
		ap_uint<32> rows, ap_uint<32> cols, ap_uint<32> channels, ap_uint<32> mode,
		ap_uint<32> r11, ap_uint<32> r12, ap_uint<32> r13,
		ap_uint<32> r21, ap_uint<32> r22, ap_uint<32> r23,
		ap_uint<32> r31, ap_uint<32> r32, ap_uint<32> r33) {
#pragma HLS INTERFACE axis port=in_stream depth=20000 bundle=INPUT
#pragma HLS INTERFACE axis port=out_stream bundle=OUTPUT

#pragma HLS INTERFACE s_axilite port=rows bundle=CONTROL_BUS offset=0x14 clock=AXI_LITE_clk
#pragma HLS INTERFACE s_axilite port=cols bundle=CONTROL_BUS offset=0x1C clock=AXI_LITE_clk
#pragma HLS INTERFACE s_axilite port=channels bundle=CONTROL_BUS offset=0x24 clock=AXI_LITE_clk
#pragma HLS INTERFACE s_axilite port=mode bundle=CONTROL_BUS offset=0x2C clock=AXI_LITE_clk
#pragma HLS INTERFACE s_axilite port=r11 bundle=CONTROL_BUS offset=0x34 clock=AXI_LITE_clk
#pragma HLS INTERFACE s_axilite port=r12 bundle=CONTROL_BUS offset=0x3C clock=AXI_LITE_clk
#pragma HLS INTERFACE s_axilite port=r13 bundle=CONTROL_BUS offset=0x44 clock=AXI_LITE_clk
#pragma HLS INTERFACE s_axilite port=r21 bundle=CONTROL_BUS offset=0x4C clock=AXI_LITE_clk
#pragma HLS INTERFACE s_axilite port=r22 bundle=CONTROL_BUS offset=0x54 clock=AXI_LITE_clk
#pragma HLS INTERFACE s_axilite port=r23 bundle=CONTROL_BUS offset=0x5C clock=AXI_LITE_clk
#pragma HLS INTERFACE s_axilite port=r31 bundle=CONTROL_BUS offset=0x64 clock=AXI_LITE_clk
#pragma HLS INTERFACE s_axilite port=r32 bundle=CONTROL_BUS offset=0x6C clock=AXI_LITE_clk
#pragma HLS INTERFACE s_axilite port=r33 bundle=CONTROL_BUS offset=0x74 clock=AXI_LITE_clk
#pragma HLS INTERFACE s_axilite port=return bundle=CONTROL_BUS clock=AXI_LITE_clk

#pragma HLS INTERFACE ap_stable port=rows
#pragma HLS INTERFACE ap_stable port=cols
#pragma HLS INTERFACE ap_stable port=channels
#pragma HLS INTERFACE ap_stable port=mode
#pragma HLS INTERFACE ap_stable port=r11
#pragma HLS INTERFACE ap_stable port=r12
#pragma HLS INTERFACE ap_stable port=r13
#pragma HLS INTERFACE ap_stable port=r21
#pragma HLS INTERFACE ap_stable port=r22
#pragma HLS INTERFACE ap_stable port=r23
#pragma HLS INTERFACE ap_stable port=r31
#pragma HLS INTERFACE ap_stable port=r32
#pragma HLS INTERFACE ap_stable port=r33


#pragma HLS dataflow

	GRAY_IMAGE g_img_in(rows,cols);
	GRAY_IMAGE g_img_out(rows,cols);

	const int col_packets = cols*channels/4;
	const int packets = col_packets*rows;
	const int pixel_cnt = rows*cols;

	for(int r = 0; r < packets; r++){
#pragma HLS loop_tripcount min=1 max=518400//=1920*1080/4
#pragma HLS pipeline II=4
		ap_uint<32> dat = in_stream->data;
		g_img_in.write(GRAY_PIXEL(dat.range(7,0)));
		g_img_in.write(GRAY_PIXEL(dat.range(15,8)));
		g_img_in.write(GRAY_PIXEL(dat.range(23,16)));
		g_img_in.write(GRAY_PIXEL(dat.range(31,24)));
		++in_stream;
	}

	const int kernel_size = 3;
	hls::Point_<int> c_point;
	c_point.x=-1;
	c_point.y=-1;
	hls::Window<kernel_size,kernel_size,ap_fixed<K_FP_W,K_FP_I,AP_RND> >	kernel;

	kernel.val[0][0].range() = r11.range(K_FP_W-1,0);
	kernel.val[0][1].range() = r12.range(K_FP_W-1,0);
	kernel.val[0][2].range() = r13.range(K_FP_W-1,0);
	kernel.val[1][0].range() = r21.range(K_FP_W-1,0);
	kernel.val[1][1].range() = r22.range(K_FP_W-1,0);
	kernel.val[1][2].range() = r23.range(K_FP_W-1,0);
	kernel.val[2][0].range() = r31.range(K_FP_W-1,0);
	kernel.val[2][1].range() = r32.range(K_FP_W-1,0);
	kernel.val[2][2].range() = r33.range(K_FP_W-1,0);

	hls::Filter2D<hls::BORDER_DEFAULT>(g_img_in,g_img_out,kernel, c_point);

	for(int r = 0; r < rows; r++){
#pragma HLS loop_tripcount min=1 max=518400//=1920*1080/4
#pragma HLS pipeline II=4
		for(int c = 0; c < col_packets; c++){
			ap_uint<32> dat;
			dat.range(7,0) = g_img_out.read().val[0];
			dat.range(15,8) = g_img_out.read().val[0];
			dat.range(23,16) = g_img_out.read().val[0];
			dat.range(31,24) = g_img_out.read().val[0];
			out_stream->data = dat;
			out_stream->user = (r == 0 && c == 0)? 1: 0;	//indicating first package
			out_stream->last = (r == rows-1 && c == col_packets-1)? 1: 0;//indicating last package
			++out_stream;
		}
	}
}
