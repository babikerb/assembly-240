; Author Name: Babiker Babiker
; CWID: 6449
; Section Number: 240-11
; Author Email: bbabiker@csu.fullerton.edu
; Date: 4/24/2025
; Identifier: Final Program

extern sum_array
extern printf
global variance

segment .bss
    temp_buffer resq 1000

segment .data
    mean_msg db "The mean of this sample is %lf.", 10, 0

segment .text
variance:
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

    mov r15, rdi
    mov r14, rsi
    xor r13, r13

    mov rdi, r15
    mov rsi, r14
    call sum_array

    cvtsi2sd xmm1, r14
    divsd xmm0, xmm1
    movsd xmm15, xmm0

    movsd xmm0, xmm15
    mov rdi, mean_msg
    call printf

.subtract_loop:
    cmp r13, r14
    jge .square_loop

    movsd xmm1, [r15 + r13*8]
    subsd xmm1, xmm15
    movsd [temp_buffer + r13*8], xmm1

    inc r13
    jmp .subtract_loop

.square_loop:
    xor r13, r13
    xorpd xmm0, xmm0

.sum_squares_loop:
    cmp r13, r14
    jge .calc_variance

    movsd xmm1, [temp_buffer + r13*8]
    mulsd xmm1, xmm1
    addsd xmm0, xmm1

    inc r13
    jmp .sum_squares_loop

.calc_variance:
    mov rdi, r14
    dec rdi
    cvtsi2sd xmm1, rdi
    divsd xmm0, xmm1

.exit:
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
