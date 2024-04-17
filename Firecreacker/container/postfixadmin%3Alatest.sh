#!/bin/bash

img_name='postfixadmin:latest'


sudo taskset -c 1 firecracker-ctr --address /run/firecracker-containerd/containerd.sock \
     run \
     --snapshotter devmapper \
     --runtime aws.firecracker \
     --tty --rm --net-host --cpus 1 \
     --env POSTFIXADMIN_DB_TYPE=mysqli \
     --env POSTFIXADMIN_DB_HOST=whatever \
     --env POSTFIXADMIN_DB_USER=user \
     --env POSTFIXADMIN_DB_PASSWORD=topsecret \
     --env POSTFIXADMIN_DB_NAME=postfixadmin \
     docker.io/library/$img_name \
     test_container bash
