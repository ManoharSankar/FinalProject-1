#ContainerName
CONTAINER_NAME="react-app-container"
PORT=80

#stop and remove container
echo "Stopping any existing container..."
docker stop $CONTAINER_NAME || true
docker rm $CONTAINER_NAME || true

#Running the container
echo "Running the new Docker container..."
docker run -d  -it --name $CONTAINER_NAME -p $PORT:80 $IMAGE_NAME

echo "Docker container is up and running"

#pushing the image to dockerhub
docker push $DOCKER_USER/$REPO_NAME:$TAG
