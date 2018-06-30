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


void erode_hls(wide_stream* in_stream, wide_stream* out_stream, int rows, int cols, int channels, int mode);
