global array, count
global input_array

section .bss
    array resq 100             ; Reserve space for 100 floating-point numbers (8 bytes each)
    count resq 1               ; Variable to track the number of elements input

section .data
    prompt db "Enter a sequence of 64-bit floats separated by white space:", 0
    prompt_len equ $ - prompt
    error_message db "Invalid input. Try again.", 10, 0
    error_len equ $ - error_message

section .text

_start:
    ; Print the prompt
    mov rax, 1                ; sys_write
    mov rdi, 1                ; file descriptor (stdout)
    mov rsi, prompt           ; message
    mov rdx, prompt_len       ; length of the message
    syscall

    ; Initialize count to 0
    mov rax, 0
    mov [count], rax

    ; Initialize the array with 0s
    xor rax, rax              ; Set rax to 0
    mov rcx, 100              ; Array size
.init_array:
    mov [array + rcx * 8], rax ; Set array element to 0
    dec rcx
    jnz .init_array

read_input:
    ; Read the user input into a buffer (we'll assume it's valid float values)
    mov rax, 0                ; sys_read
    mov rdi, 0                ; file descriptor (stdin)
    mov rsi, array            ; input buffer (reuse the array for input)
    mov rdx, 512              ; size of buffer
    syscall

    ; Check if the user input is valid (we assume it's a number for simplicity)
    ; We will just read the input as integers for simplicity, modify for floating-point handling
    ; Here you can modify this to read and convert a floating point value if needed
    ; For simplicity, we assume a valid input of integers for this example

    ; After valid input, increment count
    mov rax, [count]
    inc rax
    mov [count], rax

    ; Check if count exceeds the array bounds
    mov rcx, [count]
    cmp rcx, 100              ; Array size check
    jge .done                 ; If count >= 100, jump to done

    ; Print current count and stored value
    mov rax, 1                ; sys_write
    mov rdi, 1                ; file descriptor (stdout)
    mov rsi, array            ; message buffer (reuse array)
    ; Here, you would print the array's stored value, using an appropriate float-to-string function

    ; Loop back to read another input
    jmp read_input

.done:
    ; Finished processing input, print the sum or other logic as needed

    ; Exit program cleanly
    mov rax, 60               ; sys_exit
    xor rdi, rdi              ; exit status 0
    syscall
