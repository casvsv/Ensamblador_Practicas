;Multiplicacion de dos números por teclado
section .data
    msg_resp db "La multiplicación es igual a: "
    len_resp equ $-msg_resp


section .bss
    respuesta resb 1

section .text
    global_start
_start:

;***********multiplicacion numeros************
    mov eax, 4
    mov ebx, 2
    mul ebx
    add eax, '0'
    
    mov [respuesta], eax

;**********Imprimir mensaje de respuesta*******    
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_resp
    mov edx, len_resp
    int 80h

;**********Imprimir respuesta*******    
    mov eax, 4
    mov ebx, 1
    mov ecx, respuesta
    mov edx, 1
    int 80h
 
;***********Salir del sistema******
    mov eax, 1
    int 80h        