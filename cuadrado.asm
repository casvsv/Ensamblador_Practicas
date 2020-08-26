;Hecho por César Salazar
;22-05-2020
;*****Macros*****
%macro imprimir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

; Programa para imprimir Cuadrado *******

section .data
    asterisco db '*'
    new_line db "",10
    len_new_line equ $-new_line

section .text
    global _start
_start:
mov ebx, 9  ; filas
mov ecx, 9  ; columnas

    
principal:
    push ebx ;Guarda lo de la variable en pila
    cmp ebx, 0
    jz salir
    jmp asteriscos

asteriscos:
    dec ecx
    push ecx
    imprimir asterisco,1    
    pop ecx
    cmp ecx,0
    jg asteriscos ; jg, verifica que el primer operando sea mayor que el segundo operando
    imprimir new_line,len_new_line    
    pop ebx ;Coloca el valor de la pila en la variable
    dec ebx
    mov ecx, 9
    jmp principal

salir:
    mov eax,1
    int 80h