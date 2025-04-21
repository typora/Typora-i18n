#!/bin/sh
### Typora i18n development tool
#
# Created by
#  @Hayao0819 / Yamada Hayao <hayao@fascode.net>
#
# Updated by
#  @jlimadev

set -e -u

# Show help message if command is help or empty.
if [ -z "$*" ] || [ "$1" = "help" ]; then
    cat <<EOF
Usage: $0 COMMAND ARGS

Command:
    keys LANG          Show a key list in specified language.
    missing LANG       Show a sorted key list that is not translated.
    old LANG           Show a sorted key list that have been changed and are not currently in use.
    diff LANG          Show differences between Base and the specified language
    percent LANG       Show the percentage that has been translated.
    all-percent        Show the percentage of all languages translated.
    translated LANG    Show the translated text.
    help               Show this help message.

Example:
    keys ja-JP         # This shows key list in Japanese
EOF
    exit 0
fi

# internal function
# This function makes keys list from strings file.
# Usage: make_key <path to .strings file>
make_keys() {
    #grep "=" < "$1" | cut -d "=" -f 1 | sed -e 's/^ *//' -e 's/ *$//' | sort
    grep "=" <"$1" | awk -F "\" *= *\"" '{print $1}' | grep -xv "^$" | sed "s/^\"//g"
}

# internal function
# This function will make ./keys-* dir and store key list to each files
# Usage: make_keyslist <lang>
make_keyslist() {
    if [ -e "./keys-$1/" ]; then
        return 0
    fi

    # make temp dir for each lang
    mkdir -p "./keys-$1"

    # remove file when script exists due to something wrong
    if [ "${TYPORA_I18N_NOCLEAN-""}" != true ]; then
        trap clean_all_keyslist 1 2 3 15
    fi

    # run make_keys and write it to each files
    for _f in ."/${1}.lproj/"*.strings; do
        make_keys "$_f" >"./keys-$1/$(basename "$_f")"
    done
}

# internal function
# This function will make ./keys-* dir and store sorted key list to each files
# Usage: make_keyslist <lang>
make_sorted_keyslist() {
    if [ -e "./keys-$1/" ]; then
        return 0
    fi

    # make temp dir for each lang
    mkdir -p "./keys-$1"

    # run make_keys and write it to each files
    for _f in ."/${1}.lproj/"*.strings; do
        make_keys "$_f" | sort >"./keys-$1/$(basename "$_f")"
    done
}

clean_all_keyslist() {
    # clean up
    [ "${TYPORA_I18N_NOCLEAN-""}" = true ] && return 0
    rm -rf "./keys-"*
}

# Check lang
# Usage: check_lang <lang>
check_lang() {
    # Empty string
    [ -n "${1-""}" ] || {
        echo "Missing argument" >&2
        exit 1
    }

    # Check exists
    [ -d "./${1}.lproj" ] || {
        echo "Unknown lang: $1" >&2
        exit 1
    }
}

# Compare lang and base
# This function has two command functions: old and missing
# Usage: compare_lang <command(old or missing)> <lang> [filename]
# If filename is specified, only show the file
compare_lang() {
    check_lang "${2-""}"

    # make key list
    make_sorted_keyslist "${2}"
    make_sorted_keyslist "Base"

    # diff key list
    for _file in "./keys-Base/"*.strings; do
        if [ -n "${3-""}" ] && [ "$(basename "$_file")" != "${3-""}" ]; then
            continue
        fi

        if ! [ -e "./keys-$2/$(basename "$_file")" ]; then
            echo "Missing file: ./keys-$2/$(basename "$_file")" >&2
            continue
        else
            echo "In $(basename "$_file")"
            if [ "$1" = "old" ]; then
                # Keys present in translation but not in Base
                #grep -xv -f "$_file" "./keys-$2/$(basename "$_file")" | sed "s/^/    /g"
                #join -v 2 "$_file" "./keys-$2/$(basename "$_file")" | sed "s/^/    /g"
                diff "./keys-$2/$(basename "$_file")" "$_file" | grep "^<" | sed "s/^</    /g"
            elif [ "$1" = "missing" ]; then
                # Keys that exist in Base but have not yet been translated
                #grep -xv -f "./keys-$2/$(basename "$_file")" "$_file" | sed "s/^/    /g"
                #join -v 1 "$_file" "./keys-$2/$(basename "$_file")" | sed "s/^/    /g"
                diff "./keys-$2/$(basename "$_file")" "$_file" | grep "^>" | sed "s/^>/    /g"
            fi
        fi
    done

    clean_all_keyslist
}

