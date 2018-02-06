section .data
	
	i: dq 0
	j: dq 0
	fmt: db "%d", 0
	pfmt: db "GCD is %d", 10, 0


section .bss


section .text

	global main
	extern scanf
	extern printf

	main:

	push RBP

	mov RDI, fmt
	mov RSI, i
	mov RAX, 0
	call scanf


	mov RDI, fmt
	mov RSI, j
	mov RAX, 0
	call scanf

	mov AX, [i]
	mov BX, [j]

gcd: 
	cqo
	idiv RBX
	CMP RDX, 00
	je print
	mov RAX, RBX
	mov rbx, rdx
	jmp gcd

print:

	
	mov RDI, pfmt
	mov RSI, RBX
	mov RAX, 0

	call printf
	
	mov RAX, 0
	pop RBP
	ret

	

	





