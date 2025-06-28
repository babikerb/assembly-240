section .data
    welcome_msg db "This program will manage your arrays of 64-bit floats", 10, 0
    input_instr db "For the array, enter a sequence of 64-bit floats separated by white space.", 10, 0
    end_instr db "After the last input, press enter followed by Control+D.", 10, 0
    fmt db "%s", 0  ; Format string for printf

section .bss
    extern array, count  

section .text
global manager
extern printf, input_array, sum, output_array, sort, swap

manager:
    push    rbp
    mov     rbp, rsp

    ; Print welcome message
    mov     rax, 0
    mov     rdi, welcome_msg
    call    printf

    ; Print input instructions
    mov     rax, 0
    mov     rdi, input_instr
    call    printf

    ; Print end instructions
    mov     rax, 0
    mov     rdi, end_instr
    call    printf

    ; Call input_array to take user input
    call    input_array

    ; Call sum to calculate sum of the array
    call    sum

    ; Call sort to sort the array
    call    sort

    ; Call swap (if needed for additional operations)
    call    swap

    ; Call output_array to display the results
    call    output_array

    pop     rbp
    ret
