# -*- mode: sh -*-
#
# Executes commands at the start of an interactive session.
#

# base16-shell (don't forget to set active theme)
BASE16_SHELL="$HOME/.base16-shell/"
[ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && eval "$("$BASE16_SHELL/profile_helper.sh")"

# turn off autocorrect options
unsetopt CORRECT_ALL
unsetopt CORRECT

zstyle ':completion:*' completer _complete _match

# prezto
[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ] && source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# node/nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && source "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && source "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# fzf
[ -s "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"

# autojump
[ -f "/usr/local/etc/profile.d/autojump.sh" ] && source "/usr/local/etc/profile.d/autojump.sh"
