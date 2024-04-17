#!/bin/bash

img_name='silverpeas:latest'

sudo taskset -c 1 firecracker-ctr --address /run/firecracker-containerd/containerd.sock \
     run \
     --snapshotter devmapper \
     --runtime aws.firecracker \
     --tty --rm --net-host --cpus 1 \
     --env DB_NAME="Silverpeas" \
     --env DB_USER="silverpeas" \
     --env DB_PASSWORD="thesilverpeaspassword" \
     docker.io/library/$img_name \
     test_container bash
