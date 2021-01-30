[Bits 16]
;***********************************************************************
; Switch to protected mode
;***********************************************************************
;=======================================================================
; Load our global descriptor table, which defines the protected mode
; segments ( e.g. for code and data )
;=======================================================================
Switch.To.Protected.Mode:
    cli
    lgdt    [GDT_Descriptor]
;=======================================================================
; To make the switch to protected mode, we set the first bit of CR0,
; a control register
;=======================================================================
    mov     eax, cr0
    or      eax, 0x1
    mov     cr0, eax
;=======================================================================
; Make a far jump ( i.e. to a new segment ) to our 32-bit code. This
; also forces the CPU to flush its cache of pre-fetched and real-mode
; decoded instructions , which can cause problems.
;=======================================================================
    jmp     CODE_SEGMENT:Initialize.Protected.Mode
;=======================================================================
; Initialize registers and the stack once in PM.
;=======================================================================
[Bits 32]
Initialize.Protected.Mode:
    mov     ax, DATA_SEGMENT    ; Now in PM , our old segments are
    mov     ds, ax              ; meaningless, so we point our segment
    mov     ss, ax              ; registers to the data selector we
    mov     es, ax              ; defined in our GDT
    mov     fs, ax
    mov     gs, ax
;=======================================================================
; Update our stack position so it is right at the top of the free space.
;=======================================================================
    mov     ebp, 0x90000
    mov     esp, ebp
;=======================================================================
; Finally , call some well - known label
;=======================================================================
    call    Begin.Protected.Mode
;***********************************************************************
;//EOF
