;***********************************************************************
; Application Programming Interface (API)
;***********************************************************************
;=======================================================================
; Single character
;=======================================================================
Display.ASCII:
    mov     ah, 0x0E
    int     0x10
    ret
;-----------------------------------------------------------------------
Display.New.Line:
    push    ax
    mov     al, 10
    call    Display.ASCII
    mov     al, 13
    call    Display.ASCII
    pop     ax
    ret
;=======================================================================
; Null Terminated String
;=======================================================================
Display.String:
    push    ax
    mov     ah, 0x0E
    .Repeat:
        lodsb
        cmp     al, 0x00
        je      .Return
        int     0x10
        jmp     .Repeat
    .Return:
    pop     ax
    ret
;=======================================================================
; [Get, Set] System Variable >  __digit__ = Decimal.Digit
;=======================================================================
Decimal.Digit:      db  0
    .Set:
        cmp     byte [Decimal.Digit], 9
        ja      .Error
        push    cx
        xor     cx, cx
        mov     cl, byte [Decimal.Digit]
        mov     byte [__digit__], cl
        pop     cx
        ret
    .Get:
        push    cx
        xor     cx, cx
        mov     cl, byte [__digit__]
        mov     byte [Decimal.Digit], cl
        pop     cx
        ret
    .Error:
        mov     byte [__digit__], cl
        mov     byte [__message_type__], 1     ; Message Type
        mov     word [__message_code__], 0       ; Error Code
        mov     word [__api_code__], 0         ; API16 Code
        mov     word [__file_code__], 0        ; File Code
        mov     word [__line_number__], 39     ; Line number
        call    System.AI
        mov     byte [Decimal.Digit], 0
        call    .Set
        ret
;-----------------------------------------------------------------------
Display.Decimal.Digit:
    push    ax
    xor     ax, ax
    call    Decimal.Digit.Get
    mov     al, byte [Decimal.Digit]
    add     al, '0'
    call    Display.ASCII
    pop     ax
    ret
;=======================================================================
; [Get, Set] System Variable >  __byte__ = Decimal.Byte
;=======================================================================
Decimal.Byte:      db  0
    .Set:
        push    cx
        xor     cx, cx
        mov     cl, byte [Decimal.Byte]
        mov     byte [__byte__], cl
        pop     cx
        ret
    .Get:
        push    cx
        xor     cx, cx
        mov     cl, byte [__byte__]
        mov     byte [Decimal.Byte], cl
        pop     cx
        ret
;-----------------------------------------------------------------------
Display.Decimal.Byte:
        push    ax
        push    cx
        xor     ax, ax
        call    Decimal.Byte.Get
        mov     al, byte [Decimal.Byte]
        xor     cx, cx
        ; Detect Octal
        cmp     bl, 8
        je      .Process
        ; Detect Hexadecimal
        cmp     bl, 16
        je      .Process
        ; Otherwise Decimal
        push    bx
        xor     bx, bx
        mov     bl, 10
    .Process:
        mov     ah, 0
        div     bl
        push    ax
        inc     cl
        test    al, al
        jnz     .Process
        ; Detect Hexadecimal
        cmp     bl, 16
        je      .Restore.Hexadecimal
    .Restore:
        dec     cl
        pop     ax
        mov     byte [Decimal.Digit], ah
        call    Decimal.Digit.Set
        call    Display.Decimal.Digit
        test    cl, cl
        jnz     .Restore
        jmp     .Finish
    .Restore.Hexadecimal:
        dec     cl
        pop     ax
        cmp     ah, 9
        ja      .Extended_part
        mov     byte [Decimal.Digit], ah
        call    Decimal.Digit.Set
        call    Display.Decimal.Digit
        jmp     .Avoid_Extended_Part
    .Extended_part:
        mov     al, ah
        sub     al, 10
        add     al, 'A'
        call    Display.ASCII
    .Avoid_Extended_Part:
        test    cl, cl
        jnz     .Restore.Hexadecimal
        ; Detect Octal
        cmp     bl, 8
        je      Display.Decimal.Byte.Octal.Finish
        ; Detect Hexadecimal
        cmp     bx, 16
        je      Display.Decimal.Byte.Hexadecimal.Finish
        ; Otherwise finish here
    .Finish:
        pop     bx
        pop     cx
        pop     ax
        ret
;-----------------------------------------------------------------------
Display.Decimal.Byte.Octal:
        push    bx
        xor     bx, bx
        mov     bl, 8
        jmp     Display.Decimal.Byte
    .Finish:
        pop     cx
        pop     ax
        pop     bx
        ret
;-----------------------------------------------------------------------
Display.Decimal.Byte.Hexadecimal:
        push    bx
        xor     bx, bx
        mov     bl, 16
        jmp     Display.Decimal.Byte
    .Finish:
        pop     cx
        pop     ax
        pop     bx
        ret
