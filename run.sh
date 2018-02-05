#!/usr/bin/env bash

[[ ${DEBUG} == 'true' ]] && set -x

GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
GIT_SHA=$(git rev-parse HEAD 2>/dev/null)
RELEASE_IMAGE="quay.io/appvia/kube-toolset:latest"
WORKDIR="/workdir"

usage() {
  cat <<EOF
  Usage: $(basename $0)
  -d|--debug                   : switch on container debugging
  -h|--help                    : display this usage menu
EOF
  if [[ -n $@ ]]; then
    echo "[failed] $@"
    exit 1
  fi
  exit 0
}

run() {
  docker run -it --rm \
    -e DEBUG=${DEBUG:-false} \
    -e GIT_BRANCH=${GIT_BRANCH} \
    -e GIT_SHA=${GIT_SHA} \
    -v ${HOME}/.kube:/root/.kube:ro \
    -v ${HOME}/.ssh:/root/.ssh:ro \
    -v ${PWD}:${WORKDIR} \
    -w ${WORKDIR} \
    ${RELEASE_IMAGE}
}

while [ $# -gt 0 ]; do
  case $1 in
    -d|--debug)       DEBUG=true;     shift 1 ;;
    -h|--help)        usage;                  ;;
    *)                shift;                  ;;
  esac
done

echo "[Release Image] ${RELEASE_IMAGE}"

run
