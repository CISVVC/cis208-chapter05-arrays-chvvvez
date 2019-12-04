;Ricardo Chavez
;ricardc4975@student.vvc.edu
;December 4, 2019
;
; file: asm_main.asm

%include "asm_io.inc"
;
; initialized data is put in the .data segment
;
segment .data
        syswrite: equ 4
        stdout: equ 1
        exit: equ 1
        SUCCESS: equ 0
        kernelcall: equ 80h
array_1  dd 5,4,3,2,1
message1 dd "Old Array", 0
message2 dd "New Array", 0

; uninitialized data is put in the .bss segment
;
segment .bss

;
; code is put in the .text segment
;
segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
; *********** Start  Assignment Code *******************
	mov eax, message1
	call print_string
	call print_nl
	mov esi, array_1
	mov ecx, 5 
lop:
	lodsd 
	call print_int
	call print_nl
	loop lop
	mov eax, array_1 ;parameter 1
	push eax

	mov eax, 5 	;parameter 2
	push eax
	
 	mov eax, 2	;parameter 3
	push eax
	
		
	
	call stack
	mov eax, message2
	call print_string
	call print_nl
	mov esi, array_1
	mov ecx, 5 
looop:
	lodsd 
	call print_int
	call print_nl
	loop looop
	add esp, 12





; *********** End Assignment Code **********************


        popa
        mov     eax, SUCCESS       ; return back to the C program
        leave                     
        ret


stack:
	push ebp
	mov ebp, esp
	mov eax,[ebp +16]
	mov ecx,[ebp +12]
	mov ebx,[ebp+8]
	cld
	mov esi, eax
	mov edi, eax 
lp:
	lodsd
;	mul ebx,[eax + ecx * 4-4]
	mul ebx
	stosd
	loop lp

	pop ebp
	ret