;=======================================================================
; [Get, Set] System Variable >  __word__ = Decimal.Word
;=======================================================================
Decimal.Word:   dw  0
    .Set:
        push    cx
        mov     cx, word [Decimal.Word]
        mov     word [__word__], cx
        pop     cx
        ret
    .Get:
        push    cx
        mov     cx, word [__word__]
        mov     word [Decimal.Word], cx
        pop     cx
        ret
;-----------------------------------------------------------------------
Display.Decimal.Word:
        push    ax
        push    cx
        push    dx
        call    Decimal.Word.Get
        mov     ax, word [Decimal.Word]
        xor     cx, cx
        ; Detect Octal
        cmp     bx, 8
        je      .Process
        ; Detect Hexadecimal
        cmp     bx, 16
        je      .Process
        ; Otherwise Decimal
        push    bx
        mov     bx, 10
    .Process:
        mov     dx, 0
        div     bx
        push    dx
        inc     cl
        test    ax, ax
        jnz     .Process
        ; Detect Hexadecimal
        cmp     bx, 16
        je      .Restore.Hexadecimal
    .Restore:
        dec     cl
        pop     dx
        mov     byte [Decimal.Digit], dl
        call    Decimal.Digit.Set
        call    Display.Decimal.Digit
        test    cl, cl
        jnz     .Restore
        jmp     .Finish
    .Restore.Hexadecimal:
        dec     cl
        pop     dx
        cmp     dl, 9
        ja      .Extended_part
        mov     byte [Decimal.Digit], dl
        call    Decimal.Digit.Set
        call    Display.Decimal.Digit
        jmp     .Avoid_Extended_Part
    .Extended_part:
        mov     al, dl
        sub     al, 10
        add     al, 'A'
        call    Display.ASCII
    .Avoid_Extended_Part:
        test    cl, cl
        jnz     .Restore.Hexadecimal
        ; Detect Octal
        cmp     bx, 8
        je      Display.Decimal.Word.Octal.Finish
        ; Detect Hexadecimal
        cmp     bx, 16
        je      Display.Decimal.Word.Hexadecimal.Finish
        ; Otherwise finish here
    .Finish:
        pop     bx
        pop     dx
        pop     cx
        pop     ax
        ret
;-----------------------------------------------------------------------
Display.Decimal.Word.Octal:
        push    bx
        xor     bx, bx
        mov     bx, 8
        jmp     Display.Decimal.Word
    .Finish:
        pop     dx
        pop     cx
        pop     ax
        pop     bx
        ret
;-----------------------------------------------------------------------
Display.Decimal.Word.Hexadecimal:
        push    bx
        xor     bx, bx
        mov     bx, 16
        jmp     Display.Decimal.Word
    .Finish:
        pop     dx
        pop     cx
        pop     ax
        pop     bx
        ret
;=======================================================================
; Function:     'Call    Display.Video.Mode.Change'
;
; Parameters:
;       __video_mode__ = Video mode.
;
; Return:
;       __video_mode_flag__ = Video mode flag / CRT controller mode byte
;=======================================================================
Display.Video.Mode.Change:
    push    ax
    xor     ax, ax
    mov     al, byte [__video_mode__]
    call    BIOS_10h.Set.Current.Video.Mode
    mov     byte [__video_mode_flag__], al
    pop     ax
    ret
;=======================================================================
; Function:     'call   Display.Video.Mode.Check'
;
; Parameters:   Not applicable.
;
; Return:
;       __video_mode__  = Video Mode
;       __max_columns__ = number of character columns
;       __active_page__ = active page
;=======================================================================
Display.Video.Mode.Check:
    push    ax
    push    bx
    call    BIOS_10h.Get.Current.Video.Mode
    mov     byte [__max_columns__], ah
    mov     ah, 0
    mov     byte [__video_mode__], al
    mov     byte [__active_page__], bh
    pop     bx
    pop     ax
    ret
;=======================================================================
; Function:     'call   Display.Video.Mode.Reset'
;
; Parameters:   Not applicable.
;
; Return:       Not applicable.
;
;=======================================================================
Display.Video.Mode.Reset:
    push    ax
    push    bx
    xor     ax, ax
    mov     al, byte [__video_mode__]
    call    Display.Video.Mode.Change
    mov     byte [__video_mode_flag__], al
    call    Display.Video.Mode.Check
    mov     bl, [__background_color__]
    call    Display.Background.Color
    pop     bx
    pop     ax
    ret
