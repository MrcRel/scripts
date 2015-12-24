#!/bin/bash
FILE="$1"

dos2unix "$FILE"

# Tabs -> spaces
expand -t4 "$FILE" > "_$FILE"
mv "_$FILE" "$FILE"

# Remove blank lines at the end of file
sed -i -e :a -e '/^\n*$/{$d;N;};/\n$/ba' $FILE

# Remove whitespaces at the end of lines
sed -i 's/[[:blank:]]*$//' "$FILE"
