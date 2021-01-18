;***********************************************************************
;=======================================================================
; Main System Informer - Artificial Intelligence (AI)
;=======================================================================
System.AI:
    ; Step 0 - New line
    call    Display.New.Line
    ; Step 1 - Detect message type
    call    System.AI.Reporting
    call    System.AI.Detect_Message_Type
    ; Step 2 - Filter next step
    call    System.AI.Filter.Next.Step
    ret
;-----------------------------------------------------------------------
System.AI.Reporting:
    call    Display.Cursor.Position.Read
    mov     byte [__ascii_color__], VERSATILE_WHITE
    push    cx
    mov     cx, word [__AI__Length]
    mov     word [__count__], cx
    pop     cx
    mov     bp, __AI__
    call    Display.Write.String
    ret
;=======================================================================
; Detect Message Type:         AL = Message Type
;
; 0 - Alert, 1 - Error,    2 - Dialog,   3 - Information, 4 - Jock
; 5 - News,  6 - Question, 7 - Romantic, 8 - Suggestion,  9 - Warning
;=======================================================================
System.AI.Detect_Message_Type:
        call    Display.Cursor.Position.Read
        mov     byte [__ascii_color__], VERSATILE_LIGHT_CYAN
    .Message_Type_Case_0:
        cmp     byte [__message_type__], 0
        ja      .Message_Type_Case_1
        push    cx
        mov     cx, word [Dialog_0_length]
        dec     cx
        mov     word [__count__], cx
        pop     cx
        mov     bp, Dialog_0
        jmp     .Final
    .Message_Type_Case_1:
        cmp     byte [__message_type__], 1
        ja      .Message_Type_Case_2
        push    cx
        mov     cx, word [Dialog_1_length]
        dec     cx
        mov     word [__count__], cx
        pop     cx
        mov     bp, Dialog_1
        jmp     .Final
    .Message_Type_Case_2:
        cmp     byte [__message_type__], 2
        ja      .Message_Type_Case_3
        push    cx
        mov     cx, word [Dialog_2_length]
        dec     cx
        mov     word [__count__], cx
        pop     cx
        mov     bp, Dialog_2
        jmp     .Final
    .Message_Type_Case_3:
        cmp     byte [__message_type__], 3
        ja      .Message_Type_Case_4
        push    cx
        mov     cx, word [Dialog_3_length]
        dec     cx
        mov     word [__count__], cx
        pop     cx
        mov     bp, Dialog_3
        jmp     .Final
    .Message_Type_Case_4:
        cmp     byte [__message_type__], 4
        ja      .Message_Type_Case_5
        push    cx
        mov     cx, word [Dialog_4_length]
        dec     cx
        mov     word [__count__], cx
        pop     cx
        mov     bp, Dialog_4
        jmp     .Final
    .Message_Type_Case_5:
        cmp     byte [__message_type__], 5
        ja      .Message_Type_Case_6
        push    cx
        mov     cx, word [Dialog_5_length]
        dec     cx
        mov     word [__count__], cx
        pop     cx
        mov     bp, Dialog_5
        jmp     .Final
    .Message_Type_Case_6:
        cmp     byte [__message_type__], 6
        ja      .Message_Type_Case_7
        push    cx
        mov     cx, word [Dialog_6_length]
        dec     cx
        mov     word [__count__], cx
        pop     cx
        mov     bp, Dialog_6
        jmp     .Final
    .Message_Type_Case_7:
        cmp     byte [__message_type__], 7
        ja      .Message_Type_Case_8
        push    cx
        mov     cx, word [Dialog_7_length]
        dec     cx
        mov     word [__count__], cx
        pop     cx
        mov     bp, Dialog_7
        jmp     .Final
    .Message_Type_Case_8:
        cmp     byte [__message_type__], 8
        ja      .Message_Type_Case_9
        push    cx
        mov     cx, word [Dialog_8_length]
        dec     cx
        mov     word [__count__], cx
        pop     cx
        mov     bp, Dialog_8
        jmp     .Final
    .Message_Type_Case_9:
        cmp     byte [__message_type__], 9
        ja      .Message_Type_Unknown
        push    cx
        mov     cx, word [Dialog_9_length]
        dec     cx
        mov     word [__count__], cx
        pop     cx
        mov     bp, Dialog_9
        jmp     .Final
    .Message_Type_Unknown:
        push    cx
        mov     cx, word [Dialog_10_length]
        dec     cx
        mov     word [__count__], cx
        pop     cx
        mov     bp, Dialog_10
    .Final:
        call    Display.Write.String
        ret
;=======================================================================
; Filter Next Step
;=======================================================================
System.AI.Filter.Next.Step:
        call    Display.New.Line
        call    System.AI.Reporting
    .Message_Type_Alert:
        cmp     byte [__message_type__], 0
        ja      .Message_Type_Error
        ret
    .Message_Type_Error:
        cmp     byte [__message_type__], 1
        ja      .Message_Type_Dialog
        jmp     System.AI.Reporting.Detected.Error
    .Message_Type_Dialog:
        cmp     byte [__message_type__], 2
        ja      .Message_Type_Information
        ret
    .Message_Type_Information:
        cmp     byte [__message_type__], 3
        ja      .Message_Type_Jock
        ret
    .Message_Type_Jock:
        cmp     byte [__message_type__], 4
        ja      .Message_Type_News
        ret
    .Message_Type_News:
        cmp     byte [__message_type__], 5
        ja      .Message_Type_Question
        ret
    .Message_Type_Question:
        cmp     byte [__message_type__], 6
        ja      .Message_Type_Romantic
        jmp     System.AI.Reporting.Detected.Question
    .Message_Type_Romantic:
        cmp     byte [__message_type__], 7
        ja      .Message_Type_Suggestion
        ret
    .Message_Type_Suggestion:
        cmp     byte [__message_type__], 8
        ja      .Message_Type_Warning
        ret
    .Message_Type_Warning:
        cmp     byte [__message_type__], 9
        ja      .Message_Type_Unknown
        ret
    .Message_Type_Unknown:
        ret
