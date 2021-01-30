#!/usr/bin/bash
#***********************************************************************
clear;
echo "  ~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo " ~ MDM VBin World! Research ~"
echo "  ~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo
export BASE_DIR="$PWD"
export SOURCE_DIR="$BASE_DIR/Source"
export OUTPUT_DIR="$BASE_DIR/VBin"
#.......................................................................
prompt="    COMP> "
echo "$prompt Base Directory = $BASE_DIR"
echo "$prompt Source Directory = $SOURCE_DIR"
echo "$prompt Output Directory = $OUTPUT_DIR"
#.......................................................................
if [[ -d $OUTPUT_DIR ]]
then
        rm -f $OUTPUT_DIR/*
fi
if [[ ! -d $OUTPUT_DIR ]]
then
        mkdir $OUTPUT_DIR
fi
#.......................................................................
echo
echo "$prompt Changing Directory."
cd $SOURCE_DIR
echo "$prompt Current Directory = $PWD"
echo "$prompt Compilling Core..."
#.......................................................................
echo "$prompt File: Sector_512_000B00T.asm"
nasm -f bin Sector_512_000B00T.asm -o "$OUTPUT_DIR/Sector_512_000B00T.vbin" -l "$OUTPUT_DIR/Sector_512_000B00T.lst"
#.......................................................................
echo "$prompt File: Sector_512_0000002.asm"
nasm -f bin Sector_512_0000002.asm -o "$OUTPUT_DIR/Sector_512_0000002.vbin" -l "$OUTPUT_DIR/Sector_512_0000002.lst"
#.......................................................................
echo "$prompt Disk: Disk.img"
nasm -f bin Disk.asm -o "$OUTPUT_DIR/Disk.img"
#.......................................................................
echo "$prompt Returning to the Base Directory..."
cd $BASE_DIR
echo "$prompt Current Directory = $PWD"
#.......................................................................
echo
echo "$prompt Now calling QEMU for testing the virtual disk file..."
qemu-system-x86_64 -drive file="$OUTPUT_DIR/Disk.img",format=raw,index=0,media=disk
#***********************************************************************
#//EOF
