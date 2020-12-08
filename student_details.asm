section .data
    msg db "Enter Your name", 10
    msglen equ $-msg
    msg1 db "Enter Your Division", 10
    msglen1 equ $-msg1
    msg2 db "Enter Your Roll No.", 10
    msglen2 equ $-msg2
    newline db 10

section .bss
    name resb 10
    len_name resq 1
    divi resb 2
    len_divi resq 1
    roll resb 2
    len_roll resq 1

section .text
    global _start

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, msglen
    syscall
    mov rax, 0
    mov rdi, 0
    mov rsi, name
    mov rdx, 10
    syscall
    mov [len_name],rax
    mov rax, 1
    mov rdi, 1
    mov rsi, name
    mov rdx, [len_name]
    syscall
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall
    
    mov rax, 1
    mov rdi, 1
    mov rsi, msg1
    mov rdx, msglen1
    syscall
    mov rax, 0
    mov rdi, 0
    mov rsi, divi
    mov rdx, 2
    syscall
    
    mov [len_divi],rax
    
    mov rax, 1
    mov rdi, 1
    mov rsi, divi
    mov rdx, [len_divi]
    syscall
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall
    
    mov rax, 1
    mov rdi, 1
    mov rsi, msg2
    mov rdx, msglen2
    syscall
    mov rax, 0
    mov rdi, 0
    mov rsi, roll
    mov rdx, 2
    syscall
    
    mov [len_roll],rax
    mov rax, 1
    mov rdi, 1
    mov rsi, roll
    mov rdx, [len_roll]
    syscall
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall
    mov rax, 60
    mov rdi, 0
    syscall
