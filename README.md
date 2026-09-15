Repository for syncing dotfiles (e.g. .emacs, .zshrc).

# usage

Use the provided `install.sh` script to install the dotfiles. This will move any
existing .dotfile to .dotfile.old, and create a symlink for .dotfile into the
.dotfiles directory.

## install dotfiles
  * clone repo or download zip/tarball
  * move to ~/.dotfiles
  * cd into ~/.dotfiles
  * run ./install.sh

## shell theme

The Tomorrow Night theme from [Tinted Shell](https://github.com/tinted-theming/tinted-shell)
is vendored as `tinted-shell` and linked to `~/.tinted-shell`. Zsh sources it
directly, so no theme manager or separate clone is required on macOS or Linux.
