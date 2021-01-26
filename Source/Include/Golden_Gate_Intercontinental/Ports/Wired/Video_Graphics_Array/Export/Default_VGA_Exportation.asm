;***********************************************************************
;=======================================================================
; Default Standard Video Graphics Array Exportation
;=======================================================================
[bits 32]
Export.VGA.Default:
    push    eax
    push    edx
    ;Set edx to the start of Video memory.
    mov     edx, VIDEO_MEMORY
    pop     edx
    pop     eax
;.......................................................................
;~ %include "Include/Golden_Gate_Intercontinental/Ports/Wired/Video_Graphics_Array/Default_VGA.asm"
%include "../Default_VGA.asm"
;.......................................................................
;***********************************************************************
;//EOF
