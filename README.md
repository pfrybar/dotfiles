Repository for syncing dotfiles (e.g. .emacs, .zshrc).

# usage

Use the provided `create-links.sh` and `remove-links.sh` scripts to "install" the
dotfiles. This will move any existing .dotfile to .dotfile.old, and create a symlink
for .dotfile into the .dotfiles directory.

## install dotfiles
  * clone repo or download zip/tarball
  * move to ~/.dotfiles
  * cd into ~/.dotfiles
  * run ./create-links.sh

## uninstall dotfiles
  * cd into ~/.dotfiles
  * run ./remove-links.sh

# notes
To enable OpenSSH Agent protocol emulation, and make gpg-agent a drop-in replacement
for ssh-agent, add the following line to ~/.gnupg/gpg-agent.conf:

```enable-ssh-support```

## zsh
Good explaination of zsh and source order here: https://wiki.archlinux.org/index.php/zsh.
