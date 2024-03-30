Part 1 - Dockerize it

## CI Project Overview
This project aims to dockerize a website and set up a web server using Docker. The website files will be served using nginx as the web server.

## Run Project
### Install Docker + Dependencies
- Using an EC2 instance:

```
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install latest version
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Verify install
sudo docker run hello-world

```

### Build Docker Image
1. Clone this repository to your local machine.
2. Navigate to the root directory of the repository.
3. Run the following command to build the Docker image: 'docker build -t my-website-image .'

### Run the Container
1. After building the Docker image, run the following command to start a container: `docker run -d -p 80:80 my-website-image`

### View the Project Running in the Container
- Open a web browser.
- Navigate to `http://44.222.7.138:80` to view the website running in the Docker container (the ip address is my aws instance ip).

## Additional Notes
- If you encounter any issues during installation or running the project, refer to Docker's documentation.
- Make sure to customize the Dockerfile and website content according to your specific requirements.


