#!/usr/bin/env bash
set -euo pipefail

# install the emacs packages selected in emacs. once they are all installed this
# does nothing and does not contact the package archives, so it is safe to rerun.
install_emacs_packages() {
    command -v emacs >/dev/null || return 0

    # base16-theme prints a compile warning for each of its themes, so only show
    # the emacs output when the installation fails.
    local output
    if ! output="$(emacs --batch --eval '(package-initialize)' --load "$HOME/.emacs" --eval '
        (unless (cl-every (function package-installed-p) package-selected-packages)
          (package-refresh-contents)
          (package-install-selected-packages t))' 2>&1)"; then
        printf '%s\n' "$output" >&2
        return 1
    fi
}

# claude code shows its first-run screens, including a login prompt, until
# ~/.claude.json has hasCompletedOnboarding, even when CLAUDE_CODE_OAUTH_TOKEN
# already provides a login. see anthropics/claude-code#46259.
skip_claude_onboarding() {
    command -v jq >/dev/null || return 0

    local state="$HOME/.claude.json"
    jq -e '.hasCompletedOnboarding' "$state" >/dev/null 2>&1 && return 0

    [[ -f "$state" ]] || (umask 077 && echo '{}' >"$state")
    (umask 077 && jq '.hasCompletedOnboarding = true' "$state" >"$state.tmp")
    mv "$state.tmp" "$state"
}

install_emacs_packages
skip_claude_onboarding
