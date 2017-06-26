extern printf

section .data
	a dq 1.0
	b dq 4.0
	c dq 3.0
	r1 dq 0.0
	r2 dq 0.0
	msg db "Raiz da equacao:"
	x1 db " %f", 0x0a, 0x00
	x2 db " %f", 0x0a, 0x00
section .text
global main
main:
	fld qword[b] 
	fmul st0, st0
	fld qword[a]
	fld qword[c]
	fld1
	fld1
	faddp
	fadd st0, st0
	fmulp
	fmulp
	fchs
	faddp
	fsqrt
	fld qword[b]
	fchs
	fadd st0, st1
	fld qword[a]
	fld1
	fld1
	faddp
	fmulp
	fdivp st1, st0
	fstp qword[r1]
	push dword[r1+4]
	push dword[r1]
	push x1
	call printf 
	add esp, 8

	;st0 = 2.0

	fchs
	fld qword[b]
	fchs
	faddp
	fld qword[a]
	fld1
	fld1
	faddp
	fmulp
	fdivp st1,st0
	fstp qword[r2]
	push dword[r2+4]
	push dword[r2]
	push x2
	call printf
	add esp, 8

	mov eax, 1
	mov ebx, 0
	int 80h