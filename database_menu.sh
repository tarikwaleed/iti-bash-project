#!/usr/bin/env bash
source ./colors.sh

clear
database_menu() {
    echo -ne "
$(blueprint '\t\t*********** DATABASE MENU ***********')
\n$(greenprint '\t\t\t1)') CREATE DATABASE
\n$(redprint '\t\t\t2)') SHOW DATABASES
\n$(greenprint '\t\t\t3)') DROP DATABASE
\n$(magentaprint '\t\t\t4)') CONNECT TO DATABASE
\n$(magentaprint '\t\t\t5)') Go Back to Main Menu
\n$(redprint '\t\t\t0)') Exit
\n\t\t\tChoose an option:  "
    read -r ans
    case $ans in
    1)
        clear 
        
        . ./create_database.sh
        ;;
    2)
        clear
        . ./show_databases.sh
        ;;
    3)
        clear
        . ./drop_database.sh
        ;;
    4)
        clear
        . ./connect_database.sh
        ;;
    5)
        clear
        . ./main_menu.sh
        ;;
    0)
        clear
        fn_bye
        ;;
    *)
        clear
        fn_fail
        ;;
    esac
}
database_menu