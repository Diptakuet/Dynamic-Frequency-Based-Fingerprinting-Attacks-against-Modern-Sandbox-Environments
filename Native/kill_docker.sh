#!/bin/bash

docker ps -f 'status=running' -aq | xargs docker inspect --format '{{.State.Pid}}' | xargs sudo kill -KILL
