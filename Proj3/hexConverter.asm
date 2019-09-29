	;;  Convert user input to hexadecimal number.
	;;
	;;  Assemble using NASM:  nasm -f elf64 hexConverter.asm
	;;  Compile with gcc:     gcc hexConverter.o cfunc.c -o converter.out
	;;

	%define STDIN         0
	%define STDOUT        1
	%define SYSCALL_EXIT  60
	%define SYSCALL_READ  0
	%define SYSCALL_WRITE 1
	%define BUFLEN	      21


	SECTION .data	; initialized data section

msg1:	   db "Enter Number: "	; user prompt
len1:	   equ $-msg1		; length of first message

msg2:	   db "Invalid Input!", 10 ; error message
len2:	   equ $-msg2

msg3:	   db "Hexadecimal value is: " ; Feedback
len3:	   equ $-msg3

msg4:	   db 10		; Linefeed
len4:	   equ $-msg4

	SECTION .bss	; uninitialized data section
buf:	    resb BUFLEN	; buffer for read
newstr:	 resb BUFLEN	; converted string
count:	  resb 4	; reserve storage for user input bytes

	SECTION .text	; Code section.
	global  atoi
	global  main	; let gcc see entry point
	extern printhex	; This routine is defined in the c function
	extern printf	; This routine will be utilized in the c function

main:		nop		; Entry point.
start:				; address for gdb

	;;  prompt user for input
	;;
	mov rax, SYSCALL_WRITE ; write function
	mov rdi, STDOUT	; Arg1: file descriptor
	mov rsi, msg1	; Arg2: addr of message
	mov rdx, len1	; Arg3: length of message
	syscall	; 64-bit system call

	;;  read user input
	;;
	mov rax, SYSCALL_READ ; read function
	mov rdi, STDIN	; Arg1: file descriptor
	mov rsi, buf	; Arg2: addr of message
	mov rdx, BUFLEN	; Arg3: length of message
	syscall	; 64-bit system call

	jmp read_OK

	;;  error check
	;;
	mov [count], rax ; save length of string read
	cmp rax, 0	; check if any chars read
	jle invalid	; <=0 chars read = not valid

	cmp rax, 21	; check if 21 characters were read
	je	read_OK	; 21 characters read, we are good
	cmp rax, 20; check if 20 characters were read
	jb	invalid
	je	read_OK	; 20 characters read, we are good

invalid:	mov rax, SYSCALL_WRITE ; Or Print Error Message
	mov rdi, STDOUT	       ; Arg1: file descriptor
	mov rsi, msg2  ; Arg2: addr of message
	mov rdx, len2	; Arg3: length of message
	syscall	; 64-bit system call
	jmp     exit	; skip over rest

read_OK:
	;;  Loop for conversion
	;;  assuming count > 0
	;;
init:

	
	;;  printout the precursor message
	mov rax, SYSCALL_WRITE ; Print Message
	mov rdi, STDOUT	; Arg1: file descriptor
	mov rsi, msg3	; Arg2: addr of message
	mov rdx, len3	; Arg3: length of message

	syscall	; 64-bit system call

	call	atoi
	call	convert

	;;  printout the linefeed
	mov rax, SYSCALL_WRITE ; Print Message
	mov rdi, STDOUT	; Arg1: file descriptor
	mov rsi, msg4	; Arg2: addr of message
	mov rdx, len4	; Arg3: length of message
	syscall	; 64-bit system call
	
	;;  final exit
	;;
exit:	mov 	rax, SYSCALL_EXIT
	mov 	rdi, 0	; exit to shell
	syscall


	;; Converts the 64-bit int into a hexadecimal char by char
convert:
	mov	r10, 'Z' 	; push Z into stack. used to exit the loop
	push	r10
convert_top:
	mov	r8, 16		; move 16 into r8, used to divid
	mov	rdx, 0		; set rdx to 0 to avoid divid errors
	div	r8		; divid RAX/R8 ( RAX/ 16)
	                        ;; RAX = Quotient, RDX = Remainder
	
	cmp	rdx, 10		;compare to 10
	jb	convert_below	; jump to below to keep it an "int"
	je	convert_above	; jump if equal to make it "ADCDEF in hex
	ja	convert_above	; jump to above to make it "ABCDEF" in hex
convert_below:
	add	rdx, 48		; add 48 to rdx to convert it back into a string
	mov	r10, rdx	; move character into the stack
	push	r10		; push stack to help reverse the order
	;; This will push the hex characters in reverse order.
	;; When you pop them, they will pop in the correct order
	
	cmp	rax, 0		; check if we're done dividing
	je	convert_bot_init ;if RAX is 0 then we've finished
	
	jmp	convert_top	;otherwise, keep looping and dividing
	
convert_above:	
	add 	rdx, 55		; add 55 to rdx to convert it back into a string
	mov	r10, rdx	; move character into the stack
	push	r10		; push stack to help reverse the order
	;; this will push the hex characters in reverse order.
	;; When you pop them, theyw ill pop in the correct order

	cmp	rax, 0		; check if we're done dividing
	je	convert_bot_init ;if RAX is 0 then we've finished
	
	jmp	convert_top	; otherwise, keep looping and dividing

convert_bot_init:
	pop	r10		;For some reason, it kept printing out the first character in the
	;; converted hexadecimal first. This is a bandaid  that fixes that, if I have time I will
	;; trace through and fix it
convert_bot:

	cmp	r10, 'Z' 	;check to see if I've reached the end of the stack
	je	convert_end	;if i have, then finish subroutine

	mov	rdi, r10	; move the top of the stack into rdi (arg1)
	pop	r10		; pop the stack

break:	
	
	push	r10		; push to preserve the stack
	call	printhex	; call cfunc.c, which will print one character of the converted hex
	pop	r10		; pop to preserve the stach

	jmp	convert_bot	; loop back to convert_bot until end of stack

convert_end:	
	ret			; return to where we came from

	
	;; Convert string to int
atoi:
	mov	rdi, buf	;load the string int into rdi
	mov	rax, 0		; set the sum to zero
	mov	r8, 10		; set r8 to 10, used for multiplication
atoi_convert:
	movzx	rsi, byte [rdi] ;get the first character in rdi, move it into rsi
	inc 	rdi		; update RDI pointer

	cmp	rsi, 10		; compare rsi to newline, 10
	je	atoi_done	; jump to exit
	
	cmp	rsi, '0'	; check if the character is less than '0'
	jb	invalid		; jump to invalid

	cmp	rsi, '9'	; check if the cahracter is greater than '9'
	ja	invalid		; jump to invalid

	sub	rsi, '0'	;subtract '0' or 48, this will make the string "int" into
	;; its decimal form
	mul	r8		; multiply by 10, pushes the sum up a power
	;; allows you to add a single digit number to the sum
	add	rax, rsi	; add the decimal number into the sum

	jmp	atoi_convert	; loop loop loop
atoi_done:
	ret			; return to where we came
