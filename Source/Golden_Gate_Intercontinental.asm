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
;-----------------------------------------------------------------------
    mov     byte [__background_color__], VERSATILE_LIGHT_RED
    call    Display.Video.Mode.Change
    call    Display.Intensity
    call    Display.Cursor.Shape.Normal
    call    Display.Background.Color
;-----------------------------------------------------------------------
    cld
    jmp     Golden_Gateway
;***********************************************************************
Golden_Gateway:
    call    Text_Logo
;-----------------------------------------------------------------------
    mov     byte [__current_row__], 4
    mov     byte [__current_column__], 1
    call    Display.Cursor.Position.Move
;-----------------------------------------------------------------------
    mov     byte [__message_type__], 6
    mov     byte [__message_code__], 0
    call    System.AI
    call    System.Wait
;-----------------------------------------------------------------------
    mov     byte [__current_row__], 8
    mov     byte [__current_column__], 0
    call    Display.Cursor.Position.Move
;-----------------------------------------------------------------------
    call    Master.TagRaa.Offline.Last.Message.Show
    call    System.Wait
;-----------------------------------------------------------------------
    mov     byte [System.Timer.Elapsed.Minutes], 5
    mov     byte [__current_row__], 24
    mov     byte [__current_column__], 40
    call    Display.Cursor.Position.Move
    mov     si, System.Timer.Elapsed
    call    Display.String
    xor     cx, cx
    call    System.Wait
    jmp     AutoTurnedOffMsg.Show
;-----------------------------------------------------------------------
AutoTurnedOffMsg: db " Automatically turned off after: "
    .AutoTurnedOffMsgEnd:
    .Show:
        mov     byte [__current_row__], 23
        mov     byte [__current_column__], 40
        call    Display.Cursor.Position.Move
        mov     byte [__ascii_color__], BACKGROUND_BLUE+VERSATILE_CYAN
        push    sp
        pop     es
        mov     word [__count__], AutoTurnedOffMsg.AutoTurnedOffMsgEnd-AutoTurnedOffMsg
        mov     bp, AutoTurnedOffMsg
        call    Display.Write.String
;***********************************************************************
;=======================================================================
; Suspend System
;=======================================================================
AutoTurnedOff:
    call    System.Timer.Elapsed.Count
;-----------------------------------------------------------------------
    mov     byte [__current_row__], 24
    mov     byte [__current_column__], 63
    call    Display.Cursor.Position.Move
    mov     cl, byte [System.Timer.Elapsed.Minutes]
    mov     byte [Decimal.Byte], cl
    call    Decimal.Byte.Set
    cmp     byte [Decimal.Byte], 9
    ja      .Next1
    call    FormatFigure
    jmp     .Next2
    .Next1:
        call    Display.Decimal.Byte
;-----------------------------------------------------------------------
    .Next2:
        mov     byte [__current_row__], 24
        mov     byte [__current_column__], 77
        call    Display.Cursor.Position.Move
        mov     cl, byte [System.Timer.Elapsed.Seconds]
        mov     byte [Decimal.Byte], cl
        call    Decimal.Byte.Set
        cmp     byte [Decimal.Byte], 9
        ja      .Next3
        call    FormatFigure
        jmp     .Next4
    .Next3:
        call    Display.Decimal.Byte
;-----------------------------------------------------------------------
    .Next4:
        call    IsTimeOver
        call    System.Wait
        jmp     AutoTurnedOff
;-----------------------------------------------------------------------
FormatFigure:
        push    ax
        xor     ax, ax
        mov     al, '0'
        call    Display.ASCII
        call    Display.Decimal.Byte
        pop     ax
        ret
IsTimeOver:
        cmp     byte [System.Timer.Elapsed.Minutes], 0
        je      .CheckSeconds
        ret
    .CheckSeconds:
        cmp     byte [System.Timer.Elapsed.Seconds], 0
        je      NextPagePlease
NextPagePlease:
        mov     byte [__active_page__], 1
        call    Display.Page.Move
        mov     byte [__current_row__], 0
        mov     byte [__current_column__], 0
        call    Display.Cursor.Position.Move
        call    System.Wait
;***********************************************************************
LastPage:
    mov     byte [Decimal.Digit], 10
    call    Decimal.Digit.Set
    call    System.Wait
    call    System.Wait
    call    System.Wait
    call    System.Wait
    call    System.Wait
    call    Display.Decimal.Digit
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
;-----------------------------------------------------------------------
%include "Include/Golden_Gate_Intercontinental/Leader/Master_TagRaa.asm"
;***********************************************************************
;//EOF