;=======================================================================
; Function:     'call   Display.Background.Color'
;
; Parameters:
;       __background_color__ = Background/Border color
;                              (Border only in text modes)
;
; Return:       Not applicable.
;
;=======================================================================
Display.Background.Color:
    push    bx
    mov     bl, byte [__background_color__]
    call    BIOS_10h.Set.Background.Or.Border.Color
    pop     bx
    ret
;=======================================================================
; Function:     'call   Display.Cursor.Shape.Custom'
;
; Parameters:
;       __cursor_shape__ = value from 0007h to 0607h
;
; Return:       Not applicable.
;
;=======================================================================
Display.Cursor.Shape.Custom:
    push    cx
    mov     cx, word [__cursor_shape__]
    call    BIOS_10h.Set.Cursor.Shape
    pop     cx
    ret
;-----------------------------------------------------------------------
Display.Cursor.Shape.FullBlock:
    push    cx
    mov     word [__cursor_shape__], 0007h
    mov     cx, word [__cursor_shape__]
    call    BIOS_10h.Set.Cursor.Shape
    pop     cx
    ret
;-----------------------------------------------------------------------
Display.Cursor.Shape.Normal:
    push    cx
    mov     word [__cursor_shape__], 0607h
    mov     cx, word [__cursor_shape__]
    call    BIOS_10h.Set.Cursor.Shape
    pop     cx
    ret
;-----------------------------------------------------------------------
Display.Cursor.Hide:
    push    cx
    mov     word [__cursor_shape__], 2607h
    mov     cx, word [__cursor_shape__]
    call    BIOS_10h.Set.Cursor.Shape
    pop     cx
    ret
;=======================================================================
; Function:     'call   Display.Cursor.Position.Move'
;
; Parameters:
;       __active_page__    = Page Number
;       __current_row__    = Row
;       __current_column__ = Column
;
; Return:       Not applicable.
;
;=======================================================================
Display.Cursor.Position.Move:
    push    bx
    push    dx
    mov     bh, byte [__active_page__]
    mov     dh, byte [__current_row__]
    mov     dl, byte [__current_column__]
    call    BIOS_10h.Set.Cursor.Position
    pop     dx
    pop     bx
    ret
;=======================================================================
; Function:     'call   Display.Cursor.Position.Read'
;
; Parameters:
;       __active_page__ = Page Number
;
; Return:
;       AX = 0      ; Result: 776688 ?
;       __cursor_shape__ = Start scan line to End scan line
;       __current_row__ = Row
;       __current_column__ = Column
;
;=======================================================================
Display.Cursor.Position.Read:
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
;=======================================================================
; Function:     'call   Display.Page.Move'
;
; Parameters:
;      __active_page__ = Page Number
;
; Return:       Not applicable.
;
;=======================================================================
Display.Page.Move:
    push    ax
    xor     ax, ax
    mov     al, byte [__active_page__]
    call    BIOS_10h.Select.Active.Display.Page
    pop     ax
    ret
;=======================================================================
; Function:     'call   Display.Page.Scroll.Up'
;           and 'call   Display.Page.Scroll.Down'
;
; Parameters:
;       AL = lines to scroll (0 = clear, CH, CL, DH, DL are used),
;       BH = Background Color and Foreground color.
;            BH = 43h, means that background color is red and foreground
;            color is cyan. Refer the 'BIOS.Color.Attributes'.
;       CH = Upper row number.
;       CL = Left column number.
;       DH = Lower row number.
;       DL = Right column number.
;
; Return:       Not applicable.
;=======================================================================
Display.Page.Scroll.Up:
    ret
Display.Page.Scroll.Down:
    ret
;=======================================================================
; Function:     'call   Display.Color.Character.Read'
;
; Parameters:
;       __active_page__ = Page Number
;
; Return:
;       __color__ = Color
;       __character__ = Character
;
;=======================================================================
Display.Color.Character.Read:
    push    ax
    push    bx
    xor     bx, bx
    mov     bh, byte [__active_page__]
    call    BIOS_10h.Read.Character.And.Attribute.At.Cursor.Position
    mov     byte [__ascii_color__], ah
    mov     byte [__ascii__], al
    pop     bx
    pop     ax
    ret
;=======================================================================
; Function:     'call   Display.Color.Character.Write'
;
; Parameters:
;       __ascii__       = Character
;       __active_page__ = Page Number
;       __ascii_color__ = Color
;       __count__       = Number of times to print character
;
; Return:       Not applicable.
;
;=======================================================================
Display.Color.Character.Write:
    push    ax
    push    bx
    push    cx
    mov     cx, word [__count__]
    mov     bh, byte [__active_page__]
    mov     bl, byte [__ascii_color__]
    xor     ax, ax
    mov     al, byte [__ascii__]
    call    BIOS_10h.Write.Character.And.Attribute.At.Cursor.Position
    pop     cx
    pop     bx
    pop     ax
    ret
