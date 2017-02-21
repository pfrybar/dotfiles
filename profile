# ~/.profile: executed by the command interpreter for login shells.

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# source local profile if it exists
if [ -f "$HOME/.profile.local" ]; then
    . "$HOME/.profile.local"
fi

# source bashrc if BASH and if it exists
if [ -n "$BASH" ] && [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi
