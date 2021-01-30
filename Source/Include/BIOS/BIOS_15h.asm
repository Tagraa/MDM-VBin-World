;***********************************************************************
; BIOS interrupt call '15h'
; Resource: https://en.wikipedia.org/wiki/BIOS_interrupt_call
;***********************************************************************
BIOS_15h:
        ret
;=======================================================================
; Resource: http://www.ctyme.com/intr/rb-1525.htm
;           https://vitaly_filatov.tripod.com/ng/asm/asm_026.13.html
;
; Function:     AH=86h
;
; Parameters:
;       CX:DX = number of microseconds to wait (976 æs resolution)
;
; Return:
;       CF = set on error or AH=83h wait already in progress
;          = clear if successful (wait interval elapsed)
;       AH = status; 80h for PC and PCjr
;          = 86h for XT
;
;=======================================================================
        .Wait:
                mov     ah, 86h
                jmp     .Interrupt
;=======================================================================
; Function:     AH=89h
;
; Parameters:   Not applicable.
;
; Return:       Not applicable.
;
;=======================================================================
        .Switch.To.Protected.Mode:
                mov     ah, 89h
                jmp     .Interrupt
;=======================================================================
; Function:     AX=5300h
;
; Parameters:   Not applicable.
;
; Return:       Not applicable.
;
;=======================================================================
        .Check.APM.Service.Is.Present:
                mov     ax, 5300h
                xor     bx, bx
                jmp     .Interrupt
;=======================================================================
; Function:     AX=5301h        ; Compatibility mode APM 1.0
;
; Parameters:   Not applicable.
;
; Return:       Not applicable.
;
;=======================================================================
        .Connect.RM.Interface:
                mov     ax, 5301h
                xor     bx, bx
                jmp     .Interrupt
;=======================================================================
; Function:     AX=530eh        ; Switch to APM 1.1+
;               CX=0101h
;
; Parameters:   Not applicable.
;
; Return:       Not applicable.
;
;=======================================================================
        .Switch.To.APM:
                mov     ax, 530eh
                xor     bx, bx
                mov     cx, 0101h
                jmp     .Interrupt
;=======================================================================
; Function:     AX=5308h
;
; Parameters:
;               BX=01h
;               CX=01h
;
; Return:       Not applicable.
;
;=======================================================================
        .Enable.APM:
                mov     ax, 5308h
                mov     bx, 01h
                mov     cx, 01h
                jmp     .Interrupt
;=======================================================================
; Function:     AX=530Fh
;
; Parameters:
;               BX=01h
;               CX=01h
;
; Return:       Not applicable.
;
;=======================================================================
        .Engage.APM:
                mov     ax, 530Fh
                mov     bx, 01h
                mov     cx, 01h
                jmp     .Interrupt
;=======================================================================
; Function:     AX = 5307h      ; Advanced Power Management v1.2
;               CX = 0003h
;
; Parameters:
;               BX = 0001h (device ID for all power-managed devices)
;
; Return:
;               CF = Clear after system is resumed
;
;=======================================================================
        .Turn.Off.System:
                mov     ax, 5307h
                mov     cx, 0003h
                mov     bx, 0001h
                jmp     .Interrupt
;-----------------------------------------------------------------------
;-----------------------------------------------------------------------
        .Interrupt:
                int     15h
                ret
;-----------------------------------------------------------------------
;-----------------------------------------------------------------------
;=======================================================================
; Function:     AH=??h
;
; Parameters:   Not applicable.
;
; Return:       Not applicable.
;
;=======================================================================
;***********************************************************************
;//EOF
