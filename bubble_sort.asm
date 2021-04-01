%macro scall 4
mov rax, %1
mov rdi, %2
mov rsi, %3
mov rdx, %4
syscall
%endmacro

section .data
    comma db ","
    return db 10
    msg db "Array Before Sort: "
    msglen equ $-msg
    msg1 db "Array After Sort: "
    msglen1 equ $-msg1
    arr db 0FFh,17h,1Fh,07h,32h,46h,34h

section .bss
    t resb 1
    tb resb 1
    c1 resb 1
    c2 resb 1

section .text
    global _start

_start:
    scall 1,1,msg,msglen
    call print1
    scall 1,1,return,1
    mov byte[c1],7
l1: 
    mov byte[c2],6
    mov rsi,arr
l2:    
    mov al,[rsi]
    cmp al,[rsi+1]
    ; jbe next ; Ascending order
    jae next ; Descending order 
    xchg al,[rsi+1]
    mov [rsi],al
next: 
    inc rsi
    dec byte[c2]
    jnz l2
    dec byte[c1]
    jnz l1
    scall 1,1,msg1,msglen1
    call print1
    scall 1,1,return,1
    scall 60,0,0,0
    
print1:
    mov rbp,arr
    mov byte[c1],7
t1: 
    mov byte[c2],2
    mov al,[rbp]
t2:  
    rol al,4
    mov [t],al
    and al,0fh
    cmp al,09
    jbe a
    add al,7h
a:  
    add al,30h
    mov [tb], al
    scall 1, 1, tb, 1
    mov al,byte[t]
    dec byte[c2]
    jnz t2
    
    cmp byte[c1],1
    je e
    scall 1,1,comma,1
    
e:
    inc rbp
    dec byte[c1]
    jnz t1
    ret
