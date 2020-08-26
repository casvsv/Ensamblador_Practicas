;*****Macros*****
%macro imprimir 1
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, 1
    int 80h
%endmacro

%macro valoresiniciales 2
    mov ecx, %1
    mov ebx, %2
%endmacro

%macro salir 0
    mov eax, 1
	int 80h
%endmacro
; Programa para imprimir Triángulo*******

section .data
    asterisco db '*'
    new_line db "",10

section .text
    global _start

_start:
    valoresiniciales 20,1

l1:
    push ecx
    push ebx
    mov ecx, ebx
l2:
   	push ecx
	;********************* asterisco **********************
	imprimir asterisco
	pop ecx
	loop l2  ;  salto a l2, dec cx,  
	;**********nuevas lineas************
    imprimir new_line
    ;********************* finaliza loop de las columnas *********
    pop ebx
	pop ecx
	inc ebx
	loop l1
	;********************* finaliza loop de las fila *********

	salir
