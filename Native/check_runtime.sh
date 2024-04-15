#!/bin/bash

echo "Image Name:"

read img

docker inspect -f '{{ .HostConfig.Runtime }}' $img
