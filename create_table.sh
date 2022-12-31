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
function validate_column_type() {
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
    if [ $first_character_in_input == 's' ] || [ $first_character_in_input == 'S' ] || [ $first_character_in_input == 'i' ] || [ $first_character_in_input == 'I' ]; then
        return 1
    fi

}
function validate_number_of_columns() {
    user_input=$1
    regular_expression='^[0-9]+$'
    if ! [[ $user_input =~ $regular_expression ]]; then
        echo "error: Not a number"
        return 0
    else
        return 1
    fi
}

function main_logic() {
    table_name_is_valid=0
    while [[ table_name_is_valid -eq 0 ]]; do
        echo "Enter Table name: "
        read table_name
        validate_user_input $table_name
        table_name_is_valid=$?
        if [[ table_name_is_valid -eq 0 ]]; then
            echo "Invalid input, Try Again"
        fi
    done
    if [[ table_name_is_valid -eq 1 ]]; then
        touch_file $table_name
        file_touched_successfully=$?
        if [[ file_touched_successfully -eq 1 ]]; then
            echo "file touched successfully"
            number_of_columns_is_valid=0
            while [[ number_of_columns_is_valid -eq 0 ]]; do
                echo "Enter number of columns in the table:"
                read number_of_columns
                #TODO: create this function
                validate_number_of_columns $number_of_columns
                number_of_columns_is_valid=$?
                if [[ number_of_columns_is_valid -eq 0 ]]; then
                    echo "Invalid input, Try Again"
                fi

            done

            typeset -i count=0
            declare -i primary_key_determined=0
            while [[ $count -lt $number_of_columns ]]; do
                #? column name
                column_name_is_valid=0
                while [[ column_name_is_valid -eq 0 ]]; do
                    echo "Enter name of column ${count} "
                    read name_of_column
                    validate_user_input $name_of_column
                    column_name_is_valid=$?
                    if [[ column_name_is_valid -eq 0 ]]; then
                        echo "Invalid input, Try Again"
                    fi
                done
                #? column type
                column_type_is_valid=0
                while [[ column_type_is_valid -eq 0 ]]; do
                    echo "Chose column type [(i/s) Enter i for integer s for string "
                    read column_type
                    validate_column_type $column_type
                    column_type_is_valid=$?
                    if [[ column_type_is_valid -eq 0 ]]; then
                        echo "Invalid input, Try Again"
                    fi
                done
                #? is_primary_key
                column_is_primary_key=0
                if [[ primary_key_determined -eq 0 ]]; then
                    echo "Is this column  a primary key: (y/n)"
                    read is_primary_key_choice
                    if [[ is_primary_key_choice == 'y' || is_primary_key_choice == 'Y' ]]; then
                        primary_key_determined=1
                        column_is_primary_key=1
                    fi
                    echo $name_of_column:$column_type:$column_is_primary_key
                fi

                count=$(($count + 1))
            done

        else
            echo "file already exists"
        fi
    fi
}
main_logic
