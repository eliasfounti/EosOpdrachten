#!/bin/bash
case "$EXTENSIE" in 
py)
python3 "$BESTAND"
;;
sh)
bash "$BESTAND"
;;
cc)
cat "$BESTAND"
;;
*)
echo Foutmelding
exit 1
;;
esac
