# ~/.bash_profile: executed by the command interpreter for login shells.

# source local bash_profile if it exists
if [ -f "$HOME/.bash_profile.local" ]; then
    source "$HOME/.bash_profile.local"
fi

# source bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi

