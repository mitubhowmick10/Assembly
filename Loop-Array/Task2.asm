segment .data

    fmt: db "%d", 0
    fmt2: db "At index %d: %d", 10, 0
    fmt3: db "Sum = %d", 10, 0
    limit: db 10
    x: dq 0

segment .bss

    A resq 20

segment .txt

	global main
	extern scanf
	extern printf

	main:

	push RBP
	mov RDX, 0
	mov RCX, [limit]
	mov RAX, A

input:
    
    	push RCX
	push RAX
	
	mov RDI, fmt
	mov RSI, RAX
	mov RAX, 0

	call scanf
	
	pop RAX
	pop RCX
	
	add RAX, 8
	dec RCX

	jnz input
	
	
	mov RDI, fmt
	mov RSI, x
	mov RAX, 0
	call scanf
	
	
	mov RCX, [x]
	mov r9, 0
	
adjust: 
	
	add r9, 8
	
	dec RCX
	
	jnz adjust
	
	
print:
	
	mov RAX, A
	
	add RAX, r9
	
	mov RDI, fmt2
	mov RSI, [x]
	mov RDX, [RAX]
	
	call printf

	mov RAX, 0
	pop RBP
	ret




