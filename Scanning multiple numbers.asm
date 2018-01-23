section .data
	
	fmt: db "%d %d %s", 0
	fmt2: db "E: %d %d %s", 10, 0

section .bss


	x: resq 1
	y: resq 1
	z: resq 1


section .text

	global main
	extern scanf
	extern printf

	main:

	push RBP


	mov RDI, fmt
	mov RSI, x
	mov RDX, y
	mov RCX, z
	mov RAX, 0
	call scanf

	mov RDI, fmt2
	mov RSI, x
	mov RDX, y
	mov RCX, z
	mov RAX, 0
	call printf

	mov RAX, 0
	pop RBP
	ret


		
