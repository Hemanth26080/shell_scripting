#!/bin/bash

ITEM="$1"

if [ ! -e "$ITEM" ]; then
  echo "File or directory does not exist"
  exit 1
fi

if [ -f "$ITEM" ]; then
  echo "File exists"
  [ -r "$ITEM" ] && echo "Readable" || echo "Not readable"
  [ -w "$ITEM" ] && echo "Writable" || echo "Not writable"

elif [ -d "$ITEM" ]; then
  echo "It is a directory. Listing files:"
  ls -l "$ITEM"
fi

