#!/bin/bash
sudo docker pull mishkafloof/project4
sudo docker stop $(sudo docker ps -q --filter ancestor=mishkafloof/project4)
sudo docker rm $(sudo docker ps -aq --filter ancestor=mishkafloof/project4)
sudo docker run -d -p 80:80 mishkafloof/project4

