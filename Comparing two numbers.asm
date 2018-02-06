section .data
	
	fmt: db "%d %d", 0
	fmt2: db "The larger number is: %d", 10, 0
	fmt3: db "XXX: %d", 10, 0

section .bss

	x: resq 1
	y: resq 1

section .text

	global main
	extern scanf
	extern printf

	main:

	push RBP


	mov RDI, fmt
	mov RSI, x
	mov RDX, y
	mov RAX, 0
	call scanf

	mov RDI, fmt2
	mov RSI, [x]
	mov RDX, [y]
	mov RAX, 0

	cmp RSI, RDX

	jge printAnswer

	mov RSI, [y]
	mov RAX, 0

	call printf

	mov RAX, 0
	pop RBP
	ret

	printAnswer:
	
	push RBP
	

	mov RDI, fmt2
	mov RSI, [x]
	mov RAX, 0
	call printf

	mov RAX, 0
	pop RBP
	ret




