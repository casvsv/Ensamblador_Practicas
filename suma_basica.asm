;Suma de dos números por teclado
section .data
    msg_int_n1 db "Ingrese el primer número: ",10
    len_msg1 equ $-msg_int_n1
    msg_int_n2 db "Ingrese el segundo número: ",10
    len_msg2 equ $-msg_int_n2
    msg_resp db "La suma es igual a: "
    len_resp equ $-msg_resp


section .bss
    numero1 resb 1   
    numero2 resb 1
    respuesta resb 1

section .text
    global_start
_start:
;**********Imprimir mensaje 1*******    
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_int_n1
    mov edx, len_msg1
    int 80h

;***********Leer número 1************
    mov eax, 3
    mov ebx, 2
    mov ecx, numero1
    mov edx, 2
    int 80h

;**********Imprimir mensaje*******    
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_int_n2
    mov edx, len_msg2
    int 80h

;***********Leer número************
    mov eax, 3
    mov ebx, 2
    mov ecx, numero2
    mov edx, 2
    int 80h

;**********Imprimir mensaje respuesta*******    
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_resp
    mov edx, len_resp
    int 80h

;***********Sumar numeros************
    mov ax, [numero1]
    mov bx, [numero2]
    sub ax, '0'
    sub bx, '0'
    
    add ax, bx
    sub ax, '0'
    mov [respuesta], ax
    int 80h

;**********Imprimir mensaje respuesta*******    
    mov eax, 4
    mov ebx, 1
    mov ecx, respuesta
    mov edx, 1
    int 80h

;***********Salir del sistema******
    mov eax, 1
    int 80h    