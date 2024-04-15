#!/bin/bash

#read image

#sudo docker ps -f 'status=running' -aq | xargs sudo docker stop
#sudo docker rm $image
sudo docker ps -f 'status=running' -aq | xargs docker inspect --format '{{.State.Pid}}' | xargs sudo kill -KILL
