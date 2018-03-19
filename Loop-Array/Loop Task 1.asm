segment .data
	
	fmt1: db "%d", 0
	fmt2: db "%d", 10, 0
	fmt3: db "Differece: %d", 10, 0
	x: dq 0
	lo: dq 0
	hi: dq 0
	count: dq 0
	diff: dq 0

section .bss 

	A resq 100

segment .text

	global main
	extern printf
	extern scanf

main:

	push RBP
	
	mov rdi, fmt1
	mov rsi, lo
	mov rax, 0
	call scanf

	mov rdi, fmt1
	mov rsi, hi
	mov rax, 0
	call scanf

	sub qword[lo], 1

	
;; outer loop cholbe lo theke hi porjonto

	
OUTER: 
	add qword[lo], 1
	mov r9, [lo]
	cmp [hi], r9
	JE END

	mov [x], r9
	

INIT:
	mov RCX, [x]
	CMP RCX, 1
	JE NO
	mov RAX, 2
	
	
CHECK:
	mov RCX, [x]

	CMP RAX, RCX

	JE YES

	mov RBX, RAX
	push RAX
	mov RAX, [x]
	mov RDX, 0
	idiv RBX
	pop RAX
	CMP RDX, 0
	JE NO
	inc RAX
	jmp CHECK


NO:
	mov rdi, fmt3
	mov rax, 0
	mov rsi, [x]	
;;	call printf
	
	; ret
	JMP OUTER
	
YES:
	mov rdi, fmt2
	mov rax, 0
	mov rsi, [x]
	call printf

	
;; count even hole -, odd hole +

	
	add qword[count], 1
mov rax, [count]
	And rax, 1
	je minus

	mov r13, [x]
	sub qword[diff], r13
	JMP OUTER
	;ret
minus:
	mov r13, [x]
	add qword[diff], r13
	JMP OUTER

END:
	mov rdi, fmt3
	mov rsi, [diff]
	xor rax, rax
call printf
	ret




