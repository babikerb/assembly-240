; Author Name: Babiker Babiker
; CWID: 6449
; Section Number: 240-11
; Author Email: bbabiker@csu.fullerton.edu
; Date: 4/24/2025
; Identifier: Final Program

extern printf
extern input_array
extern output_array
extern variance

global manager

segment .data
    prompt_msg db "Please enter the integers in your sample separated by ws.   Press cntl+d to stop.", 10, 0
    variance_msg db "The variance of this sample is %lf.", 10, 0
    return_msg db "The variance will be returned to the caller function.", 10, 0

segment .bss
    align 64
    num_array resq 1000
    arr_len resq 1

segment .text
manager:
    push rbp
    mov rbp, rsp
    push rbx
    push rcx
    push rdx
    push rdi
    push rsi
    push r8
    push r9
    push r10
    push r11
    push r12
    push r13
    push r14
    push r15
    pushf

    mov rdi, prompt_msg
    call printf

    mov rdi, num_array
    mov rsi, 1000
    call input_array
    mov [arr_len], rax

    mov rdi, num_array
    mov rsi, [arr_len]
    call output_array

    mov rdi, num_array
    mov rsi, [arr_len]
    call variance

    movsd xmm15, xmm0

    movsd xmm1, xmm15
    mov rdi, variance_msg
    call printf

    mov rdi, return_msg
    call printf

    movsd xmm0, xmm15

    popf
    pop r15
    pop r14
    pop r13
    pop r12
    pop r11
    pop r10
    pop r9
    pop r8
    pop rsi
    pop rdi
    pop rdx
    pop rcx
    pop rbx
    pop rbp
    ret