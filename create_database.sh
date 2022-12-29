#!/usr/bin/env bash
# -*- coding: utf-8 -*-
source ./helper_functions.sh
# cd ~/bash_db_engine
echo -e "Database Name: "
read database_name
if [ -d ~/bash_db_engine/$database_name ]; then
    echo -e "Database with name $database_name already exists"
else
    create_database $database_name
    echo -e "Would you like to connect to this DB (y/n) ?"
    read confirmation
    if [ $confirmation == "y" ]; then
        cd ~/bash_db_engine/$database_name
        echo "cded into directory"
    fi
fi
