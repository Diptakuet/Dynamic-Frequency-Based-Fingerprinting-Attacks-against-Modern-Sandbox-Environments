#!/bin/bash

img_name='joomla:latest'

sudo taskset -c 1 firecracker-ctr --address /run/firecracker-containerd/containerd.sock \
     run \
     --snapshotter devmapper \
     --runtime aws.firecracker \
     --tty --rm --net-host --cpus 1 \
     --env JOOMLA_DB_HOST=joomladb \
     --env JOOMLA_DB_USER=joomla \
     --env JOOMLA_DB_PASSWORD=PWORD \
     docker.io/library/$img_name \
     test_container bash

