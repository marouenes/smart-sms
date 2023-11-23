# Make uses /bin/sh by default, but we are using some bash features.  On Ubuntu
# /bin/sh is POSIX compliant, ie it's not bash.  So let's be explicit:
SHELL=/bin/bash

INSTALL_DEV_REQS ?= true
PYTHON_VERSION := $(shell python --version | cut -d " " -f 2 | cut -d "." -f 1-2)
GITHUB_REPOSITORY ?= marouenes/creator-io
REPO_ROOT ?= $(shell git rev-parse --show-toplevel)
# Black magic to get module directories
PYTHON_MODULES := $(foreach initpy, $(foreach dir, $(wildcard ies_csc_dm/*), $(wildcard $(dir)/__init__.py)), $(realpath $(dir $(initpy))))

.PHONY: help
help:
	@# Magic line used to create self-documenting makefiles.
	@# See https://stackoverflow.com/a/35730928
	@awk '/^#/{c=substr($$0,3);next}c&&/^[[:alpha:]][[:alnum:]_-]+:/{print substr($$1,1,index($$1,":")),c}1{c=0}' Makefile | column -s: -t

.PHONY: hooks
# Install git hooks.
hooks:
	pre-commit install -t pre-commit \
	&& pre-commit install -t commit-msg
