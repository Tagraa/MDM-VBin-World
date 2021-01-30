;***********************************************************************
; BIOS interrupt call '13h'
; Resource: https://en.wikipedia.org/wiki/BIOS_interrupt_call
;***********************************************************************
BIOS_13h:
        ret
    .Interrupt:
        int     13h
        ret
    .Sectors.Read:
        mov     ah, 02h
        jmp     .Interrupt
;***********************************************************************
Disk:
        ret
    .Load:
        push    ax
        push    cx
        push    dx
        mov     dl, byte [__boot_device__]
        mov     al, byte [__sectors__]
        mov     ch, byte [__cylinder__]
        mov     dh, byte [__head__]
        mov     cl, byte [__starting_sector__]
        call    BIOS_13h.Sectors.Read
        jc      .Error
        cmp     byte [__sectors__], al
        jne     .Error
        jmp     .Finally
    .Error.Code:        db 0
        ret
    .Error:
        mov     byte [.Error.Code], 1
    .Finally:
        pop     dx
        pop     cx
        pop     ax
        ret

;.......................................................................
__boot_device__:        db 0
__cylinder__:           db 0
__head__:               db 0
__sectors__:            db 0
__starting_sector__:    db 0
;.......................................................................
;***********************************************************************
;//EOF
