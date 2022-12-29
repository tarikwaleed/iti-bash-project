#!/usr/bin/env bash
# -*- coding: utf-8 -*-
create_database() {
    database_name=$1
    mkdir -p ~/bash_db_engine/${database_name}
    echo -e "Your Database is created Successfully \n"
}