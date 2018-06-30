#include <cassert>
#include <iostream>
#include <stdio.h>
#include <hls_opencv.h>

#include "filter2D_f.h"

#define INPUT_IMG "../../../lena_gray.bmp"
#define OUTPUT_IMG "calc.png"

#define W 512
#define H 512
#define CH 1



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

	//mode = 2
	for (int i = 0; i < PACKETS; ++i) {
		input_data[i].data.range(7,0) = input_buffer[4*i];
		input_data[i].data.range(15,8) = input_buffer[4*i + 1];
		input_data[i].data.range(23,16) = input_buffer[4*i + 2];
		input_data[i].data.range(31,24) = input_buffer[4*i + 3];
	}

	input_data[0].user = 1;
	input_data[PACKETS-1].last = 1;

	reset_data();
	//sigma =0.8
	cv::Mat k = cv::getGaussianKernel(3,0.8,CV_32F);
	float k0 = k.at<float>(0);
	float k1 = k.at<float>(1);
	float k2 = k.at<float>(2);
	printf("%f,%f,%f\n",k0,k1,k2);
	ap_uint<32> r11 = int((k0*k0 * (1 << K_FP_W-K_FP_I)));
	ap_uint<32> r12 = int((k0*k1 * (1 << K_FP_W-K_FP_I)));
	ap_uint<32> r13 = int((k0*k2 * (1 << K_FP_W-K_FP_I)));
	ap_uint<32> r21 = int((k1*k0 * (1 << K_FP_W-K_FP_I)));
	ap_uint<32> r22 = int((k1*k1 * (1 << K_FP_W-K_FP_I)));
	ap_uint<32> r23 = int((k1*k2 * (1 << K_FP_W-K_FP_I)));
	ap_uint<32> r31 = int((k2*k0 * (1 << K_FP_W-K_FP_I)));
	ap_uint<32> r32 = int((k2*k1 * (1 << K_FP_W-K_FP_I)));
	ap_uint<32> r33 = int((k2*k2 * (1 << K_FP_W-K_FP_I)));
	printf("%d,%d,%d\n",(int)r11,(int)r12,(int)r13);
	printf("%d,%d,%d\n",(int)r21,(int)r22,(int)r23);
	printf("%d,%d,%d\n",(int)r31,(int)r32,(int)r33);
	int mode = 2;
	filter2D_f(input_data,output_data,imgSrc.rows,imgSrc.cols,CH,mode,r11,r12,r13,r21,r22,r23,r31,r32,r33);
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

	cv::GaussianBlur(imgSrc,imgcalc,cv::Size( 3, 3 ),0.8);		//generate test image
	//cv::blur(imgSrc,imgcalc,cv::Size( 3, 3 ));
	cv::imwrite("openCVcalcblur.png", imgcalc);
	cv::imwrite("HWcalcblur.png", imgHWcalc);
	// Get a matrix with non-zero values at points where the
	// two matrices have different values
	cv::Mat diff;
	cv::absdiff(imgcalc,imgHWcalc,diff);
	if(cv::countNonZero(diff)==0){
		printf("imgHWcalc and imgcalc are equal for mode:%d\n",mode);
	}else{
		printf("imgHWcalc and imgcalc are NOT equal for mode:%d with %d false pixels of %d pixels\n",mode,cv::countNonZero(diff),imgSrc.rows*imgSrc.cols);
		cv::Mat diff1;
		cv::add(diff,-1,diff1);
		printf("%d pixels are off by more than +-1\n",cv::countNonZero(diff1));
	}
	// Equal if no elements disagree
	assert(cv::countNonZero(diff)==0);
}
