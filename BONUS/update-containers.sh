#!/bin/bash

# Pull the latest image from DockerHub
docker-compose -f /home/ubuntu/s24cicd-MishkaFloof/BONUS/BONUSTemplate.yml pull

# Restart Docker containers, including load balancer
docker-compose -f /home/ubuntu/s24cicd-MishkaFloof/BONUS/BONUSTemplate.yml restart
