############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
############################################################
open_project filter2D_5
set_top filter2D_hls_5
add_files filter2D_5/filter2D_hls_5.h
add_files filter2D_5/filter2D_hls_5.cpp
add_files -tb filter2D_5/filter2D_hls_5_test.cpp
open_solution "solution1"
set_part {xc7z020clg400-1} -tool vivado
create_clock -period 6 -name default
#source "./filter2D_5/solution1/directives.tcl"
csim_design -clean
csynth_design
cosim_design
export_design -flow impl -rtl verilog -format ip_catalog
