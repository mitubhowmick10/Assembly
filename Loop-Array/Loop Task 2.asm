segment .data

	fmt1: db "Enter a string", 10, 0
	fmtEqual: db "Palindrome", 10, 0
	fmtNot: db "Not Palindrome", 10, 0
	

segment .bss

	str1: resb 100
	str2: resb 100

segment .text

	global main
	extern scanf, printf, gets, puts


main:
	
	XOR RAX, RAX
	MOV RDI, fmt1
	call printf

	MOV RDI, str1
	XOR RAX, RAX
	call gets

	mov RCX, 0
	mov RDX, 0

FIND_LENGTH:
	
	
	cmp byte[str1 + RCX], 0
	JE REVERSE

	INC RCX
	JMP FIND_LENGTH
	
REVERSE:
	
	mov RAX, RCX
	cmp RAX, 1
	JE EQUAL
	DEC RCX
			
	
START_REVERSE:
	
	
	cmp byte[str1 + RCX], 90
	JG OK

	add byte[str1 + RCX], 32

OK:
	mov r8, [str1 + RCX]
	mov [str2 + RDX], r8
	
	INC RDX
	DEC RCX
	
	cmp RCX, 0
	JE REVERSE_DONE
	JMP START_REVERSE

REVERSE_DONE:

	mov r8, [str1 + RCX]
	mov [str2 + RDX], r8
	
	xor r9, r9
	INC RDX
	mov [str2 + RDX], r9

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
