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

NVM_DIR="$HOME/.nvm"
if [[ -s $NVM_DIR/nvm.sh ]]; then
    # load nvm as needed (too slow)
    alias node="echo 'nvm not initialized (run load_nvm)'"
    alias npm="echo 'nvm not initialized (run load_nvm)'"
    function load_nvm() {
        unalias node
        unalias npm
        export NVM_DIR=$NVM_DIR
        source "$NVM_DIR/nvm.sh"
    }
fi
