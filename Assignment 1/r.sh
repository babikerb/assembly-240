# Copyright (C) 2025 Babiker Babiker.

# This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License
# version 3 as published by the Free Software Foundation. This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details. A copy of the GNU General Public License v3 is available here:
# https://www.gnu.org/licenses/.

# Author: Babiker Babiker
# Author Email: bbabiker@csu.fullerton.edu
# CWID: 871026449
# Class: 240-11 Section 11
# Program name: Triangles
# Programming Languages: one module in C, one in x86-64, and one in bash
# Date program began: 2025-Jan-24
# Date of last update: 2025-Jan-24
# Files in this program: geometry.c, triangle.asm, r.sh
# This file is the script file that accompanies the "Triangles" program.
# Prepare for execution in normal mode (not gdb mode).

# This File:
#   File Name: r.sh
#   Language: bash

#!/bin/bash

# Remove old executable files if there are any
echo "Remove old executable files if there are any"
rm -f *.out

# Assemble the X86 file triangle.asm, output object file triangle.o
echo "Assemble the X86 file triangle.asm, output object file triangle.o"
nasm -f elf64 -o triangle.o triangle.asm

# Compile the C file geometry.c, output object file geometry.o
echo "Compile the C file geometry.c, output object file geometry.o"
gcc -g -c geometry.c -o geometry.o

# Link the two object files geometry.o and triangle.o, output executable file learn.out
echo "Link the two object files geometry.o and triangle.o, output executable file learn.out"
gcc -g geometry.o triangle.o -o learn.out -no-pie -lm

# Run the program
echo "Next the program 'learn.out' will run"
./learn.out