Project Description

************************************************************************
0. Files:
************************************************************************

Makefile	- Makes the binaries for the provided assembly file
ReadMe.txt	- This file
hexConverter.asm	- The file you will be modifying and handing in
typescript  - If you have not met all test cases/code does not compile etc.
any other supporting files

List expected inputs/outputs

************************************************************************
1. Expected inputs/outputs
************************************************************************

Test 1

Enter Number: 18446744073709551615

Hexadecimal value is: FFFFFFFFFFFFFFFF

Test 2

Enter Number: afadf

Invalid Input!



Test 3

Enter Number: 245453

Invalid Input!



Test 4

Enter Number: afdg dbdgbsgbfnnhnfhnh45647637

Invalid Input!



Test 5

Enter Number: 3564276575375787dfjhfdjdtj

Invalid Input!



Test 6



Enter Number: 1107895634578278122

Hexadecimal value is: F600935B33E86EA




Test 7

Enter Number: 9223372036854775808

Hexadecimal value is: 8000000000000000



Test 8

Enter Number: 12683270251100288260

Hexadecimal value is: B0040718331CB504



Test 9

Enter Number: 15683272751237288260

Hexadecimal value is: D9A62D79450FD144



Test 10

Enter Number: 9346678735677288564

Hexadecimal value is: 81B612CA0DBDF074

************************************************************************
2. How to compile and use this project
************************************************************************

Compilation

nasm -g -f elf64 -F dwarf hexConverter.asm
gcc -g hexConverter.o cfunc.c -o converter.out

Usage

./converter.out

************************************************************************
3. Functionality (describe your contributions here)
************************************************************************

I have two subroutines, atoi and convert.

Atoi will take the integer in string form, what is input. And converts
it into it's actualy integer value.

After I have the real integer value, I call convert which will begin the
process of divinding the integer by 16, saving the remainder, converting
it back into it's string form by adding 48 or 55 depending if its less
than or greater then 10.

I then take that hex character, and push it into a stack.

After the division is finished, I have a full stack of all 16 hex chars

print each character, pop it off the stack. This ensures that the
hexadecimal value is printed off in the correct order instead of
backwards

************************************************************************
4. Limitations (if any)
************************************************************************

No limitations as far as I know.

************************************************************************
5. Applications (your thoughts) of this project
************************************************************************

I'm sure conversion is very helpful when dealing with large numbers.

The less bytes you use the better in some situations.

Conversion between certain bases are simple for a computer to convert
