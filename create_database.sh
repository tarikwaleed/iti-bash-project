#!/usr/bin/env bash
source ./colors.sh

#Enter name of database and check if it exists.
database_name=$(zenity --entry \
    --width 500 \
    --title "Create Database" \
    --text "Enter Database Name to Create:")
#echo -e $(blueprint "Enter Database Name to Create: ")
#read database_name

if [[ -d $database_name ]]; then
    clear
    zenity --warning \ --title "Duplicated database name" \
        --width 500 \
        --height 100 \
        --text "Database with name $database_name already exists"
    #echo -e $(redprint "Database with name $database_name already exists")

    . ./database_menu.sh

#If database name entered doesn't exist then create database.
else
    if [[ ! "$database_name" =~ ^[[:alpha:]][[:alnum:]]*$ ]]; then
        clear
        echo $(yellowprint "Database Name can not be empty or have any symbols, and must start with letter")
        zenity --warning \ --title "Error in format" \
            --width 500 \
            --height 100 \
            --text "Database Name can not be empty or have any symbols, and must start with letter"
            clear
            sleep 0.2
            . ./database_menu.sh
       
       
    else
        mkdir $database_name
        echo -e $(yellowprint "Your DataBase $database_name sucessfully created")
        zenity --info \
       --title "Info Message" \
       --width 500 \
       --height 100 \
       --text "Your DataBase $database_name sucessfully created."
        sleep 0.2
        clear
        . ./database_menu.sh

    fi
fi
