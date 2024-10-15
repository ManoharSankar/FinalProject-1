#!/bin/bash

# Variables
DOCKERHUB="manoharms"
REPO_NAME="reactapp-dev"
IMAGE_NAME="$DOCKERHUB/$REPO_NAME"
TAG="latest"  

# Server-specific variables
CONTAINER_NAME="react-app-container"
PORT="80"

# Step 1: Pull the latest image from Docker Hub
echo "Pulling the latest image from Docker Hub: $IMAGE_NAME:$TAG..."
docker pull $IMAGE_NAME:$TAG

# Step 2: Stop and remove any running container with the same name
echo "Stopping any running container with the name $CONTAINER_NAME..."
docker stop $CONTAINER_NAME || true

echo "Removing the old container..."
docker rm $CONTAINER_NAME || true

# Step 3: Run a new container with the pulled image
echo "Running the new container..."
docker run -d --name $CONTAINER_NAME -p $PORT:80 $IMAGE_NAME:$TAG
echo "Deployment completed successfully!"

