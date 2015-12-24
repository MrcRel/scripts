#!/bin/bash
for FILE in $*; do
    # Dos2unix
    dos2unix "$FILE"

    # Tabs -> spaces
    expand -t 4 "$FILE" > "_$FILE"
    mv "_$FILE" "$FILE"

    # Remove blank lines at the end of file
    sed -i -e :a -e '/^\n*$/{$d;N;};/\n$/ba' $FILE

    # Remove whitespaces at the end of lines
    sed -i 's/[[:blank:]]*$//' "$FILE"
done
