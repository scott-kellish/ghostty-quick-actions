#!/bin/bash
set -euo pipefail
here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "$HOME/.local/bin" "$HOME/Library/Services"

cp "$here/bin/"*.sh "$HOME/.local/bin/"
chmod +x "$HOME/.local/bin/ghostty-open-folder.sh" "$HOME/.local/bin/ghostty-open-folder-claude.sh"

for wf in "$here/workflows/"*.workflow; do
  rm -rf "$HOME/Library/Services/$(basename "$wf")"
  cp -R "$wf" "$HOME/Library/Services/"
done

echo "Installed. Quick Actions will appear in Finder's right-click menu on folders."
