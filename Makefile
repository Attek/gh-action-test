#!/usr/bin/make -f
export SHELL := /bin/sh -e

TRIVY_REPOSITORY := lsy-bc/pax-ifc-portal-base
export DOCKER_IMAGE_TAG := megakisfaszom

.PHONY: print-docker-image-tag
print-docker-image-tag:
  @echo ${TRIVY_REPOSITORY}
  @echo ${DOCKER_IMAGE_TAG}
