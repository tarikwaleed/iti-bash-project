#!/usr/bin/env bash
source ./colors.sh
clear
table_menu() {
    echo -ne "
$(yellowprint '\t\t*********** table_menu ***********')
\n$(redprint '\t\t\t1)') CREATE TABLE
\n$(blueprint '\t\t\t2)') SHOW TABLES
\n$(greenprint '\t\t\t3)') INSERT INTO TABLE
\n$(redprint '\t\t\t4)') UPDATE TABLE
\n$(blueprint '\t\t\t5)') DROP TABLE
\n$(greenprint '\t\t\t6)') SELECT FROM TABLE
\n$(blueprint '\t\t\t7)') Go Back to DATABASE MENU
\n$(magentaprint '\t\t\t8)') Go Back to MAIN MENU
\n$(redprint '\t\t\t0)') Exit
\n\t\t\tChoose an option:  "
    read -r ans
    case $ans in
    1)
        clear
        . ./create_table.sh     
        ;;
    2)
        clear
        echo "Show tables in selected databse"
        tables_number=$(ls -p *.data | grep -v / | wc -w)
        tables_found=$(ls -p  *.data| grep -v / | column)
        printf "\n$tables_number\n"
        printf "\n$tables_found\n\n"
        ;;
    3)
        clear
        . ./insert_into_table ### not finished
        ;;
    4)
        clear
        . ./update_table.sh ### not finished
        ;;
    5)
        clear
        . ./drop_table.sh ### not finished
        ;;
    6)
        clear
        . ./select_from_table.sh #where conditon not finished
        table_menu
        ;;
    7)
        clear
        . ./database_menu.sh
        ;;
    8)
        clear
        . ./main_menu.sh
        ;;
    0)
        clear
        fn_bye
        ;;
    *)
    clear
        . ./table_menu.sh
        ;;
    esac
}
table_menu