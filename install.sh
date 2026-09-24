#!/usr/bin/env bash
set -euo pipefail

# link $1 to $2, moving anything already at $2 to a backup first.
link() {
    local source="$1" target="$2"
    local backup="$target.old"

    # leave an existing correct link alone.
    if [[ -L "$target" && "$target" -ef "$source" ]]; then
        echo "$target already set up correctly, skipping..."
        return
    fi

    if [[ -e "$target" || -L "$target" ]]; then
        if [[ -e "$backup" || -L "$backup" ]]; then
            echo "$target and $backup already exist, refusing to overwrite backup"
            exit 1
        fi

        mv "$target" "$backup"
    fi

    ln -s "$source" "$target"
}

for f in *; do
    # skip repository metadata, directories linked file by file below, and
    # emacs autosave files
    case "$f" in
        AGENTS.md|Brewfile|CLAUDE.md|claude|install.sh|post-install.sh|README.md|*~)
            continue
            ;;
    esac

    link "$PWD/$f" "$HOME/.$f"
done

# ~/.claude also holds claude code's credentials, history, and caches, so link
# only the tracked files into it.
mkdir -p "$HOME/.claude"
for f in claude/*; do
    link "$PWD/$f" "$HOME/.claude/${f#claude/}"
done
