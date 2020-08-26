%macro imprimir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 0x80
%endmacro

%macro leer 2
    mov eax, 3 ; Define el tipo de operación
    mov ebx, 2 ; Estándar de entrada
    mov ecx, %1 ; Lo que se captura en el teclado
    mov edx, %2 ; Número de caracteres que vamos a guardar (Los que definimos antes)
    int 80h ; Interrupción de GNU Linux
%endmacro
section .data
		msj db 10,"Ingrese un numero del 1 - 9 para el fibonacci:  "
        len_msj equ $ - msj
section .bss
	numero resb 2
    aux resb 2

section .text
	global _start
_start:
    imprimir msj,len_msj
    leer numero,2
    mov ecx,0

ciclo: 
    mov edx,[numero]
    add edx,'0'
	cmp ecx, edx
	je salir
    call fibo
	inc ecx
    jmp ciclo

fibo:
cmp EBX,2
jg fibo_helper
mov EAX,1
ret

fibo_helper:
dec EBX
call fibo
mov ECX,EAX
dec EBX
call fibo
ADD EAX,ECX
ret

salir: 
    mov eax, 1
    int 80h