#!/bin/bash

SCR_IMG=$(mktemp)
grimblast --freeze copysave area $SCR_IMG.png
mogrify -modulate 100,0 -resize 400% $SCR_IMG.png
tesseract -l eng $SCR_IMG.png $SCR_IMG &>/dev/null
cat $SCR_IMG.txt | wl-copy
