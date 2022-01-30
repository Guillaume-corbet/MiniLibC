BITS 64

SECTION .text
GLOBAL strcspn

strcspn:
    PUSH RBP
    MOV RBP, RSP
    CMP RDI, 0
    JE null
    CMP RSI, 0
    JE null
    MOV BYTE RCX, -1
    MOV R11, 0
    MOV R9, 0
    MOV R8, 0
    JMP strlenspn

strlenspn:
    CMP [RDI + R11], BYTE 0
    JE check
    INC R11
    JMP strlenspn

check:
    CMP [RSI + R9], BYTE 0
    JE finish
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
    MOV R10B, [RSI + R9]
    CMP [RDI + RCX], R10B
    JE found
    INC RCX
    JMP checkOne

found:
    CMP R8, RCX
    JL change
    JMP check

change:
    MOV R8, RCX
    INC R8
    JMP check

finish:
    CMP R8, 0
    MOV RCX, 0
    MOV R9, 0
    JE endnull
    JNE end

endnull:
    CMP [RDI + RCX], BYTE 0
    JE notnull
    MOV R10B, [RSI + R9]
    CMP [RDI + RCX], R10B
    JE null
    INC RCX
    JMP endnull

notnull:
    MOV RAX, R11
    LEAVE
    RET

null:
    MOV RAX, 0
    LEAVE
    RET

end:
    DEC R8
    MOV RAX, R8
    LEAVE
    RET