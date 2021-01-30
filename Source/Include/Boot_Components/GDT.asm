;***********************************************************************
; Global Descriptor Table
;***********************************************************************
; GDT
GDT_Start:
; The mandatory null descriptor
GDT_Null:
    dd  0x0
    dd  0x0
; The code segment descriptor
GDT_Code:
    dw  0xffff       ; Limit (bits 0 -15)
    dw  0x0          ; Base (bits 0 -15)
    db  0x0          ; Base (bits 16 -23)
    db  10011010b    ; 1st flags, type flags
    db  11001111b    ; 2nd flags, Limit (bits 16 -19)
    db  0x0          ; Base (bits 24 -31)
; The data segment descriptor
GDT_Data:
    dw  0xffff       ; Limit (bits 0 -15)
    dw  0x0          ; Base (bits 0 -15)
    db  0x0          ; Base (bits 16 -23)
    db  10010010b    ; 1st flags, type flags
    db  11001111b    ; 2nd flags, Limit ( bits 16 -19)
    db  0x0          ; Base (bits 24 -31)
GDT_End:
; GDT descriptior
GDT_Descriptor:
    dw  GDT_End - GDT_Start - 1
    dd  GDT_Start
;-----------------------------------------------------------------------
CODE_SEGMENT        equ     GDT_Code - GDT_Start
DATA_SEGMENT        equ     GDT_Data - GDT_Start
;***********************************************************************
;//EOF
