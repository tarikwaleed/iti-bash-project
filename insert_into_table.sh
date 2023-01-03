#!/usr/bin/env bash
function get_number_of_columns() {
    result=$(wc -l $1.metadata | cut -d ' ' -f 1)
    echo $result
}
function get_column_index_by_column_name() {
    column_name=$1
    #? get index by name
    # the ! sign gets the indexes of elements in the array
    # so echo ${!all_columns_names[@]} prints 1 2 3 4
    for i in "${!all_columns_names[@]}"; do
        # unlike other programming languages both = and == has the same effect inside test constructs
        if [[ "${all_columns_names[$i]}" = "${column_name}" ]]; then
            echo "${i}"
        fi
    done
}
function get_column_type_by_index() {
    column_index=$1
    echo ${all_columns_types[$column_index]}
}
# this function takes user_input and column name
# returns 1 if user_input is valid for column

#TODO: get type of each column
all_columns_types=()
all_columns_names=()
all_columns_keys=()
function get_columns_metadata() {
    file_name=$1.metadata
    number_of_columns=$(get_number_of_columns $1)
    declare -i count=0
    while [[ count -lt number_of_columns ]]; do
        # get every line
        column=$(head -$(($count + 1)) $file_name | tail -1)
        column_name=$(echo $column | cut -d: -f1)
        column_type=$(echo $column | cut -d: -f2)
        column_key=$(echo $column | cut -d: -f3)
        all_columns_names+=($column_name)
        all_columns_types+=($column_type)
        all_columns_keys+=($column_key)
        count=$(($count + 1))
    done
    for column_name in ${all_columns_names[@]}; do
        echo "Enter Data for column ${column_name}"

    done

}

get_columns_metadata $1
# echo ${all_columns_names[@]}
# echo ${all_columns_types[@]}
# echo ${all_columns_keys[@]}
