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
;//EOF
