Project Description

************************************************************************
0. Files:
************************************************************************

Makefile	- Makes the binaries for the provided assembly file
ReadMe.txt	- This file
textSearch.asm	- The file you will be modifying and handing in
typescript  - If you have not met all test cases/code does not compile etc.
any other supporting files

List expected inputs/outputs

************************************************************************
1. Expected inputs/outputs
************************************************************************

My inputs and outputs match the given outputs from the test cases

Test 1

Enter search string: K

Text you search appears at  0 characters after the first.

Test 2

Enter search string: Rider

Text you search appears at  7 characters after the first.

Test 3

Enter search string: er,

Text you searched for, appears at  253 characters after the first.

Test 4

Enter search string: ht.

Text you searched for, appears at  287 characters after the first.

Test 5

Enter search string: anger

Text you searched for, appears at  39 characters after the first.

Test 6

Enter search string: criminals who operate above the law

Text you searched for,  appears at  206 characters after the first.

Test 7

Enter search string: cent

Text you searched for,  appears at  159 characters after the first.

Test 8

Enter search string: Knight Rider,

Text you searched for,  appears at  243 characters after the first.

Test 9

Enter search string: rider

String not found!

Test 10

Enter search string: random@3456

String not found!


************************************************************************
2. How to compile and use this project
************************************************************************

Compilation

From my makefile:

	AS=nasm
	LD=ld
	ASFLAGS=-f elf64 -g -F dwarf
	.PREFIXES= .o .asm



Usage

./textSearch

then input any text and it will search the given paragraph

************************************************************************
3. Functionality (describe your contributions here)
************************************************************************

I think I followed the KMP algorithm? Or something close to it.
I just compared every character of the paragraph with the first
character of the searched string. If they were a match, then I would
advance the searched string to the next character and keep incrementing
the paragraph pointer. If it ever failed the search, then it would reset
back to the first character in the searched word.

There was some counters and math needed to keep the two pointers and the
location of the found word accurate, but overall this method worked.

************************************************************************
4. Limitations (if any)
************************************************************************

No limitations

************************************************************************
5. Applications (your thoughts) of this project
************************************************************************

Well, almost every application now-a-days has a search function. Commonly
on windows it will be CTRL + F. Extremely helpful for quick searches and
saves the user a ton of time.
