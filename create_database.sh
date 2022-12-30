#!/usr/bin/env bash
echo -e "Database Name: "
read database_name
if [ -d ~/bash_db_engine/$database_name ]; then
    echo -e "Database with name $database_name already exists"
else
    mkdir -p ~/bash_db_engine/${database_name}
    echo -e "Your Database is created Successfully \n"
    # create_database $database_name
    echo -e "Would you like to connect to this DB (y/n) ?"
    read confirmation
    if [ $confirmation == "y" ]; then
        cd $HOME/bash_db_engine/$database_name
        pwd
        echo "cded into directory"
    fi
fi
