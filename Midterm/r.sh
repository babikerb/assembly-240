#!/bin/bash

#******************************************************************************************************************************
#  Author name: Babiker Babiker
#  Author email: bbabiker@csu.fullerton.edu
#  CWID: 871026449
#  Class: 240-11 Section 11
#  Date: March 11, 2025
#  240-11 Midterm Program
#  File name: main.sh
#  Preferred Email Address: bbabiker@csu.fullerton.edu
#******************************************************************************************************************************

# Remove old executable files if there are any
echo "Removing old executable files if there are any"
rm -f *.out *.o

# Assemble the X86 files electricity.asm and current.asm
echo "Assembling the X86 files electricity.asm and current.asm"
nasm -f elf64 -o electricity.o electricity.asm
nasm -f elf64 -o current.o current.asm
nasm -f elf64 -o isfloat.o isfloat.asm

# Compile the C file main.c
echo "Compiling the C file main.c"
gcc -c main.c -o main.o

# Link the object files into a final executable
echo "Linking main.o, electricity.o, and current.o to create learn.out"
gcc main.o electricity.o current.o isfloat.o -o learn.out -no-pie -lm

# Run the program
echo "Next the program 'learn.out' will run"
./learn.out