BITS 64

SECTION .text
GLOBAL strncmp

strncmp:
    PUSH RBP
    MOV RBP, RSP
    CMP RDI, 0
    JE equal
    CMP RSI, 0
    JE equal
    MOV RCX, 0

check:
    CMP RDX, RCX
    JE equal
    CMP [RSI + RCX], BYTE 0
    JE checkendrsi
    CMP [RDI + RCX], BYTE 0
    JE checkendrdi
    MOV R10B, [RSI + RCX]
    CMP [RDI + RCX], R10B
    JG sup
    JNGE inf
    INC RCX
    JMP check

checkendrsi:
    CMP [RDI + RCX], BYTE 0
    JE equal
    JNE sup

checkendrdi:
    CMP [RSI + RCX], BYTE 0
    JE equal
    JNE inf

sup:
    MOV RAX, 1
    JMP end

inf:
    MOV BYTE RAX, -1
    JMP end

equal:
    MOV RAX, 0
    JMP end

end:
    LEAVE
    RET