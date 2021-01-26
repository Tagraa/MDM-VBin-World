;  Decimal_Digit.asm
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
;=======================================================================
; [Get, Set] System Variable >  __digit__ = Decimal.Digit
;=======================================================================
Decimal.Digit:      db  0
    .Set:
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

;//EOF
