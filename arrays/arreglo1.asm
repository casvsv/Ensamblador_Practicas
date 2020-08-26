%macro imprimir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 0x80
%endmacro

section .data
    arreglo db 3,2,0,7,5
    len_arreglo equ $-arreglo
    new_line db "",10
    len_new_line equ $-new_line


section .bss
    numero resb 1

section .text
    global _start

_start:
    mov esi, arreglo ; esi = fijar el tamaño del arrreglo, posicionar el arreglo en memoria
    mov edi, 0 ; edi = comparar el indice del arreglo

impresion:
    mov al, [esi]
    add al, '0'
    mov [numero],al

    add esi, 1
    add edi, 1

    imprimir numero,1
    imprimir new_line,len_new_line


    cmp edi, len_arreglo    ;cmp 3,4 => activa carry
                            ;cmp 3,4 => desactiva carry y zero
                            ;cmp 3,4 => desactiva carry y zero se activa
    jb impresion ; se ejecuta cuando la bandera de carry está activada

salir:
    mov eax,1
    int 0x80