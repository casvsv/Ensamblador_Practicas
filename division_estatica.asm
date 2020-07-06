;Division de dos números por teclado
section .data
    msg_resp db "El cociente es igual a: "
    len_resp equ $-msg_resp
    
    msg_resp2 db "El residuo es igual a: "
    len_resp2 equ $-msg_resp2


section .bss
    cociente resb 1
    residuo resb 1
section .text
    global_start
_start:

;***********division numeros************
    mov al, 8
    mov bh, 2
    div bh
    add al, '0'
    add ah, '0'
    mov [cociente], al
    mov [residuo], ah

;**********Imprimir mensaje de respuesta*******    
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_resp
    mov edx, len_resp
    int 80h

;**********Imprimir respuesta*******    
    mov eax, 4
    mov ebx, 1
    mov ecx, cociente
    mov edx, 1
    int 80h
 
;**********Imprimir mensaje de respuesta*******    
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_resp2
    mov edx, len_resp2
    int 80h

;**********Imprimir respuesta*******    
    mov eax, 4
    mov ebx, 1
    mov ecx, residuo
    mov edx, 1
    int 80h

;***********Salir del sistema******
    mov eax, 1
    int 80h        