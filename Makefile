#
#  vim:ts=2:sw=2:et
#
NAME=kube-toolset
REGISTRY ?= quay.io
AUTHOR ?= appvia

default: docker

docker:
	@docker build -t ${REGISTRY}/${AUTHOR}/${NAME} .
