#!/bin/bash
for f in *; do
    # skip this script and any emacs autosave files
    [[ $f == *.sh ]] || [[ $f == *~ ]] && continue

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
