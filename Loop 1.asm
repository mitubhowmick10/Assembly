section .data
	
	fmt: db "%d", 0
	fmt2: db "%d", 10, 0
	fmt3: db "%d is odd", 10, 0

section .bss

	x: resq 1

section .text

	global main
	extern scanf
	extern printf

	main:

	push RBP

	mov RDI, fmt
	mov RSI, x
	mov RAX, 0
	call scanf

	mov RCX, [x]
	mov RDX, 5

printt:

	
	mov RDI, fmt2
	mov RSI, RDX
	mov RAX, 0

	push RCX
	push RDX

	call printf
	pop RDX
	pop RCX

	ADD RDX, 5
	DEC RCX
	

	jnz printt



	mov RAX, 0
	pop RBP
	ret

	

	




