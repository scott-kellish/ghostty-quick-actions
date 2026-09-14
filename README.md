# Ghostty Quick Actions

Finder Quick Actions that open a folder in a new [Ghostty](https://ghostty.org) window,
with the window title set to the folder's name.

Two variants:

- **Open in Ghostty** — just opens the terminal in that folder.
- **Open Claude in Ghostty** — does the same, and also launches `claude` in it.

## Install

```
./install.sh
```

This copies:

- `bin/*.sh` → `~/.local/bin/`
- `workflows/*.workflow` → `~/Library/Services/`

No Automator setup needed — the `.workflow` bundles are pre-built and just get copied into place.

## Use

1. In Finder, right-click a folder. Alternatively, select a folder and use the gear icon or Actions menu in the toolbar.
2. Go to **Quick Actions**.
3. Choose **Open in Ghostty** or **Open Claude in Ghostty**.

A new Ghostty window opens in that folder, titled with the folder's name.

If the Quick Actions don't show up in the menu right away, check
**System Settings → Keyboard → Keyboard Shortcuts → Services** and make sure they're enabled.

## Uninstall

```
rm -rf ~/Library/Services/"Open in Ghostty.workflow" ~/Library/Services/"Open Claude in Ghostty.workflow"
rm ~/.local/bin/ghostty-open-folder.sh ~/.local/bin/ghostty-open-folder-claude.sh
```

## How it works

Each Quick Action is an Automator "Run Shell Script" workflow. It receives folders and passes
them as arguments to the corresponding script in `bin/`. The scripts do:

```
open -na Ghostty.app --args --working-directory="$dir" --title="$name"
```

The claude variant adds `-e /usr/local/bin/claude` to that command to also launch claude.

Note: `-e <command>` requires an absolute path — Ghostty invokes it via `login`, which uses a
minimal `PATH` that doesn't include `/usr/local/bin`.
