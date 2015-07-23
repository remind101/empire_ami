SHELL=/bin/bash

us-east-1:
	packer build --only=empire-us-east-1 ./packer.json

us-west-1:
	packer build --only=empire-us-west-1 ./packer.json

us-west-2:
	packer build --only=empire-us-west-2 ./packer.json

ami-all:
	packer build ./packer.json

download-packer:
	mkdir -p $(HOME)/bin
	if [ ! -f $(HOME)/bin/packer ]; then curl --location -O https://dl.bintray.com/mitchellh/packer/packer_0.8.2_linux_amd64.zip && unzip -d $(HOME)/bin packer_0.8.2_linux_amd64.zip; fi

build:
	set -o pipefail; packer -machine-readable build -color=false ./packer.json | tee -a $(CIRCLE_ARTIFACTS)/packer.out
