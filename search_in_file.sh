#!/bin/bash

FILE=""
SEARCH=""

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --file) FILE="$2"; shift ;;
        --search) SEARCH="$2"; shift ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

if [[ -z "$FILE" || -z "$SEARCH" ]]; then
    echo "Usage: $0 --file <file_path> --search <string>"
    exit 1
fi

COUNT=$(grep -o "$SEARCH" "$FILE" | wc -l)

if [ "$COUNT" -gt 0 ]; then
    echo "Number of occurrences: $COUNT"
else
    echo "Не найдено не одного совпадения в файле $(realpath $FILE)"
fi
