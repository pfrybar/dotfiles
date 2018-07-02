#
# Executes commands at the start of an interactive session.
#

# base16-shell (don't forget to set active theme)
BASE16_SHELL="$HOME/.base16-shell/"
[ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && eval "$("$BASE16_SHELL/profile_helper.sh")"

# setup jump aliases
if [[ -d $HOME/Documents/develop ]]; then
    alias j-develop="cd $HOME/Documents/develop"

    # jump alias to repos inside develop with structure '/<server>/<repo>/'
    for proj in $HOME/Documents/develop/*/*/*/; do
        if [[ -d ${proj}.git ]]; then
            alias j-$(basename $proj)="cd $proj"
        fi
    done
fi

# load common virtualenv
if [[ -s $HOME/.pyenv/bin/activate ]]; then
    VIRTUAL_ENV_DISABLE_PROMPT=1
    emulate sh -c 'source $HOME/.pyenv/bin/activate'
fi

# dynamically load nvm when calling nvm/node/npm (too slow otherwise)
NVM_DIR="$HOME/.nvm"
if [[ -s $NVM_DIR/nvm.sh ]]; then
    function load_nvm() {
        unalias nvm
        unalias node
        unalias npm
        export NVM_DIR=$NVM_DIR
        source "$NVM_DIR/nvm.sh"
    }
    alias nvm="load_nvm && nvm"
    alias node="load_nvm && node"
    alias npm="load_nvm && npm"
fi

# turn off options
unsetopt CORRECT_ALL
unsetopt CORRECT

zstyle ':completion:*' completer _complete _match

# source prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

alias ssh="ssh -A -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
