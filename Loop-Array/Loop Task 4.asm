segment .data

	fmt1: db "Enter two strings", 10, 0
	fmtEqual: db "Equal", 10, 0
	fmtNot: db "Not equal", 10, 0
	

segment .bss

	str1: resb 100
	str2: resb 100

segment .text

	global main
	extern scanf
	extern printf
	extern gets
	extern puts

main:

	
	XOR RAX, RAX
	MOV RDI, fmt1
	call printf

	MOV RDI, str1
	XOR RAX, RAX
	call gets

	MOV RDI, str2
	XOR RAX, RAX
	call gets
	
	mov RCX, 0
	mov RDX, 0

CHECK:

	cmp byte[str1 + RCX], 0 ; null character
	JE END

	cmp byte[str2 + RDX], 0
	JE END
	
	mov r8, [str1 + RCX]
	mov r9, [str2 + RDX]

	cmp r8, r9

	JNE NOT_EQUAL

	INC RDX
	INC RCX

	JMP CHECK


END:
	cmp RDX, RCX
	JE EQUAL
	

NOT_EQUAL:

	mov rdi, fmtNot
	xor rax, rax
	call printf
	ret

EQUAL:
	mov rdi, fmtEqual
	xor rax, rax
	call printf
	ret
