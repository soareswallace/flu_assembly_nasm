extern printf 

section .data
	number dq 0.0
	msg db "Raiz: %f", 0x0a, 0x00

section .text
global main

main:
	fld1
	fld1
	faddp
	fsqrt
	fst qword[number]

	push dword[number+4]
	push dword[number]
	push msg
	call printf

	mov eax, 1
	mov ebx, 0
	int 80h