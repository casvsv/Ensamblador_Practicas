section .data
    msg db "Ingrese un número:",10
    leng_msg equ $-msg
    msg_present db "El número ingresado: ",10
    leng_msg_present equ $-msg_present

section .bss
    numero resb 5

section .text
    global_start
_start:
    ;*********Imprimir mensaje***********
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, leng_msg
    int 80h

    ;**********Leer un número*******
    ;mov eax, 3 ; Define el tipo de operación
    ;mov ebx, 2 ; Estándar de entrada
    ;mov ecx, numero ; Lo que se captura en el teclado
    ;mov edx, 5 ; Número de caracteres que vamos a guardar (Los que definimos antes)
    ;int 80h ; Interrupción de GNU Linux

    ;**********Asignar un número*****
    mov ebx, 9
    add ebx, "0" ; Adición del 0 para que se presente el 9
    mov [numero],ebx

    ;**********Imprimir mensaje presentación************
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_present
    mov edx, leng_msg_present
    int 80h

    ;**********Imprimir número************
    mov eax, 4
    mov ebx, 1
    mov ecx, numero
    mov edx, 5
    int 80h

    ;***********Salir del sistema******
    mov eax, 1
    int 80h