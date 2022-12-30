function validate_user_input() {
    #? the input doesn't include spaces because we are taking the first argumet
    #? passed to the function
    user_input=$@
    first_character_in_input=${user_input:0:1}
    if [[ $# -gt 1 ]]; then
        echo "table/column/ name cann't have spaces"
        return 0
    fi

    if [[ $# -eq 0 ]]; then
        echo "No argument supplied"
        return 0
    fi
    if [[ $first_character_in_input =~ [0-9] ]]; then
        echo "table/column name cann't start with number"
        return 0
    fi

    return 1
}
function touch_file() {
    table_name=$1
    if [[ -f $table_name ]]; then
        return 0

    else
        touch $table_name.data
        touch $table_name.metadata
        return 1
    fi

}
function validate_data_type_input() {
    user_input=$@
    first_character_in_input=${user_input:0:1}
    if [[ $# -gt 1 ]]; then
        echo "datatype cann't have spaces"
        return 0
    fi

    if [[ $# -eq 0 ]]; then
        echo "No argument supplied"
        return 0
    fi
    if [[ $first_character_in_input =~ [sSiI] ]]; then
        return 1
    fi


}
function main_logic() {
    echo "Enter Table name: "
    read table_name
    validate_user_input $table_name
    table_name_is_valid=$?

    if [[ table_name_is_valid -eq 1 ]]; then
        touch_file $table_name
        file_touched_successfully=$?
        if [[ file_touched_successfully -eq 1 ]]; then
            echo "file touched successfully"
            echo "Enter number of columns in the table:"
            read number_of_columns
            typeset -i count=$number_of_columns
            while [[ $count -lt $number_of_columns ]]; do
                #todo: do the following for each column
                #todo: take name of the column from user
                echo "Enter name of column"
                read name_of_column
                #todo: validate that name
                validate_user_input $name_of_column
                column_name_is_valid=$?
                #todo: valid?
                if [[ column_name_is_valid -eq 1 ]]; then
                    #todo: column type
                    echo "Chose column type [(i/s) chose i for integer s for string "
                    read column_type
                    #todo: validate_data_type_input
                    validate_data_type_input $column_type
                    column_type_is_valid=$?
                    #! should be either s or i

                #todo: is_primary_key

                fi

                count=$(($count - 1))
            done

        else
            echo "file already exists"
        fi
    fi
}

validate_data_type_input s
column_type_is_valid=$?
echo $column_type_is_valid
