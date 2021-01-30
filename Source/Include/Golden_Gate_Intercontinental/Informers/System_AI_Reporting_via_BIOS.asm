;***********************************************************************
System.AI.Reporting.via.BIOS:
    call    Display.Cursor.Position.Read
    mov     byte [__ascii_color__], VERSATILE_LIGHT_CYAN
    push    cx
    mov     cx, word [__AI__Length]
    mov     word [__count__], cx
    pop     cx
    mov     bp, __AI__
    call    Display.String
    ret
;***********************************************************************
;//EOF
