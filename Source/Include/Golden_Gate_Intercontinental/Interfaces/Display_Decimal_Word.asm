;  Display_ASCII.asm
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
;
Display.Decimal.Word:
        push    ax
        push    cx
        push    dx
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
        call    Display.ASCII.Write
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
    .Result:
        push    ax
        push    dx
        mov     dx, Word [Decimal.Word]
        mov     ax, [__result__]
        mov     word [Decimal.Word], ax
        call    Display.Decimal.Word
        mov     Word [Decimal.Word], dx
        pop     dx
        pop     ax
        ret
;-----------------------------------------------------------------------
; Display Decimal Word Value to Octal
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
; Display Decimal Word Value to Hexadecimal
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

;//EOF
