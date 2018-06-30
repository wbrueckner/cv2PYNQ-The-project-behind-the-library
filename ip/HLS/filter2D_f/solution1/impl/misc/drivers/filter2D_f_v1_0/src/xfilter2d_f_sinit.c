// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.4
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xfilter2d_f.h"

extern XFilter2d_f_Config XFilter2d_f_ConfigTable[];

XFilter2d_f_Config *XFilter2d_f_LookupConfig(u16 DeviceId) {
	XFilter2d_f_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XFILTER2D_F_NUM_INSTANCES; Index++) {
		if (XFilter2d_f_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XFilter2d_f_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XFilter2d_f_Initialize(XFilter2d_f *InstancePtr, u16 DeviceId) {
	XFilter2d_f_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XFilter2d_f_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XFilter2d_f_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

