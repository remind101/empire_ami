SHELL=/bin/bash

ifeq ($(CIRCLE_BRANCH),master)
	TEMPLATE = ./packer.json
else
	TEMPLATE = ./packer.json.dev
endif

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
	set -o pipefail; packer -machine-readable build -color=false $(TEMPLATE) | tee -a $(CIRCLE_ARTIFACTS)/packer.out
