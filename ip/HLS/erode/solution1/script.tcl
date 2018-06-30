############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
############################################################
open_project erode
set_top erode_hls
add_files erode/erode_hls.h
add_files erode/erode_hls.cpp
add_files -tb erode/erode_hls_test.cpp
open_solution "solution1"
set_part {xc7z020clg400-1} -tool vivado
create_clock -period 6 -name default
#source "./erode/solution1/directives.tcl"
csim_design -clean
csynth_design
cosim_design
export_design -flow impl -rtl verilog -format ip_catalog
