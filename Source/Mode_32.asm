[bits 32]
[ORG 0x1000]
Start_32:
    pusha
    mov     edx, VIDEO_MEMORY
    xor     eax, eax
    mov     ah, MAGENTA_ON_BLACK
    mov     al, 'Y'
    mov     [edx], ax
    popa
Idle:
    hlt
    jmp     Idle
;=======================================================================
;.......................................................................
;.......................................................................
;-----------------------------------------------------------------------
; Pad boot sector to 510 bytes and add 2 byte boot signature for
; 512 total bytes
;-----------------------------------------------------------------------
TIMES       512-($-$$)  db  0
;***********************************************************************
%include "Include/Golden_Gate_Intercontinental/Ports/Wired/Video_Graphics_Array/Default.asm"
%include "Include/BIOS/BIOS_CGA_16Colors.asm"
;***********************************************************************
;//EOF
