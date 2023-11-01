# Calculator in C 
## About
Basic calculator in C that operates on integer operands based on user input. 
 - Includes functions for simple operations (i.e., addition, subtraction, multiplication, and division).  
 - Error handles invalid inputs (e.g., non-numeric, divide-by-0).
 - Accepts user input for operands and operation.

**Note:** *Repository includes C and assembly source files.*

## How to Run C Code

    // First command generates executable.
    // Second command runs executable.
    gcc calculator.c -o calculator.o
    ./calculator.o

## How to Run Assembly Code
### Extended ASM (current)
    // Converts to extended assembly syntax using GCC (current).
    //
    // First command disassembles C into extended assembly syntax with GCC. 
    // Second command generates executable.
    // Third command runs executable.
    //
    // **NOTE: for syntax @see https://www.felixcloutier.com/documents/gcc-asm.html
    // **NOTE: for -pie @see https://stackoverflow.com/a/30426603/22279004
    // **NOTE: -S disassembles C code into extended assembly syntax (does not support nasm, masm, fasm, tasm)
    
    gcc -S calculator.c -o calculator.s
    gcc -o calculator calculator.s -pie
    ./calculator
    
  ### NASM (deprecated)
    
    // Compiles and executes assembly in NASM syntax (deprecated).
    //
    // First command assembles NASM (Netwide Assembler).
    // Second command generates executable.
    // Third command runs executable.
    //
    // ** NOTE: -felf64 specifies the output format as ELF64 (Executable and Linkable Format for 64-bit architectures).
    
    nasm -felf64 Calculator2.asm
    ld Calculator2.o -o Calculator2
    ./Calculator2

