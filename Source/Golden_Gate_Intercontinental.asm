[bits 16]
[org    0x7e00]
Golden.Gateway:
    xor     ax, ax
    mov     ds, ax
    mov     ss, ax
    mov     sp, 0x7e00
;.......................................................................
    mov     byte [__background_color__], VERSATILE_LIGHT_RED
    call    Display.Intensity
    call    Display.Cursor.Shape.Normal
    call    Display.Background.Color
;.......................................................................
    cld
    xor     cx, cx
;***********************************************************************
VBin.Stage2:
    call    VBin.Stage2.Render
;.......................................................................
Idle:
    hlt
    jmp     Idle
;***********************************************************************
VBin.Stage2.Render:
    mov     si, MessageWelcome
    call    System.AI.via.BIOS
    mov     si, Project.Title
    call    System.AI.via.BIOS
    mov     si, Project.Version
    call    System.AI.via.BIOS
    ret
;***********************************************************************
%include "Include/BIOS/BIOS_Display.asm"
%include "Include/BIOS/BIOS_CGA_16Colors.asm"
%include "Include/Golden_Gate_Intercontinental/Informers/System_AI_via_BIOS.asm"
%include "Include/Golden_Gate_Intercontinental/Informers/System_AI_Reporting_via_BIOS.asm"
%include "Include/Golden_Gate_Intercontinental/Informers/System_AI_Core/System_AI_Identity_Card.asm"
%include "Include/Golden_Gate_Intercontinental/Version.asm"
;***********************************************************************
;.......................................................................
MessageWelcome:            db "Welcome to", 0
;.......................................................................
;***********************************************************************
;//EOF
