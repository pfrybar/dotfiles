#!/usr/bin/env bash
set -euo pipefail

for f in *; do
    # skip repository metadata and emacs autosave files
    case "$f" in
        Brewfile|install.sh|post-install.sh|README.md|*~)
            continue
            ;;
    esac

    source="$PWD/$f"
    target="$HOME/.$f"
    backup="$target.old"

    # leave an existing correct link alone.
    if [[ -L "$target" && "$target" -ef "$source" ]]; then
        echo "$target already set up correctly, skipping..."
        continue
    fi

    if [[ -e "$target" || -L "$target" ]]; then
        if [[ -e "$backup" || -L "$backup" ]]; then
            echo "$target and $backup already exist, refusing to overwrite backup"
            exit 1
        fi

        mv "$target" "$backup"
    fi

    ln -s "$source" "$target"
done
