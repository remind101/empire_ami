SHELL=/bin/bash

ifeq ($(CIRCLE_BRANCH),master)
	# builds in us-east-1, us-west-1, us-west-2 and exposes to the world
	TEMPLATE = ./packer.json
else
	# Only builds in us-east-1, and doesn't expose to the world
	TEMPLATE = ./packer.json.dev
endif

ifndef CHANGES
	CHANGES=$(shell git log -1 --pretty=%B | head -1 | head -c 255)
endif

ifdef MACHINE
	PACKERCMD=packer -machine-readable build -color=false ./packer.json | tee -a $(CIRCLE_ARTIFACTS)/packer.out
else
	PACKERCMD=packer build ./packer.json
endif

BRANCH=$(shell git rev-parse --abbrev-ref HEAD)

us-east-1:
	packer build --only=empire-us-east-1 $(TEMPLATE)

us-west-1:
	packer build --only=empire-us-west-1 $(TEMPLATE)

us-west-2:
	packer build --only=empire-us-west-2 $(TEMPLATE)

ami-all:
	packer build $(TEMPLATE)

download-packer:
	mkdir -p $(HOME)/bin
	if [ ! -f $(HOME)/bin/packer ]; then curl --location -O https://dl.bintray.com/mitchellh/packer/packer_0.8.2_linux_amd64.zip && unzip -d $(HOME)/bin packer_0.8.2_linux_amd64.zip; fi

build:
	set -o pipefail; CHANGES="$(CHANGES)" BRANCH="$(BRANCH)" GITINFO="$(BRANCH)@$(shell git log -1 --pretty=%H)" packer -machine-readable build -color=false $(TEMPLATE) | tee -a $(CIRCLE_ARTIFACTS)/packer.out
	./files/get_packer_amis $(CIRCLE_ARTIFACTS)/packer.out > $(CIRCLE_ARTIFACTS)/amis.yml
