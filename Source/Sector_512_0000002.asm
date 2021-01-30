[bits 16]
[ORG 0x1000]
Sector.2:
    xor     ax, ax
    mov     es, ax
    mov     ds, ax
    ; Set the stack.
    mov     bp, 0xFFFF
    mov     sp, bp
    call    Wait.A.Second
    mov     si, SECTOR_2_MESSAGE
    call    System.AI.via.BIOS
Idle:
    hlt
    jmp     Idle
;***********************************************************************
%include "Include/BIOS/BIOS_Display.asm"
%include "Include/BIOS/BIOS_CGA_16Colors.asm"
%include "Include/BIOS/BIOS_Process_Wait.asm"
%include "Include/Golden_Gate_Intercontinental/Informers/System_AI_via_BIOS.asm"
%include "Include/Golden_Gate_Intercontinental/Informers/System_AI_Reporting_via_BIOS.asm"
%include "Include/Golden_Gate_Intercontinental/Informers/System_AI_Core/System_AI_Identity_Card.asm"
;***********************************************************************
;.......................................................................
SECTOR_2_MESSAGE:   db "This is SECTOR-2.", 0x0A, 0x0D, 0
;.......................................................................
;-----------------------------------------------------------------------
; Pad boot sector to 510 bytes and add 2 byte boot signature for
; 512 total bytes
;-----------------------------------------------------------------------
TIMES       512-($-$$)  db  0
;***********************************************************************
;//EOF
;***********************************************************************
