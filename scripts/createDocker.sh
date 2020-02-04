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

 read -p 'ContainerId: ' containerId


# open container in terminal 
docker exec -it $containerId  /bin/bash


# docker tag ubuntu-serverless-tests josephpaulmckenzie/ubuntu-serverless-tests:latest


aws configure set aws_access_key_id AKIAI44QH8DHBEXAMPLE
aws configure set  aws_secret_access_key nYe0f76UN5FQ/nJH3jVDh2MTMhCd33aCY6RcgPKU
aws configure set region us-east-1