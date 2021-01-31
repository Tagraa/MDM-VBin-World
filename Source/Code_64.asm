;***********************************************************************
; Entering Long Mode Directly
; Resource: https://wiki.osdev.org/Entering_Long_Mode_Directly
;***********************************************************************
%define FREE_SPACE 0x9000
[bits 16]
[ORG 0x7c00]
;=======================================================================
; Main entry point where BIOS leaves us.
;=======================================================================
System:
    jmp     0x0000:.Flush.Segment.Code
    .Flush.Segment.Code:
        xor     ax, ax
        ; Set up segment registers.
        mov     ss, ax
        ; Set up stack so that it starts below Main.
        mov     sp, System
        mov     ds, ax
        mov     es, ax
        mov     fs, ax
        mov     gs, ax
        cld
        ; Check whether we support Long Mode or not.
        call    Check.CPU
        jc      .Mode.Double
        ; Point edi to a free space bracket.
        mov     edi, FREE_SPACE
        ; Switch to Long Mode.
        jmp     Switch.To.Mode.Long
[bits 64]
    .Mode.Long:
        hlt
        jmp .Mode.Long
[bits 16]
    .Mode.Double:
        mov     si, NO_LONG_MODE_MESSAGE
        call    Display.String
    .Idle:
        hlt
        jmp .Idle
;***********************************************************************
%include "Include/Boot_Components/Switch_To_Long_Mode_Directly.asm"
;***********************************************************************
[bits 16]
;.......................................................................
NO_LONG_MODE_MESSAGE:    db "ERROR: Require long mode (64 bits CPU). \
:)", 0x0A, 0x0D, 0
;.......................................................................
;***********************************************************************
%include "Include/Boot_Components/Display_String.asm"
%include "Include/Boot_Components/Check_CPU.asm"
;***********************************************************************
;-----------------------------------------------------------------------
; Pad boot sector to 510 bytes and add 2 byte boot signature for
; 512 total bytes
;-----------------------------------------------------------------------
TIMES   510-($-$$)              db      0
                                dw      0xaa55
;***********************************************************************
;//EOF
