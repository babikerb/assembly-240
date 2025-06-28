section .text
global sum
extern count, array, printf

sum:
    pxor xmm0, xmm0          ; Clear sum register
    mov rcx, [count]         ; Load count
    test rcx, rcx            ; Check if count is zero
    jz .done

    mov rsi, array           ; Load array address
.loop:
    movsd xmm1, [rsi]        ; Load element
    addsd xmm0, xmm1         ; Add to sum

    ; Debug: Print current element being summed
    sub rsp, 8               ; Align stack
    mov rdi, debug_element_fmt
    mov rax, 1
    call printf
    add rsp, 8

    add rsi, 8               ; Move to next element
    loop .loop

.done:
    ret

section .data
debug_element_fmt db "Summing: %f", 10, 0