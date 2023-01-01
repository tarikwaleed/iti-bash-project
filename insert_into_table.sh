#!/usr/bin/env bash
#TODO: get number of columns from tablename.metadata
function get_number_of_columns() {
    result=$(wc -l $1)
    echo $result
}
get_number_of_columns  $1