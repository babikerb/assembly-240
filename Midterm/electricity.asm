;******************************************************************************************************************************
;  Author name: Babiker Babiker
;  Author email: bbabiker@csu.fullerton.edu
;  CWID: 871026449
;  Class: 240-11 Section 11
;  Date: March 11, 2025
;  240-11 Midterm Program
;  file name: electricity.asm
;  Preferred Email Address: bbabiker@csu.fullerton.edu
;******************************************************************************************************************************

extern printf
extern scanf
extern atof
extern isfloat
global electricity
extern current

string_size equ 48

segment .data
    floatform db "%s", 0
    eforce db "Please enter the electric force in circuits (volts): ", 0
    resistance_1 db "Please enter the resistance in circuit number 1 (ohms): ", 0
    resistance_2 db "Please enter the resistance in circuit number 2 (ohms): ", 0
    resistance_3 db "Please enter the resistance in circuit number 3 (ohms): ", 0
    thanks db "Thank you.", 10, 0
    badinput db "Invalid input. Please try again.", 10, 0

segment .bss
    align 64
    backup_storage_area resb 832

segment .text

electricity:
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

    ;prompt the user for electric force
    mov rax, 0
    mov rdi, eforce
    call printf

    push qword 0
    push qword 0
    mov rax, 0
    mov rdi, floatform
    mov rsi, rsp
    call scanf

input_loop_r1:
    ;prompt the user for resistance in circuit 1
    mov rax, 0
    mov rdi, resistance_1
    call printf

    ;user's input for resistance of circuit 1
    push qword 0
    push qword 0
    mov rax, 0
    mov rdi, floatform
    mov rsi, rsp
    call scanf

    ;check that input for resistance of circuit 1 is a valid float
    mov rdi, rsp
    call isfloat
    cmp rax, 0
    je  bad_input_r1

    ;if resistance for circuit 1 is valid float number, save & get resistance for circuit 2
    mov rax, 0
    mov rdi, rsp
    call atof
    movsd xmm14, xmm0
    pop r9
    pop r9
    jmp continue_code

bad_input_r1:
    pop rax
    pop rax

    ;reprompt
    mov rax, 0
    mov rdi, badinput
    call printf

    jmp input_loop_r1

continue_code:
    ;prompt the user for resistance 2
    mov rax, 0
    mov rdi, resistance_2
    call printf

    push qword 0
    push qword 0
    mov rax, 0
    mov rdi, floatform
    mov rsi, rsp
    call scanf

    mov rax, 0
    mov rdi, rsp
    call atof
    movsd xmm13, xmm0
    pop r9
    pop r9

    ;prompt the user for resistance 3
    mov rax, 0
    mov rdi, resistance_3
    call printf

    push qword 0
    push qword 0
    mov rax, 0
    mov rdi, floatform
    mov rsi, rsp
    call scanf

    mov rax, 0
    mov rdi, rsp
    call atof
    movsd xmm12, xmm0
    pop r9
    pop r9

    ;print thank you message
    mov rax, 0
    mov rdi, thanks
    call printf

    ;call current function
    mov rax, 3
    movsd xmm0, xmm14
    movsd xmm1, xmm13
    movsd xmm2, xmm12
    movsd xmm3, xmm15
    call current

    ;move results of total current from current function to stack
    mov rax, 0
    push qword 0
    movsd [rsp], xmm0

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
