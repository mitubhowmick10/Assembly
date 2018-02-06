section .data
	
	fmt: db "%d", 0
	fmt2: db "%d is even", 10, 0
	fmt3: db "%d is odd", 10, 0

section .bss

	x: resq 1

section .text

	global main
	extern scanf
	extern printf

	main:

	push RBP

	mov RDI, fmt	; scanf
	mov RSI, x
	mov RAX, 0
	call scanf

	mov RAX, 0
	mov RAX, [x]
	mov RBX, 2
	mov RCX, [x]
	
; TEST RAX, 1 ; checks the bitwise and
	cqo

	idiv RBX

	cmp RDX, 1

	jz printAnswer

	mov RDI, fmt2
	mov RSI, RCX
	mov RAX, 0

	call printf


	mov RAX, 0
	pop RBP
	ret

printAnswer:
	
	push RBP

	mov RDI, fmt3
	mov RSI, RCX
	mov RAX, 0

	call printf

	mov RAX, 0
	pop RBP
	ret




