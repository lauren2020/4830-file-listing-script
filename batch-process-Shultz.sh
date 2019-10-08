#! /bin/sh

do_process_file() {
  SIZE="$(du -sh "$1" | cut -f1)"
  WORD_COUNT="$(wc -w "$1" | cut -d' ' -f1)"

  echo "Processing $1 file..."
  echo "Word count: $WORD_COUNT"
  echo "File size: $SIZE"
}

walk() {
  for entry in "$1"/*; do
    #echo "$entry"
    [ -f "$entry" ] && do_process_file "$entry";
  done

  for entry in "$1"/*; do
    #echo "$entry"
    [ -d "$entry" ] && walk "$entry";
  done
}

walk $1
