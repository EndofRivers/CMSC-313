; File: bookcmp.asm
;
;Defines the bookcmp subroutine for use by the sort algorithm in sort_books.c
;
    
%define TITLE_OFFSET 0
%define AUTHOR_OFFSET 41
%define YEAR_OFFSET 64

        SECTION .text                ; Code section.
        global  bookcmp              ; let loader see entry point
	extern book1, book2	     ; letting nasm know these are external

bookcmp:
	push	rbp                       ; push the base pointer
	mov	rbp, rsp                  ; move stack pointer onto rbp (Prologue)

	push	rdi                       ; push registers we want to use
	push	rsi
	
	mov	rdi, [rbp - 8]            ; move first book into rdi
	mov	rsi, [rbp - 16]           ; move second book into rsi

	mov	eax, dword [rdi + YEAR_OFFSET] ; move year into eax reg

	cmp	eax, dword [rsi + YEAR_OFFSET] ; compare to second book
	jne	L_eq			       ; lexicographically equaically if not equal

	xor	rcx,rcx		; zero out the counter just in case
cmpTitles:                           ; Fall through to here if years same
                                ; Compare the book title strings
	mov	al, byte [rdi + rcx + TITLE_OFFSET] ; book2

	cmp	al, byte [rsi + rcx + TITLE_OFFSET] ;comparison to book2
	jl	L_lt				    ; Jump if less
	jg	L_gt				    ; Jump if greater
	
	inc 	rcx		;inc counter

	cmp	al, 0		; check for NULL character
	je	L_eq		; If at end of string, 
	jne	cmpTitles	; Loop if more
cmpDone:                             ; Things to do after titles are compared


L_lt:
    mov    rax, -1                   ; book1 is strictly less than book2
    jmp    end
    
L_eq:    
    mov    rax, 0                    ; book1 equals book2
    jmp    end
    
L_gt:    
    mov    rax, 1                    ; book1 is strictly greater than book2

    ;; Clean up and finish
end:    
	pop    rsi                       ; clean up
	pop    rdi

    leave                            ; Sets RSP to RBP and pops off RBP (Epilogue)
    ret