;=======================================================================
; Function:     'call   Display.Character.Write'
;
; Parameters:
;       __ascii__        = Character
;       __active_page__  = Page Number
;       __count__        = Number of times to print character
;
; Return:       Not applicable.
;
;=======================================================================
Display.Character.Write:
    push    ax
    push    bx
    push    cx
    mov     cx, word [__count__]
    xor     bx, bx
    mov     bh, byte [__active_page__]
    xor     ax, ax
    mov     al, byte [__ascii__]
    call    BIOS_10h.Write.Character.Only.At.Cursor.Position
    pop     cx
    pop     bx
    pop     ax
    ret
;=======================================================================
; Function:     'call   Display.Palette.Change'
;
; Parameters:
;       BL = Palette ID (was only valid in CGA, but newer cards support
;            it in many or all graphics modes)
;
; Return:       Not applicable.
;
;=======================================================================
Display.Palette.Change:  ; ?
    ;call    BIOS_10h.Set.Palette
    ret
;=======================================================================
; Function:      'call   Display.Graphics.Pixel.Write'
;
; Parameters:
;       AL = Color
;       BH = Page Number
;       CX = x
;       DX = y
;
; Return:       Not applicable.
;
;=======================================================================
Display.Graphics.Pixel.Write:
    ;call    BIOS_10h.Write.Graphics.Pixel:
    ret
;=======================================================================
; Function:     'call   Display.Graphics.Pixel.Read'
;
; Parameters:
;       BH = Page Number
;       CX = x
;       DX = y
;
; Return:
;       AL = Color
;
;=======================================================================
Display.Graphics.Pixel.Read:
    ;call    BIOS_10h.Read.Graphics.Pixel:
    ret
;=======================================================================
; Function:     'call   Display.Teletype.Output'
;
; Parameters:
;       AL = Character
;       BH = Page Number
;       BL = Color (only in graphic mode)
;
; Return:       Not applicable.
;
;=======================================================================
Display.Teletype.Output:
    ;call    BIOS_10h.Teletype.Output:
    ret
;=======================================================================
; Function:     'call   Display.CharacterSet.Change'
;
; Parameters:
;       BH = Number of bytes per character
;       CX = Number of characters to change
;       DX = Starting character to change
;       ES:BP = Offset of character data
;
; Return:       Not applicable.
;
;=======================================================================
Display.CharacterSet.Change:
    ;call    BIOS_10h.Change.Text.Mode.Character.Set
    ret
;=======================================================================
; Function:     'call   Display.Write.String'
;
; Parameters:
;       AL = Write mode: 1 - character only and cursor moved.
;       __active_page__    = Page Number
;       __ascii_color__    = Color
;       __count__          = Number of characters in string
;       __current_row__    = Row
;       __current_column__ = Column
;       BP = Offset of string
;
; Return:       Not applicable.
;
;=======================================================================
Display.Write.String:          ; (EGA+, meaning PC AT minimum)
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
;=======================================================================
; Function:     'call   Display.Intensity'
;
; Parameters:   Not applicable.
;
; Return:       Not applicable.
;
;=======================================================================
Display.Intensity:                          ; Enable intensive colors.
    mov     bl, 0
    mov     bh, 0
    call    BIOS_10h.Toggle.Intensity.Or.Blinking
    ret
;=======================================================================
; Function:     'call   Display.Blinking'
;
; Parameters:   Not applicable.
;
; Return:       Not applicable.
;
;=======================================================================
Display.Blinking:                           ; Enable blinking
    mov     bl, 1
    mov     bh, 0
    call    BIOS_10h.Toggle.Intensity.Or.Blinking
    ret
;=======================================================================
; Function:     'call   VESA.Video.Mode.Change'
;
; Parameters:
;       BX = video mode, if Sign bit (bit 15) set, video memory will not
;            be refreshed.
;
; Return:       Not applicable.
;
;=======================================================================
VESA.Video.Mode.Change:
    ;call    BIOS_10h.Set.VESA_Compliant.Video.Modes
    ret
;***********************************************************************
;=======================================================================
; Resource: https://vitaly_filatov.tripod.com/ng/asm/asm_026.13.html
;
; Function:     'call   Process.Sleep'
;
; Parameters:
;       CX = 15     ; 1 second wait
;
; Return:
;       CF = set on error or AH=83h wait already in progress
;          = clear if successful (wait interval elapsed)
;       AH = status; 80h for PC and PCjr
;          = 86h for XT
;
;=======================================================================
Process.Sleep:
    push    ax
    push    dx
    push    cx
    mov     cx, 15
    mov     dx, 8480h
    call    BIOS_15h.Wait
    pop     cx
    pop     dx
    pop     ax
    ret
;***********************************************************************
;//EOF
