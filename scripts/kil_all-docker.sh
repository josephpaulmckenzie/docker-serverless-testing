#!/bin/bash

## Stop and kill all docker containers and images


docker rmi -f $(docker images -aq)
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

