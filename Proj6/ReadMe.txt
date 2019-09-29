Project Description - Project 6
Nicholas J Long
nlong2@umbc.edu

************************************************************************
0. Files:
************************************************************************

Makefile	- Makes the binaries for the provided assembly file
ReadMe.txt	- This file
frac_heap.h	- Header file given, added union to file
frac_heap.c	- Project file, mallocs, deletions, free_list handled
		  here.
test1-6.c	- Test files given
typescript  - If you have not met all test cases/code does not compile etc.
any other supporting files

List expected inputs/outputs

************************************************************************
1. Expected inputs/outputs
************************************************************************

Matches Proj6.txt

as well as matches the descriptions in the test1-6.c files as
to what should happen.

Typescript includes all expected outputs.

************************************************************************
2. How to compile and use this project
************************************************************************

Compilation

gcc -g

Can use makefile to compile.

make - Compile proj6
make test1 - Compile test1
make test2 - Compile test2
make test3 - Compile test3
make test4 - Compile test4
make test5 - Compile test5
make test6 - Compile test6

Usage

make run - run proj6
make run1 - run test1
make run2 - run test2
make run3 - run test3
make run4 - run test4
make run5 - run test5
make run6 - run test6

************************************************************************
3. Functionality (describe your contributions here)
************************************************************************

Allocation of memory was handled by me. Only allocating 10 blocks
at a time. Putting these blocks into a linked list to be used by the
user when needed.

Free was never used, instead when something is to be deleted. We just
add it back to the free list to be used later.

Many checks to ensure that NULL pointers weren't used and provided
printf to explain what happened


************************************************************************
4. Limitations (if any)
************************************************************************

No limitations as far as I can tell.


************************************************************************
5. Applications (your thoughts) of this project
************************************************************************

This was an interesting usage of a linked list to control memory.
I am curious how often something like this would be implemented in the
real working world. I found the idea cool as I was working through the
project.

Memory and efficiency is such an important part of the C/C++ language
Well, in CompSci in general. But I know C/C++ memory is controlled
by the programmer vs Java has it's own control.

Anything to create little loop holes, or reduce cost is awesome.
