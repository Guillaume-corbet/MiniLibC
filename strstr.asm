BITS 64

SECTION .text
GLOBAL strstr

strstr:
    PUSH RBP
    MOV RBP, RSP
    MOV BYTE RCX, -1
    CMP RDI, 0
    JE null
    CMP RSI, 0
    JE null
    CMP [RSI], BYTE 0
    JE end
    JMP checkAll

checkAll:
    CMP [RDI], BYTE 0
    JE null
    INC RDI
    CMP RCX, -1
    JE decrdi
    MOV RCX, 0
    JMP checkStr

decrdi:
    DEC RDI
    MOV RCX, 0

checkStr:
    CMP [RSI + RCX], BYTE 0
    JE end
    MOV R8B, [RDI + RCX]
    CMP [RSI + RCX], R8B
    JNE checkAll
    INC RCX
    JMP checkStr

null:
    MOV RAX, 0
    LEAVE
    RET

end:
    MOV RAX, RDI
    LEAVE
    RET