%macro io 4
    mov rax, %1
    mov rdi, %2
    mov rsi, %3
    mov rdx, %4
    syscall
%endmacro

section .data
    array dw 1h,2h, -3h,-4h,-5h, 0ah, -0fh, 0fh, -0ah
    pm db 10, "Positive Count is "
    pmlen equ $-pm
    nm db 10, "Negative Count is "
    mmlen equ $-nm
    n equ 9

section .bss
    pc resq 1
    nc resq 1

section .text
    global _start

_start:
    mov rsi, array
    mov rdi, n
    mov rbx,0
    mov rcx,0
 up:mov rax, [rsi]
    ror rax, 1
    jc neg
    inc rbx
    jmp next
 neg: inc rcx
 next: inc rsi
        dec rdi
        jnz up
        
        add rbx,30h
        add rcx,30h
        mov [pc], rbx
        mov [nc], rcx
        
        io 1, 1, pm, 19
        io 1, 1, pc, 2
        io 1, 1, nm, 19
        io 1, 1, nc, 2
    
    mov rax, 60
    mov rdi, 0
    syscall
