segment .data
	
	star: db "*", 0
	star_space: db "* ", 0
	newLine: db " ", 10, 0
	fmt: db "%d", 0
	blankSpace: db " ", 0
	starline: db "*", 10, 0
	n: dq 0

section .bss 

segment .text

	global main
	extern printf
	extern scanf

main:

	push RBP

	mov RAX,0
	mov RDI,fmt
	mov RSI, n
	call scanf

	
	mov RCX, [n]
	mov r15, 1
	
	

OUTER:
	inc r15
	DEC RCX
	cmp RCX, 0
	JE EXIT
	mov r8, 0
	mov r9, -1

INNER: 
	cmp r8, RCX
	JE INNER2

	mov RDI, blankSpace
	mov rax, 0
	push RCX
	push r8
	call printf
	pop r8
	pop RCX

	INC r8
	JMP INNER


INNER2:
	
	
	inc r9
	cmp r15, r9
	JL SKIP
	mov RDI, star_space
	mov rax, 0
	push RCX
	push r9
	call printf
	pop r9
	pop RCX
	
	JMP INNER2
		
SKIP:
	
	mov RDI, newLine
	mov RAX, 0
	push RCX
	call printf
	pop RCX
	
JMP OUTER

EXIT:

	mov RCX, [n]
	add RCX, RCX
	DEC RCX
	
Last:

	push RCX
	mov RDI, star
	mov rax, 0
	call printf
	pop RCX
	Loop Last
	 mov RDI, newLine
	mov rax, 0
	call printf
	xor RAX, RAX
	ret

