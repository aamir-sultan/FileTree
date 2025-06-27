#!/usr/bin/env bash

BASE="$HOME/Workspace"
ACTIVE="$BASE/03_Projects/Active"
ARCHIVE="$BASE/03_Projects/Archive"

# Check input
if [ -z "$1" ]; then
  echo "Usage: $0 <project_folder>"
  exit 1
fi

PROJECT="$1"
SRC="$ACTIVE/$PROJECT"

if [ ! -d "$SRC" ]; then
  echo "Error: $SRC does not exist."
  exit 1
fi

DATE=$(date +%Y-%m-%d)
DEST="$ARCHIVE/${PROJECT}_archived_$DATE"

echo "Archiving: $SRC -> $DEST"
mv "$SRC" "$DEST"

