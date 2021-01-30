;***********************************************************************
; BIOS interrupt call '10h'
; Resource: https://en.wikipedia.org/wiki/INT_10H
;***********************************************************************
BIOS_10h:
        ret
    .Interrupt:
        int     0x10
        ret
    .Teletype.Output:
        mov     ah, 0Eh
        jmp     .Interrupt
    .Write.String:              ; (EGA+, meaning PC AT minimum)
        mov     ah, 13h
        jmp     .Interrupt
    .Get.Cursor.Position.And.Shape:
        mov     ah, 03h
        jmp     .Interrupt
    .Set.Cursor.Position:
        mov     ah, 02h
        jmp     .Interrupt
;***********************************************************************
Display:
    ret
;-----------------------------------------------------------------------
    .String:
        push    ax
        push    bx
        push    cx
        push    dx
        xor     ax, ax
        mov     es, ax
        mov     al, 1
        mov     bh, byte [__active_page__]
        mov     bl, byte [__ascii_color__]
        mov     cx, word [__count__]
        mov     dh, byte [__current_row__]
        mov     dl, byte [__current_column__]
        call    BIOS_10h.Write.String
        pop     dx
        pop     cx
        pop     bx
        pop     ax
        ret
;-----------------------------------------------------------------------
    .String.Teletype:
            push    ax
        ._Repeat:
            lodsb
            test    al, al
            je      .Done
            call    BIOS_10h.Teletype.Output
            loop    ._Repeat
        .Done:
            pop     ax
            ret
;-----------------------------------------------------------------------
Display.Cursor.Position:
    .Read:
        push    bx
        push    cx
        push    dx
        xor     bx, bx
        mov     bh, byte [__active_page__]
        call    BIOS_10h.Get.Cursor.Position.And.Shape
        mov     word [__cursor_shape__], cx
        mov     byte [__current_row__], dh
        mov     byte [__current_column__], dl
        pop     dx
        pop     cx
        pop     bx
        ret
;-----------------------------------------------------------------------
    .Move:
        push    bx
        push    dx
        mov     bh, byte [__active_page__]
        mov     dh, byte [__current_row__]
        mov     dl, byte [__current_column__]
        call    BIOS_10h.Set.Cursor.Position
        pop     dx
        pop     bx
        ret
;-----------------------------------------------------------------------
;.......................................................................
__active_page__:            db 0
__ascii_color__:            db 0
__count__:                  dw 0
__current_row__:            db 0
__current_column__:         db 0
__cursor_shape__:           dw 0607h
;.......................................................................
;***********************************************************************
;//EOF
