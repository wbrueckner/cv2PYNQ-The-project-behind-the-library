#include <cassert>
#include <iostream>
#include <stdio.h>
#include <hls_opencv.h>

#include "canny_edge.h"

//#define INPUT_IMG "../../../lena_gray.bmp"
#define INPUT_IMG "../../../solidWhiteRight.jpg"
#define OUTPUT_IMG "calc.png"

#define W 960//512//640//1920
#define H 540//512//480//1080
#define CH 1//3



#define PACKETS (W*CH*H/4)
unsigned char input_buffer[W*H];
wide_stream input_data[PACKETS];
wide_stream output_data[PACKETS];
unsigned char output_buffer[W*H] = {0};

void reset_data(void) {
	for (int i = 0; i < PACKETS; ++i) {
		output_data[i].data = 0;
		output_data[i].last = 0;
		output_data[i].user = 0;
	}
}

int main() {

	cv::Mat imgSrc;
	imgSrc = cv::imread(INPUT_IMG,CV_8UC1);
	printf("r %d, c %d, d %d\n",imgSrc.rows,imgSrc.cols,imgSrc.dims);

	uint8_t *myData = imgSrc.data;
	int width = imgSrc.cols;
	int height = imgSrc.rows;
	int _stride = imgSrc.step;//in case cols != strides
	for(int i = 0; i < height; i++)
	{
	    for(int j = 0; j < width; j++)
	    {
	        input_buffer[i * _stride + j] = myData[ i * _stride + j];
	    }
	}

	for (int i = 0; i < PACKETS; ++i) {
		input_data[i].data.range(7,0) = input_buffer[4*i];
		input_data[i].data.range(15,8) = input_buffer[4*i + 1];
		input_data[i].data.range(23,16) = input_buffer[4*i + 2];
		input_data[i].data.range(31,24) = input_buffer[4*i + 3];
	}

	input_data[0].user = 1;
	input_data[PACKETS-1].last = 1;

	reset_data();
	int8_t k0[4] = {-1, 0, 1, 0};
	int8_t k1[4] = {-2, 0, 2, 0};
	int8_t k2[4] = {-1, 0, 1, 0};
	ap_uint<32> r1 = *((unsigned long *)k0);
	ap_uint<32> r2 = *((unsigned long *)k1);
	ap_uint<32> r3 = *((unsigned long *)k2);
	int th1 = 80;
	int th2 = 80;
 	canny_edge(input_data,output_data,imgSrc.rows,imgSrc.cols, th1, th2);
	printf("Evaluate results\n");

	for (int i = 0; i < PACKETS; ++i) {
		output_buffer[4*i] = output_data[i].data.range(7,0);
		output_buffer[4*i + 1] = output_data[i].data.range(15,8);
		output_buffer[4*i + 2] = output_data[i].data.range(23,16);
		output_buffer[4*i + 3] = output_data[i].data.range(31,24);
	}

	cv::Mat imgHWcalc = cv::Mat(imgSrc.rows,imgSrc.cols,CV_8UC1);
	myData = imgHWcalc.data;
	width = imgHWcalc.cols;
	height = imgHWcalc.rows;
	_stride = imgHWcalc.step;//in case cols != strides
	for(int i = 0; i < height; i++)
	{
		for(int j = 0; j < width; j++)
		{
			myData[ i * _stride + j] = output_buffer[i * _stride + j];
		}
	}

	cv::imwrite(OUTPUT_IMG, imgHWcalc);
	cv::Mat imgcalc = cv::Mat(imgSrc.rows,imgSrc.cols,CV_8UC1);
	cv::Canny(imgSrc,imgcalc,th1,th2);	//generate test image
	cv::imwrite("openCVcalc.png", imgcalc);

	// Get a matrix with non-zero values at points where the
	// two matrices have different values
	cv::Mat diff = imgcalc != imgHWcalc;
	cv::Mat imgHWcalcColour;
	cv::Mat diffColour;
	cv::Mat diffColour2;
	cv::Mat diffColour3;
	cv::cvtColor(imgHWcalc,imgHWcalcColour,CV_GRAY2BGR);
	cv::cvtColor(diff,diffColour,CV_GRAY2BGR);
	//write diff
	cv::Mat ch1, ch2, ch3; // declare three matrices
	// "channels" is a vector of 3 Mat arrays:
	cv::vector<cv::Mat> channels(3);
	// split img:
	cv::split(diffColour, channels);
	// get the channels (follow BGR order in OpenCV)
	ch1 = channels[0];
	ch2 = channels[1];
	ch3 = channels[2];
	ch1 *= 0;
	ch2 *= 0;
	// modify channel// then merge
	cv::merge(channels, diffColour2);
	cv::add(imgHWcalcColour, diffColour2, diffColour3);
	cv::imwrite("calcDiff.png", diffColour3);
	if(cv::countNonZero(diff)==0){
		printf("imgHWcalc and imgcalc are equal\n");
	}else{
		printf("imgHWcalc and imgcalc are NOT equal\n");
		printf("imgHWcalc and imgcalc are NOT equal with %d false pixels2 of %d\n",cv::countNonZero(diff),cv::countNonZero(imgcalc));
	}
	// Equal if no elements disagree
	assert(cv::countNonZero(diff)==0);
}
