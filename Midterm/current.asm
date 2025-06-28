;******************************************************************************************************************************
;  Author name: Babiker Babiker
;  Author email: bbabiker@csu.fullerton.edu
;  CWID: 871026449
;  Class: 240-11 Section 11
;  Date: March 11, 2025
;  240-11 Midterm Program
;  file name: current.asm
;  Preferred Email Address: bbabiker@csu.fullerton.edu
;******************************************************************************************************************************

extern printf

global current

section .data
    current_1 db "The current on circuit #1 is %.5lf amps.", 10, 0
    current_2 db "The current on circuit #2 is %.5lf amps.", 10, 0
    current_3 db "The current on circuit #3 is %.5lf amps.", 10, 0
    total_current db "The total current is %.5lf amps.", 10, 0

section .bss
    align 64
    backup_storage_area resb 832

section .text

current:
    ;backup GPRs
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

    mov rax,7
    mov rdx,0
    xsave [backup_storage_area]

    ;moving the values from the registers to the xmm registers
    movsd xmm0, xmm14
    movsd xmm1, xmm13
    movsd xmm2, xmm12
    movsd xmm3, xmm15

    ;calculating current 1
    movsd xmm10, xmm15
    divsd xmm10, xmm14

    ;print the results for circuit 1
    mov rax, 1
    mov rdi, current_1
    movsd xmm0, xmm10
    call printf

    ;calculating current 2
    movsd xmm11, xmm15
    divsd xmm11, xmm13

    ;print the results for circuit 2
    mov rax, 1
    mov rdi, current_2
    movsd xmm0, xmm11
    call printf

    ;calculating current 3
    movsd xmm9, xmm15
    divsd xmm9, xmm12

    ;print the results for circuit 3
    mov rax, 1
    mov rdi, current_3
    movsd xmm0, xmm9
    call printf

    ;calculating total current
    movsd xmm12, xmm10
    addsd xmm12, xmm11
    addsd xmm12, xmm9

    ;print the results for total current
    mov rax, 1
    mov rdi, total_current
    movsd xmm0, xmm12
    call printf

    ;move results of total current from current function to stack
    mov rax, 0
    push qword 0
    movsd [rsp], xmm12

    ;restore values to non-GPRs
    mov rax,7
    mov rdx,0
    xrstor [backup_storage_area]

    ;store the results of the total current in xmm0 (to go back to main)
    movsd xmm0, [rsp]
    pop rax

    ;restore GPRs
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
