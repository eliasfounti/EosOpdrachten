#!/bin/bash

generate_md5() {
echo -n "$1" | md5sum | cut -d ' ' -f1
}

read -p "Geef je naam: " NAAM
echo "$NAAM"

read -p "Voer wachtwoord in: " WACHTWOORD
echo
read -p "Voer nog een keer zelfde wachtwoord: " WACHTWOORD2

if[["$WACHTWOORD" != "$WACHTWOORD2"]]; then
echo "Wachtwoord niet overeen!"
elif [${#WACHTWOORD} -lt 8] || [${#WACHTWOORD2} -lt 8]; then
echo "Wachtwoord heeft niet meer dan 8 karakters"
else
echo "Wachtwoord goedgekeurd!"
MD5_HASH=$(generate_md5 "$WACHTWOORD")
echo "$NAAM $MD5_HASH" >> "$1"
fi
