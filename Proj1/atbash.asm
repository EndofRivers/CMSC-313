	;;  File: toupper.asm last updated 09/17/2018
	;;
	;;  Convert user input to upper case.
	;;
	;;  Assemble using NASM:  nasm -f elf64 toupper.asm
	;;  Link with ld:  ld toupper.o -o toupper
	;;

	%define STDIN         0
	%define STDOUT        1
	%define SYSCALL_EXIT  60
	%define SYSCALL_READ  0
	%define SYSCALL_WRITE 1
	%define BUFLEN        256


	SECTION .data	; initialized data section

msg1:	   db "Enter string: "	; user prompt
len1:	   equ $-msg1		; length of first message

msg2:	   db "Original:  "	; original string label
len2:	   equ $-msg2		; length of second message

msg3:	   db "Converted: "	; converted string label
len3:	   equ $-msg3

msg4:	   db 10, "Read error", 10 ; error message
len4:	   equ $-msg4

capA:	   db 0x41 		; Hex value of capital A
	
table:     db "ZYXWVUTSRQPONMLKJIHGFEDCBA[\]^_'zyxwvutsrqponmlkjihgfedcba" ; alphebet backwards

tablelen:  db 50 		; length of each table


	SECTION .bss	; uninitialized data section
buf:	    resb BUFLEN	; buffer for read
newstr:	 resb BUFLEN	; converted string
count:	  resb 4	; reserve storage for user input bytes


	SECTION .text	; Code section.
	global  _start	; let loader see entry point

_start:	 nop			; Entry point.
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

	;;  error check
	;;
	mov [count], rax ; save length of string read
	cmp rax, 0	; check if any chars read
	jg  read_OK	; >0 chars read = OK
	mov rax, SYSCALL_WRITE ; Or Print Error Message
	mov rdi, STDOUT	; Arg1: file descriptor
	mov rsi, msg4	; Arg2: addr of message
	mov rdx, len4	; Arg3: length of message
	syscall	; 64-bit system call
	jmp     exit	; skip over rest
read_OK:


	;;  Loop for upper case conversion
	;;  assuming count > 0
	;;
L1_init:
	mov     r15, [count] ; initialize count
	mov     rsi, buf ; point to start of buffer
	mov     rdi, newstr ; point to start of new string
	mov	rsp, table  ; stores table
	
L1_top:
	mov     al, [rsi] ; get a character from buffer
	inc 	rsi

	
	cmp	al, 0x41
	jb	L1_edge

	cmp 	al, 0x5A
	ja	L1_midchar
L1_jump1:	

	cmp	al, 0x7A
	ja	L1_edge
	
	mov	cl, [capA] ; get a character from table1
	sub	al, cl	  ; subtracting table value from buffer
 	movzx	rbx, al	  ;
	movzx 	rdx, byte[table + rbx] ;
	
L1_cont:	
	mov 	[rdi], rdx 	; storing char in the converted string
	inc	rdi
L1_jump2:	
	dec	r15
	cmp	r15, 0
	je	L1_end
	jne	L1_top

L1_edge:
	mov	[rdi], al
	inc	rdi
	jmp L1_jump2

L1_midchar:
	cmp al, 0x61
	jb L1_edge
	jmp L1_jump1
	
L1_end:
	;;  print out user input for feedback
	;;
	mov rax, SYSCALL_WRITE ; Print Message
	mov rdi, STDOUT	; Arg1: file descriptor
	mov rsi, msg2	; Arg2: addr of message
	mov rdx, len2	; Arg3: length of message
	syscall	; 64-bit system call

	mov rax, SYSCALL_WRITE ; Write user input
	mov rdi, STDOUT	; Arg1: file descriptor
	mov rsi, buf	; Arg2: addr of message
	mov rdx, [count] ; Arg3: length of message
	syscall	 ; 64-bit system call

	;;  print out converted string
	;;
	mov rax, SYSCALL_WRITE ; Print Message
	mov rdi, STDOUT	; Arg1: file descriptor
	mov rsi, msg3	; Arg2: addr of message
	mov rdx, len3	; Arg3: length of message
	syscall	; 64-bit system call


	mov rax, SYSCALL_WRITE ; Write out string
	mov rdi, STDOUT	; Arg1: file descriptor
	mov rsi, newstr	; Arg2: addr of message
	mov rdx, [count] ; Arg3: length of message
	syscall	 ; 64-bit system call


	;;  final exit
	;;
exit:	mov rax, SYSCALL_EXIT
	mov rdi, 0	; exit to shell
	syscall
