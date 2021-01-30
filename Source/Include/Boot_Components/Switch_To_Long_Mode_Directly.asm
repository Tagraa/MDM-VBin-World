;***********************************************************************
; Switch to Long Mode Directly
; Resource: https://wiki.osdev.org/Entering_Long_Mode_Directly
;***********************************************************************
%define     PAGE_PRESENT     (1 << 0)
%define     PAGE_WRITE      (1 << 1)
;-----------------------------------------------------------------------
%define     CODE_SEGMENT    0x0008
%define     DATA_SEGMENT    0x0010
;-----------------------------------------------------------------------
ALIGN 4
IDT:
    .Length     dw 0
    .Base       dd 0
; Function to switch directly to long mode from real mode.
; Identity maps the first 2MiB.
; Uses Intel syntax.
; es:edi    Should point to a valid page-aligned 16KiB buffer, for the PML4, PDPT, PD and a PT.
; ss:esp    Should point to memory that can be used as a small (1 uint32_t) stack
Switch.To.Mode.Long:
    ; Zero out the 16KiB buffer.
    ; Since we are doing a rep stosd, count should be bytes/4.
    push    di                  ; REP STOSD alters DI.
    mov     ecx, 0x1000
    xor     eax, eax
    cld
    rep     stosd
    pop     di                  ; Get DI back.
    ; Build the Page Map Level 4.
    ; es:di points to the Page Map Level 4 table.
    lea     eax, [es:di + 0x1000]           ; Put the address of the Page Directory Pointer Table in to EAX.
    or      eax, PAGE_PRESENT | PAGE_WRITE  ; Or EAX with the flags - present flag, writable flag.
    mov     [es:di], eax                    ; Store the value of EAX as the first PML4E.
    ; Build the Page Directory Pointer Table.
    lea     eax, [es:di + 0x2000]           ; Put the address of the Page Directory in to EAX.
    or      eax, PAGE_PRESENT | PAGE_WRITE  ; Or EAX with the flags - present flag, writable flag.
    mov     [es:di + 0x1000], eax           ; Store the value of EAX as the first PDPTE.
    ; Build the Page Directory.
    lea     eax, [es:di + 0x3000]           ; Put the address of the Page Table in to EAX.
    or      eax, PAGE_PRESENT | PAGE_WRITE  ; Or EAX with the flags - present flag, writeable flag.
    mov     [es:di + 0x2000], eax           ; Store to value of EAX as the first PDE.
    push    di                              ; Save DI for the time being.
    lea     di, [di + 0x3000]               ; Point DI to the page table.
    mov     eax, PAGE_PRESENT | PAGE_WRITE  ; Move the flags into EAX - and point it to 0x0000.
    ; Build the Page Table.
    .LoopPageTable:
        mov     [es:di], eax
        add     eax, 0x1000
        add     di, 8
        cmp     eax, 0x200000               ; If we did all 2MiB, end.
        jb      .LoopPageTable
    pop di                                  ; Restore DI.
    ; Disable IRQs
    mov     al, 0xFF    ; Out 0xFF to 0xA1 and 0x21 to disable all IRQs.
    out     0xA1, al
    out     0x21, al
    nop
    nop
    lidt    [IDT]       ; Load a zero length IDT so that any NMI causes a triple fault.
    ; Enter long mode.
    ; Set the PAE and PGE bit.
    mov     eax, 10100000b
    mov     cr4, eax
    ; Point CR3 at the PML4.
    mov     edx, edi
    mov     cr3, edx
    ; Read from the EFER MSR.
    mov     ecx, 0xC0000080
    rdmsr
    ; Set the LME bit.
    or      eax, 0x00000100
    wrmsr
    ; Activate long mode by enabling paging and protection simultaneously.
    mov     ebx, cr0
    or      ebx,0x80000001
    mov     cr0, ebx
    ; Load GDT.Pointer defined below.
    lgdt    [GDT.Pointer]
    ; Load CS with 64 bit segment and flush the instruction cache
    jmp     CODE_SEGMENT:Mode.Long
    ; Global Descriptor Table
GDT:
    ; Null Descriptor - should be present.
    .Null:
        dq 0x0000000000000000
    .Code:
        ; 64-bit code descriptor (exec/read).
        dq 0x00209A0000000000
        ; 64-bit data descriptor (read/write).
        dq 0x0000920000000000
; Padding to make the "address of the GDT" field aligned on a 4-byte boundary
ALIGN 4
    dw 0
    .Pointer:
        ; 16-bit Size (Limit) of GDT.
        dw $-GDT-1
        ; 32-bit Base Address of GDT. (CPU will zero extend to 64-bit)
        dd GDT
[bits 64]
Mode.Long:
    mov     ax, DATA_SEGMENT
    mov     ds, ax
    mov     es, ax
    mov     fs, ax
    mov     gs, ax
    mov     ss, ax
    ; Blank out the screen to a blue color.
    mov     edi, 0xB8000
    mov     rcx, 500                      ; Since we are clearing uint64_t over here, we put the count as Count/4.
    mov     rax, 0x1E201E201E201E20       ; Set the value to set the screen to: Blue background, white foreground, blank spaces.
    rep     stosq                         ; Clear the entire screen.

    ; Display "Successfully landed in '64 bits Long Mode'."
    mov     edi, 0x00b8000
    mov     rax, 0x1E62_1E20_1E34_1E36
    mov     [edi], rax
    mov     rax, 0x1E20_1E73_1E74_1E69
    mov     [edi+8], rax
    mov     rax, 0x1E67_1E6E_1E6F_1E4C
    mov     [edi+16], rax
    mov     rax, 0x1E64_1E6F_1E4D_1E20
    mov     [edi+24], rax
    mov     rax, 0x1E20_1E20_1E2E_1E65
    mov     [edi+32], rax
    ; You should replace this jump to wherever you want to jump to.
    jmp     System.Mode.Long
;***********************************************************************
;//EOF
