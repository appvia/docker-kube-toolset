# Docker Kubernetes Toolset

A toolset image for managing Kubernetes deployments.

### CircleCI Build Status
[![CircleCI](https://circleci.com/gh/appvia/docker-kube-toolset.svg?style=svg)](https://circleci.com/gh/appvia/docker-kube-toolset)

## Overview
This container provides the following utilities to assist in interacting with a Kubernetes Cluster:
- [Kubectl](https://kubernetes.io/docs/reference/kubectl/overview/)
- [KD](https://github.com/UKHomeOffice/kd)

## Build
`make docker`

## Run
```
$ ./run.sh
[Release Image] quay.io/appvia/kube-toolset:latest
[kube-toolset@workdir] (master) $
```
