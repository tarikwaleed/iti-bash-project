#!/usr/bin/env bash
source ./colors.sh

echo -e "Enter DataBase name to delete : "
database_name=$(zenity --entry --width 400 / --height 200 / --title="DataBase name" / --text="Enter your DataBase name to delete")

if [[ -d $database_name ]]; then
    
	rm -r -v $database_name
    zenity --info \
       --title "Delete Database" \
       --width 500 \
       --height 100 \
       --text "Database deleted successfully."
	echo "$database_name Database deleted successfully"
    . ./database_menu.sh
else

zenity --error \
       --title "delete Databse Message" \
       --width 500 \
       --height 100 \
       --text "Error to delete database $database_name."
    	echo "Error to delete database $database_name"
            . ./database_menu.sh
fi
