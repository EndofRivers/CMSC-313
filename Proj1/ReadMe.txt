Project Description, Nicholas J Long

************************************************************************
0. Files:
************************************************************************

Makefile	- Makes the binaries for the provided assembly file
ReadMe.txt	- This file
atbash.asm	- The file you will be modifying and handing in
typescript  - If you have not met all test cases/code does not compile etc.
any other supporting files

List expected inputs/outputs

************************************************************************
1. Expected inputs/outputs
************************************************************************
Test 1

Enter string: abcdef

Original: abcdef

Convert:  zyxwvu

Test 2

Enter string: AbCdEfGhI

Original: AbCdEfGhI

Convert:  ZyXwVuTsR

Test 3

Enter string: NoPqRsTuV

Original: NoPqRsTuV

Convert:  MlKjIhGfE

Test 4

Enter string: 1+1=Two

Original: 1+1=Two

Convert:  1+1=Gdl

Test 5

Enter string: retriever@umbc.edu

Original: retriever@umbc.edu

Convert:  ivgirvevi@fnyx.vwf

Test 6

Enter string: 1 One 2 Two 3 Three 4 Four 5 Five 6 Six

Original: 1 One 2 Two 3 Three 4 Four 5 Five 6 Six

Convert:  1 Lmv 2 Gdl 3 Gsivv 4 Ulfi 5 Urev 6 Hrc

Test 7 (Note: In this test, only the enter key was input)

Enter string:

Original:

Convert:

Test 8

Enter string: 'quotes!'

Original: 'quotes!'

Convert:  'jflgvh!'

Test 9

Enter string: arithmetic+-%^&*

Original: arithmetic+-%^&*

Convert:  zirgsnvgrx+-%^&*

Test 10

Enter string: wefjhdjw^%^&%&^$$

Original: wefjhdjw^%^&%&^$$

Convert:  dvuqswqd^%^&%&^$$

************************************************************************
2. How to compile and use this project
************************************************************************

Compilation

 Assemble using NASM: -f elf64 -g -F dwarf

Usage

To use this project, compile then use the ./atbash command to run it.
Enter a string of characters and it will provide the converted string.

************************************************************************
3. Functionality (describe your contributions here)
************************************************************************

atbash.asm will encode any text you provide it. By doing some ascii math
and converting the original text, it will flip all of the letters to
their opposites (A to Z, H to S, etc) while also maintaining the letters
case. Any symbols will be ignored and unchanged.

************************************************************************
4. Limitations (if any)
************************************************************************

No limitations. Passes all tests.

************************************************************************
5. Applications (your thoughts) of this project
************************************************************************

This project could be useful for ...

nothing. At least not as is. I'm not sure what you would need an atbash
cipher for. However, it was useful as a teacher tool to get my feet wet
in Assembly. That was the hardest part of this project, was actually
being able to read and understand Assembly and how to code it.
