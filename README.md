# empire_ami
Home of the AMI building tools for the Official Empire AMI

In order to run the AMI, you'll need to create the file /etc/empire/seed via user data on boot with the following variables:

## For controllers

```
EMPIRE_HOSTGROUP=controller
ECS_CLUSTER
DOCKER_USER
DOCKER_PASS
DOCKER_EMAIL
DOCKER_REGISTRY
```

## For minions

```
EMPIRE_HOSTGROUP=minion
ECS_CLUSTER
DOCKER_USER
DOCKER_PASS
DOCKER_EMAIL
DOCKER_REGISTRY
ENABLE_STREAMING_LOGS
```
