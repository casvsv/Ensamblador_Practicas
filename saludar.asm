section .data
	mensaje DB "Holi estoy usando NASM"  ; constante mensaje de 1 byte
	longitud EQU $-mensaje ; constante longtud que calcula el # de caracteres de mensaje

;section bss

section .text
	global _start
_start:
	; *****imprimir el mensaje*****
	mov eax, 4 ; tipo de subrutina, operación => escritura, salida
	mov ebx, 1 ; tipo de estándar, por teclado
	mov ecx, mensaje ; el registro ecx almacena la referencia a imprimir de "mensaje"
	mov edx, longitud ; el registro edx almacena la referencia a imprimir de "longitud"
	int 80H ; interrupción de sw para el so. Linux

	mov eax, 1 ; salida del programa, system_exit, sys_exit
	mov ebx, 0 ; si el retorno es 0 (200 en la web) OK
	int 80H
	
