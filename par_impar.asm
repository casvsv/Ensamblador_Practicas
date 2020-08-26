section .data
par_msg db "Número par"
len_par equ $ - par_msg

impar_msg db "Número impar"
len_impar equ $ - impar_msg

section .text
    global _start

_start:
    mov ax, 8
    and ax, 1
    jz par
    jmp impar

par:
    mov eax, 4
    mov ebx, 1
    mov ecx, par_msg
    mov edx, len_par
    int 0x80
    jmp salir

impar:
    mov eax, 4
    mov ebx, 1
    mov ecx, impar_msg
    mov edx, len_impar
    int 0x80
    jmp salir

salir:
    mov eax,1
    int 0x80