#!/usr/bin/env bash

source ./colors.sh

clear

mainmenu() 
{
  echo -e  "\n"              
  echo -e  "\n"              
  echo -e  "$(greenprint  ' \t\t     *   *   *  ******  *    *****    *****   *     *  ****** ' )"  
  echo -e  "$(greenprint  ' \t\t     *   *   *  *       *    *       *     *  **   **  *      ' )" 
  echo -e  "$(greenprint  ' \t\t     *  * *  *  ******  *    *       *     *  * * * *  ****** ' )"
  echo -e  "$(greenprint  ' \t\t     * *   * *  *       *    *       *     *  *  *  *  *      ' )" 
  echo -e  "$(greenprint  ' \t\t     *       *  ******  ***  *****    *****   *     *  ****** ' )"
  echo -e  "\n" 
  echo -e  "$(yellowprint  ' \t  *****   **   ****   ****  *   *      ***        ****   **   *      **   *     *   **   ' )"
  echo -e  "$(yellowprint  ' \t    *    *  *  *   *  *     *  *      *   *       *     *  *  *     *  *  *     *  *  *  ' )"
  echo -e  "$(yellowprint  ' \t    *    ****  ****   ****  * *         **  *     ****  ****  *     ****  * * * *  ****  ')"
  echo -e  "$(yellowprint  ' \t    *    *  *  *   *  *     *  *      *   *          *  *  *  *     *  *  *  *  *  *  *  ')"
  echo -e  "$(yellowprint  ' \t    *    *  *  *   *  ****  *   *      ***  *     ****  *  *  ****  *  *  *     *  *  *  ')"


echo -ne "
\n\t$(blueprint '\t\t*********** ABOUT DESIGNERS ***********')
\n\t\t$(greenprint '\t\t\t)') SALAMA HASSANEIN FATHALLA
\n\t\t$(redprint '\t\t\t)') TARIK WALEED
\n\t\t\t\t\t Press 0 to exit or any key to go back to main menu  "
   
    read confirmation
    if [ $confirmation == 0 ]; 
    then
        exit
    else
        . ./main_menu.sh
    fi
    
}
mainmenu