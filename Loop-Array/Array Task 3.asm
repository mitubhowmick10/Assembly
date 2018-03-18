segment .data

    fmt: db "%d", 0
    msg: db "%d %d", 10, 0
    limit: db 5
    first: db 0
    last: db 0

segment .bss

    A resq 20
    odds resq 20

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

	xor RBX, RBX
	mov RBX, A
	mov RCX, [limit]
	
	

checkingFirst:

	
		mov RAX, [RBX]
		AND RAX, 1
		cmp RAX, 0
		jnz assignFirst 
		add RBX, 8
		loop checkingFirst

assignFirst:
		
		mov RAX, [RBX]
		mov [first], RAX
		mov r9, [first]
	

		mov RDX, A
		mov RCX, [limit]
		add RDX, 32

checkingLast:

	
		mov RAX, [RDX]
		AND RAX, 1
		cmp RAX, 0
		jnz assignLast
		sub RDX, 8
		loop checkingLast


assignLast:

		mov RAX, [RDX]
		mov [last], RAX
	
print:

   	
	mov RDI, msg
	mov RSI, r9
	mov RDX, [last]

	
        xor RAX, RAX

	call printf

	ret

        
