#!/usr/bin/env bash
source ./colors.sh
zenity --notification --text "Welcome to our project"
clear
main_menu() {
    echo -e "\n"
    echo -e "\n"
    echo -e "$(greenprint ' \t\t     *   *   *  ******  *    *****    *****   *     *  ****** ')"
    echo -e "$(redprint ' \t\t     *   *   *  *       *    *       *     *  **   **  *      ')"
    echo -e "$(blueprint ' \t\t     *  * *  *  ******  *    *       *     *  * * * *  ****** ')"
    echo -e "$(yellowprint ' \t\t     * *   * *  *       *    *       *     *  *  *  *  *      ')"
    echo -e "$(cyanprint ' \t\t     *       *  ******  ***  *****    *****   *     *  ****** ')"
    echo -e "\n"
    echo -ne "
\n\t$(blueprint '\t\t*********** WELCOME TO OUR PROJECT ***********')
\n\t\t$(greenprint '\t\t\t1)') RUN PROJECT
\n\t\t$(cyanprint '\t\t\t2)') ABOUT  
\n\t\t$(redprint '\t\t\t0)') Exit 
\n\t\t\t\t\tChoose an option:  "
    read -r ans
    case $ans in
    1)
        clear
        . ./database_menu.sh
        ;;
    2)
        clear
        . ./about.sh
        ;;
    0)
        clear
        fn_bye
        ;;
    *)
        clear
        . ./main_menu.sh
        ;;
    esac
}
main_menu