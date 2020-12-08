section .data
    hex dw 0FFFFh

section .bss
    result resb 5

section .text
    global _start

_start:
    mov rsi, result 
    add rsi, 4   
    mov ax, [hex]
    mov cx, 0Ah 
 up:mov dx, 0
    
    div cx     
    add dx, 30h  
    mov [rsi], dl  
    dec rsi
    cmp ax,0
    jne up
    
    mov rax,1
    mov rdi,1
    mov rsi,result
    mov rdx,5
    
    syscall
    mov rax,60
    mov rdi,0
    syscall
    35h is ascii equ
