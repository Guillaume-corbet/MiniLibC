BITS 64

SECTION .text
GLOBAL memmove

memmove:
    PUSH RBP
    MOV RBP, RSP
    CMP RDI, 0
    JE null
    CMP RSI, 0
    JE null
    MOV RCX, 0

fill:
    CMP RDX, RCX
    JE end
    CMP [RSI + RCX], BYTE 0
    JE end
    MOV R10B, [RSI + RCX]
    MOV [RDI + RCX], R10B
    INC RCX
    JMP fill

null:
    MOV RAX, 0
    LEAVE
    RET

end:
    MOV RAX, RDI
    LEAVE
    RET