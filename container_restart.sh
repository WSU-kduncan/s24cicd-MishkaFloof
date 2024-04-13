#!/bin/bash
sudo docker pull yourusername/yourimage
sudo docker stop $(sudo docker ps -q --filter ancestor=yourusername/yourimage)
sudo docker rm $(sudo docker ps -aq --filter ancestor=yourusername/yourimage)
sudo docker run -d -p 80:80 yourusername/yourimage

