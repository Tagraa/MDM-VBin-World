;***********************************************************************
; Offline Messages from Master TagRaa
;***********************************************************************
;=======================================================================
; Last Message: 2021/01/18 06:29:40
;=======================================================================
Master.TagRaa.Offline.Last.Message: dw 0
    .Show:
        cmp     word [Master.TagRaa.Offline.Last.Message], 0
        ja      .Show.1
        mov     si, Data_0
        call    Display.String
        ret
    .Show.1:
        ;~ mov     si, Data_1
        ;~ call    Display.String
        ret
;-----------------------------------------------------------------------
Data_0: db " Message From: <Master TagRaa>", `\n\r`, \
" Date: January 18 2021", `\n\r`, " Time: 06:29:40", `\n\r`, `\n\r`, \
" Subject: Need Your Help for 'Virtual Binary World' Construction", \
`\n\r`, `\n\r`, " Body: Hi, how are you? Nice to meet you :) The \
important thing is, I need your", `\n\r`, " help as a developer to \
construct the 'Virtual Binary World (VBin World)' first", `\n\r`, \
" of all. The World (i.e. VBin World) is based on pure raw binary, so \
you can", `\n\r`, " easly guess it, that, assembly code and NASM \
compiler is the primary weapons", `\n\r`, " for me, ha ha ha. Sorry, \
never mind :p So I hope you will be the next another", `\n\r`, \
" real person in this World. Anyway, I will be waiting for you, Kindly \
take care.", `\n\r`, " Best Regards,", `\n\r`, " TagRaa", 0
;-----------------------------------------------------------------------
;***********************************************************************
;//EOF
