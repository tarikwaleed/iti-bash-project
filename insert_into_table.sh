#!/usr/bin/env bash
function get_number_of_columns() {
    result=$(wc -l $1 | cut -d ' ' -f 1)
    echo $result
}
#TODO: get type of each column
function get_columns_types() {
    file_name=$1
    number_of_columns=$(get_number_of_columns $1)
    declare -i count=0
    while [[ count -lt number_of_columns ]]; do
        # get every line
        column=$(head -$(($count + 1)) $file_name | tail -1)
        column_type=$(echo $column | cut -d: -f2)
         
        #! test here
        echo $column_type
        count=$(($count + 1))
    done
}
get_columns_types $1
