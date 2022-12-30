#!/usr/bin/env bash
source ./colors.sh

#Enter name of table and check if it exists.

echo -e "Enter Table Name to add: "
read table_name
if [[  -f $table_name ]]; then
    clear
    echo -e "Table with name $table_name already exists"
    .. ./create_table.sh

#If Table's name entered doesn't exist then create Table.
else
    touch $table_name
    touch .$table_name
    echo -e "Your Table $table_name sucessfully added"
    echo -e "Press any key to continue"
		read -s -n1  cont
		case $cont in
    		 *) .. ./table_menu.sh;;
 		esac
fi