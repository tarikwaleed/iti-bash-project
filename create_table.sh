function validate_user_input() {
    #? the input doesn't include spaces because we are taking the first argumet
    #? passed to the function
    user_input=$@
    first_character_in_input=${user_input:0:1}
    if [[ $# -gt 1 ]]; then
        echo "table name cann't have spaces"
        return 0
    fi

    if [[ $# -eq 0 ]]; then
        echo "No argument supplied"
        return 0
    fi
    if [[ $first_character_in_input =~ [0-9] ]]; then
        echo "table name cann't start with number"
        return 0
    fi

    return 1
}
function touch_file() {
    table_name=$1
    if [[ -f $table_name ]]; then
        return 0

    else
        touch $table_name
        return 1
    fi

}

echo "Enter Table name: "
read table_name
validate_user_input $table_name
table_name_is_valid=$?

if [[ table_name_is_valid -eq 1 ]]; then
    touch_file $table_name
    file_touched_successfully=$?
    if [[ file_touched_successfully -eq 1 ]]; then
        echo "file touched successfully"
    else
        echo "file already exists"
    fi
fi
