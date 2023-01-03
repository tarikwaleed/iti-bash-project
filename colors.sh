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
fn_bye() { echo "Bye bye."; sleep 0.6; exit 0; }
back_to(){ cd .. ;}

### Fuctions used in project
#Show all columns from table
function show_all_data { column -t -s ":" $database_name/$table_name.data;}

#Show specific column --not working yet
#function show_specific_column { column -t -s ":" $column_name | awk '{print $col}' ;}
function show_specific_column { column -t -s ":" $columnrecord ;}

#column -t -s ":"  salama.data | awk '{print $2}' 

