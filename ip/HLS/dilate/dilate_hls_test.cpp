#include <cassert>
#include <iostream>
#include <stdio.h>
#include <hls_opencv.h>

#include "dilate_hls.h"

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

	for (int i = 0; i < PACKETS; ++i) {
		input_data[i].data.range(7,0) = input_buffer[4*i];
		input_data[i].data.range(15,8) = input_buffer[4*i + 1];
		input_data[i].data.range(23,16) = input_buffer[4*i + 2];
		input_data[i].data.range(31,24) = input_buffer[4*i + 3];
	}

	input_data[0].user = 1;
	input_data[PACKETS-1].last = 1;

	reset_data();
	int mode = cv::MORPH_RECT;
	//int mode = cv::MORPH_CROSS;
	//int mode = cv::MORPH_ELLIPSE;

	dilate_hls(input_data,output_data,imgSrc.rows,imgSrc.cols,CH,mode);
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
	cv::Mat k = cv::getStructuringElement(mode, cv::Size(3,3),cv::Point(-1,-1));
	printf("%d,%d,%d\n",k.at<uint8_t>(0,0),k.at<uint8_t>(0,1),k.at<uint8_t>(0,2));
	printf("%d,%d,%d\n",k.at<uint8_t>(1,0),k.at<uint8_t>(1,1),k.at<uint8_t>(1,2));
	printf("%d,%d,%d\n",k.at<uint8_t>(2,0),k.at<uint8_t>(2,1),k.at<uint8_t>(2,2));
	cv::dilate(imgSrc,imgcalc,k);		//generate test image
	cv::imwrite("openCVcalc.png", imgcalc);

	// Get a matrix with non-zero values at points where the
	// two matrices have different values
	cv::Mat diff = imgcalc != imgHWcalc;
	if(cv::countNonZero(diff)==0){
		printf("imgHWcalc and imgcalc are equal\n");
	}else{
		printf("imgHWcalc and imgcalc are NOT equal\n");
	}
	// Equal if no elements disagree
	assert(cv::countNonZero(diff)==0);
}
