;***********************************************************************
; Welcome to MDM
; Virtual Binary World (VBin World)
; [ Version: 0.0.1.10-Alpha Stage ]
;***********************************************************************
Project:
    .Title:     db "Virtual Binary World (VBin World)", 0
    .Version:   db "[0.0.0.10-Alpha Stage]", 0
;=======================================================================
; Text Logo
;=======================================================================
;~ Text_Logo:
    ;~ mov     byte [__active_page__], 0
    ;~ mov     byte [__ascii_color__], BACKGROUND_DARK_GRAY+VERSATILE_LIGHT_MAGENTA
    ;~ mov     byte [__count__], 240
    ;~ mov     byte [__ascii__], ' '
    ;~ call    Display.Color.Character.Write
    ;~ mov     byte [__count__], 1
    ;~ mov     byte [__current_row__], 0
    ;~ mov     byte [__current_column__], 2
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 175
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], ' '
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'W'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'e'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'l'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'c'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'o'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'm'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'e'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], ' '
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 't'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'o'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], ' '
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'M'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'D'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'M'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__current_row__], 1
    ;~ mov     byte [__current_column__], 2
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 175
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], ' '
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii_color__], BACKGROUND_DARK_GRAY+VERSATILE_LIGHT_GREEN
    ;~ mov     byte [__ascii__], 'V'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'i'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'r'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 't'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'u'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'a'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'l'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], ' '
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'B'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'i'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'n'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'a'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'r'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'y'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], ' '
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'W'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'o'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'r'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'l'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'd'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], ' '
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii_color__], BACKGROUND_DARK_GRAY+VERSATILE_LIGHT_MAGENTA
    ;~ mov     byte [__ascii__], '('
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'V'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'B'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'i'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'n'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], ' '
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'W'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'o'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'r'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'l'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'd'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], ')'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__current_row__], 2
    ;~ mov     byte [__current_column__], 2
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 175
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], ' '
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], '['
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], ' '
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'V'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'e'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'r'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 's'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'i'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'o'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'n'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], ':'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], ' '
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;=======================================================================
;~ ;-----------------------------------------------------------------------
;~ ;=======================================================================
    ;~ mov     byte [__ascii__], '0'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], '.'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], '0'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], '.'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], '1'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], '.'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], '1'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], '0'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;=======================================================================
;~ ;-----------------------------------------------------------------------
;~ ;=======================================================================
    ;~ mov     byte [__ascii__], '-'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'A'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'l'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'p'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'h'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'a'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], ' '
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'S'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 't'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'a'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'g'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], 'e'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], ' '
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ mov     byte [__ascii__], ']'
    ;~ call    Display.Color.Character.Write
    ;~ inc     byte [__current_column__]
    ;~ call    Display.Cursor.Position.Move
;~ ;-----------------------------------------------------------------------
    ;~ ret
;***********************************************************************
;//EOF
