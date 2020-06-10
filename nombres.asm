section .data
	nombre DW "Cesar",10
	apellido DW "Salazar",10
	materia DD "Lenguaje Ensamblador",10
	genero DW "Masculino",10
section bss
section .text
global _start
	_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, nombre
	mov edx, apellido
	int 80H
	mov ecx, materia
	mov edx, genero
	int 80H

	mov eax, 1
	mov ebx, 0
	int 80H