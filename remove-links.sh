#!/bin/bash
for f in *; do
    # skip this script and any emacs autosave files
    [[ $f == *.sh ]] || [[ $f == *~ ]] && continue

    # append a . to the file
    df=".$f"

    # remove the dotfile, if it exists and it's a link
    [[ -h $HOME/$df ]] && rm $HOME/$df

    # if dotfile.old, move it back
    [[ -f $HOME/$df.old ]] && mv $HOME/$df.old $HOME/$df
done
