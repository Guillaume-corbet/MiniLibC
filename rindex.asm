BITS 64

SECTION .text
GLOBAL rindex

rindex:
    PUSH RBP
    MOV RBP, RSP
    CMP RDI, BYTE 0
    JE null
    MOV RCX, 0
    MOV RAX, 0
    CMP ESI, 0
    JE zero
    JMP goend

zero:
    MOVSX EDX, BYTE [RDI + RCX]
    CMP EDX, 0
    JE end
    INC RCX
    JMP zero

goend:
    MOVSX EDX, BYTE [RDI + RCX]
    CMP EDX, 0
    JE takelast
    INC RCX
    JMP goend

takelast:
    INC RCX
    CMP ESI, 0
    JE end
    JMP search

search:
    MOVSX EDX, BYTE [RDI + RCX]
    CMP RCX, BYTE 0
    JL null
    CMP EDX, ESI
    JE end
    DEC RCX
    JMP search

null:
    MOV RAX, 0
    LEAVE
    RET

end:
    MOV RAX, RDI
    ADD RAX, RCX
    LEAVE
    RET