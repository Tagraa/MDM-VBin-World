;***********************************************************************
;=======================================================================
; Support 2 or 3 byte encoded JMPs before BPB.
;=======================================================================
jmp    Boot_Start
       TIMES 3-($-$$) DB 0x90
;=======================================================================
; Dos 4.0 EBPB 1.44MB floppy, 'mkfs.fat' is what OEMname mkdosfs uses
;=======================================================================
BPB_Disk_Info:
    OEMname:            db    "mkfs.fat"
    bytesPerSector:     dw    512
    sectPerCluster:     db    1
    reservedSectors:    dw    1
    numFAT:             db    2
    numRootDirEntries:  dw    224
    numSectors:         dw    2880
    mediaType:          db    0xf0
    numFATsectors:      dw    9
    sectorsPerTrack:    dw    18
    numHeads:           dw    2
    numHiddenSectors:   dd    0
    numSectorsHuge:     dd    0
    driveNum:           db    0
    reserved:           db    0
    signature:          db    0x29
    volumeID:           dd    0x2d7e5a1a
    volumeLabel:        db    "MDM_VBIN   "
    fileSysType:        db    "FAT12   "
;***********************************************************************
;//EOF
