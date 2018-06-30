############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
############################################################
open_project filter2D_f
set_top filter2D_f
add_files filter2D_f/filter2D_f.cpp
add_files filter2D_f/filter2D_f.h
add_files -tb filter2D_f/filter2D_f_test.cpp
open_solution "solution1"
set_part {xc7z020clg400-1} -tool vivado
create_clock -period 6 -name default
#source "./filter2D_f/solution1/directives.tcl"
csim_design -clean
csynth_design
cosim_design
export_design -flow syn -rtl verilog -format ip_catalog
