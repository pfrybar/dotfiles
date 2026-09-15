Repository for syncing dotfiles (e.g. .emacs, .zshrc).

# usage

`install.sh` creates symlinks in your home directory that point to files in this
repository. For example, `~/.zshrc` points to `zshrc`. Before replacing an
existing target, the script moves it to the same path with `.old` appended.

## install dotfiles
  * clone repo or download zip/tarball
  * move to ~/.dotfiles
  * cd into ~/.dotfiles
  * run ./install.sh

## shell theme

The Tomorrow Night theme from [Tinted Shell](https://github.com/tinted-theming/tinted-shell)
is vendored as `tinted-shell` and linked to `~/.tinted-shell`. Zsh sources it
directly, so no theme manager or separate clone is required on macOS or Linux.
