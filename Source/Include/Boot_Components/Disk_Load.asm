;  Disk_Load.asm
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
; load DH sectors to ES : BX from drive DL
;***********************************************************************
Disk:
    .Load:
        push    dx
        mov     ax, 0x02
        mov     al, dh      ; Read DH sectors
        mov     ch, 0x00    ; Select cylinder 0
        mov     dh, 0x00    ; Select head 0
        mov     cl, 0x02    ; Start reading from second sector
        int     0x13
        jc      .Error      ; Jump if error (i.e. carry flag set)
        pop     dx
        cmp     dh, al
        jne     .Error
        ret
    .Error:
        mov     si, DISK_ERROR_MESSAGE
        call    Display.String
        ret

DISK_ERROR_MESSAGE:             db "Disk read error!", 0
