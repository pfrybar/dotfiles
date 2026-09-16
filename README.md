# Dotfiles

A small, symlink-based configuration for macOS and Linux. It configures Zsh,
Prezto, Git, tmux, Emacs, asdf, Atuin, and a fixed Tomorrow Night terminal
palette without using a dotfile manager.

`install.sh` links these repository files into `$HOME`:

```text
emacs        -> ~/.emacs
gitconfig    -> ~/.gitconfig
tinted-shell -> ~/.tinted-shell
tmux.conf    -> ~/.tmux.conf
zshenv       -> ~/.zshenv
zprofile     -> ~/.zprofile
zshrc        -> ~/.zshrc
zpreztorc    -> ~/.zpreztorc
zlogin       -> ~/.zlogin
zlogout      -> ~/.zlogout
```

## Requirements

Use current versions of the required tools. Important minimums are Git 2.37,
tmux 3.5, Emacs 27, and standalone asdf 0.16.

## Installation

### Dotfiles only

This assumes Prezto, diff-so-fancy, and other tools are already installed.

```sh
git clone https://github.com/pfrybar/dotfiles.git "$HOME/.dotfiles"
cd "$HOME/.dotfiles"
./install.sh
```

### Full macOS setup

This sequence assumes a fresh machine. Make sure to replace name, email,
and signing key path for git config in the instructions below before running.

```sh
xcode-select --install

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

brew install git zsh tmux emacs asdf diff-so-fancy atuin

git clone --recursive https://github.com/sorin-ionescu/prezto.git "$HOME/.zprezto"
git clone https://github.com/pfrybar/dotfiles.git "$HOME/.dotfiles"
cd "$HOME/.dotfiles"
./install.sh

git config --file "$HOME/.gitconfig.local" user.name "Your Name"
git config --file "$HOME/.gitconfig.local" user.email "you@example.com"
git config --file "$HOME/.gitconfig.local" user.signingKey "path_to_signing_key"

emacs --batch --load "$HOME/.emacs" --eval '(package-refresh-contents)' --eval '(package-install-selected-packages t)'

ZSH_PATH="$(command -v zsh)"
grep -qxF "$ZSH_PATH" /etc/shells || printf '%s\n' "$ZSH_PATH" | sudo tee -a /etc/shells
chsh -s "$ZSH_PATH"
```

## Installer behavior

Run `install.sh` from the repository root and do not move the clone afterward;
its symlinks use absolute paths.

The installer is idempotent:

- Correct symlinks are left unchanged.
- Existing destinations are moved to `<name>.old`.
- Installation stops if both a destination and its backup already exist.
- `install.sh`, `README.md`, hidden entries, and files ending in `~` are skipped.

The file discovery is intentionally dynamic. Do not leave unrelated files in
the repository root, because they would become dotfile links.

## Configuration notes

### Zsh and Prezto

Prezto is an independent recursive clone. The enabled modules are:

```text
environment editor history utility completion syntax-highlighting prompt
```

The shell uses Emacs keybindings, case-sensitive completion, Pure, shared native
history, and syntax highlighting. Command correction and interactive file
operation prompts are disabled. Python environments are activated explicitly:

```sh
source .venv/bin/activate
```

Pure checks Git status and fetches remotes asynchronously. The vendored Tinted
Shell script sends Tomorrow Night palette escape sequences directly to the
terminal; no theme manager is required.

Modern asdf is integrated through `${ASDF_DATA_DIR:-$HOME/.asdf}/shims`.

### Atuin

`zshrc` initializes Atuin after Prezto when the executable is available:

```zsh
eval "$(atuin init zsh --disable-up-arrow)"
```

Atuin owns `Ctrl-R`, while Up retains native Zsh history. Atuin's database and
Prezto's `~/.zsh_history` coexist. Account registration and synchronization are
optional and are not managed here.

### Git

Personal identity and the SSH signing-key path stay in `~/.gitconfig.local`.
Commits are signed automatically. The tracked configuration uses diff-so-fancy,
initializes repositories with `main`, prunes stale remote branches, uses
`zdiff3` conflicts, establishes an upstream on first push, and allows only
fast-forward pulls. A divergent pull must be resolved with an explicit merge or
rebase.

### Emacs

The selected packages are `base16-theme`, `markdown-mode`, and `yaml-mode`.
Tomorrow Night loads when its package is installed. Customize output lives in
`~/.emacs.d/custom.el`, and backups live under `~/.emacs.d/backups`.

### tmux

The prefix is `Ctrl-Space`; pressing it twice sends `Ctrl-Space` to the pane.
Prefix plus `|`, `-`, or `c` creates a split or window in the current directory.
The configuration enables mouse support, extended keys, focus events, OSC 52
clipboard integration, passthrough, and 100,000 lines of history.

`set-clipboard on` lets pane applications, including remote applications, write
to the outer clipboard. `allow-passthrough on` permits notifications and other
terminal sequences.

The `tmux-256color` terminfo entry must exist locally and on remote hosts.

### Local overrides

Machine-specific interactive configuration belongs in `~/.zshrc.local`, which
loads after Prezto and Atuin. Keep identity, credentials, and secrets outside
the repository.

## Updating

```sh
git -C "$HOME/.dotfiles" pull --ff-only

git -C "$HOME/.zprezto" pull --ff-only
git -C "$HOME/.zprezto" submodule sync --recursive
git -C "$HOME/.zprezto" submodule update --init --recursive
```

Rerun `install.sh` only when a new top-level dotfile is added. Updates are never
pulled automatically; Pure's background fetches do not modify working trees.

## Restoring a backup

There is no destructive uninstall script. Remove a repository symlink and move
its backup into place:

```sh
rm "$HOME/.zshrc"
mv "$HOME/.zshrc.old" "$HOME/.zshrc"
```

## Tests

GitHub Actions checks the installer on Linux and macOS, including the Apple
Silicon Homebrew environment. It also tests configuration syntax, Git, Emacs,
tmux, Prezto startup, and Atuin initialization. See the workflow for details.
