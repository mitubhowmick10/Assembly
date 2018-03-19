segment .data
	
	fmt1: db  "%lld",0
	fmt2: db  "Give %lld more numbers",10,0
	fmt3: db  "Number already exists. Give %d more numbers", 10, 0
	fmt4: db  "%lld", 10, 0
	fmt5: db  "The 10 numbers are:", 10, 0

	x:	dq 0
	need:  dq 10
	size:   dq 0

section .bss 

	A resq 100

segment .text

	global main
	extern printf
	extern scanf

main:

	push RBP
	MOV RDI, fmt1
	MOV RSI, x
	call scanf
	mov RAX, [x]
	mov [A], RAX
	add qword[size], 1

	sub qword[need], 1
	MOV RDI, fmt2
	mov rsi, [need]
	mov rax, 0
	call printf

INPUT:
	cmp qword[need], 0
	JE END

	mov RDI, fmt1
	mov RSI, x
	mov rax, 0
	call scanf
	mov RAX, [x]
	mov r8, 0

CHECK:

	cmp r8, [size]
	JE OK

	mov RAX, [A + r8*8]
	cmp rax, [x]
	je IGNORE
	
	INC r8
	JMP CHECK

IGNORE:

	mov RDI, fmt3
	mov rsi, [need]
	mov rax, 0
	call printf
	jmp INPUT

OK: 
	mov rbx, [size]
	mov rax, [x]
	mov [A + rbx * 8], rax
	add qword[size], 1
	sub qword[need], 1

	cmp qword[need], 0
	je END
	mov rdi , fmt2
	mov rsi, [need]
	mov rax, 0
	call printf
	JMP INPUT
	
END:
	
	mov rdi, fmt5
	mov rax, 0
	call printf
    	mov rcx,0
	

print:
        cmp rcx,10
	je done

	mov rdi,fmt4
	mov rsi,[A+rcx*8]
	mov rax,0
	push rcx
	call printf
	pop rcx
	inc rcx
	jmp print

	pop rbp		
	mov rax, 0		
	ret

