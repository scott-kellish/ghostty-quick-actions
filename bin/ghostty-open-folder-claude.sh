#!/bin/bash
for dir in "$@"; do
  name=$(basename "$dir")
  open -na Ghostty.app --args --working-directory="$dir" --title="$name" -e "$HOME/.local/bin/claude"
done
