#!/bin/sh
# Convert image to X11 ARGB format.
# Needs imagemagic.
echo 'unsigned long icon[] = {'
identify -format '%w, %h,' $1
echo ''
convert $1 RGBA:- | hexdump -v -e '1/4 "0x%08x,\n"'
echo '};'
