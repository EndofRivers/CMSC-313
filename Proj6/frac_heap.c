#include "frac_heap.h"
#include <stdio.h>
#include <stdlib.h>

#define block_size 10
static fraction_block *free_list;


/*
 * init_heap():
 * must be called once by the program using your
 * functions before calls to any other functions are made. This
 * allows you to set up any housekeeping needed for your memory
 * allocator. For example, this is when you can initialize
 * your free block list.
 */
void init_heap(void) {

  free_list = malloc( block_size * sizeof(fraction_block));
  printf("\nCalled malloc(%d): Returned 0x%Lx\n\n");
  //  free_list->next = NULL;

  if(free_list) {
    for(int i = 0; i < (block_size - 1); i++)
      free_list[i].next = &free_list[i + 1];
    free_list[block_size - 1].next = NULL;
  }
  else
    printf("“\nError: No more memory space left for allocation!\n");

}// init_heap

/*
 * new_frac():
 * must return a pointer to fractions.
 * It should be an item taken from the list of free blocks.
 * (Don't forget to remove it nfrom the list of free blocks!)
 * If the free list is empty, you need to get more using malloc()
 * (Number of blocks to malloc each time is specified in the project
 * description)
 */
fraction *new_frac(void) {
  if( free_list == NULL )
    init_heap();

  fraction_block *ptr;
  ptr = free_list;
  free_list = free_list->next;
  ptr->next = NULL;

  return (&ptr->frac);
}// new_frac

/*
 * del_frac():
 * takes a pointer to a fraction and adds that item to the free block list.
 * The programmer using your functions promises to never use that item again,
 * unless the item is given to her/him by a subsequent call to new_frac().
 */
void del_frac(fraction *frac) {

  if(frac == NULL)
    printf("\nError: del_frac() issued on NULL pointer.\n\n");

  else{

    fraction_block *ptr;
    ptr = (fraction_block*) frac;

    ptr->next = free_list;
    free_list = ptr;

  }
}

/*
 * dump_heap():
 * For debugging/diagnostic purposes.
 * It should print out the entire contents of the free list,
 * printing out the address for each item.
 */
void dump_heap(void) {

  printf("\n**** BEGIN HEAP DUMP ****\n\n");

  if(free_list == NULL) {
    printf("\nFree list is empty\n");
    printf("\n**** END HEAP DUMP ****\n\n");
    return;
  }
  
  fraction_block *ptr;
  ptr = free_list;
  while( ptr != NULL) {
    printf("    0x%Lx\n", ptr);
    ptr = ptr->next;
  }
  
  printf("\n**** END HEAP DUMP ****\n\n");
}

