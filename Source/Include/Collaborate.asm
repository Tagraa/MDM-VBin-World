[bits 16]
[org    0x7e00]
;=======================================================================
; Stack at 0x0000:0x7e00
;=======================================================================
Golden_Gate_Open:
    xor     ax, ax
    mov     ds, ax
    mov     ss, ax
    mov     sp, 0x7e00
;.......................................................................
    mov     byte [__background_color__], VERSATILE_LIGHT_RED
    call    Display.Video.Mode.Change
    call    Display.Intensity
    call    Display.Cursor.Shape.Normal
    call    Display.Background.Color
;.......................................................................
    cld
    jmp     Golden_Gateway
;***********************************************************************
Golden_Gateway:
    call    Text_Logo
    mov     byte [__current_row__], 4
    mov     byte [__current_column__], 1
    call    Display.Cursor.Position.Move
;.......................................................................
    ;~ mov     byte [Decimal.Byte], 50
    ;~ mov     byte [Decimal.Byte.Plus], 5
    ;~ call    Decimal.Byte.Plus.Result
    ;~ call    Display.Decimal.Byte.Result
    ;
    ;~ mov     word [Decimal.Word], 522
    ;~ mov     word [Decimal.Word.Plus], 22
    ;~ call    Decimal.Word.Plus.Result
    ;~ call    Display.Decimal.Word.Result
    ;
    ;~ mov     byte [Decimal.Byte], 50
    ;~ mov     byte [Decimal.Byte.Minus], 5
    ;~ call    Decimal.Byte.Minus.Result
    ;~ call    Display.Decimal.Byte.Result
    ;
    ;~ mov     word [Decimal.Word], 522
    ;~ mov     word [Decimal.Word.Minus], 22
    ;~ call    Decimal.Word.Minus.Result
    ;~ call    Display.Decimal.Word.Result
    ;
    ;~ mov     byte [Decimal.Byte], 255
    ;~ mov     byte [Decimal.Byte.Multiply], 255
    ;~ call    Decimal.Byte.Multiply.Result
    ;~ call    Display.Decimal.Byte.Result.Special
    ;
    mov     word [Decimal.Word], 65535
    mov     word [Decimal.Word.Multiply], 65535
    call    Decimal.Word.Multiply.Result
    call    Display.Decimal.Word.Result.Special2
    ;
    ;~ mov     byte [Decimal.Byte], 255
    ;~ mov     byte [Decimal.Byte.Divide], 25
    ;~ call    Decimal.Byte.Divide.Result
    ;~ call    Display.Decimal.Byte.Result.Special.Quotient
    ;~ push    ax
    ;~ xor     ax, ax
    ;~ mov     al, ' '
    ;~ call    Display.ASCII
    ;~ mov     al, '&'
    ;~ call    Display.ASCII
    ;~ mov     al, ' '
    ;~ call    Display.ASCII
    ;~ pop     ax
    ;~ call    Display.Decimal.Byte.Result.Special.Remainder
    ;
    ;~ mov     word [Decimal.Word], 65535
    ;~ mov     word [Decimal.Word.Divide], 65000
    ;~ call    Decimal.Word.Divide.Result
    ;~ call    Display.Decimal.Word.Result.Special.Quotient
    ;~ push    ax
    ;~ xor     ax, ax
    ;~ mov     al, ' '
    ;~ call    Display.ASCII
    ;~ mov     al, '&'
    ;~ call    Display.ASCII
    ;~ mov     al, ' '
    ;~ call    Display.ASCII
    ;~ pop     ax
    ;~ call    Display.Decimal.Word.Result.Special.Remainder
;.......................................................................
;***********************************************************************
LastPage:
    call    System.Wait
    call    System.Wait
    ;~ call    System.Wait
    ;~ call    System.Wait
    ;~ call    System.Wait
    call    System.Turn.Off
    call    System.Idle.Forever
;***********************************************************************
%include "Include/Golden_Gate_Intercontinental/Variables.asm"
%include "Include/Golden_Gate_Intercontinental/Schedule.asm"
%include "Include/Golden_Gate_Intercontinental/System.asm"
%include "Include/Golden_Gate_Intercontinental/Version.asm"
%include "Include/Golden_Gate_Intercontinental/Hosts.asm"
%include "Include/Golden_Gate_Intercontinental/Informers/System_AI.asm"
%include "Library16.asm"
;.......................................................................
%include "Include/Golden_Gate_Intercontinental/Leader/Master_TagRaa.asm"
;***********************************************************************
;//EOF
