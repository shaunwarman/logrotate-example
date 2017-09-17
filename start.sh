#!/bin/bash

# create log directories
mkdir -m 777 -p nginxlogs
mkdir -m 777 -p applogs

# build and start containers
docker-compose up --build -d
