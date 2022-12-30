#!/usr/bin/env bash
source ./colors.sh

echo -e "Enter your DataBase name to connect : "
read database_name
#If database's name entered does exist then connect to it.
if [[  -d $database_name ]]; then
    clear
	cd $database_name
	echo -e "You have connected to '$database_name' database successfully."
		echo -e "Press any key to continue"
		read -s -n1  cont
		case $cont in
    		 *) . ../table_menu.sh;;
 		esac
#If the user pressed ESCAPE then press any key to back to database menu.
elif [ $database_name ==  $'\e' ]; then
	echo -e "Press any key to go back to database menu"
	read -s -n1  key
 		case $key in
    		 *) . ./database_menu.sh ;;
 		esac
#If database's name entered doesn't exist then try to connect again.
else
    clear
	echo -e "Connection failed. It seems that '$database_name' doesn't exist."
	. ./connect_database.sh
fi