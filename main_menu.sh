#!/usr/bin/env bash

### Colors ##
ESC=$(printf '\033') RESET="${ESC}[0m" BLACK="${ESC}[30m" RED="${ESC}[31m"
GREEN="${ESC}[32m" YELLOW="${ESC}[33m" BLUE="${ESC}[34m" MAGENTA="${ESC}[35m"
CYAN="${ESC}[36m" WHITE="${ESC}[37m" DEFAULT="${ESC}[39m"

### Color Functions ##

greenprint() { printf "${GREEN}%s${RESET}\n" "$1"; }
blueprint() { printf "${BLUE}%s${RESET}\n" "$1"; }
redprint() { printf "${RED}%s${RESET}\n" "$1"; }
yellowprint() { printf "${YELLOW}%s${RESET}\n" "$1"; }
magentaprint() { printf "${MAGENTA}%s${RESET}\n" "$1"; }
cyanprint() { printf "${CYAN}%s${RESET}\n" "$1"; }
db_created() { echo; echo "DataBase created"; }
db_connected() { echo; echo "Connected to DataBase."; }
fn_bye() { echo "Bye bye."; exit 0; }
fn_fail() { echo "Wrong option."; exit 1; }

Selected_Database() {
    echo -ne "
$(yellowprint '\t\t*********** Selected_Database ***********')
\n$(redprint '\t\t\t1)') CREATE TABLE
\n$(blueprint '\t\t\t2)') LIST TABLE
\n$(greenprint '\t\t\t3)') INSERT TABLE
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
        Selected_Database
        ;;
    2)
        clear
        db_created
        Selected_Database
        ;;
    3)
        clear
        db_created
        Selected_Database
        ;;
    4)
        clear
        db_created
        Selected_Database
        ;;
    5)
        clear
        db_created
        Selected_Database
        ;;
    6)
        clear
        db_created
        Selected_Database
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

DB_Menu() {
    echo -ne "
$(blueprint '\t\t*********** DATABASE MENU ***********')
\n$(greenprint '\t\t\t1)') CREATE DATABASE
\n$(redprint '\t\t\t2)') LIST DATABASE
\n$(greenprint '\t\t\t3)') DROP DATABASE
\n$(magentaprint '\t\t\t4)') CONNECT TO DATABASE
\n$(magentaprint '\t\t\t5)') Go Back to Main Menu
\n$(redprint '\t\t\t0)') Exit
\n\t\t\tChoose an option:  "
    read -r ans
    case $ans in
    1)
        clear 
        
        ./create_database.sh
        ;;
    2)
        clear
        mainmenu
        ;;
    3)
        clear
        mainmenu
        ;;
    4)
        clear
        mainmenu
        ;;
    5)
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

mainmenu() {
  echo -e  "\n"              
  echo -e  "\n"              
  echo -e  "$(greenprint  ' \t\t     *   *   *  ******  *    *****    *****   *     *  ****** ' )"  
  echo -e  "$(greenprint  ' \t\t     *   *   *  *       *    *       *     *  **   **  *      ' )" 
  echo -e  "$(greenprint  ' \t\t     *  * *  *  ******  *    *       *     *  * * * *  ****** ' )"
  echo -e  "$(greenprint  ' \t\t     * *   *    *       *    *       *     *  *  *  *  *      ' )" 
  echo -e  "$(greenprint  ' \t\t     *       *  ******  ***  *****    *****   *     *  ****** ' )"
  echo -e  "\n" 
  echo -e  "$(yellowprint  ' \t  *****   **   ****   ****  *   *      ***        ****   **   *      **   *     *   **   ' )"
  echo -e  "$(yellowprint  ' \t    *    *  *  *   *  *     *  *      *   *       *     *  *  *     *  *  *     *  *  *  ' )"
  echo -e  "$(yellowprint  ' \t    *    ****  ****   ****  * *         **  *     ****  ****  *     ****  * * * *  ****  ')"
  echo -e  "$(yellowprint  ' \t    *    *  *  *   *  *     *  *      *   *          *  *  *  *     *  *  *  *  *  *  *  ')"
  echo -e  "$(yellowprint  ' \t    *    *  *  *   *  ****  *   *      ***  *     ****  *  *  ****  *  *  *     *  *  *  ')"


echo -ne "
\n\t$(blueprint '\t\t*********** WELCOME TO OUR PROJECT ***********')
\n\t\t$(greenprint '\t\t\t1)') RUN PROJECT 
\n\t\t$(redprint '\t\t\t0)') Exit 
\n\t\t\t\t\tChoose an option:  "
    read -r ans
    case $ans in
    1)
        clear
        DB_Menu
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
mainmenu