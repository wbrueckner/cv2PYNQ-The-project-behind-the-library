#include "filter2D_hls_5.h"

void filter2D_hls_5(wide_stream* in_stream, wide_stream* out_stream, int rows, int cols,
		ap_int<8> par[28]){
#pragma HLS INTERFACE axis port=in_stream depth=20000 bundle=INPUT
#pragma HLS INTERFACE axis port=out_stream bundle=OUTPUT

#pragma HLS INTERFACE s_axilite port=rows bundle=CONTROL_BUS offset=0x14 clock=AXI_LITE_clk
#pragma HLS INTERFACE s_axilite port=cols bundle=CONTROL_BUS offset=0x1C clock=AXI_LITE_clk
#pragma HLS INTERFACE s_axilite port=par bundle=CONTROL_BUS offset=0x40 clock=AXI_LITE_clk
#pragma HLS INTERFACE s_axilite port=return bundle=CONTROL_BUS

#pragma HLS INTERFACE ap_stable port=rows
#pragma HLS INTERFACE ap_stable port=cols
#pragma HLS INTERFACE ap_stable port=par

#pragma HLS dataflow

	GRAY_IMAGE g_img_0(rows,cols);
	GRAY_IMAGE g_img_1(rows,cols);

	const int col_packets = cols/4;
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

	const int kernel_size = 5;
	hls::Window<kernel_size,kernel_size,ap_int<8> >	kernel;

	kernel.val[0][0] = par[0];
	kernel.val[0][1] = par[1];
	kernel.val[0][2] = par[2];
	kernel.val[0][3] = par[3];
	kernel.val[0][4] = par[4];
	kernel.val[1][0] = par[5];
	kernel.val[1][1] = par[6];
	kernel.val[1][2] = par[7];
	kernel.val[1][3] = par[8];
	kernel.val[1][4] = par[9];
	kernel.val[2][0] = par[10];
	kernel.val[2][1] = par[11];
	kernel.val[2][2] = par[12];
	kernel.val[2][3] = par[13];
	kernel.val[2][4] = par[14];
	kernel.val[3][0] = par[15];
	kernel.val[3][1] = par[16];
	kernel.val[3][2] = par[17];
	kernel.val[3][3] = par[18];
	kernel.val[3][4] = par[19];
	kernel.val[4][0] = par[20];
	kernel.val[4][1] = par[21];
	kernel.val[4][2] = par[22];
	kernel.val[4][3] = par[23];
	kernel.val[4][4] = par[24];

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
