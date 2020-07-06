%macro imprimir 1
    mov eax, 4
    mov ebx, 1
    mov ecx, $1
    mov edx, 1
    int 80h
%endmacro