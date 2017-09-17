#!/bin/bash

# stop/remove containers
docker-compose down
docker rm $(docker ps -qa)

# clean up logs directory mounted to host
rm -rf applogs nginxlogs

# remove docker volumes
docker volume rm $(docker volume ls)
