; Author Name: Babiker Babiker
; CWID: 6449
; Section Number: 240-11
; Author Email: bbabiker@csu.fullerton.edu
; Date: 4/24/2025
; Identifier: Final Program

global sum_array

segment .text
sum_array:
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
    xorpd xmm0, xmm0

.sum_loop:
    cmp r13, r14
    jge .done

    movsd xmm1, [r15 + r13*8]
    addsd xmm0, xmm1
    inc r13
    jmp .sum_loop

.done:
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
