# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

PS1='\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\[\033[1;34m\]$(date +%H:%M)\[\033[0;0m\] $ '

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# enable bash git prompt, and use custom theme in ~/.git-prompt-colors.sh
#     https://github.com/magicmonty/bash-git-prompt
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_THEME=Custom
    . "$HOME/.bash-git-prompt/gitprompt.sh"
elif [ -f /usr/local/share/gitprompt.sh ]; then
    GIT_PROMPT_THEME=Custom
    . /usr/local/share/gitprompt.sh
fi

# enable jenv to manage java versions, with edited export plugin that exports
# $JAVA_VERSION for use in .git-prompt-colors.sh: export JAVA_VERSION=$(jenv version | head -c3)
#     https://github.com/gcuisinier/jenv
if [ -d "$HOME/.jenv/jenv/bin" ]; then
    PATH="$HOME/.jenv/jenv/bin:$PATH"
    eval "$(jenv init -)"
fi

# source local bashrc if it exists
if [ -f "$HOME/.bashrc.local" ]; then
    . "$HOME/.bashrc.local"
fi

# custom aliases
alias la='ls -alh'
