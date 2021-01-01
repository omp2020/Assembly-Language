%macro scall 4
mov rax, %1
mov rdi, %2
mov rsi, %3
mov rdx, %4
syscall
%endmacro

section .data
    array db 11h,12h,13h,14h,15h,16h,17h,18h,19h,20h
    pm db 10, "Count is "
    pmlen equ $-pm
    n db 10

section .bss
    c resw 1
    t resw 1
    tb resb 1

section .text
    global _start

_start:
    mov rsi, array
    mov rdi, [n]
    mov ax, 0h
    mov bh, 0h
up: mov bl, [rsi]
    add al, bl
    jnc next
    add ah , 1
next:inc rsi
    dec rdi
    jnz up
    mov word[c], ax
    scall 1, 1, pm, pmlen
    
    call print
    scall 60,0,0,0

print:
    
    mov rbp,4
    mov ax,word[c]
b:  rol ax,4
    mov [t],ax
    and ax,0fh
    cmp al,09
    jbe a
    add al,7h
a: add al,30h
    mov [tb], al
    scall 1, 1, tb, 1
    mov ax,word[t]
    dec rbp
    jnz b
    ret