# Show a key list that is not translated
missing_command() {
    compare_lang "missing" "$@"
}

# Show a key list that there is not in Base
old_command() {
    compare_lang "old" "$@"
}

# Show the difference between Base and specified lang
diff_command() {
    check_lang "${1-""}"

    # make key list
    make_keyslist "${1}"
    make_keyslist "Base"

    # diff key list
    for _file in "./keys-Base/"*.strings; do
        if [ -n "${2-""}" ] && [ "$(basename "$_file")" != "${2-""}" ]; then
            continue
        fi

        if ! [ -e "./keys-$1/$(basename "$_file")" ]; then
            echo "Missing file: ./keys-$1/$(basename "$_file")" >&2
            continue
        else
            echo "In $(basename "$_file")"
            diff "./keys-$1/$(basename "$_file")" "$_file" | sed "s/^/    /g"
        fi
    done

    clean_all_keyslist
}

# Show the percentage that has been translated
percent_command() {
    # Check lang name
    check_lang "${1-""}"

    # make keys-* dir
    make_keyslist "$1"
    make_keyslist "Base"

    _base_lines=$(cat ./keys-Base/*.strings | wc -l)                # Base line number
    _missing_lines=$(missing_command "$1" | grep -c "    " || true) # Count keys which has not been translated yet

    # calculate
    #echo "$(( 100 - _missing_lines * 100 / _base_lines ))%"
    awk "BEGIN{ printf \"%.2f%%\n\", (100 - $_missing_lines * 100 / $_base_lines) }"

    # Remove used files
    clean_all_keyslist
}

# Show the progress of all language
all_percent_command() {
    for lang in ./*.lproj; do
        lang="${lang%".lproj"}"
        lang="${lang#"./"}"

        if [ "$lang" = "." ] || [ "$lang" = "Base" ]; then
            continue
        fi

        echo "$lang: $(percent_command "$lang")"
    done

    # Remove temp files
    clean_all_keyslist
}

# Show a key list to stdout
# Usage: keys_command <lang>
keys_command() {
    check_lang "$@"
    # Run make_keys with all files and print key list
    for file in "./$1.lproj/"*.strings; do
        make_keys "$file"
    done
    unset file
}

translated_command() {
    check_lang "${1-""}"

    # run make_keys and write it to each files
    for _f in ."/${1}.lproj/"*.strings; do
        if [ -n "${2-""}" ] && ! [ "$(basename "$_f")" = "${2-""}" ]; then
            continue
        fi
        grep "=" <"$_f" | awk -F "\" *= *\"" '{print $2}' | grep -xv "^$" | sed -e "s/^\"//g" -e "s/\" *;$//g"
    done
}

# Parse options
TYPORA_I18N_NOCLEAN="${TYPORA_I18N_NOCLEAN-""}"
if [ "$1" = "--noclean" ]; then
    TYPORA_I18N_NOCLEAN=true
    shift 1
fi

# Set command
command="${1-""}"
shift 1 || true

# Run each command
case "${command}" in
"keys")
    keys_command "$@"
    ;;
"missing")
    missing_command "$@"
    ;;
"percent")
    percent_command "$@"
    ;;
"old")
    old_command "$@"
    ;;
"all-percent")
    all_percent_command "$@"
    ;;
"diff")
    diff_command "$@"
    ;;
"translated")
    translated_command "$@"
    ;;
*)
    echo "Undefined command: $command" >&2
    echo "Run help command to show usage." >&2
    exit 1
    ;;
esac
