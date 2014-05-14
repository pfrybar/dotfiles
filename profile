# ~/.profile: executed by the command interpreter for login shells.

# add programs in ~/Software to path
if [[ -d "$HOME/Software" ]]; then
    for PRGDIR in $HOME/Software/*; do
        if [[ -d "$PRGDIR" && -d "$PRGDIR/bin" ]]; then
            PATH="$PATH:$PRGDIR/bin"
        fi
    done
fi

# source local profile if it exists
if [ -f "$HOME/.profile.local" ]; then
    . "$HOME/.profile.local"
fi

# source bashrc if BASH and if it exists
if [ -n "$BASH" ] && [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi
