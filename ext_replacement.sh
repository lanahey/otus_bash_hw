#!/bin/bash

# Парсинг аргументов
FILES=()
EXTENSION=""
REPLACEMENT=""

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --file) FILES+=("$2"); shift ;;
        --extension) EXTENSION="$2"; shift ;;
        --replacement) REPLACEMENT="$2"; shift ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

# Проверка на наличие обязательных параметров
if [[ -z "$EXTENSION" || -z "$REPLACEMENT" || ${#FILES[@]} -eq 0 ]]; then
    echo "Usage: $0 --file <file1> --file <file2> --extension <ext> --replacement <new_ext>"
    exit 1
fi

# Обработка файлов
for FILE in "${FILES[@]}"; do
    BASENAME=$(basename "$FILE")
    DIRNAME=$(dirname "$FILE")
    NEW_NAME="${BASENAME%.$EXTENSION}.$REPLACEMENT"
    mv "$FILE" "$DIRNAME/$NEW_NAME"
    echo "$DIRNAME/$NEW_NAME"
done
