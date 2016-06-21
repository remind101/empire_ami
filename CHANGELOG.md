# Changelog

## Pending

- The Empire controller is no longer configured within the AMI. The new
  recommended architecture is to run both a Controller and Minion ECS cluster
  and run the Empire Controller as a daemon on the Controller ECS cluster. This
  version of the AMI will run docker, ecs-agent, and logspout on the ECS instances
  that run within the Controller and Minion clusters.
- Update to ansible to version 2.1
- Update ecs-agent to version 1.10.0
- Update docker to version 1.11.2

## 2015-08-04

- docker upstart job removes /var/run/docker.sock if it's a directory (#1)
- docker daemon now uses devicemapper storage driver
- ecs-agent & empire upstart jobs now remove old containers when restarting
- non-master branch pushes are now not published, and only build in us-east-1
