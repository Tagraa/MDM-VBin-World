[bits 32]
VIDEO_MEM       equ     0xb8000
DEF_COLOR       equ     0x0f
;=======================================================================
Test32:
    mov ax,0x10
    mov ds,ax
    mov ss,ax
    mov es,ax
    mov esp,90000h
    cld
    mov     ebx, MODE_MESSAGE
    call    print_string32
    cli
Idle:
    hlt
    jmp     Idle
;=======================================================================
;.......................................................................
MODE_MESSAGE:       db "Mode: Protected Mode (32 Bits).", 0x0A, 0x0D, 0
;.......................................................................
;***********************************************************************
print_string32:
    pusha
    mov edx,VIDEO_MEM

print_string32_loop:
    mov al, [ebx]
    mov ah, DEF_COLOR

    cmp al,0
    je print_string32_end

    mov [edx],ax

    inc ebx
    add edx,2
    jmp print_string32_loop

print_string32_end:
    popa
    ret
;***********************************************************************
;//EOF
