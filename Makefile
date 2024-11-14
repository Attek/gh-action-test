#!/usr/bin/make -f
export SHELL := /bin/sh -e

ifeq ($(ACTUAL_BRANCH),)
	ACTUAL_BRANCH := $(shell git describe --exact-match --tags 2> /dev/null)
endif
ifeq ($(ACTUAL_BRANCH),)
	ACTUAL_BRANCH := $(shell git rev-parse --abbrev-ref HEAD 2> /dev/null)
endif
ifeq ($(ACTUAL_BRANCH),)
	ACTUAL_BRANCH := develop
endif

# Strip the "tags/" prefix and convert "/" characters to "-".
ACTUAL_BRANCH := $(shell echo "${ACTUAL_BRANCH}" | sed 's/^tags\///' | sed 's/\//-/g')
DOCKER_REPOSITORY := lsybc/ifc-portal-cms-development
IMAGE_TAG := base-${ACTUAL_BRANCH}
DOCKER_IMAGE_TAG := ${DOCKER_REPOSITORY}:${IMAGE_TAG}

.PHONY: docker-repository
docker-repository:
	@echo ${DOCKER_REPOSITORY}

.PHONY: docker-image-tag
docker-image-tag:
	@echo ${IMAGE_TAG}

.PHONY: docker-test
docker-test:
	@echo ${DOCKER_IMAGE_TAG}