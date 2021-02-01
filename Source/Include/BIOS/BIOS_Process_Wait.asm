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
;***********************************************************************
Process:
        ret
    .Wait.A.Second:
        push    ax
        push    cx
        push    dx
        mov     cx, 0Fh         ; --|
        mov     dx, 4240h       ; --|-> 1000000
        call    BIOS_15h.Wait
        pop     dx
        pop     cx
        pop     ax
        ret
    .Wait.For.Seconds:
        call    Process.Wait.A.Second
        dec     word [__wait_seconds__]
        cmp     word [__wait_seconds__], 0
        jne     .Wait.For.Seconds
        ret
;.......................................................................
__wait_seconds__:       dw 1
;.......................................................................
;***********************************************************************
;//EOF