;=======================================================================
; Detected Question:    __message_code__  =  Question Code
;=======================================================================
System.AI.Reporting.Detected.Question:
        cmp     byte [__message_code__], 0
        ja      .Question_Code_1
        mov     si, Question_0
        call    Display.String
    .Question_Code_1:
        ret
;=======================================================================
; Detected Error:       __message_type__  =  1
;                       __api_16__        =  API16 Code
;                       __file_code__     =  File Code
;                       __line_number__   =  Line Number
;                       __error_code__    =  Error Code
;=======================================================================
System.AI.Reporting.Detected.Error:
        cmp     byte [__message_code__], 0
        ja      .Error_Code_1
        mov     si, Error_0
        call    Display.String
    .Error_Code_1:
;-----------------------------------------------------------------------
    .Searching_API16_Code:
        call    Display.New.Line
        call    System.AI.Reporting
        call    Display.Cursor.Position.Read
        mov     byte [__ascii_color__], VERSATILE_WHITE
        push    cx
        cmp     byte [__api_code__], 0
        ja      .Searching_API16_1
        mov     cx, word [Call_0_length]
        dec     cx
        mov     word [__count__], cx
        pop     cx
        mov     bp, Call_0
        call    Display.Write.String
        jmp     .Searching_File_Code
    .Searching_API16_1:
;-----------------------------------------------------------------------
    .Searching_File_Code:
        call    Display.New.Line
        call    System.AI.Reporting
        mov     si, Dialog_11
        call    Display.String
    ;~ File_Code_Case_0:
        cmp     word [__file_code__], 0
        ja      .File_Code_Case_1
        mov     si, Source_Code_File_0
        call    Display.String
        jmp     .Detect.Code.Line
    .File_Code_Case_1:
        ret
;-----------------------------------------------------------------------
    .Detect.Code.Line:
        call    Display.New.Line
        call    System.AI.Reporting
        mov     si, Dialog_12
        call    Display.String
        push    cx
        mov     cx, word [__line_number__]
        mov     word [Decimal.Word], cx
        call    Decimal.Word.Set
        call    Display.Decimal.Word
        pop     cx
        call    Display.New.Line
        ret
;-----------------------------------------------------------------------
;-----------------------------------------------------------------------
;***********************************************************************
; Include Core Files
;***********************************************************************
%include "Include/Golden_Gate_Intercontinental/Informers/System_AI_Core\
/System_AI_Source_Code_File_List.asm"
;-----------------------------------------------------------------------
%include "Include/Golden_Gate_Intercontinental/Informers/System_AI_Core\
/System_AI_API_Call_List.asm"
;-----------------------------------------------------------------------
%include "Include/Golden_Gate_Intercontinental/Informers/System_AI_Core\
/System_AI_Identity_Card.asm"
;-----------------------------------------------------------------------
%include "Include/Golden_Gate_Intercontinental/Informers/System_AI_Core\
/System_AI_Preset_Messages/System_AI_Messages_Alert.asm"
;-----------------------------------------------------------------------
%include "Include/Golden_Gate_Intercontinental/Informers/System_AI_Core\
/System_AI_Preset_Messages/System_AI_Messages_Error.asm"
;-----------------------------------------------------------------------
%include "Include/Golden_Gate_Intercontinental/Informers/System_AI_Core\
/System_AI_Preset_Messages/System_AI_Messages_Dialog.asm"
;-----------------------------------------------------------------------
%include "Include/Golden_Gate_Intercontinental/Informers/System_AI_Core\
/System_AI_Preset_Messages/System_AI_Messages_Information.asm"
;-----------------------------------------------------------------------
%include "Include/Golden_Gate_Intercontinental/Informers/System_AI_Core\
/System_AI_Preset_Messages/System_AI_Messages_Jock.asm"
;-----------------------------------------------------------------------
%include "Include/Golden_Gate_Intercontinental/Informers/System_AI_Core\
/System_AI_Preset_Messages/System_AI_Messages_News.asm"
;-----------------------------------------------------------------------
%include "Include/Golden_Gate_Intercontinental/Informers/System_AI_Core\
/System_AI_Preset_Messages/System_AI_Messages_Question.asm"
;-----------------------------------------------------------------------
%include "Include/Golden_Gate_Intercontinental/Informers/System_AI_Core\
/System_AI_Preset_Messages/System_AI_Messages_Romantic.asm"
;-----------------------------------------------------------------------
%include "Include/Golden_Gate_Intercontinental/Informers/System_AI_Core\
/System_AI_Preset_Messages/System_AI_Messages_Suggestion.asm"
;-----------------------------------------------------------------------
%include "Include/Golden_Gate_Intercontinental/Informers/System_AI_Core\
/System_AI_Preset_Messages/System_AI_Messages_Warning.asm"
;***********************************************************************
;//EOF
