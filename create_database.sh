#!/usr/bin/env bash
source ./colors.sh

#Enter name of database and check if it exists.

echo -e $(blueprint "Enter Database Name to Create: ")
read database_name
if [[  -d $database_name ]]; then
    clear
    echo -e $(redprint "Database with name $database_name already exists")

    . ./create_database.sh


#If database's name entered doesn't exist then create database.
else
    mkdir $database_name
    echo -e $(yellowprint "Your DataBase $database_name sucessfully created")
    echo -ne $(blueprint "Would you like to connect to $database_name DataBase?
    press (y) to connect Or any key to go back : ")
    read confirmation
    if [ $confirmation == 'y' ]; 
    then
        cd $database_name
        echo -e $(yellowprint "You have connected to '$database_name' database successfully.")
		echo -e "Press any key to continue"
		read -s -n1  cont
		case $cont in
    		 *)back ../table_menu.sh;;
 		esac
    else 
    . ./database_menu.sh
    fi
fi