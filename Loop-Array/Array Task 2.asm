
segment .data

    fmt: db "%d", 0
    fmt2: db "At index %d: %d", 10, 0
    limit: db 10
    x: dq 0

segment .bss

    A resq 20

segment .text

	global main
	extern scanf
	extern printf

	main:

	push RBP
	mov RCX, [limit]
	mov RBX, A

input:
    
    	push RCX
	
	mov RDI, fmt
	mov RSI, RBX
	mov RAX, 0

	call scanf
	
	pop RCX
	
	add RBX, 8
	
         loop input
	
	mov RDI, fmt
	mov RSI, x
	mov RAX, 0
	call scanf
	
	mov RCX, [x]
	mov r9, 0
	
adjust: 
	
	add r9, 8
	loop adjust
	
print:
	
	mov RBX, A
	add RBX, r9
	
	mov RDI, fmt2
	mov RSI, [x]
	mov RDX, [RBX]
	
	call printf

	mov RAX, 0
	pop RBP
	ret



