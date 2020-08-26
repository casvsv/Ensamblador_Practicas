;Hecho por César Salazar
;03-07-2020
;*****Macros*****
%macro imprimir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro


section .data
    msj1 db " * "
    len_msj1 equ $-msj1

    msj2 db " = "
    len_msj2 equ $-msj2

    new_line db "",10
    len_new_line equ $-new_line

section .bss    
    a resb 2
    b resb 2
    c resb 2

section .text
    global _start

_start:
    
    mov al, 1;x1
    add al, '0'
    mov [a], al
    mov cx, 1
    call ciclo
    mov al, 2;x2
    add al, '0'
    mov [a], al
    mov cx, 1
    call ciclo
    mov al, 3;x3
    add al, '0'
    mov [a], al
    mov cx, 1
    call ciclo
    mov al, 4;x4
    add al, '0'
    mov [a], al
    mov cx, 1
    call ciclo
    mov al, 5;x5
    add al, '0'
    mov [a], al
    mov cx, 1
    call ciclo
    mov al, 6;x6
    add al, '0'
    mov [a], al
    mov cx, 1
    call ciclo
    mov al, 7;x7
    add al, '0'
    mov [a], al
    mov cx, 1
    call ciclo
    mov al, 8;x8
    add al, '0'
    mov [a], al
    mov cx, 1
    call ciclo
    mov al, 9;x9
    add al, '0'
    mov [a], al
    mov cx, 1
    call ciclo
    ;FIN
    mov eax,1
    int 80h

ciclo:
    push cx
    mov ax, [a]
    sub ax, '0'
    mul cx
    add ax, '0'
    mov [c],ax
    add cx, '0'
    mov [b], cx
    imprimir a, 1
    imprimir msj1, len_msj1
    imprimir b,1
    imprimir msj1, len_msj2
    imprimir c,1    
    imprimir new_line,len_new_line
    pop cx
    inc cx
    cmp cx,10
    jnz ciclo
    ret
    