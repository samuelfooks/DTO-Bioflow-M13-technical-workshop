#!/bin/bash

# This script watches for changes in Markdown files and automatically converts them to HTML using Marp CLI.
echo "Starting watch script..."
inotifywait -m -r -e close_write --format '%w%f' ./ | while read FILE
do
  echo "Detected file change: $FILE"
  if [[ $FILE == *.md ]]; then
    echo "Processing Markdown file: $FILE"
    npx @marp-team/marp-cli@latest "$FILE" -o "${FILE%.md}.html" --no-stdin
  fi
done