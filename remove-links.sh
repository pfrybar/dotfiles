#!/bin/bash
for f in *; do
    # skip create/remove scripts, README.md, and any emacs autosave files
    [[ $f == "create-links.sh" ]] || [[ $f == "remove-links.sh" ]] || [[ $f == *~ ]] || [[ $f == "README.md" ]] && continue

    # append a . to the file
    df=".$f"

    # remove the dotfile, if it exists and it's a link
    [[ -h $HOME/$df ]] && rm $HOME/$df

    # if dotfile.old, move it back
    [[ -f $HOME/$df.old ]] && mv $HOME/$df.old $HOME/$df
done
