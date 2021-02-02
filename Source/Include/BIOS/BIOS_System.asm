;***********************************************************************
; BIOS interrupt call '15h'
; Resource: https://en.wikipedia.org/wiki/BIOS_interrupt_call
;***********************************************************************
BIOS_15h:
        ret
    .Interrupt:
        int     15h
        ret
    .Wait:
        mov     ah, 86h
        jmp     .Interrupt
    .Check.APM.Service.Is.Present:
        mov     ax, 5300h
        xor     bx, bx
        jmp     .Interrupt
    .Connect.RM.Interface:
        mov     ax, 5301h
        xor     bx, bx
        jmp     .Interrupt
    .Switch.To.Protected.Mode:
        mov     ah, 89h
        jmp     .Interrupt
    .Switch.To.APM:
        mov     ax, 530eh
        xor     bx, bx
        mov     cx, 0101h
        jmp     .Interrupt
    .Enable.APM:
        mov     ax, 5308h
        mov     bx, 01h
        mov     cx, 01h
        jmp     .Interrupt
    .Engage.APM:
        mov     ax, 530Fh
        mov     bx, 01h
        mov     cx, 01h
        jmp     .Interrupt
    .Turn.Off.System:
        mov     ax, 5307h
        mov     cx, 0003h
        mov     bx, 0001h
        jmp     .Interrupt
;***********************************************************************
System.Process.Wait:
        ret
    .A.Second:
        push    ax
        push    cx
        push    dx
        mov     cx, 0Fh         ; --|
        mov     dx, 4240h       ; __|-> 1000000
        call    BIOS_15h.Wait
        pop     dx
        pop     cx
        pop     ax
        ret
    .For.Seconds:
        call    .A.Second
        dec     word [__wait_seconds__]
        cmp     word [__wait_seconds__], 0
        jne     .For.Seconds
        ret
;=======================================================================
System.Turn.Off:
        mov     byte [__error__], 'A'
        call    BIOS_15h.Check.APM.Service.Is.Present
        jc      .Err
        inc     byte [__error__]
        cmp     bx, 504dh
        jne     .Err
;.......................................................................
        inc     byte [__error__]
        call    BIOS_15h.Connect.RM.Interface
        jc      .Err
;.......................................................................
        inc     byte [__error__]
        call    BIOS_15h.Switch.To.APM           ; APM 1.1+
        jc      .Err
        inc     byte [__error__]
        cmp     al, 01h
        jb      .Err
;.......................................................................
        inc     byte [__error__]
        call    BIOS_15h.Enable.APM
        jc      .Err
;.......................................................................
        inc     byte [__error__]
        call    BIOS_15h.Engage.APM
        jc      .Err
;.......................................................................
        inc     byte [__error__]
        call    BIOS_15h.Turn.Off.System
        jc      .Err
;.......................................................................
        jmp     .End
;.......................................................................
    .Err:
        xor     di, di
        mov     ah, 09h
        mov     al, byte [__error__]
        stosw
;.......................................................................
    .End:
        cli
        hlt
        ret
;***********************************************************************
;.......................................................................
__error__:              db 0
__wait_seconds__:       dw 1
;.......................................................................
;***********************************************************************
;//EOF
