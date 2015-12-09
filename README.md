Repository for syncing dotfile (e.g. .profile, .bashrc).

# usage

Use the provided 'create-links.sh' and 'remove-links.sh' scripts to "install" the dotfiles. This will move any existing .dotfile to .dotfile.old, and create a symlink for .dotfile into the .dotfiles directory.

## install dotfiles
  * clone repo or download zip/tarball
  * move to ~/.dotfiles
  * cd into ~/.dotfiles
  * run ./create-links.sh

## uninstall dotfiles
  * cd into ~/.dotfiles
  * run ./remove-links.sh

# notes

## system files
  * /etc/profile
  * /etc/profile.d/<file>
  * /etc/bash.bashrc
  * /etc/bash.bash_logout

## user files (version controlled)
  * ~/.bash_profile - not used (does not get sourced by login manager)
  * ~/.bash_login - not used
  * ~/.profile - put environment variables here (including PATH)
  * ~/.bashrc - do not put environment variables here, put bash specific customizations here

## machine specific user files (NOT version controlled)
  * ~/.profile.local
  * ~/.bashrc.local

## interactive, login bash shell
  /etc/profile -> /etc/profile.d/* -> [ ~/.bash_profile || ~/.bash_login || ~/.profile ]

## interactive, non-login bash shell
  /etc/bashrc -> ~/.bashrc

However, /etc/profile calls /etc/bashrc, and it's good practice to have your ~/.bash_profile, ~/.bash_login, or ~/.profile source ~/.bashrc

# non-related notes
When setting up a new Mac machine, in order to get brew and paths setup correctly, do the following:

install homebrew

/etc/paths should look like:

    /usr/bin
    /bin
    /usr/sbin
    /sbin
    /usr/local/bin

install newer bash (brew install bash)

add to .profile.local: PATH=/usr/local/bin:${PATH/:\/usr\/local\/bin/}

add /usr/local/bin/bash to /etc/shells

change to use new bash shell: chsh -s /usr/local/bin/bash
