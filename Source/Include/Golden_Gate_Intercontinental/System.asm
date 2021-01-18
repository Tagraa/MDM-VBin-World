;***********************************************************************
; System Instructions
;***********************************************************************
System.Wait:
    call    Process.Sleep
    ret
;-----------------------------------------------------------------------
System.Idle.Forever:
    call    System.Wait
    jmp     System.Idle.Forever
;-----------------------------------------------------------------------
System.Timer.Elapsed: db "Hour(s): 00 Minute(s): 00 Second(s): 00", 0
    .Hours:  db 0
    .Minutes: db 0
    .Seconds: db 0
    .Count:
        cmp     byte [.Seconds], 0
        je      .AndCheckMinutes
        dec     byte [.Seconds]
        ret
    .AndCheckMinutes:
        cmp     byte [.Minutes], 0
        je      .AndCheckHours
        cmp     byte [.Seconds], 0
        je      .ResetSeconds
    .AndCheckHours:
        cmp     byte [.Hours], 0
        je      .Done
    .Done:
        ret
    .ResetSeconds:
        mov     byte [.Seconds], 60
        dec     byte [.Minutes]
        jmp     .Count
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
Error       db  0
;.......................................................................
        ret
;***********************************************************************
;//EOF
