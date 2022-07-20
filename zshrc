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

# homebrew
HOMEBREW="/opt/homebrew/bin/brew"
[ -s "$HOMEBREW" ] && eval "$($HOMEBREW shellenv)"

# prezto
PREZTO_DIR="${ZDOTDIR:-$HOME}/.zprezto"
[ -s "$PREZTO_DIR/init.zsh" ] && source "$PREZTO_DIR/init.zsh"

# asdf
ASDF_DIR="$HOME/.asdf"
[ -s "$ASDF_DIR/asdf.sh" ] && source "$ASDF_DIR/asdf.sh" && fpath=(${ASDF_DIR}/completions $fpath) && autoload -Uz compinit && compinit
[ -s "$ASDF_DIR/plugins/java/set-java-home.zsh" ] && source "$ASDF_DIR/plugins/java/set-java-home.zsh"

# fzf
[ -s "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"

# local zshrc
[ -s "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
