;***********************************************************************
; List of BIOS color attributes
; Resource: https://en.wikipedia.org/wiki/BIOS_color_attributes
;***********************************************************************
;=======================================================================
; Color Graphics Adapter (CGA) - Total 16 Colors for Background
;=======================================================================
;-----------------------------------------------------------------------
; CGA Color Name                    Hexadecimal     Binary      decimal
;-----------------------------------------------------------------------
BACKGROUND_BLACK                equ     000h      ; 0000 0000      0
BACKGROUND_BLUE                 equ     010h      ; 0001 0000      16
BACKGROUND_GREEN                equ     020h      ; 0010 0000      32
BACKGROUND_CYAN                 equ     030h      ; 0011 0000      48
BACKGROUND_RED                  equ     040h      ; 0100 0000      64
BACKGROUND_MAGENTA              equ     050h      ; 0101 0000      80
BACKGROUND_BROWN                equ     060h      ; 0110 0000      96
BACKGROUND_LIGHT_GRAY           equ     070h      ; 0111 0000      112
BACKGROUND_DARK_GRAY            equ     080h      ; 1000 0000      128
BACKGROUND_LIGHT_BLUE           equ     090h      ; 1001 0000      144
BACKGROUND_LIGHT_GREEN          equ     0A0h      ; 1010 0000      160
BACKGROUND_LIGHT_CYAN           equ     0B0h      ; 1011 0000      176
BACKGROUND_LIGHT_RED            equ     0C0h      ; 1100 0000      192
BACKGROUND_LIGHT_MAGENTA        equ     0D0h      ; 1101 0000      208
BACKGROUND_YELLOW               equ     0E0h      ; 1110 0000      244
BACKGROUND_WHITE                equ     0F0h      ; 1111 0000      240
;=======================================================================
; Color Graphics Adapter(CGA) - Total 16 Colors for Forground/Background
;=======================================================================
VERSATILE_BLACK                 equ     00h      ; 0000 0000       0
VERSATILE_BLUE                  equ     01h      ; 0000 0001       1
VERSATILE_GREEN                 equ     02h      ; 0000 0010       2
VERSATILE_CYAN                  equ     03h      ; 0000 0011       3
VERSATILE_RED                   equ     04h      ; 0000 0100       4
VERSATILE_MAGENTA               equ     05h      ; 0000 0101       5
VERSATILE_BROWN                 equ     06h      ; 0000 0110       6
VERSATILE_LIGHT_GRAY            equ     07h      ; 0000 0111       7
VERSATILE_DARK_GRAY             equ     08h      ; 0000 1000       8
VERSATILE_LIGHT_BLUE            equ     09h      ; 0000 1001       9
VERSATILE_LIGHT_GREEN           equ     0Ah      ; 0000 1010       10
VERSATILE_LIGHT_CYAN            equ     0Bh      ; 0000 1011       11
VERSATILE_LIGHT_RED             equ     0Ch      ; 0000 1100       12
VERSATILE_LIGHT_MAGENTA         equ     0Dh      ; 0000 1101       13
VERSATILE_YELLOW                equ     0Eh      ; 0000 1110       14
VERSATILE_WHITE                 equ     0Fh      ; 0000 1111       15
;***********************************************************************
;//EOF
