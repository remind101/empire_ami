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
- Remove custom docker upstart job. We enabled this to handle cases where
  /var/run/docker.sock would get mounted as a directory (similar to this
  thread: https://bugzilla.redhat.com/show_bug.cgi?id=1289851) due to a race
  condition when restarting the docker daemon and the ecs-agent upstart task
  respawning. Now we use `--restart=always` when running the ecs-agent to let
  docker manage restarting the ecs-agent process for us.

## 2015-08-04

- docker upstart job removes /var/run/docker.sock if it's a directory (#1)
- docker daemon now uses devicemapper storage driver
- ecs-agent & empire upstart jobs now remove old containers when restarting
- non-master branch pushes are now not published, and only build in us-east-1
