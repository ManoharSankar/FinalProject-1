#!/bin/bash
#Variables

REPO_NAME="reactapp-dev"
TAG="latest"
DOCKERHUB="manoharms"
#dockerImage 
IMAGE_NAME="my-react-app-image"

echo "Cleaning up old Docker image (if any)..."
docker rmi -f $IMAGE_NAME:$TAG

#Build the image
echo "Building the Docker image: $IMAGE_NAME..."
docker build -t $IMAGE_NAME:$TAG .

#DOCKERLOGIN
docker login -u $DOCKER_USERNAME -p $DOCKER_PASS

#pushing the image to dockerhub
docker tag $IMAGE_NAME $DOCKERHUB/$REPO_NAME
echo "Pushing the Docker image to Docker Hub..."
docker push $DOCKERHUB/$REPO_NAME:$TAG

#ContainerNAME
CONTAINER_NAME="react-app-container"
PORT=80

#stop and remove container
echo "Stopping any existing container..."
docker stop $CONTAINER_NAME || true
docker rm $CONTAINER_NAME || true

#Running the container
echo "Running the new Docker container..."
docker run -it --name $CONTAINER_NAME -p $PORT:80 $IMAGE_NAME

echo "Docker container is up and running"
