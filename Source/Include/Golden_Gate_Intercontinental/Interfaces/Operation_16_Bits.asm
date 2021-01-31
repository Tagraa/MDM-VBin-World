;  API_16.asm
;
;  Copyright 2021 Saurav Roy (TagRaa) <xp.saurav@yahoo.in>
;
;  This program is free software; you can redistribute it and/or modify
;  it under the terms of the GNU General Public License as published by
;  the Free Software Foundation; either version 2 of the License, or
;  (at your option) any later version.
;
;  This program is distributed in the hope that it will be useful,
;  but WITHOUT ANY WARRANTY; without even the implied warranty of
;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;  GNU General Public License for more details.
;
;  You should have received a copy of the GNU General Public License
;  along with this program; if not, write to the Free Software
;  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
;  MA 02110-1301, USA.
;
;#######################################################################
; Operation 16 Bits
;#######################################################################
;***********************************************************************
; Arithmetic Operations
;***********************************************************************

;=======================================================================
; Decimal Addition
;=======================================================================
;-----------------------------------------------------------------------
; Addition between byte sized decimal values
;-----------------------------------------------------------------------
Decimal.Byte.Plus:     db  0
    ret
    .Result:
        push    ax
        xor     ax, ax
        mov     al, byte [Decimal.Byte]
        add     al, byte [Decimal.Byte.Plus]
        mov     [__result__], al
        pop     ax
        ret
;-----------------------------------------------------------------------
; Addition between word sized decimal values
;-----------------------------------------------------------------------
Decimal.Word.Plus:     dw  0
    ret
    .Result:
        push    ax
        xor     ax, ax
        mov     ax, word [Decimal.Word]
        add     ax, word [Decimal.Word.Plus]
        mov     [__result__], ax
        pop     ax
        ret
;=======================================================================
; Decimal Subtraction
;=======================================================================
;-----------------------------------------------------------------------
; Subtraction between byte sized decimal values
;-----------------------------------------------------------------------
Decimal.Byte.Minus:     db  0
    ret
    .Result:
        push    ax
        xor     ax, ax
        mov     al, byte [Decimal.Byte]
        sub     al, byte [Decimal.Byte.Minus]
        mov     [__result__], al
        pop     ax
        ret
;-----------------------------------------------------------------------
; Subtraction between word sized decimal values
;-----------------------------------------------------------------------
Decimal.Word.Minus:     dw  0
    ret
    .Result:
        push    ax
        xor     ax, ax
        mov     ax, word [Decimal.Word]
        sub     ax, word [Decimal.Word.Minus]
        mov     [__result__], ax
        pop     ax
        ret
;=======================================================================
; Decimal Multiplication
;=======================================================================
;-----------------------------------------------------------------------
; Multiplication between byte sized decimal values
;-----------------------------------------------------------------------
Decimal.Byte.Multiply:     db  0
    ret
    .Result:
        push    ax
        xor     ax, ax
        mov     al, byte [Decimal.Byte]
        mul     byte [Decimal.Byte.Multiply]
        mov     [__result__], ax
        pop     ax
        ret
;-----------------------------------------------------------------------
; Multiplication between word sized decimal values
;-----------------------------------------------------------------------
Decimal.Word.Multiply:     dw  0
    ret
    .Result:
        push    ax
        push    dx
        xor     ax, ax
        xor     dx, dx
        mov     ax, word [Decimal.Word]
        mul     word [Decimal.Word.Multiply]
        mov     [__result__], ax
        mov     [__result__+2], dx
        pop     dx
        pop     ax
        ret
;=======================================================================
; Decimal Division
;=======================================================================
;-----------------------------------------------------------------------
; Division between byte sized decimal values
;-----------------------------------------------------------------------
Decimal.Byte.Divide:     db  0
    ret
    .Result:
        push    ax
        xor     ax, ax
        mov     al, byte [Decimal.Byte]
        div     byte [Decimal.Byte.Divide]
        mov     [__result__], ax
        pop     ax
        ret
;-----------------------------------------------------------------------
; Division between word sized decimal values
;-----------------------------------------------------------------------
Decimal.Word.Divide:     dw  0
    ret
    .Result:
        push    ax
        push    dx
        xor     dx, dx
        mov     ax, word [Decimal.Word]
        div     word [Decimal.Word.Divide]
        mov     [__result__], ax
        mov     [__result__+2], dx
        pop     dx
        pop     ax
        ret
;=======================================================================
; Display Multiplication or Division result between byte sized decimal
; values, depends on type of operation
;=======================================================================
Display.Decimal.Byte.Result.Special:
    push    word [Decimal.Word]
    push    ax
    mov     ax, word [__result__]
    cmp     byte [.Zone], 0
    ja      .Division
    mov     word [Decimal.Word], ax
    call    Display.Decimal.Word
    .Done:
        pop     ax
        pop     word [Decimal.Word]
        ret
    .Zone:      db  0
        ret
    .Quotient:
        mov     byte [.Zone], 1
        jmp     Display.Decimal.Byte.Result.Special
    .Division:
        push    dx
        xor     dx, dx
        mov     dl, byte [Decimal.Byte]
        cmp     byte [.Zone], 2
        je      .Part2
        mov     byte [Decimal.Byte], al
        jmp     .Continue
    .Part2:
        mov     byte [Decimal.Byte], ah
    .Continue:
        call    Display.Decimal.Byte
        mov     byte [Decimal.Byte], dl
        pop     dx
        jmp     .Done
    .Remainder:
        mov     byte [.Zone], 2
        jmp     Display.Decimal.Byte.Result.Special
;=======================================================================
; Display Multiplication or Division result between word sized decimal
; values, depends on type of operation
;=======================================================================
Display.Decimal.Word.Result.Special:
    push    word [Decimal.Word]
    push    ax
    push    dx
    cmp     byte [.Zone], 1
    je      .Quotient_Part
    cmp     byte [.Zone], 2
    je      .Remainder_Part
    .Quotient_Part:
        mov     ax, [__result__]
        mov     word [Decimal.Word], ax
        jmp     .Done
    .Remainder_Part:
        mov     dx, [__result__+2]
        mov     word [Decimal.Word], dx
    .Done:
        call    Display.Decimal.Word
        pop     dx
        pop     ax
        pop     word [Decimal.Word]
        ret
    .Zone:      db  0
        ret
    .Quotient:
        mov     byte [.Zone], 1
        jmp     Display.Decimal.Word.Result.Special
    .Remainder:
        mov     byte [.Zone], 2
        jmp     Display.Decimal.Word.Result.Special
;***********************************************************************
Display.Decimal.Word.Result.Special2:
    push    ax
    push    dx
    xor     ax, ax
    xor     dx, dx
    mov     ax, [__result__]
    mov     dx, [__result__+2]
    cmp     dx, 0
    je      .Softway
    mov     word [Decimal.Word], dx
    call    Display.Decimal.Word
    .Softway:
        mov     word [Decimal.Word], ax
        call    Display.Decimal.Word
    pop     dx
    pop     ax
    ret
;***********************************************************************


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
