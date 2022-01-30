BITS 64

SECTION .text
GLOBAL strlen

strlen:
    PUSH RBP
	MOV RBP, RSP
    CMP RDI, 0
    JE end
    MOV RCX, 0
    JMP check

check:
    CMP BYTE [RDI + RCX], 0
    JE end
    INC RCX
    JMP check

end:
    MOV RAX, RCX
    LEAVE
    RET