section .data
fmt_float db "%lf\n", 0  ; Added newline for better output formatting

section .text
global output_array
extern printf, array, count

output_array:
    mov rcx, qword [count]   ; FIX: Ensure count is read properly
    test rcx, rcx
    jz .done                 ; If count is 0, exit

    mov rsi, array
.loop:
    movq xmm0, [rsi]         ; Load float from array
    mov rdi, fmt_float
    call printf
    add rsi, 8
    loop .loop
.done:
    ret
