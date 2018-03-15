#/bin/bash

rm *.o, *.lis, *.out

echo "assemble the X86 file x86_1.asm"
nasm -f elf64 -l x86_1.lis -o x86_1.o x86_1.asm

echo "compile the C++ file radius.cpp"
g++ -c -m64 -Wall -l radius.lis -o radius.o -fno-pie -no-pie radius.cpp

echo "link the two 'O' files x86_1.o and radius.o"
g++ -m64 -fno-pie -no-pie -o xeightsix.out radius.o x86_1.o 

echo "run the program"
./xeightsix.out


