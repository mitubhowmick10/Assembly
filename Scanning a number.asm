section .data
	i: DQ 0
	fmt: db "%d", 0
	fmt2: db "E: %d", 10, 0


section .text

	global main
	extern scanf
	extern printf

	main:

	push RBP
	push RAX

	mov RDI, fmt
	mov RSI, i
	XOR RAX, RAX
	call scanf

	mov RDI, fmt2
	mov RSI, [i]
	mov RAX, 0
	call printf

	mov RAX, 0
	pop RAX
	pop RBP


	ret

;  compile command

;  nasm -f elf64 back.asm
;  gcc back.o -o abcd
;  ./abcd

