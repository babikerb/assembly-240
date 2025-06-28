# Author Name: Babiker Babiker
# CWID: 6449
# Section Number: 240-11
# Author Email: bbabiker@csu.fullerton.edu
# Date: 4/24/2025
# Identifier: Final Program

echo "Removing old executable and object files (if any)"
rm -f *.out *.o

echo "Assembling the X86 files"
nasm -f elf64 -o input_array.o input_array.asm
nasm -f elf64 -o output_array.o output_array.asm
nasm -f elf64 -o sum_array.o sum_array.asm
nasm -f elf64 -o variance.o variance.asm
nasm -f elf64 -o manager.o manager.asm
nasm -f elf64 -o isfloat.o isfloat.asm

echo "Compiling the C driver"
gcc -c driver.c -o driver.o

echo "Linking all object files into the executable learn.out"
gcc driver.o manager.o input_array.o output_array.o sum_array.o variance.o isfloat.o -o learn.out -no-pie -lm

echo "Running the program..."
./learn.out
