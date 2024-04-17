#!/bin/bash

sudo firecracker-ctr --address /run/firecracker-containerd/containerd.sock \
     run \
     --snapshotter devmapper \
     --runtime aws.firecracker \
     --rm --tty --net-host --env ARANGO_RANDOM_ROOT_PASSWORD=1 --cpus 1 \
     docker.io/library/arangodb:latest \
     test_container
