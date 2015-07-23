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
	set -o pipefail; [ ! -f $(HOME)/bin/packer ] && curl --location -O https://dl.bintray.com/mitchellh/packer/packer_0.8.2_linux_amd64.zip && unzip -d /home/ubuntu/bin packer_0.8.2_linux_amd64.zip
