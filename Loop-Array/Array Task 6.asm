segment .data

    inputFmt: db "%lld", 0
    outputFmt: db "%lld", 10, 0
    display: db "After sorting:", 10, 0
    x dq 0
    
segment .bss

    A resq 20

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

	cmp r10, r11
	JG SKIP

	mov [A + RCX * 8], r11
	mov [A + r8 * 8], r10
SKIP:
	INC r8
	JMP INNER

PRINT:
	
	mov RDI, display
	mov RAX, 0
	call printf
	
	mov RCX, 0
	
	
PRINTLOOP:
	
	cmp RCX, 5
	JE DONE
	push RCX
	mov RDI, outputFmt
	mov RSI, [A + RCX * 8]
	mov RAX, 0
 	
	call printf
	pop RCX
	INC RCX
	JMP PRINTLOOP

DONE:
ret
	pop rbp
	MOV RAX, 0
	ret
	
