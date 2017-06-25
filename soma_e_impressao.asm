extern printf ;chama funcao printf

section .data
	msg db "soma = %.3f", 0x0a, 0x00
	x dd 1.5
	y dd 2.5
	z dq 0

section .text
global main
main:
	fld dword[x]
	fld dword[y]
	faddp
	fst qword[z]
	push dword[z+4]
	push dword[z]
	push dword msg
	call printf
	add esp, 12

	; mov eax, 1
	; mov ebx, 0
	; int 80h

	fld qword[z]
	fsubp
	fst qword[z]
	push dword[z+4]
	push dword[z]
	push msg
	call printf
	add esp, 12

	mov eax, 1
	mov ebx, 0
	int 80h
