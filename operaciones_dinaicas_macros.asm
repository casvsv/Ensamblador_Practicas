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
%macro leernumero 2 
    mov eax, 3
    mov ebx, 2
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data
    msg_entrada db "Ingrese el número: ",10
    len_entrada equ $-msg_entrada
    
    msg_suma db "La suma es igual a: "
    len_suma equ $-msg_suma
    
    msg_resta db "La resta es igual a: "
    len_resta equ $-msg_resta
    
    msg_mul db "La multiplicación es igual a: "
    len_mul equ $-msg_mul
    
    msg_coci db "El cociente es igual a: "
    len_coci equ $-msg_coci
    msg_residuo db " y El residuo es igual a: "
    len_residuo equ $-msg_residuo

    new_line db "",10
    len_new_line equ $-new_line

section .bss
    valor1 resb 1
    valor2 resb 1
    suma resb 1
    resta resb 1
    multiplicacion resb 1
    cociente resb 1
    residuo resb 1

section .text
    global_start

_start:

;**********lectura******************
    imprimir msg_entrada,len_entrada
    leernumero valor1, 2
    imprimir msg_entrada,len_entrada
    leernumero valor2, 2

;***********suma numeros************
    mov al, [valor1] ; el valor de valor1 es una cadena
    sub al, '0'      ; Conversión de cadena a entero
    
    mov bl, [valor2] ; el valor de valor2 es una cadena
    sub bl, '0'      ; Conversión de cadena a entero
    
    add al,bl
    add al, '0'
    mov [suma], al

;***********resta numeros************
    mov al, [valor1] ; el valor de valor1 es una cadena
    sub al, '0'      ; Conversión de cadena a entero
    
    mov bl, [valor2] ; el valor de valor2 es una cadena
    sub bl, '0'      ; Conversión de cadena a entero
    
    sub al, bl
    add al, '0'
    
    mov [resta], al

;***********multiplicacion numeros************
    mov al, [valor1] ; el valor de valor1 es una cadena
    sub al, '0'      ; Conversión de cadena a entero
    
    mov bl, [valor2] ; el valor de valor2 es una cadena
    sub bl, '0'      ; Conversión de cadena a entero
    
    mul bl
    add al, '0'
    
    mov [multiplicacion], al

;***********division numeros************
    mov al, [valor1] ; el valor de valor1 es una cadena
    sub al, '0'      ; Conversión de cadena a entero
    
    mov bl, [valor2] ; el valor de valor2 es una cadena
    sub bl, '0'      ; Conversión de cadena a entero

    div bl
    add al, '0'
    add ah, '0'
    mov [cociente], al
    mov [residuo], ah

;**********Imprimir mensaje de suma*******    
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_suma
    mov edx, len_suma
    int 80h

;**********Imprimir suma*******    
    imprimir suma,1

;**********Imprimir linea en blanco*******    
    mov eax, 4
    mov ebx, 1
    mov ecx, new_line
    mov edx, len_new_line
    int 80h

;**********Imprimir mensaje de resta*******    
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_resta
    mov edx, len_resta
    int 80h

;**********Imprimir resta*******    
    imprimir resta,1
 
;**********Imprimir linea en blanco*******    
    mov eax, 4
    mov ebx, 1
    mov ecx, new_line
    mov edx, len_new_line
    int 80h

;**********Imprimir mensaje de multiplicacion*******    
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_mul
    mov edx, len_mul
    int 80h

;**********Imprimir multiplicacion*******    
    imprimir multiplicacion,1

;**********Imprimir linea en blanco*******    
    mov eax, 4
    mov ebx, 1
    mov ecx, new_line
    mov edx, len_new_line
    int 80h

;**********Imprimir mensaje de division*******    
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_coci
    mov edx, len_coci
    int 80h

;**********Imprimir division*******    
    imprimir cociente, 1

;**********Imprimir mensaje de division*******    
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_residuo
    mov edx, len_residuo
    int 80h

;**********Imprimir division*******    
    imprimir residuo, 1

;**********Imprimir linea en blanco*******    
    mov eax, 4
    mov ebx, 1
    mov ecx, new_line
    mov edx, len_new_line
    int 80h

;***********Salir del sistema******
    mov eax, 1
    int 80h        