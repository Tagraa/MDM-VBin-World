;***********************************************************************
; BIOS interrupt call '10h'
; Resource: https://en.wikipedia.org/wiki/INT_10H
;***********************************************************************
BIOS_10h:
        ret
;=======================================================================
; Function:     AH=00h
;
; Parameters:
;       AL = Video mode.
;
; Return:
;       AL = Video mode flag / CRT controller mode byte
;=======================================================================
        .Set.Current.Video.Mode:
                mov     ah, 00h
                jmp     .Interrupt
;=======================================================================
; Function:     AH=04h          (Does not work on VGA systems)
;
; Parameters:   Not applicable.
;
; Return:
;       AH = Status (0=not triggered, 1=triggered)
;       BX = Pixel X
;       CH = Pixel Y
;       CX = Pixel line number for modes 0Fh-10h
;       DH = Character Y
;       DL = Character X
;
;=======================================================================
        ;.Read.Light.Pen.Position:
                ;mov     ah, 04h
                ;jmp     .Interrupt
;=======================================================================
; Function:     AH=05h
;
; Parameters:
;       AL = Page Number
;
; Return:       Not applicable.
;
;=======================================================================
        .Select.Active.Display.Page:
                mov     ah, 05h
                jmp     .Interrupt
;=======================================================================
; Function:     AH=06h and AH=07h
;
; Parameters:
;       AL = lines to scroll (0 = clear, CH, CL, DH, DL are used),
;       BH = Background Color and Foreground color.
;            BH = 43h, means that background color is red and foreground
;            color is cyan. Refer the 'BIOS.Color.Attributes'.
;       CH = Upper row number.
;       CL = Left column number.
;       DH = Lower row number.
;       DL = Right column number.
;
; Return:       Not applicable.
;=======================================================================
        .Scroll.Window.Up:
                mov     ah, 06h
                jmp     .Interrupt
        .Scroll.Window.Down:
                mov     ah, 07h
                jmp     .Interrupt
;=======================================================================
; Function:     AH=08h
;
; Parameters:
;       BH = Page Number
;
; Return:
;       AH = Color
;       AL = Character
;
;=======================================================================
        .Read.Character.And.Attribute.At.Cursor.Position:
                mov     ah, 08h
                jmp     .Interrupt
;=======================================================================
; Function:     AH=09h
;
; Parameters:
;       AL = Character
;       BH = Page Number
;       BL = Color
;       CX = Number of times to print character
;
; Return:       Not applicable.
;
;=======================================================================
        .Write.Character.And.Attribute.At.Cursor.Position:
                mov     ah, 09h
                jmp     .Interrupt
;=======================================================================
; Function:     AH=0Ah
;
; Parameters:
;       AL = Character
;       BH = Page Number
;       CX = Number of times to print character
;
; Return:       Not applicable.
;
;=======================================================================
        .Write.Character.Only.At.Cursor.Position:
                mov     ah, 0Ah
                jmp     .Interrupt
;=======================================================================
; Function:     AH=0Bh
;               BH=01h
;
; Parameters:
;       BL = Palette ID (was only valid in CGA, but newer cards support
;            it in many or all graphics modes)
;
; Return:       Not applicable.
;
;=======================================================================
        .Set.Palette:
                mov     ah, 0Bh
                mov     bh, 01h
                jmp     .Interrupt
;=======================================================================
; Function:     AH=0Ch
;
; Parameters:
;       AL = Color
;       BH = Page Number
;       CX = x
;       DX = y
;
; Return:       Not applicable.
;
;=======================================================================
        .Write.Graphics.Pixel:
                mov     ah, 0Ch
                jmp     .Interrupt
;=======================================================================
; Function:     AH=0Dh
;
; Parameters:
;       BH = Page Number
;       CX = x
;       DX = y
;
; Return:
;       AL = Color
;
;=======================================================================
        .Read.Graphics.Pixel:
                mov     ah, 0Dh
                jmp     .Interrupt
