#!/usr/bin/make -f
export SHELL := /bin/sh -e

TRIVY_REPOSITORY := lsy-bc/pax-ifc-portal-base

.PHONY: print-docker-image-tag
print-docker-image-tag:
    echo ${TRIVY_REPOSITORY}
