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
Display.Decimal.Byte:
        push    ax
        push    cx
        xor     ax, ax
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
    .Result:
        push    ax
        push    dx
        xor     dx, dx
        mov     dl, byte [Decimal.Byte]
        xor     ax, ax
        mov     al, [__result__]
        mov     byte [Decimal.Byte], al
        call    Display.Decimal.Byte
        mov     byte [Decimal.Byte], dl
        pop     dx
        pop     ax
        ret
;-----------------------------------------------------------------------
; Display Decimal Byte Value to Octal
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
; Display Decimal Byte Value to Hexadecimal
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
;//EOF
