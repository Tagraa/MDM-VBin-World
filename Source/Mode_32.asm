[bits 32]
[global kstart]
kstart:
    mov     esp, 0x1000
    pusha
    mov     edx, VIDEO_MEMORY
    xor     eax, eax
    mov     ah, MAGENTA_ON_BLACK
    mov     al, 'Y'
    mov     [edx], ax
    popa
    ret
;=======================================================================
;.......................................................................
;.......................................................................
TIMES       512-($-$$)  db  0
;***********************************************************************
%include "Include/Golden_Gate_Intercontinental/Ports/Wired/Video_Graphics_Array/Default.asm"
%include "Include/BIOS/BIOS_CGA_16Colors.asm"
;***********************************************************************
;//EOF
