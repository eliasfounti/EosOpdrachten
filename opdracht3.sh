#!/bin/bash
MAP="$1"
COMMANDO="$2"
LOG="$3"

>"LOG"
for BESTAND in "$MAP"/*; do
$COMMANDO "$BESTAND" >/dev/null

if $COMMANDO "$BESTAND" >/dev/null; then
echo "Succes: $COMMANDO $BESTAND" >> "$LOG"
else
echo "Fout: $COMMANDO $BESTAND" >> "$LOG"
fi
done