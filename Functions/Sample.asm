segment .data

	a: dq 5
	b: dq 6

	fmt: db "sum = %d", 10, 0


segment .text

	global main
	extern printf

	main:
	push RBP


	mov RAX, [a]
	mov RBX, [b]

	push RAX
	push RBX

	call myFunc

	pop RBX
	pop RAX
	pop RBP

	ret
myFunc:
	
	push RBP
	mov RBP, RSP
	mov RSI, [RBP + 24]
	mov r9,  [RBP + 16]
	add RSI, r9

	mov RDI, fmt
	
	mov RAX, 0

	call printf
	ret
