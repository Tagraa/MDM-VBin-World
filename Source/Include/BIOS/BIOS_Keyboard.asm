;***********************************************************************
; BIOS interrupt call '16h'
; Resource: https://en.wikipedia.org/wiki/BIOS_interrupt_call
;***********************************************************************
BIOS_16h:
        ret
    .Interrupt:
        int     16h
        ret
    .Read.Character:
        mov     ah, 00h
        jmp     .Interrupt
    .Read.Input.Status:
        mov     ah, 01h
        jmp     .Interrupt
    .Read.Keyboard.Shift.Status:
        mov     ah, 02h
        jmp     .Interrupt
    .Store.Keystroke.In.Keyboard.Buffer:
        mov     ah, 05h
        jmp     .Interrupt
    .Read.Character.Extended:
        mov     ah, 10h
        jmp     .Interrupt
    .Read.Input.Status.Extended:
        mov     ah, 11h
        jmp     .Interrupt
    .Read.Keyboard.Shift.Status.Extended:
        mov     ah, 12h
        jmp     .Interrupt
;***********************************************************************
Keyboard:
        ret
    .Wait.For.Enter:
        call    BIOS_16h.Read.Input.Status
        hlt
        jz      .Wait.For.Enter
        call    BIOS_16h.Read.Character
        cmp     al, 13
        jne     .Wait.For.Enter
        ret
    .Wait.For.PageDown:
        call    BIOS_16h.Read.Input.Status
        hlt
        jz      .Wait.For.PageDown
        call    BIOS_16h.Read.Character
        cmp     ah, 51h
        jne     .Wait.For.PageDown
        ret
