BITS 64

SECTION .text
GLOBAL strchr

strchr:
    PUSH RBP
    MOV RBP, RSP
    CMP RDI, 0
    JE null
    MOV RCX, 0

check:
    MOVSX EDX, BYTE [RDI + RCX]
    CMP EDX, 0
    JE null
    CMP EDX, ESI
    JE end
    INC RCX
    JMP check

null:
    CMP ESI, 0
    JE end
    MOV RAX, 0
    LEAVE
    RET

end:
    MOV RAX, RDI
    ADD RAX, RCX
    LEAVE
    RET