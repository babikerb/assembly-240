;******************************************************************************************************************************
; Copyright (C) 2025 Babiker Babiker.
;
; This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License
; version 3 as published by the Free Software Foundation. This program is distributed in the hope that it will be useful, but
; WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
; General Public License for more details. A copy of the GNU General Public License v3 is available here:
; https://www.gnu.org/licenses/.
;
; Author: Babiker Babiker
; Author Email: bbabiker@csu.fullerton.edu
; CWID: 871026449
; Class: 240-11 Section 11
; Program name: Triangles
; Programming Languages: One module in C, one in X86-64, and one in bash.
; Date Program Began: 2025-Jan-24
; Date of Last Update: 2025-Jan-24
; Files in this Program: geometry.c, triangle.asm, r.sh.
; This program calculates the third side of a triangle given lengths of the other two sides and an angle in degrees

; This File:
;   File Name: triangle.asm
;   Language: Assembly x86-64
;******************************************************************************************************************************

; declarations
extern printf
extern scanf
extern cos
global compute

segment .data
    prompt_lengths db "Please enter the sides of your triangle separated by whitespace: ", 0
    prompt_angle db "Please enter the size in degrees of the angle between those two sides: ", 0
    result db "The length of the third side is %lf units.", 10, 0
    format_strings db "%lf %lf", 0
    format_num db "%lf", 0
    pi_value dq 3.14159265358979323846
    divisor_180 dq 180.0
    two dq 2.0
    ; Below is for concepts final completely ignore this
    games dq 37, 94, 44, 60, 17, 26, 95, 18

segment .bss
    align 64
    backup_storage_area resb 832

segment .text

; Function handling the computation and printing of the third side of a triangle
compute:
    ; Backup GPRs
    push    rbp
    mov     rbp, rsp
    push    rbx
    push    rcx
    push    rdx
    push    rdi
    push    rsi
    push    r8
    push    r9
    push    r10
    push    r11
    push    r12
    push    r13
    push    r14
    push    r15
    pushf

    ; Prompt user for triangle sides
    mov     rax, 0
    mov     rdi, prompt_lengths
    call    printf

    ; Read user input for sides a and b (stored as xmm10 = a, xmm11 = b)
    sub     rsp, 32
    mov     rax, 0
    mov     rdi, format_strings
    lea     rsi, [rsp]
    lea     rdx, [rsp + 8]
    call    scanf
    movsd   xmm10, [rsp]            ; xmm10 = a
    movsd   xmm11, [rsp + 8]        ; xmm11 = b
    add     rsp, 32

    ; Prompt user for angle in degrees
    mov     rax, 0
    mov     rdi, prompt_angle
    call    printf

    ; Read user input for angle (stored as xmm12)
    sub     rsp, 16
    mov     rax, 0
    mov     rdi, format_num
    lea     rsi, [rsp]
    call    scanf
    movsd   xmm12, [rsp]            ; xmm12 = angle in degrees
    add     rsp, 16

    ; a^2 computation (stored as xmm13)
    movsd   xmm13, xmm10
    mulsd   xmm13, xmm10            ; xmm13 = a^2

    ; b^2 computation (stored as xmm14)
    movsd   xmm14, xmm11
    mulsd   xmm14, xmm11            ; xmm14 = b^2

    ; a^2 + b^2 computation (stored as xmm15)
    movsd   xmm15, xmm13
    addsd   xmm15, xmm14  ; xmm15 = a^2 + b^2

    ; Convert angle from degrees to radians: radians = degrees * (pi / 180)
    movsd   xmm1, [rel pi_value]
    divsd   xmm1, [rel divisor_180]  ; xmm1 = pi / 180
    mulsd   xmm12, xmm1              ; xmm12 = angle in radians

    ; Compute cos(C)
    movsd   xmm0, xmm12
    call    cos
    movsd   xmm13, xmm0             ; xmm13 = cos(C)

    ; Compute 2 * a * b * cos(C)
    movsd   xmm14, xmm10
    mulsd   xmm14, xmm11            ; xmm14 = a * b
    mulsd   xmm14, [rel two]        ; xmm14 = 2 * a * b
    mulsd   xmm14, xmm13            ; xmm14 = 2ab * cos(C)

    ; Compute c^2 = a^2 + b^2 - 2ab * cos(C)
    subsd   xmm15, xmm14            ; xmm15 = a^2 + b^2 - 2ab * cos(C)

    ; Compute c = sqrt(c^2)
    sqrtsd  xmm0, xmm15             ; xmm0 = sqrt(a^2 + b^2 - 2ab * cos(C))

    ; Print result
    mov     rdi, result
    mov     rax, 1
    call    printf

    ; Restore GPRs (general-purpose registers)
    popf
    pop     r15
    pop     r14
    pop     r13
    pop     r12
    pop     r11
    pop     r10
    pop     r9
    pop     r8
    pop     rsi
    pop     rdi
    pop     rdx
    pop     rcx
    pop     rbx
    pop     rbp

    ; Return from the function
    ret

