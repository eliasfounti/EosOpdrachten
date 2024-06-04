#!/bin/bash

MAP="$1"
for BESTAND in "$MAP"/*.jpg; do
    if [ -f "$BESTAND" ]; then
        NAAM_ZONDER_EXTENSIE=$(basename "$BESTAND" .jpg)
        convert "$BESTAND" -resize 128x128\> "$MAP/$NAAM_ZONDER_EXTENSIE.png"
        echo "Geconverteerd: $BESTAND naar PNG"
    fi
done

echo "Conversie voltooid."