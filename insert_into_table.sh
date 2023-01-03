#!/usr/bin/env bash
#if [[ ! "$database_name" =~  ^[[:alpha:]][[:alnum:]]*$  ]]
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
function main_logic() {
    metadata_file=$1.metadata
    data_file=$1.data
    number_of_columns=$(get_number_of_columns $1)
    declare -i count=0
    while [[ count -lt number_of_columns ]]; do
        # get every line
        column=$(head -$(($count + 1)) $metadata_file | tail -1)
        column_name=$(echo $column | cut -d: -f1)
        column_type=$(echo $column | cut -d: -f2)
        column_key=$(echo $column | cut -d: -f3)
        all_columns_names+=($column_name)
        all_columns_types+=($column_type)
        all_columns_keys+=($column_key)
        count=$(($count + 1))
    done
    row_data=()
    for column_name in ${all_columns_names[@]}; do
        column_index=$(get_column_index_by_column_name $column_name)
        column_type=$(get_column_type_by_index $column_index)
        is_primary_key=${all_columns_keys[$column_index]}
        declare -i valid_input=0
        while [[ $valid_input -eq 0 ]]; do
            echo "Enter Data for column ${column_name} of type ${column_type}"
            read column_data

            if [[ $column_type == 'i' ]]; then
                if [[ ! $column_data =~ ^[0-9]+$ ]]; then
                    echo "Invalid input, provided data should be of type integer"
                    valid_input=0
                else
                    valid_input=1
                fi
            elif [[ $column_type == 's' ]]; then
                if [[ $column_name = 'email' ]]; then
                    if [[ ! $column_data =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$ ]]; then
                        echo "Invalid email format"
                        valid_input=0
                    else
                        valid_input=1
                    fi

                elif [[ ! $column_data =~ ^[[:alpha:]]*$ ]]; then
                    echo "Invalid input, provided data should be of type string [NO white spaces allowed]"
                    valid_input=0
                else
                    valid_input=1
                fi

            fi
        done
        row_data+=($column_data)
    done
    # kda we've got all the data, and it's valid inshallah
    temp=${row_data[@]}

    #substiture every occurence of white space with colon
    final_record=${temp// /:}
    echo $final_record >>$data_file
    echo "Row inserted successfully"
}

main_logic $1
# echo ${all_columns_names[@]}
# echo ${all_columns_types[@]}
# echo ${all_columns_keys[@]}
