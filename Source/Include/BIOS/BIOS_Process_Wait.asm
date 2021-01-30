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
Wait.A.Second:
        mov     word [__Wait__], 15
        call    Process.Wait
        ret
Process:
        ret
    .Wait:
        push    ax
        push    cx
        push    dx
        mov     cx, word [__Wait__]
        mov     dx, 8480h
        call    BIOS_15h.Wait
        pop     dx
        pop     cx
        pop     ax
        ret
;.......................................................................
__Wait__:            dw 15
;.......................................................................
;***********************************************************************
;//EOF
