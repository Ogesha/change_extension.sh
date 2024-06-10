#!/bin/bash
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 filename new_extension"
    exit 1
fi
FILE="$1"
NEW_EXTENSION="$2"
if [ ! -f "$FILE" ]; then
    echo "File $FILE does not exist."
    exit 1
fi
BASENAME="${FILE%.*}"
CURRENT_EXTENSION="${FILE##*.}"
if [ "$CURRENT_EXTENSION" = "$FILE" ]; then
    echo "File has no extension. Adding new extension."
    mv "$FILE" "${FILE}.${NEW_EXTENSION}"
else
    mv "$FILE" "${BASENAME}.${NEW_EXTENSION}"
fi

echo "File extension changed to $NEW_EXTENSION."