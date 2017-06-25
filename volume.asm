extern printf

section .data
	raio dq 2.0
	altura dq 3.0
	msg db "Volume %f", 0x0a, 0x00
	volume dq 0.0
section .text 
GLOBAL main
main:
	fld qword[altura]
	fldpi
	fld qword[raio]
	fmul st0, st0
	fmul st0, st1
	fmul st0, st2
	fst qword[volume]
	push dword[volume+4]
	push dword[volume]
	push msg
	call printf
	add esp, 12

	mov eax, 1
	mov ebx, 0
	int 80h