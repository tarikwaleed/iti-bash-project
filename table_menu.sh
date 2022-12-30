#!/usr/bin/env bash
source ./colors.sh
clear

table_menu() {
    echo -ne "
$(yellowprint '\t\t*********** table_menu ***********')
\n$(redprint '\t\t\t1)') CREATE TABLE
\n$(blueprint '\t\t\t2)') SHOW TABLE
\n$(greenprint '\t\t\t3)') ADD TABLE
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
        .. ./create_table.sh
        ;;
    2)
        clear
        db_created
        table_menu
        ;;
    3)
        clear
        db_created
        table_menu
        ;;
    4)
        clear
        db_created
        table_menu
        ;;
    5)
        clear
        db_created
        table_menu
        ;;
    6)
        clear
        db_created
        table_menu
        ;;
    7)
        clear
        DB_Menu
        ;;
    8)
        clear
        mainmenu
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

table_menu