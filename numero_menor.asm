%macro imprimir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 0x80
%endmacro

section .data
    msj1 db "Ingrese 5 números",10
    len1 equ $ - msj1
    msj2 db "El número menor es",10
    len2 equ $ - msj2


    arreglo db 0,0,0,0,0
    len_arreglo equ $-arreglo
    new_line db "",10
    len_new_line equ $-new_line


section .bss
    numero resb 2

section .text
    global _start

_start:
    mov esi, arreglo ; esi = fijar el tamaño del arrreglo, posicionar el arreglo en memoria
    mov edi, 0 ; edi = comparar el indice del arreglo

    ;******mensaje 1******
    imprimir msj1,len1

    ;******lectura de datos del arreglo
leer:
    ;Se lee por teclado
    mov eax, 3
    mov ebx, 0
    mov ecx, numero
    mov edx,2
    int 80h
    
    ;Se envía al arreglo
    mov al, [numero] 
    sub al,'0'          ; Se le resta cero al número para convertirlo

    mov [esi],al ;indice 2 (1) es el número 0

    inc edi
    inc esi

    cmp edi,len_arreglo
    jb leer

    mov ecx, len_arreglo
    mov bl, 5


comparacion:
    mov al, [arreglo + ecx]
    cmp al, bl
    ja contador
    mov bl,al

contador:
    dec ecx
    cmp ecx, len_arreglo
    jb comparacion

impresion:
    add bl,'0'
    mov [numero],bl
    imprimir msj2,len2
    imprimir numero,1
    imprimir new_line,len_new_line
    int 80h

salir:
    mov eax,1
    int 80h
    