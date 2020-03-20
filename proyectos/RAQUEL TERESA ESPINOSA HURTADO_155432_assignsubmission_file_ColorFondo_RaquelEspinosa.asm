%macro escribir 2
mov eax, 4
mov ebx, 1
mov ecx, %1
mov edx, %2
int 0x80
%endmacro

section .data
	bienvenida db "-----------------------------PROYECTO FINAL------------------------------", 10
	len_bienvenida equ $-bienvenida
	nombre db "Pertenece a: ", 10, "	Raquel Espinosa Hurtado", 10, 10
	lenn equ $-nombre
	col db "		SELECCIONE UNO DE LOS SIGUIENTES COLORES ", 10, 10, "1--> Amarillo", 10, "2--> Azul", 10,"3--> Rojo", 10,"4--> Verde", 10,"5--> Morado", 10,"6--> Celeste", 10,"7--> Blanco", 10,"8--> Salir", 10, "", 10
	len_col EQU $ -col
	dato db "Ingrese una opcion: "
	len_dato EQU $ -dato

	rojo db  0x1b,"[41;31m",":) Rojo...",0xA,0x1b,"[40;37m"
	len_rojo equ $-rojo
	verde db  0x1b,"[42;32m",":) Verde...",0xA,0x1b,"[0;0m"
	len_verde equ $-verde
	amarillo db  0x1b,"[43;33m",":) Amarillo...",0xA,0x1b,"[40;37m"
	len_amarillo equ $-amarillo
	azul db  0x1b,"[44;34m",":) Azul...",0xA,0x1b,"[40;37m"
	len_azul equ $-azul
	morado db  0x1b,"[45;35m",":) Morado...",0xA,0x1b,"[40;37m"
	len_morado equ $-morado
	celeste db  0x1b,"[46;36m",":) Celeste...",0xA,0x1b,"[40;37m"
	len_celeste equ $-celeste
	blanco db  0x1b,"[47;37m",":) Blanco...",0xA,0x1b,"[40;37m"
	len_blanco equ $-blanco

section .bss
	n resb 2
	opcion resb 10
	
section .text
	global _start

_start:
	escribir bienvenida, len_bienvenida
	escribir nombre, lenn
	escribir col, len_col
	escribir dato, len_dato
	mov eax, 3
	mov ebx, 2
	mov ecx, opcion
	mov edx, 2
	int 80H
	
	mov al, [opcion]
	sub al, '0'
	cmp al, 1 
	jz c_amarillo

	cmp al, 2 
	jz c_azul

	cmp al, 3 
	jz c_rojo

	cmp al, 4 
	jz c_verde

	cmp al, 5
	jz c_morado
	
	cmp al, 6 
	jz c_celeste
	
	cmp al, 7 
	jz c_blanco
	jmp salir
	
c_amarillo:
	escribir amarillo, len_amarillo
	jmp salir
	
c_azul:
	escribir azul, len_azul
	jmp salir
	
c_rojo:
	escribir rojo, len_rojo
	jmp salir
	
c_verde:
	escribir verde, len_verde
	jmp salir
	
c_morado:
	escribir morado, len_morado
	jmp salir
	
c_celeste:
	escribir celeste, len_celeste
	jmp salir
	
c_blanco:
	escribir blanco, len_blanco
	jmp salir
	
salir:
	mov eax, 1
	int 80H
