#!/bin/bash
#
#  vim:ts=2:sw=2:et
#
[[ -f "/etc/profile.d/bash_completion.sh" ]] && source "/etc/profile.d/bash_completion.sh"
[[ -f "${PLATFORM_DIR}/scripts/environment.sh" ]] && source "${PLATFORM_DIR}/scripts/environment.sh"

## Aliases
alias d="git diff"
alias ll="ls -l"
alias st="git status"
alias vim="vi"
alias ..="cd .."
alias ....="cd ../.."
