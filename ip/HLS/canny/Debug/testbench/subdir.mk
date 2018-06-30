################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../canny_edge_test.cpp 

OBJS += \
./testbench/canny_edge_test.o 

CPP_DEPS += \
./testbench/canny_edge_test.d 


# Each subdirectory must supply rules for building sources it contributes
testbench/canny_edge_test.o: C:/Users/sdi_admin/CloudStation/HLS/canny/canny_edge_test.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -DAESL_TB -D__llvm__ -D__llvm__ -IC:/Xilinx/Vivado/2017.4/include -IC:/Xilinx/Vivado/2017.4/include/etc -IC:/Xilinx/Vivado/2017.4/win64/tools/auto_cc/include -IC:/Xilinx/Vivado/2017.4/win64/tools/systemc/include -IC:/Xilinx/Vivado/2017.4/include/ap_sysc -IC:/Users/sdi_admin/CloudStation/HLS -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


