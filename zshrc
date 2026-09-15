# -*- mode: sh -*-
#
# Executes commands at the start of an interactive session.
#

# ensure function paths do not contain duplicates.
typeset -gU fpath

# turn off autocorrect options
unsetopt CORRECT_ALL
unsetopt CORRECT

# define aliases
alias gb='git branch'
alias gco='git checkout'
alias gc='git commit'
alias gd='git diff'
alias gdc='git diff --cached'
alias gs='git status'
alias gsu='git submodule update'
alias kc='kubectl'
alias kx='kubectx'

# base16-shell (don't forget to set active theme)
BASE16_SHELL="$HOME/.base16-shell/"
[ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && eval "$("$BASE16_SHELL/profile_helper.sh")"

# asdf
asdf_dir="${ASDF_DATA_DIR:-$HOME/.asdf}"
[ -d "$asdf_dir/completions" ] && fpath=("$asdf_dir/completions" $fpath)

# asdf java - set JAVA_HOME
[ -s "$asdf_dir/plugins/java/set-java-home.zsh" ] && source "$asdf_dir/plugins/java/set-java-home.zsh"

# prezto
prezto_dir="${ZDOTDIR:-$HOME}/.zprezto"
[ -s "$prezto_dir/init.zsh" ] && source "$prezto_dir/init.zsh"

# local zshrc
[ -s "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
