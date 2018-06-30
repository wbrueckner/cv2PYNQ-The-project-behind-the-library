#include "hls_video.h"
#include <ap_fixed.h>

struct wide_stream {
	ap_uint<32> data;
	ap_uint<1> user;
	ap_uint<1> last;
};
#define MAX_WIDTH  1920
#define MAX_HEIGHT 1080
//#define CHANNEL	   3

//width 26bit - 36 dsp blocks
//width 25bit - 18 dsp blocks
#define K_FP_W 	25	//kernel fixed point: length in bits
#define K_FP_I 	2	//kernel fixed point: The number of bits used to represent the integer value (the number of bits above the decimal point)

typedef hls::Scalar<1, unsigned char>                 GRAY_PIXEL;
typedef hls::Mat<MAX_HEIGHT, MAX_WIDTH, HLS_8UC1>     GRAY_IMAGE;

void filter2D_f(wide_stream* in_stream, wide_stream* out_stream, ap_uint<32> rows, ap_uint<32> cols, ap_uint<32> channels, ap_uint<32> mode, ap_uint<32> r11, ap_uint<32> r12, ap_uint<32> r13, ap_uint<32> r21, ap_uint<32> r22, ap_uint<32> r23, ap_uint<32> r31, ap_uint<32> r32, ap_uint<32> r33);
