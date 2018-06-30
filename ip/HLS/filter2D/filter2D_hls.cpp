#include "filter2D_hls.h"

void filter2D_hls(wide_stream* in_stream, wide_stream* out_stream, int rows, int cols, int channels, int mode, ap_uint<32> r1, ap_uint<32> r2, ap_uint<32> r3) {
#pragma HLS INTERFACE axis port=in_stream depth=20000 bundle=INPUT
#pragma HLS INTERFACE axis port=out_stream bundle=OUTPUT

#pragma HLS INTERFACE s_axilite port=rows bundle=CONTROL_BUS offset=0x14 clock=AXI_LITE_clk
#pragma HLS INTERFACE s_axilite port=cols bundle=CONTROL_BUS offset=0x1C clock=AXI_LITE_clk
#pragma HLS INTERFACE s_axilite port=channels bundle=CONTROL_BUS offset=0x24 clock=AXI_LITE_clk
#pragma HLS INTERFACE s_axilite port=mode bundle=CONTROL_BUS offset=0x2C clock=AXI_LITE_clk
#pragma HLS INTERFACE s_axilite port=r1 bundle=CONTROL_BUS offset=0x34 clock=AXI_LITE_clk
#pragma HLS INTERFACE s_axilite port=r2 bundle=CONTROL_BUS offset=0x3C clock=AXI_LITE_clk
#pragma HLS INTERFACE s_axilite port=r3 bundle=CONTROL_BUS offset=0x44 clock=AXI_LITE_clk
#pragma HLS INTERFACE s_axilite port=return bundle=CONTROL_BUS

#pragma HLS INTERFACE ap_stable port=rows
#pragma HLS INTERFACE ap_stable port=cols
#pragma HLS INTERFACE ap_stable port=channels
#pragma HLS INTERFACE ap_stable port=mode
#pragma HLS INTERFACE ap_stable port=r1
#pragma HLS INTERFACE ap_stable port=r2
#pragma HLS INTERFACE ap_stable port=r3

#pragma HLS dataflow

	GRAY_IMAGE g_img_0(rows,cols);
	GRAY_IMAGE g_img_1(rows,cols);

	const int col_packets = cols*channels/4;
	const int packets = col_packets*rows;
	const int pixel_cnt = rows*cols;

	for(int r = 0; r < packets; r++){
#pragma HLS pipeline II=4
		ap_uint<32> dat = in_stream->data;
		g_img_0.write(GRAY_PIXEL(dat.range(7,0)));
		g_img_0.write(GRAY_PIXEL(dat.range(15,8)));
		g_img_0.write(GRAY_PIXEL(dat.range(23,16)));
		g_img_0.write(GRAY_PIXEL(dat.range(31,24)));
		++in_stream;
	}

	const int kernel_size = 3;
	hls::Window<kernel_size,kernel_size,ap_int<8> >	kernel;

	kernel.val[0][0] = r1.range(7,0);
	kernel.val[0][1] = r1.range(15,8);
	kernel.val[0][2] = r1.range(23,16);
	kernel.val[1][0] = r2.range(7,0);
	kernel.val[1][1] = r2.range(15,8);
	kernel.val[1][2] = r2.range(23,16);
	kernel.val[2][0] = r3.range(7,0);
	kernel.val[2][1] = r3.range(15,8);
	kernel.val[2][2] = r3.range(23,16);

	hls::Point_<int> c_point;
	c_point.x=-1;
	c_point.y=-1;
	hls::Filter2D<hls::BORDER_DEFAULT>(g_img_0,g_img_1,kernel, c_point);


	for(int r = 0; r < rows; r++){
#pragma HLS pipeline II=4
		for(int c = 0; c < col_packets; c++){
			ap_uint<32> dat;
			dat.range(7,0) = g_img_1.read().val[0];
			dat.range(15,8) = g_img_1.read().val[0];
			dat.range(23,16) = g_img_1.read().val[0];
			dat.range(31,24) = g_img_1.read().val[0];
			out_stream->data = dat;
			out_stream->user = (r == 0 && c == 0)? 1: 0;
			out_stream->last = (r == rows-1 && c == col_packets-1)? 1: 0;
			++out_stream;
		}
	}
}
