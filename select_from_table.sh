#!/bin/bash
source ./functions.sh

select_menu() {
        echo -ne "
$(yellowprint '\t\t\t*********** select_menu ***********')
\n$(redprint '\t\t\t1)') SELECT ALL DATA FROM TABLE
\n$(blueprint '\t\t\t2)') SELECT SPECIFIC COLUMN
\n$(greenprint '\t\t\t3)') 
\n$(blueprint '\t\t\t4)') Go Back to TABLE MENU
\n$(magentaprint '\t\t\t5)') Go Back to MAIN MENU
\n$(redprint '\t\t\t0)') Exit
\n\t\t\tChoose an option:  "
        read select_menu

        case $select_menu in
        1)
                #ask about table name
                table_name=$(zenity --entry --title="Enter table name")
                for f in *.data; do
                        #if table name exists then show all its data
                        if [ -f "$table_name.data" ]; then
                                clear
                                show_all_data
                        else
                                #if table name does not exist then go back to select menu
                                zenity --error --title="Error" --text="$table_name.data does not exist" --no-wrap
                                . ./select_menu.sh

                        fi
                done
                ;;

        2)
                echo "Select Specific Column"
                #ask about table name
                table_name=$(zenity --entry --title="Enter table name")
                #check if table name exists
                if [ -f "$table_name.data" ]; then
                        #if table name exists then ask about column name
                        echo "Enter column name"
                        column_name=$(zenity --entry --title="Enter column name")

                        check_if_column_exists=$(awk 'BEGIN{FS=":"}{if(NR==1){for(i=1;i<=NF;i++){if($i=="'$column_name'") print i}}}' $table_name.data)
                        #if column name does not exist then error message and back to select menu
                        if [[ $check_if_column_exists == "" ]]; then

                                zenity --error --title="Error" --text="Column does not exist" --no-wrap
                                echo -e "\n\nPress any key to continue"
                                read -s -n1 cont
                                case $cont in
                                *)
                                        clear
                                        . ./select_menu.sh
                                        ;;
                                esac
                        #if column name exists then print its data and go back to select menu
                        else
                                clear
                                column_data=$(awk -F: '{print $"'$check_if_column_exists'"}' $table_name.data)
                                printf "\n$column_data"
                                echo -e "\n\nPress any key to continue"
                                read -s -n1 cont
                                case $cont in
                                *)
                                        clear
                                        . ./select_menu.sh
                                        ;;
                                esac
                        fi

                else
                        #if table name does not exist then go back to select menu
                        zenity --error --title="Error" --text="$table_name.data does not exist" --no-wrap
                        . ./select_menu.sh
                fi
                ;;

        3)
                echo "Select using Where Condition"
                . ./select_menu.sh
                ;;
        4)
                echo "Back to Table Menu"
                . ./table_menu.sh
                ;;
        5)
                echo "Back to Main Menu"
                cd ..
                . ./main_menu.sh
                ;;
        esac
}

select_menu
