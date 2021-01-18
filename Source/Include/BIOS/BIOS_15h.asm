;***********************************************************************
; BIOS interrupt call '15h'
; Resource: https://en.wikipedia.org/wiki/BIOS_interrupt_call
;***********************************************************************
BIOS_15h:
        ret
;=======================================================================
; Function:     AH=00h      ; (IBM PC/PCjr only)
;
; Parameters:   Not applicable.
;
; Return:       Not applicable.
;
;=======================================================================
        .Turn.On.Cassette.Drive.Motor:
                mov     ah, 00h
                jmp     .Interrupt
;=======================================================================
; Function:     AH=01h      ; (IBM PC/PCjr only)
;
; Parameters:   Not applicable.
;
; Return:       Not applicable.
;
;=======================================================================
        .Turn.Off.Cassette.Drive.Motor:
                mov     ah, 01h
                jmp     .Interrupt
;=======================================================================
; Function:     AH=02h      ; (IBM PC/PCjr only)
;
; Parameters:   Not applicable.
;
; Return:       Not applicable.
;
;=======================================================================
        .Read.Data.Blocks.From.Cassette:
                mov     ah, 02h
                jmp     .Interrupt
;=======================================================================
; Function:     AH=03h      ; (IBM PC/PCjr only)
;
; Parameters:   Not applicable.
;
; Return:       Not applicable.
;
;=======================================================================
        .Write.Data.Blocks.To.Cassette:
                mov     ah, 03h
                jmp     .Interrupt
;=======================================================================
; Function:     AH=4Fh
;
; Parameters:   Not applicable.
;
; Return:       Not applicable.
;
;=======================================================================
        .Keyboard.Intercept:
                mov     ah, 4Fh
                jmp     .Interrupt
;=======================================================================
; Function:     AH=83h
;
; Parameters:   Not applicable.
;
; Return:       Not applicable.
;
;=======================================================================
        .Event.Wait:
                mov     ah, 83h
                jmp     .Interrupt
;=======================================================================
; Function:     AH=84h      ; BIOSes from 1986 onward
;
; Parameters:   Not applicable.
;
; Return:       Not applicable.
;
;=======================================================================
        .Read.Joystick:
                mov     ah, 84h
                jmp     .Interrupt
;=======================================================================
; Function:     AH=85h
;
; Parameters:   Not applicable.
;
; Return:       Not applicable.
;
;=======================================================================
        .Sysreq.Key.Callout:
                mov     ah, 85h
                jmp     .Interrupt
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
; Function:     AH=87h
;
; Parameters:   Not applicable.
;
; Return:       Not applicable.
;
;=======================================================================
        .Move.Block:
                mov     ah, 87h
                jmp     .Interrupt
;=======================================================================
; Function:     AH=88h
;
; Parameters:   Not applicable.
;
; Return:       Not applicable.
;
;=======================================================================
        .Get.Extended.Memory.Size:
                mov     ah, 88h
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
; Function:     AH=C0h
;
; Parameters:   Not applicable.
;
; Return:       Not applicable.
;
;=======================================================================
        .Get.System.Parameters:
                mov     ah, 0C0h
                jmp     .Interrupt
;=======================================================================
; Function:     AH=C1h
;
; Parameters:   Not applicable.
;
; Return:       Not applicable.
;
;=======================================================================
        .Get.Extended.BIOS.Data.Area.Segment:
                mov     ah, 0C1h
                jmp     .Interrupt
;=======================================================================
; Function:     AH=C2h
;
; Parameters:   Not applicable.
;
; Return:       Not applicable.
;
;=======================================================================
        .Pointing.Device.Functions:
                mov     ah, 0C2h
                jmp     .Interrupt
;=======================================================================
; Function:     AH=C3h      ; PS/2 systems only
;
; Parameters:   Not applicable.
;
; Return:       Not applicable.
;
;=======================================================================
        .Watchdog.Timer.Functions:
                mov     ah, 0C3h
                jmp     .Interrupt
;=======================================================================
; Function:     AH=C4h      ; MCA bus PS/2 systems only
;
; Parameters:   Not applicable.
;
; Return:       Not applicable.
;
;=======================================================================
        .Programmable.Option.Select:
                mov     ah, 0C4h
                jmp     .Interrupt
;=======================================================================
; Function:     AH=D8h      ; EISA bus systems only
;
; Parameters:   Not applicable.
;
; Return:       Not applicable.
;
;=======================================================================
        .EISA.System.Functions:
                mov     ah, 0D8h
                jmp     .Interrupt
;=======================================================================
; Function:     AH=E8h      ; Newer function, since 1994. Gives results
;                                          for memory size above 64 Mb.
;               AL=01h
;
; Parameters:   Not applicable.
;
; Return:       Not applicable.
;
;=======================================================================
        .Get.Extended.Memory.Size.1994:
                mov     ah, 0E8h
                mov     al, 01h
                jmp     .Interrupt
;=======================================================================
; Function:     AH=E8h      ; The information returned from E820
;                             supersedes what is returned from the older
;               AL=20h                   AX=E801h and AH=88h interfaces.
;
; Parameters:   Not applicable.
;
; Return:       Not applicable.
;
;=======================================================================
        .Query.System.Address.Map:
                mov     ah, 0E8h
                mov     al, 20h
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
