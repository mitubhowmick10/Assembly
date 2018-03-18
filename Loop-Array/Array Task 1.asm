%include "io64.inc"
segment .data

    fmt:  db "%d", 0
    fmt2: db "Number %d: %d",10, 0
    fmt3: db "Sum = %d", 10, 0
    sum:  dq 0

segment .bss

    A resq 20
    
segment .txt

	global main
	extern scanf
	extern printf

	main:

	push RBP
	mov RCX, 10
	mov r9, 0
	mov RAX, A

input:
    
    	push RCX
	push RAX
	push r9
	
	mov RDI, fmt
	mov RSI, RAX
	mov RAX, 0

	call scanf
	
	pop r9
	pop RAX
	pop RCX
	
	add r9, [RAX]
	add RAX, 8
	
         loop input
	
	mov RDI, fmt3
	mov RSI, r9
	mov RAX, 0
	call printf
	
	mov RAX, A
	mov RCX, 10
	mov RSI, 1
	
	
print:

	push RCX
	push RAX
	push RSI

	mov RDI, fmt2
	mov RDX, [RAX]
	
	mov RAX, 0
	
	call printf
	
	pop RSI
	pop RAX
	pop RCX
	
	add RSI, 1
	add RAX, 8
	
	loop print
	
	mov RAX, 0
	pop RBP
	ret
