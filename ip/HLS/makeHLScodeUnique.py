#!/usr/bin/env python
"""
Usage: makeHLScodeUnique.py

This script searches for Verilog modules with the same name generated by Vivado HLS and makes them unique.
It searches in the current working directory for the projects given in the 'projects' list and replaces the 
modules given in the 'replace' list by concatenating them with the project name.
After that process, Vivado synthesized the IP's without any errors. 
"""

import os

projects = ['canny','filter2D','filter2D_f','erode','dilate','CornerHarris']
replace = ['SepFilter2D','Filter2D','Loop_1_proc','Loop_2_proc','Loop_3_proc','Block_proc','Block_Mat_exit406734','Loop_loop_height_pro','Duplicate','Sobel','Sobel_1']

for project in projects:
    PATH = os.getcwd()
    PATH = os.path.join(PATH, project)
    if not os.path.isdir(PATH):
        print(PATH, "is not a directory")
    else:
        PATH = os.path.join(PATH, 'solution1')
        PATH = os.path.join(PATH, 'impl')
        print(PATH)
        if os.path.isdir(PATH): 
            for path, dirs, files in os.walk(PATH):
                for filename in files:
                    fullpath = os.path.join(path, filename)
                    file_name, file_extension = os.path.splitext(fullpath)
                    if(file_extension == '.xml' or file_extension == '.xpr' or file_extension == '.log' \
                        or file_extension == '.tcl' or file_extension == '.vds'):
                        with open(fullpath, 'r') as f:
                            data = f.read()
                            for r in replace:
                                data = data.replace(r + '.v', r + '_' + project + '.v')
                        with open(fullpath, 'w') as f:
                            f.write(data)
                    if(file_extension == '.v'):
                        oldFile = ''
                        with open(fullpath, 'r') as f:
                            data = f.read()
                            for r in replace:
                                data = data.replace(r + ' ', r + '_' + project + ' ')
                                if filename == r +'.v':
                                    print(fullpath)
                                    oldFile = fullpath                       
                                    fullpath =  os.path.join(path, r + '_' + project +'.v')
                        if not oldFile == '' :
                            os.remove(oldFile)
                        with open(fullpath, 'w') as f:
                            f.write(data)
