segment .data

    fmt: db "%d", 0
    first: db "First odd: %d", 10, 0
    last: db "Last odd: %d", 10, 0
    noOddmsg: db "No odd numbers", 10, 0

segment .bss

    A resq 20

segment .text

	global main
	extern scanf
	extern printf

main:

	push RBP
	mov RCX, 5
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
	mov RCX, 5
	
	

checkingFirst:

	
		mov RAX, [RBX]
		AND RAX, 1
		cmp RAX, 0
		jnz assignFirst 
		add RBX, 8
		loop checkingFirst


noOddnumber:

		mov RDI, noOddmsg
		mov RAX, 0
		call printf
		ret

assignFirst:
		
		mov RSI, [RBX]
		mov RDI, first
		mov RAX, 0
		call printf
		xor rax, rax
	

		mov RBX, A
		mov RCX, 5
		add RBX, 32

checkingLast:

	
		mov RAX, [RBX]
		AND RAX, 1
		cmp RAX, 0
		jnz assignLast
		sub RBX, 8
		loop checkingLast
		

assignLast:

		mov RSI, [RBX]
		mov RDI, last
		mov RAX, 0
		call printf
	
		ret
        
