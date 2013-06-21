# custom aliases
alias la='ls -alhF'

# add 'rm *~' and 'find . -name "*~" -exec rm {} \;'

# source local bash_aliases if it exists
if [ -f "$HOME/.bash_aliases.local" ]; then
    source "$HOME/.bash_aliases.local"
fi
