BITS 64

SECTION .text
GLOBAL memset

memset:
    PUSH RBP
    MOV RBP, RSP
    MOV RCX, 0

fill:
    CMP RDX, RCX
    JE end
    MOV BYTE [RDI + RCX], SIL
    INC RCX
    JMP fill

end:
    MOV RAX, RDI
    LEAVE
    RET