#!/bin/bash
#
#  vim:ts=2:sw=2:et
#
[[ ${DEBUG} == 'true' ]] && set -x

export NC='\e[0m'
export GREEN='\e[0;32m'
export YELLOW='\e[0;33m'
export RED='\e[0;31m'

log()     { (2>/dev/null echo -e "$@"); }
announce() { log "${GREEN}[INFO] $@${NC}"; }
failed()  { log "${YELLOW}[FAIL] $@${NC}"; }
error()   { log "${RED}[ERROR] $@${NC}"; }

export PS1="[kube-toolset@\W] (${YELLOW}${GIT_BRANCH:-"unknown"}${NC}) $ "
export PATH=$PATH:${PLATFORM_DIR}/scripts
