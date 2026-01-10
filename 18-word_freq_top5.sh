#!/bin/bash

#Write a script that reads a file and prints the top 5 most repeated words in that file, along with the number of times each word appears.

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 notes.txt"
    exit 1
fi
FILE=$1
if [ ! -f "$FILE" ]; then
    echo "File not found!"
    exit 1
fi

echo "Reading file: $FILE"
cat "$FILE" | tr 'A-Z' 'a-z' | tr -c 'a-z\n' ' ' | tr ' ' '\n' | grep -v '^$' | sort | uniq -c | sort -nr | head -5
# Explanation:
# 1. cat "$FILE": Reads the content of the file.
# 2. tr 'A-Z' 'a-z': Converts all uppercase letters to lowercase
# 3. tr -c 'a-z\n' ' ': Replaces all non-alphabetic characters with spaces.
# 4. tr ' ' '\n': Converts spaces to newlines, so each word is on a new line.
# 5. sort: Sorts the words alphabetically.
# 6. uniq -c: Counts the occurrences of each word.
# 7. sort -nr: Sorts the word counts in numerical reverse order (highest first).
# 8. head -5: Displays the top 5 most frequent words.   
echo "Top 5 most repeated words in '$FILE':"
