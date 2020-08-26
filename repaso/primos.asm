;Realizar un programa en ensamblador quepida un número del 1 al 9 y determine es primo o no.
;César Salazar
;6to "A"
;24/08/2020

%macro imprimir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

%macro leer 2
    mov eax, 3 ; Define el tipo de operación
    mov ebx, 2 ; Estándar de entrada
    mov ecx, %1 ; Lo que se captura en el teclado
    mov edx, %2 ; Número de caracteres que vamos a guardar (Los que definimos antes)
    int 80h ; Interrupción de GNU Linux
%endmacro

%macro salir 0
    mov eax, 1
    int 80h
%endmacro


section .data
		msj db 10,"Ingrese un número del 1 - 9 :  "
        len_msj equ $ - msj

        msj1 db 10,"¡El número es primo!",10
        len_msj1 equ $ - msj1

        msj2 db 10,"¡El número no es primo!",10
        len_msj2 equ $ - msj2

section .bss
        numero resb 2
section .text
        global _start 
_start:
; ***************************Leer número****************************
        imprimir msj,len_msj 
        leer numero, 2

; ************************Proceso ciclo ***************************
    mov cl, 3
    mov edx,0

    mov al, [numero]
    sub al, '0'
    cmp al, 3
    je es_primo

ciclo:  
    mov al,[numero]
    add al,'0'
    cmp al,cl
    jng obtener_resultado
    mov bl,cl
    
    div bl
    inc cl
    cmp ah,0
    je aumentar
    jmp ciclo
   

;************************Aumenta del contador de los divisores******************   
aumentar: 
    inc edx
    jmp ciclo


;**********************Presentación del resultado correspondiente***************
obtener_resultado: 
        cmp edx,2
        jng es_primo
        jmp no_es_primo 


;**********************El resultado es primo**********************************
es_primo:
        imprimir msj1,len_msj1
        salir


;**********************El resultado no es primo**********************************
no_es_primo:
        imprimir msj2,len_msj2
        salir