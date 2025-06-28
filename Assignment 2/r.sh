echo "Removing old object files..."
rm -f *.o *.out

echo "Assemble the source file manager.asm"
nasm -f elf64 -l manager.lis -o manager.o manager.asm

echo "Assemble the source file input_array.asm"
nasm -f elf64 -l input_array.lis -o input_array.o input_array.asm

echo "Assemble the source file sum.asm"
nasm -f elf64 -l sum.lis -o sum.o sum.asm

echo "Assemble the source file isfloat.asm"
nasm -f elf64 -l isfloat.lis -o isfloat.o isfloat.asm

echo "Assemble the source file output_array.asm"
nasm -f elf64 -l output_array.lis -o output_array.o output_array.asm

echo "Assemble the source file swap.asm"
nasm -f elf64 -l swap.lis -o swap.o swap.asm

echo "Compile the source file sort.c"
gcc -m64 -Wall -no-pie -o sort.o -std=c2x -c sort.c

echo "Compile the source file main.cpp"
g++ -m64 -Wall -no-pie -c -o main.o main.cpp 

echo "Link the object modules to create an executable file"
g++ -m64 -Wall -fno-pie -no-pie -z noexecstack -std=c2x -o manager.out \
    main.o manager.o input_array.o isfloat.o output_array.o sum.o swap.o sort.o -lm

echo "Execute the program"
./manager.out

echo "This bash script will now terminate."
