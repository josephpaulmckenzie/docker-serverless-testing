#!/bin/bash

## Stop and kill all docker containers and images


docker rmi -f $(docker images -aq)
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)


# set -euo pipefail

# for c in $(docker ps -a -f status=exited -f status=created -f status=dead --format="{{.ID}}"); do
#     docker rm $c
# done
# for img in $(docker images -f dangling=true --format="{{.ID}}"); do
#     docker rmi $img
# done