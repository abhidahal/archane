#!/bin/bash

# Define the directories and their associated file extensions
declare -A DIRECTORIES=(
  ["HTML"]="html5 html htm xhtml"
  ["Images"]="jpeg jpg tiff gif bmp png bpg svg heif psd svg webp heic ico avif"
  ["Videos"]="avi flv wmv mov mp4 webm vob mng qt mpg mpeg 3gp"
  ["Document"]="oxps epub pages docx doc fdf ods odt pwi xsn xps dotx docm dox rvg rtf rtfd wpd xls xlsx ppt pptx csv pptx"
  ["Compressed"]="a ar cpio iso tar gz rz 7z dmg rar xar zip zst AppImage deb"
  ["Audio"]="aac aa aac dvf m4a m4b m4p mp3 msv ogg oga raw vox wav wma"
  ["Text"]="txt in out xml"
  ["Pdf"]="pdf"
  ["Programs"]="exe msi"
  ["Json"]="json"
  ["Keys"]="pem gpg ovpn"
)

# Create a reverse lookup for file extensions to directories
declare -A FILE_FORMATS
for dir in "${!DIRECTORIES[@]}"; do
  for ext in ${DIRECTORIES[$dir]}; do
    FILE_FORMATS[$ext]=$dir
  done
done

# Change to the Downloads directory
cd ~/Downloads || exit

# Organize files
for entry in *; do
  if [ -d "$entry" ]; then
    continue
  fi
  file_format="${entry##*.}"
  file_format="${file_format,,}" # Convert to lowercase
  if [ -n "${FILE_FORMATS[$file_format]}" ]; then
    directory="${FILE_FORMATS[$file_format]}"
    mkdir -p "$directory"
    mv "$entry" "$directory/"
  fi
done

# Remove empty directories
for dir in */; do
  rmdir "$dir" 2>/dev/null
done
