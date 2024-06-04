#!/bin/bash

BOODSCHAPPENBESTAND="$1"

toon_boodschappen() {
	if [! -s "$BOODSCHAPPENBESTAND"]; then
		echo "Geen boodschappen gevonden."
	else 
		echo "Huidige boodschappen: "
		nl "$BOODSCHAPPENBESTAND"
	fi
}

voeg_boodschappen() {
	read -p "Voer je boodschap in: " BOODSCHAP
	echo "$BOODSCHAP" >> "$BOODSCHAPPENBESTAND"
	echo "Boodschap toegevoegd."
}

verwijder_boodschappen() {
	toon_boodschappen
	read -p "Voer het nummer van het boodschap dat u wilt verwijderen: " NUMMER
	if ! [["$NUMMER" =~^[0-9]+$ ]]; then
		echo "Ongeldig nummer."
		return
	fi
	
	sed -i "${NUMMER}d" "$BOODSCHAPPENBESTAND"
	echo "Boodschap verwijderd."
}

while true; do
	echo 
	echo "Boodschappenlijst menu:"
	echo "1. Toon boodschappen"
	echo "2. Voeg boodschappen"
	echo "3. Verwijder boodschappen"
	echo "4. Afsluiten"
	read -p "Maak keuze: " KEUZE

case $KEUZE in
	1)
		toon_boodschappen
		;;
	2)
		voeg_boodschappen
		;;
	3) 
		verwijder_boodschappen
		;;
	4)
		echo "Doei."
		exit 0
		;;
	*)
		echo "Ongeldig."
esac 
done