;=======================================================================
; Function:     AH=0Fh
;
; Parameters:   Not applicable.
;
; Return:
;       AL = Video Mode
;       AH = number of character columns
;       BH = active page
;=======================================================================
        .Get.Current.Video.Mode:
                mov     ah, 0Fh
                jmp     .Interrupt
;=======================================================================
; Resource: https://en.wikipedia.org/wiki/BIOS_interrupt_call
;
; Function:     AH=10h  ; Set Palette Registers (EGA, VGA, SVGA)
;
; Parameters:   ?
;
; Return:       Not applicable. / ?
;
;=======================================================================
        .Set.Palette.Registers:
                mov     ah, 10h
                jmp     .Interrupt
;=======================================================================
; Function:     AH=11h
;
; Parameters:
;       BH = Number of bytes per character
;       CX = Number of characters to change
;       DX = Starting character to change
;       ES:BP = Offset of character data
;
; Return:       Not applicable.
;
;=======================================================================
        .Change.Text.Mode.Character.Set:
                mov     ah, 11h
                jmp     .Interrupt
;=======================================================================
; Resource: https://en.wikipedia.org/wiki/BIOS_interrupt_call
;
; Function:     AH=12h  ; Alternate Select Functions (EGA, VGA, SVGA)
;
; Parameters:   ?
;
; Return:       Not applicable. / ?
;
;=======================================================================
        .Alternate.Select.Functions:
                mov     ah, 12h
                jmp     .Interrupt
;=======================================================================
; Resource: https://en.wikipedia.org/wiki/BIOS_interrupt_call
;
; Function:     AH=1Ah  ; Get or Set Display Combination Code (VGA, SVGA)
;
; Parameters:   ?
;
; Return:       Not applicable. / ?
;
;=======================================================================
        .Get.Or.Set.Display.Combination.Code:
                mov     ah, 1Ah
                jmp     .Interrupt
;=======================================================================
; Resource: https://en.wikipedia.org/wiki/BIOS_interrupt_call
;
; Function:     AH=1Bh  ; Get Functionality Information (VGA, SVGA)
;
; Parameters:   ?
;
; Return:       Not applicable. / ?
;
;=======================================================================
        .Get.Functionality.Information:
                mov     ah, 1Bh
                jmp     .Interrupt
;=======================================================================
; Resource: https://en.wikipedia.org/wiki/BIOS_interrupt_call
;
; Function:     AH=1Ch  ; Save or Restore Video State (VGA, SVGA)
;
; Parameters:   ?
;
; Return:       Not applicable. / ?
;
;=======================================================================
        .Save.Or.Restore.Video.State:
                mov     ah, 1Ch
                jmp     .Interrupt
;=======================================================================
; Resource: https://en.wikipedia.org/wiki/BIOS_interrupt_call
;
; Function:     AH=4Fh  ; VESA BIOS Extension Functions (SVGA)
;
; Parameters:   ?
;
; Return:       Not applicable. / ?
;
;=======================================================================
        .VESA.BIOS.Extension.Functions:
                mov     ah, 4Fh
                jmp     .Interrupt
;=======================================================================
; Function:     AX=4F02h
;
; Parameters:
;       BX = video mode, if Sign bit (bit 15) set, video memory will not
;            be refreshed.
;
; Return:       Not applicable.
;
;=======================================================================
        .Set.VESA_Compliant.Video.Modes:   ; Beginning at 640 by 480 and
                mov     ax, 4F02h          ; reaching 1280 by 1024 with
                jmp     .Interrupt         ; 256 colors.
;=======================================================================
; Function:     AX=4F00h to 4F15h
;               Other VESA VBE commands.
;=======================================================================
;-----------------------------------------------------------------------
;-----------------------------------------------------------------------
        .Interrupt:
                int     10h
                ret
;-----------------------------------------------------------------------
;-----------------------------------------------------------------------
;=======================================================================
; Function:     AH=??h
;
; Parameters:   Not applicable.
;
; Return:       Not applicable.
;
;=======================================================================
;***********************************************************************
;//EOF
