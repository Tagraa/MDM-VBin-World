[bits 16]
[ORG 0x7C00]
;***********************************************************************
KiB_10_OFFSET           equ     0x1000
;***********************************************************************
Initialize:
    xor     ax, ax
    mov     es, ax
    mov     ds, ax
    mov     bp, 0x7C00
    mov     sp, bp
    mov     byte [__boot_device__], dl
Start:
    call    Wait.A.Second
    mov     si, TEST_MESSAGE
    call    System.AI.via.BIOS
    call    Wait.A.Second
    mov     si, READ_DISK_MESSAGE_1
    call    System.AI.via.BIOS
    call    Load.KiB.10
Idle:
    hlt
    jmp     Idle
;***********************************************************************
Load.KiB.10:
    mov     bx, KiB_10_OFFSET
    mov     byte [__sectors__], 1
    mov     byte [__starting_sector__], 2
    call    Disk.Load
    cmp     byte [Disk.Error.Code], 1
    je     .Error
    mov     si, READ_DISK_MESSAGE_2
    call    System.AI.via.BIOS
    call     KiB_10_OFFSET
    jmp     .Done
    .Error:
        call    Wait.A.Second
        mov     si, DISK_ERROR_MESSAGE
        call    System.AI.via.BIOS
        jmp     Idle
    .Done:
        ret
;***********************************************************************
%include "Include/BIOS/BIOS_Display.asm"
%include "Include/BIOS/BIOS_CGA_16Colors.asm"
%include "Include/BIOS/BIOS_Process_Wait.asm"
%include "Include/BIOS/BIOS_Boot_Disk.asm"
%include "Include/Golden_Gate_Intercontinental/Informers/System_AI_via_BIOS.asm"
%include "Include/Golden_Gate_Intercontinental/Informers/System_AI_Reporting_via_BIOS.asm"
%include "Include/Golden_Gate_Intercontinental/Informers/System_AI_Core/System_AI_Identity_Card.asm"
;***********************************************************************
;.......................................................................
TEST_MESSAGE:           db "Hi! :)", 0
READ_DISK_MESSAGE_1:    db "Reading boot disk - Sector 2.", 0
READ_DISK_MESSAGE_2:    db "Disk read successfull.", 0
DISK_ERROR_MESSAGE:     db "Boot disk read error!", 0
;.......................................................................
;***********************************************************************
;-----------------------------------------------------------------------
; Pad boot sector to 510 bytes and add 2 byte boot signature for
; 512 total bytes
;-----------------------------------------------------------------------
TIMES       510-($-$$)  db  0
                        dw  0xaa55
;***********************************************************************
;//EOF
;***********************************************************************










    ;~ ; Set the stack.
    ;~ mov     si, STACK_MESSAGE
    ;~ call    Display.String
    ;~ ; BIOS stores our boot drive in DL, so it’s best to remember this
    ;~ ; for later.
    ;~ call    Load.Mode.32
    ;~ ; Note that we never return from here.
    ;~ call    Switch.To.Protected.Mode
;***********************************************************************
;~ %include "Include/Boot_Components/Switch_To_Protected_Mode.asm"
;~ %include "Include/Golden_Gate_Intercontinental/Ports/Wired/Video_Graphics_Array/Default.asm"
;***********************************************************************
;~ [bits 16]
;~ ; Load Collaboration
;~ Load.Mode.32:
    ;~ mov     bx, MODE_32_OFFSET
    ;~ mov     dh, 15
    ;~ mov     dl, [BOOT_DEVICE]
    ;~ call    Disk.Load
    ;~ mov     si, DISK_READ_MESSAGE
    ;~ call    Display.String
    ;~ ret
;***********************************************************************
;~ %include "Include/Boot_Components/Display_String.asm"
;~ %include "Include/Boot_Components/Disk_Load.asm"
;~ %include "Include/BIOS/BIOS_CGA_16Colors.asm"
;***********************************************************************
;~ [bits 32]
;=======================================================================
; 32-bit protected mode
; This is where we arrive after switching to and initialising
; protected mode.
;=======================================================================
;~ Begin.Protected.Mode:
    ;~ pusha
    ;~ mov     edx, VIDEO_MEMORY
    ;~ xor     eax, eax
    ;~ mov     ah, MAGENTA_ON_BLACK
    ;~ mov     al, 'X'
    ;~ mov     [edx], ax
    ;~ popa
    ;~ call    MODE_32_OFFSET

;.......................................................................
;~ BOOT_DEVICE:        db 0
;~ MODE_MESSAGE:       db "BOOT: Real Mode (16 Bits).", 0x0A, 0x0D, 0
;~ STACK_MESSAGE:      db "BOOT: The stack is set.", 0x0A, 0x0D, 0
;~ DISK_READ_MESSAGE:  db "BOOT: Disk read completed.", 0x0A, 0x0D, 0
;.......................................................................

