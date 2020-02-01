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
containerId=$3
# open container in terminal 
# $ docker exec -it 6e91b600e57c /bin/bash


