Project Description

************************************************************************
0. Files:
************************************************************************

Makefile	- Makes the binaries for the provided assembly file
ReadMe.txt	- This file
proj4.asm	- The file you will be modifying and handing in
driver.asm	- This file is given and untouched
library.o	- This file is givena nd untouched
typescript  - If you have not met all test cases/code does not compile etc.
any other supporting files

List expected inputs/outputs

************************************************************************
1. Expected inputs/outputs
************************************************************************

When executing make test

============
Program output matches expected

When running via ./proj4

Stieg Larsson
Lee Child
Margaret Atwood
J.K. Rowling
Andrew Gross
Todd Burpo
Victoria Thompson
Debbie Macomber
Lincoln Child
Stephenie Meyer
Ally Condie
Sarah Bird
Christopher Paolini
Victoria Dahl
Richard Marsh
Charlaine Harris
Debbie Macomber
Joyce Carol Oates
Umberto Eco
Meg Meeker, M.D.
Kim Carpenter
Pamela Clare
=========
Janet Evanovich
Stieg Larsson
Lee Child
Margaret Atwood
J.K. Rowling
Andrew Gross
Todd Burpo
Victoria Thompson
Debbie Macomber
Lincoln Child
Stephenie Meyer
Stephenie Meyer
Ally Condie
Anna Katherine Green
Sarah Bird
Claire Cook
Christopher Paolini
Victoria Dahl
Richard Marsh
Charlaine Harris
Debbie Macomber
Joyce Carol Oates
Umberto Eco
Lionel Shriver
Meg Meeker, M.D.
Nicholas Sparks
Kim Carpenter
Pamela Clare
=========
Margaret Atwood
J.K. Rowling
=========
Kathryn Stockett
Janet Evanovich
Stieg Larsson
Lee Child
Margaret Atwood
J.K. Rowling
Andrew Gross
Todd Burpo
Victoria Thompson
Debbie Macomber
Lincoln Child
Stephenie Meyer
Stephenie Meyer
Ally Condie
Anna Katherine Green
Sarah Bird
Claire Cook
Christopher Paolini
Victoria Dahl
Richard Marsh
Charlaine Harris
Elin Hilderbrand
Debbie Macomber
Joyce Carol Oates
Umberto Eco
Lionel Shriver
Meg Meeker, M.D.
Nicholas Sparks
Charles C. Mann
Kim Carpenter
Pamela Clare
=========
Stieg Larsson
Lee Child
Margaret Atwood
J.K. Rowling
Andrew Gross
Todd Burpo
Victoria Thompson
Debbie Macomber
Lincoln Child
Stephenie Meyer
Ally Condie
Sarah Bird
Christopher Paolini
Victoria Dahl
Richard Marsh
Charlaine Harris
Debbie Macomber
Joyce Carol Oates
Umberto Eco
Meg Meeker, M.D.
Nicholas Sparks
Kim Carpenter
Pamela Clare
=========
=========
Stieg Larsson
Lee Child
Margaret Atwood
J.K. Rowling
Andrew Gross
Victoria Thompson
Christopher Paolini
Victoria Dahl
Richard Marsh
Joyce Carol Oates
Meg Meeker, M.D.
Kim Carpenter
=========
Lee Child
Margaret Atwood
J.K. Rowling
Andrew Gross
Victoria Thompson
Victoria Dahl
Richard Marsh
Joyce Carol Oates
Meg Meeker, M.D.
=========
Margaret Atwood
=========
Stieg Larsson
Lee Child
Margaret Atwood
J.K. Rowling
Andrew Gross
Victoria Thompson
Debbie Macomber
Ally Condie
Christopher Paolini
Victoria Dahl
Richard Marsh
Charlaine Harris
Debbie Macomber
Joyce Carol Oates
Umberto Eco
Meg Meeker, M.D.
Kim Carpenter
=========


************************************************************************
2. How to compile and use this project
************************************************************************

Compilation

typing "make" into the console

Usage

make test

or

./proj4

will run the program

************************************************************************
3. Functionality (describe your contributions here)
************************************************************************

List of things I did in order:
- Extract the price from the current node in the Linked List
- Compare that node to the price passed into subroutine
- The extracted price was popped with fcomip afterward
- If the price was less than the price given, then jump to skip
  which skipped over any printing parts of the program
- Update the pointer of the linked list so that rsi = NEXT_OFFSET
- Compare rsi to 0, if equal jump to cleanUp
- If not, jump back to printName and repeat this list


************************************************************************
4. Limitations (if any)
************************************************************************

"make test" has given me the okay. Saying that my output matches.

************************************************************************
5. Applications (your thoughts) of this project
************************************************************************

We didn't do much actual coding in this project as most of it was done
for us. However, this is a basic searching function, however normally
you'd be looking for cheaper books rather than more expensive ones.

For example, when you're online shoping, you can give it a price and
it will only show you products that are equal to or lower than the price
you gave it. This is the opposite of what we did in this project.
