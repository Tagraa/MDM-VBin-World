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
;***********************************************************************
; System Power Off
;***********************************************************************
System.Turn.Off:
        mov     byte [Error], 'A'
        call    BIOS_15h.Check.APM.Service.Is.Present
        jc      .Err
        inc     byte [Error]
        cmp     bx, 504dh
        jne     .Err
;.......................................................................
        inc     byte [Error]
        call    BIOS_15h.Connect.RM.Interface
        jc      .Err
;.......................................................................
        inc     byte [Error]
        call    BIOS_15h.Switch.To.APM           ; APM 1.1+
        jc      .Err
        inc     byte [Error]
        cmp     al, 01h
        jb      .Err
;.......................................................................
        inc     byte [Error]
        call    BIOS_15h.Enable.APM
        jc      .Err
;.......................................................................
        inc     byte [Error]
        call    BIOS_15h.Engage.APM
        jc      .Err
;.......................................................................
        inc     byte [Error]
        call    BIOS_15h.Turn.Off.System
        jc      .Err
;.......................................................................
        jmp     .End
;.......................................................................
    .Err:
        xor     di, di
        mov     ah, 09h
        mov     al, byte [Error]
        stosw
;.......................................................................
    .End:
        cli
        hlt
;.......................................................................
Error:
    db  0
;.......................................................................
        ret
;//EOF
