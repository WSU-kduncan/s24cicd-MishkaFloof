#!/bin/bash

# Set the DockerHub repository name and tag
REPO_NAME="mishkafloof/project4"
CURRENT_IMAGE=$(docker inspect --format='{{.RepoTags}}' $(docker ps -q) | awk -F '[][]' '{print $2}')

# Pull the latest image from DockerHub
docker pull $REPO_NAME

# Check if the pulled image is different from the currently running one
NEW_IMAGE=$(docker inspect --format='{{.RepoTags}}' $(docker images $REPO_NAME -q) | awk -F '[][]' '{print $2}')

if [[ "$CURRENT_IMAGE" != "$NEW_IMAGE" ]]; then
    echo "New image available. Restarting containers..."
    # Restart Docker containers, including load balancer
    docker-compose -f /home/ubuntu/s24cicd-MishkaFloof/BONUS/BONUSTemplate.yml restart
else
    echo "No new image available."
fi
