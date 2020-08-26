%macro imprimir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 0x80
%endmacro

%macro leer 2
    mov eax, 3 ; Define el tipo de operación
    mov ebx, 2 ; Estándar de entrada
    mov ecx, %1 ; Lo que se captura en el teclado
    mov edx, %2 ; Número de caracteres que vamos a guardar (Los que definimos antes)
    int 80h ; Interrupción de GNU Linux
%endmacro

section .data
    msj1 db "Ingrese 1 número: ",10
    len1 equ $ - msj1
    msj2 db "El número es positivo",10
    len2 equ $ - msj2
    msj3 db "El número es negativo",10
    len3 equ $ - msj3

    new_line db "",10
    len_new_line equ $-new_line


section .bss
    ;numero resb 2

section .text
    global _start

_start:
    ;imprimir msj1,len1
    ;leer numero,2
    mov eax,-3
	mov ebx,0
	cmp eax,ebx ; movimiento /cambio banderas
	js negativo ; a una etiqueta
	jmp positivo

positivo:
    imprimir msj2,len2
    jmp salir
negativo:
    imprimir msj3,len3
    jmp salir

salir:
    mov eax, 1
    int 80h