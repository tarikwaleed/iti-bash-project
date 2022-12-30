function validate_user_input() {
    #? the input doesn't include spaces because we are taking the first argumet
    #? passed to the function
    user_input=$1
    first_character_in_input=${user_input:0:1}
    input_is_valid=1
    if [[ $# -eq 0 ]]; then
        echo "No argument supplied"
        input_is_valid=0
    fi
    if [[ $first_character_in_input =~ [0-9] ]]; then
        echo "table name cann't start with number"
        input_is_valid=0
    fi

    echo $input_is_valid
}
validate_user_input $1
