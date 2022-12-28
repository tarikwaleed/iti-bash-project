#!/usr/bin/env bash
# -*- coding: utf-8 -*-
create_database() {
    database_name=$1
    mkdir ${database_name}
    echo -e "Your Database is created Successfully \n"
}
cd ~/bash_db_engine
echo -e "Database Name: "
read database_name
if [ -d $database_name ]; then
    echo -e "Database with name $database_name already exists"
else
    create_database $database_name
fi
