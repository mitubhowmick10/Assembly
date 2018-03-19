segment .data

    	fmt1: db "Given string: ", 0
	fmt2: db "Vowel: %d, Consonant: %d", 10, 0
	fmt3: db "Enter a string (Upper case only)", 10, 0

	con: dq 0
	vow: dq 0

segment .bss

	str: resb 100

segment .text

	global main
	extern scanf
	extern printf
	extern gets
	extern puts

main:

	
	XOR RAX, RAX
	MOV RDI, fmt3
	call printf
	MOV RDI, str
	XOR RAX, RAX
	call gets
	
	XOR RCX, RCX

	mov r8, 0
	mov r9, 0

CHECK:

	cmp byte[str + RCX], 0 ; null character
	JE PRINT
	
	cmp byte[str + RCX], 65 ; A
	JE COUNT_VOWEL

	cmp byte[str + RCX], 69
	JE COUNT_VOWEL

	cmp byte[str + RCX], 73
	JE COUNT_VOWEL

	cmp byte[str + RCX], 79
	JE COUNT_VOWEL

	cmp byte[str + RCX], 85
	JE COUNT_VOWEL

	cmp byte[str + RCX], 65
	JL CONTINUE
 
	cmp byte[str + RCX], 90
	JG CONTINUE
	
	add qword[con], 1
	JMP CONTINUE

CONTINUE:
	INC RCX
	
	JMP CHECK

COUNT_VOWEL:
	add qword[vow], 1
	JMP CONTINUE

PRINT: 

	MOV RDI, fmt1
	XOR RAX, RAX
	call printf
	
	mov RDI, str
	XOR RAX, RAX
	call puts

	mov RDI, fmt2
	MOV RSI, [vow]
	mov RDX, [con]
	mov rax, 0
	call printf
	ret	




