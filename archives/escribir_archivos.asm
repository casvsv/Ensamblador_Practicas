%macro escribir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

segment .data
    msj1 db "Ingresa datos en el archivo:",10
    len_msj1 equ $ - msj1
    direccion_archivo db "/home/casv/Documentos/Ensamblador/archivos/archivo.txt"


segment .bss
    texto resb 30
    idarchivo resd 1 ;Se utiliza resd cuando es un archivo

segment .text
    global _start

leer: 
    mov eax, 3
    mov ebx, 0
    mov ecx, texto
    mov edx, 10
    int 80h
    ret


_start:
    mov eax,8                   ;Servicio para crear archivos o trabajar con ellos
    mov ebx, direccion_archivo  ;Direccion del archivo
    mov ecx, 1                  ; Modo de acceso
                                    ; O-RDONLY 0: El archivo se abre solo para leer
                                    ; O-WRONLY 1: El archivo se abre para escritura
                                    ; O-RDWR 2: El archivo se abre para escritura y lectura  
                                    ; O-CREATE 256: Crea el archivo en caso de que no exista
                                    ; O-APPEND 2000h: El archivo se abresolo para escritura al final
    mov edx, 777h
    int 80h

    test eax, eax

    jz salir                    ;Se ejecuta cuando existen errores en el archivo

    mov dword [idarchivo], eax
    escribir msj1, len_msj1
    

    call leer

    ;************** Escritura en el archivo***********
    mov eax,4 
    mov ebx, [idarchivo] 
    mov ecx, texto
    mov edx, 20
    int 80h

salir:
    mov eax, 1
    int 80h
