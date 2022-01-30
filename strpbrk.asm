BITS 64

SECTION .text
GLOBAL strpbrk

strpbrk:
    PUSH RBP
    MOV RBP, RSP
    CMP RDI, 0
    JE null
    CMP RSI, 0
    JE null
    MOV BYTE RCX, -1
    MOV R9, 0
    MOV BYTE R8, -1
    JMP check

check:
    CMP [RSI + R9], BYTE 0
    JE end
    INC R9
    CMP BYTE RCX, -1
    JE decr
    MOV RCX, 0
    JMP checkOne

decr:
    DEC R9
    MOV RCX, 0

checkOne:
    CMP [RDI + RCX], BYTE 0
    JE check
    MOV R10B, [RDI + RCX]
    CMP [RSI + R9], R10B
    JE found
    INC RCX
    JMP checkOne

found:
    CMP BYTE R8, -1
    JE change
    CMP RCX, R8
    JL change
    JMP check

change:
    MOV R8, RCX
    JMP check

null:
    MOV RAX, 0
    LEAVE
    RET

end:
    MOV RAX, RDI
    ADD RAX, R8
    CMP BYTE R8, -1
    JE null
    LEAVE
    RET