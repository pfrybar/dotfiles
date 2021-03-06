#!/bin/bash
for f in *; do
    # skip create/remove scripts, README.md, emacs autosave files, and extras directory
    [[ $f == "create-links.sh" ]] || [[ $f == "remove-links.sh" ]] || [[ $f == "README.md" ]] ||
        [[ $f == *~ ]] || [[ $f == "extras" ]] && continue

    # append a . to the file
    df=".$f"

    # if the link exists, remove it
    [[ -h $HOME/$df ]] && rm $HOME/$df

    # if the dotfile exists (and is a file), move it to dotfile.old
    [[ -f $HOME/$df ]] && mv $HOME/$df $HOME/$df.old

    # now create a symlink from $HOME/.dotfile to this file
    dir=`pwd`
    ln -s $dir/$f $HOME/$df
done
