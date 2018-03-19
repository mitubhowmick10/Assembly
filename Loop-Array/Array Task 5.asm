segment .data

    inputFmt: db "%lld", 0
    x dq 0

    smallest: db "Smallest number: %lld at location: %lld ", 10, 0
    largest: db "Largest number: %lld at location: %lld", 10, 0

segment .bss

    A resq 20
    arr resq 20

segment .text

	global main
	extern scanf
	extern printf

main:

	mov RAX, 0
	mov RCX, 0
	mov RBX, 0

INPUT:
    	
    	cmp RCX, 5
	JE INPUTDONE
push RCX
	
	mov RDI, inputFmt
	mov RSI, x
	mov RAX, 0
	
	call scanf
	
	pop RCX
	mov r8, [x]
	mov [A + rcx*8], r8
	mov [arr + rcx * 8], rcx
	
	INC RCX
	mov RAX, 0
	JMP INPUT

INPUTDONE:

	mov RCX, -1

OUTER:
	INC RCX
	cmp RCX, 5
	JE PRINT
	mov r8, 0
INNER:
	cmp r8, 5
	JE OUTER

	mov r10, [A + RCX * 8]
	mov r11, [A + r8 * 8]

	mov r12, [arr + rcx * 8]
	mov r13, [arr + r8 * 8]

	cmp r10, r11
	JG SKIP

	mov [A + RCX * 8], r11
	mov [A + r8 * 8], r10

	
	mov  [arr + rcx * 8], r13
	mov  [arr + r8 * 8], r12

SKIP:
	INC r8
	JMP INNER

PRINT:
	

	
	mov RDI, smallest
	mov RSI, [A]
	mov RDX, [arr]
	xor rax, rax
	call printf

	mov RDI, largest
	mov RSI, [A + 32]
	mov RDX, [arr + 32]
	xor rax, rax
	call printf
	
	ret
	
