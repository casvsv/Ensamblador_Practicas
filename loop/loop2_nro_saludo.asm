;Hecho por César Salazar
;29-06-2020
;*****Macros*****
%macro imprimir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data
    saludo db " Hola amigo!",10
    len_saludo equ $-saludo

section .bss
	valorc resb 1  	

section .txt
    global _start

_start:
    mov ecx, 20

for:
    push ecx
    add ecx,'0'
    mov [valorc],ecx
    imprimir valorc,1
    imprimir saludo,len_saludo
    pop ecx
    
    loop for

salir:
    mov eax, 1
    int 80h