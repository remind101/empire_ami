us-east-1:
	packer build --only=empire-us-east-1 ./packer.json

us-west-1:
	packer build --only=empire-us-west-1 ./packer.json

us-west-2:
	packer build --only=empire-us-west-2 ./packer.json

ami-all:
	packer build ./packer.json
