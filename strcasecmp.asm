BITS 64

SECTION .text
GLOBAL strcasecmp

strcasecmp:
    PUSH RBP
    MOV RBP, RSP
    CMP RDI, 0
    JE equal
    CMP RSI, 0
    JE equal
    MOV RCX, 0

check:
    CMP [RDI + RCX], BYTE 0
    JE endRdi
    CMP [RDI + RCX], BYTE 65
    JL notCase
    CMP [RDI + RCX], BYTE 90
    JG notCase
    JLE CaseRdi
    JMP checkRsi

notCase:
    MOV R9B, [RDI + RCX]
    JMP checkRsi

CaseRdi:
    MOV R9B, [RDI + RCX]
    ADD R9B, 32
    JMP checkRsi

checkRsi:
    CMP [RSI + RCX], BYTE 0
    JE endRsi
    CMP [RSI + RCX], BYTE 65
    JL notCaseRsi
    CMP [RDI + RCX], BYTE 90
    JG notCaseRsi
    JLE CaseRsi

notCaseRsi:
    MOV R10B, [RSI + RCX]
    JMP checkAll

CaseRsi:
    MOV R10B, [RSI + RCX]
    ADD R10B, 32
    JMP checkAll

checkAll:
    CMP R9B, R10B
    JG sup
    JL inf
    INC RCX
    JMP check

endRdi:
    CMP [RSI + RCX], BYTE 0
    JE equal
    JNE inf

endRsi:
    CMP [RDI + RCX], BYTE 0
    JE equal
    JNE sup

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