segment .data
a: dd 50
b: dd 60
fmt: db "The sum is %d", 10

segment .text

global main
extern printf

main:
push RBP


mov RSI, [a]
add RSI, [b]
mov RDI, fmt
mov RAX, 0
call printf


mov RAX, 0
pop RBP
ret
