#!/usr/bin/env bash
source ./colors.sh

#ask about table name
table_name=$(zenity --entry --title="Enter table name")
for f in *.data; do
#if table name exists then delete it
if [ -f "$table_name.data" ]; then
       clear
       rm -v ./$database_name/$table_name
   zenity --info \
--title "Delete Table" \
--width 500 \
--height 100 \
--text "Table deleted successfully."
echo "$database_name Table deleted successfully"
 . ./table_menu.sh
for f in *.metadata; do

 if  
 [ -f "$table_name.metadata" ]; then
       clear
       rm -v ./$database_name/$table_name
   zenity --info \
--title "Delete Table" \
--width 500 \
--height 100 \
--text "Table deleted successfully."
echo "$database_name Table deleted successfully"
 . ./table_menu.sh
 fi
    else
 #if table name does not exist then go back to table menu
zenity --error --title="Error" --text="$table_name.data does not exist" --no-wrap
 . ./table_menu.sh
fi
done
