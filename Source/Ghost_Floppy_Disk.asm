;***********************************************************************
; Ghost Floppy Disk [3.5" - 1.44 MiB]
;***********************************************************************
STAGE2_ABSOLUTE_ADDRESS     equ     0x7E00
STAGE2_RUN_SEGMENT          equ     0x0000
STAGE2_RUN_OFFSET           equ     STAGE2_ABSOLUTE_ADDRESS
STAGE2_LOAD_SEGMENT         equ     STAGE2_ABSOLUTE_ADDRESS >> 4
STAGE2_LBA_START            equ     1
STAGE2_LBA_END              equ     STAGE2_LBA_START + STAGE2_TOTAL_SECTORS
DISK_RETRIES                equ     3
;***********************************************************************
[bits 16]
[ORG 0x7C00]
    jmp     Boot.Start
            TIMES 3-($-$$)      DB 0x90
;-----------------------------------------------------------------------
BPB.Disk.Information:
    OEMname:                    db "mkfs.fat"
    bytesPerSector:             dw 512
    sectPerCluster:             db 1
    reservedSectors:            dw 1
    numFAT:                     db 2
    numRootDirEntries:          dw 224
    numSectors:                 dw 2880
    mediaType:                  db 0xf0
    numFATsectors:              dw 9
    sectorsPerTrack:            dw 18
    numHeads:                   dw 2
    numHiddenSectors:           dd 0
    numSectorsHuge:             dd 0
    driveNum:                   db 0
    reserved:                   db 0
    signature:                  db 0x29
    volumeID:                   dd 0x2d7e5a1a
    volumeLabel:                db "_GG_INT_16_"
    fileSysType:                db "FAT12   "
;-----------------------------------------------------------------------
Boot.Start:
    xor     ax, ax
    mov     ds, ax
    mov     ss, ax
    mov     sp, 0x7c00
    cld
    xor     cx, cx
;.......................................................................
    mov     si, MessageTest
    call    System.AI.via.BIOS
;.......................................................................
Stage2.Load:
    mov     si, MessageReadDisk
    call    System.AI.via.BIOS
    mov     byte [__boot_device__], dl
    mov     di, STAGE2_LOAD_SEGMENT
    mov     si, STAGE2_LBA_START
    jmp     .Check.For.Last.LBA
    .Read.Sector.Loop:
        mov     bp, DISK_RETRIES
        call    LBA.To.CHS
        mov     es, di
        xor     bx, bx
    .Retry:
        mov     ax, 0x0201
        int     0x13
        jc      .Disk.Error
    .Success:
        add     di, 512 >> 4
        inc     si
    .Check.For.Last.LBA:
        cmp     si, STAGE2_LBA_END
        jl      .Read.Sector.Loop
    .Stage2.Loaded:
        mov     ax, STAGE2_RUN_SEGMENT
        mov     ds, ax
        mov     es, ax
        jmp     STAGE2_RUN_SEGMENT:STAGE2_RUN_OFFSET
    .Disk.Error:
        xor     ah, ah
        int     0x13
        dec     bp
        jge     .Retry
Stage2.Load.Error:
    mov     si, MessageDiskError
    call    System.AI.via.BIOS
    cli
Idle:
    hlt
    jmp     Idle
;***********************************************************************
LBA.To.CHS:
    push    ax
    mov     ax, si
    xor     dx, dx
    div     word [sectorsPerTrack]
    mov     cl, dl
    inc     cl
    xor     dx, dx
    div     word [numHeads]
    mov     dh, dl
    mov     dl, [__boot_device__]
    mov     ch, al
    shl     ah, 6
    or      cl, ah
    pop     ax
    ret
;***********************************************************************
%include "Include/BIOS/BIOS_Display.asm"
%include "Include/BIOS/BIOS_CGA_16Colors.asm"
%include "Include/Golden_Gate_Intercontinental/Informers/System_AI_via_BIOS.asm"
%include "Include/Golden_Gate_Intercontinental/Informers/System_AI_Reporting_via_BIOS.asm"
%include "Include/Golden_Gate_Intercontinental/Informers/System_AI_Core/System_AI_Identity_Card.asm"
;***********************************************************************
;.......................................................................
__boot_device__:        db 0
MessageTest:            db "Hi! :)", 0
MessageReadDisk:        db "Reading disk.", 0
MessageDiskError:       db "Disk read error!", 0
;.......................................................................
;***********************************************************************
;-----------------------------------------------------------------------
; Pad boot sector to 510 bytes and add 2 byte boot signature for
; 512 total bytes
;-----------------------------------------------------------------------
TIMES       510-($-$$)  db  0
                        dw  0xaa55
;***********************************************************************
;-----------------------------------------------------------------------
; Beginning of stage2 at 0x7E00 and will allow 32.5KiB
;-----------------------------------------------------------------------
STAGE2_TOTAL_SECTORS    equ     (Stage2.End - Stage2.Start + 511) / 512
;***********************************************************************
Stage2.Start:
    incbin "../VBin/Golden_Gate_Intercontinental.vbin"
Stage2.End:
;***********************************************************************
;//EOF
