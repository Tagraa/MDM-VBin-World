;***********************************************************************
; All Global Variables Here
;***********************************************************************
;=======================================================================
; System Variables
;=======================================================================
__digit__:              db      0
__byte__:               db      0
__word__:               dw      0
__result__:             dd      0
;-----------------------------------------------------------------------
__count__:              dw      0
__ascii__:              db      0       ; character
__ascii_color__:        db      0
;-----------------------------------------------------------------------
__video_mode__:         db      02h
__video_mode_flag__:    db      0
__background_color__:   db      VERSATILE_LIGHT_GRAY
__cursor_shape__:       dw      0607h
;-----------------------------------------------------------------------
__active_page__:        db      0
__max_columns__:        db      0
__current_row__:        db      0
__current_column__:     db      0
;-----------------------------------------------------------------------
__wait_seconds__:       dw      0
__wait_minutes__:       dw      0
__wait_hours__:         dw      0
;-----------------------------------------------------------------------
__message_type__:       db      0
__message_code__:       dw      0
__api_code__:           dw      0
__file_code__:          dw      0
__line_number__:        dw      0
;***********************************************************************
;//EOF
