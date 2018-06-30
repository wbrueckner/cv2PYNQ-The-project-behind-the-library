// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.4
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xerode_hls.h"

extern XErode_hls_Config XErode_hls_ConfigTable[];

XErode_hls_Config *XErode_hls_LookupConfig(u16 DeviceId) {
	XErode_hls_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XERODE_HLS_NUM_INSTANCES; Index++) {
		if (XErode_hls_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XErode_hls_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XErode_hls_Initialize(XErode_hls *InstancePtr, u16 DeviceId) {
	XErode_hls_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XErode_hls_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XErode_hls_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

