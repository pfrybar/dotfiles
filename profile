# ~/.profile: executed by the command interpreter for login shells.

# source local profile if it exists
if [ -f "$HOME/.profile.local" ]; then
    . "$HOME/.profile.local"
fi

# source bashrc if BASH and if it exists
if [ -n "$BASH" ] && [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi
