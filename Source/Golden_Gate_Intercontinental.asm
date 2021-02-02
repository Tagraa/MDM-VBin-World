;***********************************************************************
; Golden Gate of the VBin World
;***********************************************************************
HEADQUARTER_16                  equ     0x7e00
                                jmp     Golden.Gateway
[bits 16]
[org HEADQUARTER_16]
;***********************************************************************
%include "Include/BIOS/BIOS_Display.asm"
%include "Include/BIOS/BIOS_CGA_16Colors.asm"
%include "Include/BIOS/BIOS_System.asm"
%include "Include/Golden_Gate_Intercontinental/Informers/System_AI_via_BIOS.asm"
%include "Include/Golden_Gate_Intercontinental/Informers/System_AI_Reporting_via_BIOS.asm"
%include "Include/Golden_Gate_Intercontinental/Informers/System_AI_Core/System_AI_Identity_Card.asm"
%include "Include/Golden_Gate_Intercontinental/Version.asm"
;***********************************************************************
;=======================================================================
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
    call    VBin.Function.Welcome
    call    VBin.Function.Hardwares.Check
;.......................................................................
Idle:
    hlt
    mov     word [__wait_seconds__], 5
    call    System.Process.Wait.For.Seconds
    mov     si, MessageTurnOff
    call    System.AI.via.BIOS
    mov     word [__wait_seconds__], 2
    call    System.Process.Wait.For.Seconds
    call    System.Turn.Off
    jmp     Idle
;=======================================================================
VBin.Function.Welcome:
    mov     word [__wait_seconds__], 2
    call    System.Process.Wait.For.Seconds
    mov     si, MessageWelcome
    call    System.AI.via.BIOS
    mov     si, Project.Title
    call    System.AI.via.BIOS
    mov     si, Project.Version
    call    System.AI.via.BIOS
    ret
VBin.Function.Hardwares.Check:
    mov     word [__wait_seconds__], 4
    call    System.Process.Wait.For.Seconds
    mov     si, MessageCheckHardwares
    call    System.AI.via.BIOS
    ret
;***********************************************************************
;.......................................................................
MessageWelcome:                   db "Welcome to", 0
MessageCheckHardwares:            db "Now ... Checking hardwares ;)", 0
MessageTurnOff:                   db "I am going to sleep. BBFN", 0
;.......................................................................
;***********************************************************************
;//EOF
