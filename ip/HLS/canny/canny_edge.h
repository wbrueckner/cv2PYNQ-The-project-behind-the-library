/*
The canny_edge IP is based on the work of Aadeetya Shreedhar and Alexander Wang
https://github.com/ka367/Lane-Detecting-Using-Hough-Transform/blob/master/test.cpp
*/
#include "hls_video.h"
#include <ap_fixed.h>

struct wide_stream {
	ap_uint<32> data;
	ap_uint<1> user;
	ap_uint<1> last;
};
#define MAX_WIDTH  1920
#define MAX_HEIGHT 1080
#define CHANNEL	   3

typedef hls::Scalar<1, unsigned char>                 GRAY_PIXEL;
typedef hls::Mat<MAX_HEIGHT, MAX_WIDTH, HLS_8UC1>     GRAY_IMAGE;
typedef hls::Mat<MAX_HEIGHT, MAX_WIDTH, HLS_16SC1>    GRAY_IMAGE_16S;
typedef hls::Mat<MAX_HEIGHT, MAX_WIDTH, HLS_16UC1>    GRAY_IMAGE_16;

void canny_edge(wide_stream* in_stream, wide_stream* out_stream, ap_uint<32> rows, ap_uint<32> cols, int threshold1, int threshold2);
