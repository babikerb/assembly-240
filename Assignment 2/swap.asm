section .text
global swap

swap:
    movq xmm0, [rdi]
    movq xmm1, [rsi]
    movq [rdi], xmm1
    movq [rsi], xmm0
    ret
