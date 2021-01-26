;***********************************************************************
; Checks whether CPU supports long mode or not.
; Returns with carry set if CPU doesn't support long mode.
; Resource: https://wiki.osdev.org/Entering_Long_Mode_Directly
;***********************************************************************
Check.CPU:
    ; Check whether CPUID is supported or not.
    pushfd                            ; Get flags in EAX register.
    pop     eax
    mov     ecx, eax
    xor     eax, 0x200000
    push    eax
    popfd
    ; Check whether bit 21 is set or not. If EAX now contains 0,
    ; CPUID isn't supported.
    pushfd
    pop     eax
    xor     eax, ecx
    shr     eax, 21
    and     eax, 1
    push    ecx
    popfd
    test    eax, eax
    jz      .Mode.NoLong
    mov     eax, 0x80000000
    cpuid
    ; Check whether extended function 0x80000001 is available are not.
    ; If not, long mode not supported.
    cmp     eax, 0x80000001
    jb      .Mode.NoLong
    ; Test if the LM-bit, is set or not.
    ; If not Long mode not supported.
    mov     eax, 0x80000001
    cpuid
    test    edx, 1 << 29
    jz      .Mode.NoLong
    ret
    ; If not Long mode then
    .Mode.NoLong:
        stc
        ret
;***********************************************************************
;//EOF
