#!/bin/bash

username=$1
imageName=$2
## Build the image
docker image build -t $username/$imageName .

## Run the images
# docker run -p 49160:8080 -d josephpaulmckenzie/node-web-app 
docker run -t -d  $username/$imageName

# shows all containers including ones that are not running.
docker ps -a
# containerId=$3

 read -p 'ContainerId: ' containerId


# open container in terminal 
docker exec -it bcf06bd96aa4  /bin/bash


# docker tag ubuntu-serverless-tests josephpaulmckenzie/ubuntu-serverless-tests:latest


