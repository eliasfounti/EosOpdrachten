#!/usr/bin/env bash
DIR_AFB="$1/Afbeeldingen"
mkdir "$DIR_AFB"
for FILE in "$1"/*.{jpg,png,JPEG,PNG}; do
if test -f "$FILE"]; then 
mv "$FILE" "$DIR_AFB"
fi
done