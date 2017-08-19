#
# Executes commands at the start of an interactive session.
#

# source prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# setup base16-shell for theme compatibility
[[ -n "$PS1" ]] && [[ -s $HOME/.base16-shell/profile_helper.sh ]] && eval "$($HOME/.base16-shell/profile_helper.sh)"

# enable badges/triggers for tilix
if [[ -v TILIX_ID ]] || [[ -v VTE_VERSION ]]; then
    [[ -f /etc/profile.d/vte.sh ]] &&
        source /etc/profile.d/vte.sh
fi

# jump alias to develop
alias j-develop="cd ~/Documents/develop"

# jump alias to repos inside develop with structure '/<server>/<repo>'
for d in ~/Documents/develop/*; do
    for dd in $d/*; do
        for ddd in $dd/*; do
            alias j-$(basename $ddd)="cd $ddd"
        done
    done
done

# load common virtualenv
if [[ -s $HOME/.pyenv/bin/activate ]]; then
    VIRTUAL_ENV_DISABLE_PROMPT=1
    emulate sh -c 'source ~/.pyenv/bin/activate'
fi

# dynamically load nvm/node (too slow)
NVM_DIR="$HOME/.nvm"
if [[ -s $NVM_DIR/nvm.sh ]]; then
    NO_INIT="echo 'nvm not initialized (run load_nvm)'"
    alias nvm=$NO_INIT
    alias node=$NO_INIT
    alias npm=$NO_INIT
    function load_nvm() {
        unalias nvm
        unalias node
        unalias npm
        export NVM_DIR=$NVM_DIR
        source "$NVM_DIR/nvm.sh"
    }
fi

# turn off options
unsetopt CORRECT_ALL
unsetopt CORRECT
