;***********************************************************************
; Golden Gate of the VBin World
;***********************************************************************
HEADQUARTER_16                  equ     0x7e00
;=======================================================================
[bits 16]
[org HEADQUARTER_16]
Golden.Gateway:
    xor     ax, ax
    mov     ds, ax
    mov     ss, ax
    mov     sp, HEADQUARTER_16
;.......................................................................
    mov     byte [__background_color__], VERSATILE_LIGHT_RED
    call    Display.Intensity
    call    Display.Cursor.Shape.Normal
    call    Display.Background.Color
;.......................................................................
    cld
    xor     cx, cx
;=======================================================================
VBin.Operation.Bits.16:
    call    VBin.Offset.Welcome
;.......................................................................
Idle:
    hlt
    jmp     Idle
;=======================================================================
VBin.Offset.Welcome:
    mov     word [__wait_seconds__], 2
    call    Process.Wait.For.Seconds
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
%include "Include/BIOS/BIOS_Process_Wait.asm"
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
