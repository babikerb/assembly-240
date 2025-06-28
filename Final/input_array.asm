; Author Name: Babiker Babiker
; CWID: 6449
; Section Number: 240-11
; Author Email: bbabiker@csu.fullerton.edu
; Date: 4/24/2025
; Identifier: Final Program

extern printf
extern scanf
extern atof
extern isfloat

global input_array

segment .data
    floatformat db "%s", 0
    not_a_float db "The last input was invalid and not entered into the array", 10, 0
    full_message db "The array has been filled.", 10, 0

segment .bss
    align 64
    backup_storage_area resb 832

segment .text
input_array:

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

    mov rax, 7
    xor rdx, rdx
    xsave [backup_storage_area]

    mov r15, rdi
    mov r14, rsi
    xor r13, r13

check_capacity:
    cmp r13, r14
    jl is_less
    jmp is_full

is_less:
    push qword 0
    push qword 0
    mov rax, 0
    mov rdi, floatformat
    mov rsi, rsp
    call scanf

    cdqe
    cmp rax, -1
    je control_d

    mov rdi, rsp
    call isfloat
    cmp rax, 0
    je not_float

    mov rax, 0
    mov rdi, rsp
    call atof
    movsd xmm15, xmm0
    pop r9
    pop r9

    movsd [r15 + r13*8], xmm15
    inc r13
    jmp check_capacity

is_full:
    mov rax, 0
    mov rdi, full_message
    call printf
    jmp exit

not_float:
    mov rax, 0
    mov rdi, not_a_float
    call printf
    pop r9
    pop r9
    jmp is_less

control_d:
    pop r9
    pop r9

exit:
    mov rax, 7
    xor rdx, rdx
    xrstor [backup_storage_area]

    mov rax, r13

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
