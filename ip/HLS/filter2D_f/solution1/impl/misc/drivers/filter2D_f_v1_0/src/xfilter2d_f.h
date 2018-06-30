// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.4
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

#ifndef XFILTER2D_F_H
#define XFILTER2D_F_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xfilter2d_f_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 Control_bus_BaseAddress;
} XFilter2d_f_Config;
#endif

typedef struct {
    u32 Control_bus_BaseAddress;
    u32 IsReady;
} XFilter2d_f;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XFilter2d_f_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XFilter2d_f_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XFilter2d_f_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XFilter2d_f_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XFilter2d_f_Initialize(XFilter2d_f *InstancePtr, u16 DeviceId);
XFilter2d_f_Config* XFilter2d_f_LookupConfig(u16 DeviceId);
int XFilter2d_f_CfgInitialize(XFilter2d_f *InstancePtr, XFilter2d_f_Config *ConfigPtr);
#else
int XFilter2d_f_Initialize(XFilter2d_f *InstancePtr, const char* InstanceName);
int XFilter2d_f_Release(XFilter2d_f *InstancePtr);
#endif

void XFilter2d_f_Start(XFilter2d_f *InstancePtr);
u32 XFilter2d_f_IsDone(XFilter2d_f *InstancePtr);
u32 XFilter2d_f_IsIdle(XFilter2d_f *InstancePtr);
u32 XFilter2d_f_IsReady(XFilter2d_f *InstancePtr);
void XFilter2d_f_EnableAutoRestart(XFilter2d_f *InstancePtr);
void XFilter2d_f_DisableAutoRestart(XFilter2d_f *InstancePtr);

void XFilter2d_f_Set_rows_V(XFilter2d_f *InstancePtr, u32 Data);
u32 XFilter2d_f_Get_rows_V(XFilter2d_f *InstancePtr);
void XFilter2d_f_Set_cols_V(XFilter2d_f *InstancePtr, u32 Data);
u32 XFilter2d_f_Get_cols_V(XFilter2d_f *InstancePtr);
void XFilter2d_f_Set_channels_V(XFilter2d_f *InstancePtr, u32 Data);
u32 XFilter2d_f_Get_channels_V(XFilter2d_f *InstancePtr);
void XFilter2d_f_Set_mode_V(XFilter2d_f *InstancePtr, u32 Data);
u32 XFilter2d_f_Get_mode_V(XFilter2d_f *InstancePtr);
void XFilter2d_f_Set_r11_V(XFilter2d_f *InstancePtr, u32 Data);
u32 XFilter2d_f_Get_r11_V(XFilter2d_f *InstancePtr);
void XFilter2d_f_Set_r12_V(XFilter2d_f *InstancePtr, u32 Data);
u32 XFilter2d_f_Get_r12_V(XFilter2d_f *InstancePtr);
void XFilter2d_f_Set_r13_V(XFilter2d_f *InstancePtr, u32 Data);
u32 XFilter2d_f_Get_r13_V(XFilter2d_f *InstancePtr);
void XFilter2d_f_Set_r21_V(XFilter2d_f *InstancePtr, u32 Data);
u32 XFilter2d_f_Get_r21_V(XFilter2d_f *InstancePtr);
void XFilter2d_f_Set_r22_V(XFilter2d_f *InstancePtr, u32 Data);
u32 XFilter2d_f_Get_r22_V(XFilter2d_f *InstancePtr);
void XFilter2d_f_Set_r23_V(XFilter2d_f *InstancePtr, u32 Data);
u32 XFilter2d_f_Get_r23_V(XFilter2d_f *InstancePtr);
void XFilter2d_f_Set_r31_V(XFilter2d_f *InstancePtr, u32 Data);
u32 XFilter2d_f_Get_r31_V(XFilter2d_f *InstancePtr);
void XFilter2d_f_Set_r32_V(XFilter2d_f *InstancePtr, u32 Data);
u32 XFilter2d_f_Get_r32_V(XFilter2d_f *InstancePtr);
void XFilter2d_f_Set_r33_V(XFilter2d_f *InstancePtr, u32 Data);
u32 XFilter2d_f_Get_r33_V(XFilter2d_f *InstancePtr);

void XFilter2d_f_InterruptGlobalEnable(XFilter2d_f *InstancePtr);
void XFilter2d_f_InterruptGlobalDisable(XFilter2d_f *InstancePtr);
void XFilter2d_f_InterruptEnable(XFilter2d_f *InstancePtr, u32 Mask);
void XFilter2d_f_InterruptDisable(XFilter2d_f *InstancePtr, u32 Mask);
void XFilter2d_f_InterruptClear(XFilter2d_f *InstancePtr, u32 Mask);
u32 XFilter2d_f_InterruptGetEnabled(XFilter2d_f *InstancePtr);
u32 XFilter2d_f_InterruptGetStatus(XFilter2d_f *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
