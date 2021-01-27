[bits 16]
[ORG 0x7c00]
;=======================================================================
; This is the memory offset to which we will load our Mode-32
;=======================================================================
MODE_32_OFFSET       equ     0x1000
;=======================================================================
; 16-bit real mode
;=======================================================================
Boot.Start:
    xor     ax, ax
    mov     es, ax
    mov     ds, ax
    mov     bp, 0x7c00
    mov     sp, bp
    hlt
    mov     si, MODE_MESSAGE
    call    Display.String
    hlt
    ; BIOS stores our boot drive in DL, so it’s best to remember this
    ; for later.
    mov     [BOOT_DEVICE], dl
    hlt
    ; Set the stack.
    mov     si, STACK_MESSAGE
    call    Display.String
    hlt
    call    Load.Mode.32
    ; Note that we never return from here.
    call    Switch.To.Protected.Mode
    hlt
;***********************************************************************
%include "Include/Boot_Components/GDT.asm"
%include "Include/Boot_Components/Switch_To_Protected_Mode.asm"
%include "Include/Golden_Gate_Intercontinental/Ports/Wired/Video_Graphics_Array/Default.asm"
;***********************************************************************
[bits 16]
; Load Collaboration
Load.Mode.32:
    mov     bx, MODE_32_OFFSET
    mov     dh, 15
    mov     dl, [BOOT_DEVICE]
    call    Disk.Load
    hlt
    mov     si, DISK_READ_MESSAGE
    call    Display.String
    ret
;***********************************************************************
%include "Include/Boot_Components/Display_String.asm"
%include "Include/Boot_Components/Disk_Load.asm"
%include "Include/BIOS/BIOS_CGA_16Colors.asm"
;***********************************************************************
[bits 32]
;=======================================================================
; 32-bit protected mode
; This is where we arrive after switching to and initialising
; protected mode.
;=======================================================================
Begin.Protected.Mode:
    pusha
    mov     edx, VIDEO_MEMORY
    xor     eax, eax
    mov     ah, MAGENTA_ON_BLACK
    mov     al, 'X'
    mov     [edx], ax
    popa
    ;~ call    MODE_32_OFFSET
Idle:
    hlt
    jmp     Idle
;.......................................................................
BOOT_DEVICE:        db 0
MODE_MESSAGE:       db "BOOT: Real Mode (16 Bits).", 0x0A, 0x0D, 0
STACK_MESSAGE:      db "BOOT: The stack is set.", 0x0A, 0x0D, 0
DISK_READ_MESSAGE:  db "BOOT: Disk read completed.", 0x0A, 0x0D, 0
;.......................................................................
;-----------------------------------------------------------------------
; Pad boot sector to 510 bytes and add 2 byte boot signature for
; 512 total bytes
;-----------------------------------------------------------------------
TIMES       510-($-$$)  db  0
                        dw  0xaa55
;***********************************************************************
;//EOF
;***********************************************************************
