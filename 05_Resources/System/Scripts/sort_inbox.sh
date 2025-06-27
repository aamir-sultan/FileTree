#!/usr/bin/env bash

# Define your base folder
BASE="$HOME/Workspace"

# Source folder
INBOX="$BASE/00_Inbox"

# Process each file in Inbox
for file in "$INBOX"/*; do
  # Skip if no files
  [ -e "$file" ] || continue

  case "${file##*.}" in
    pdf|PDF)
      target="$BASE/02_Work/Shared"
      ;;
    md|MD)
      target="$BASE/01_Aamir/Notes"
      ;;
    jpg|jpeg|png|gif)
      target="$BASE/04_Media/Photos"
      ;;
    mp4|mkv|avi)
      target="$BASE/04_Media/Movies"
      ;;
    zip|tar|gz)
      target="$BASE/05_Resources/Installers"
      ;;
    *)
      target="$BASE/00_Inbox/Unsorted"
      ;;
  esac

  echo "Moving: $file -> $target"
  mkdir -p "$target"
  mv "$file" "$target/"
done

