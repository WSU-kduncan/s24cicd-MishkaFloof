## Part 1 - Dockerize it
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


Create DockerHub Account
Go to DockerHub and sign up for an account.
Select the Free tier if prompted.
Once logged in, create a Public Repository on DockerHub.
Set GitHub Secrets
Go to your GitHub repository.
Navigate to Settings > Secrets.
Click on "New repository secret".
<<<<<<< HEAD
Add two secrets: DOCKERUSERNAME and DOCKERPASSWORD, with your DockerHub username and password respectively.
=======
Add two secrets: DOCKER_USERNAME and DOCKER_PASSWORD, with your DockerHub username and password respectively.
>>>>>>> fb72b0c2510c22b70265144138abb79886cebf7d
Set up GitHub Actions Workflow
In your GitHub repository, create a directory named .github/workflows.
Inside this directory, create a YAML file (e.g., docker-build-push.yml) for your GitHub Actions workflow.
Configure the workflow to build and push your Docker image to DockerHub. Below is an example workflow YAML:

```
name: Build and Push Docker Image

on:
  push:
    branches:
      - main

jobs:
  build-and-push:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v2

      - name: Login to DockerHub
        run: docker login -u ${{ secrets.DOCKER_USERNAME }} -p ${{ secrets.DOCKER_PASSWORD }}

      - name: Build and push Docker image
        uses: docker/build-push-action@v2
        with:
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKER_PASSWORD }}
          repository: your-dockerhub-username/your-repository-name
          tag_with_ref: true

```


Replace your-dockerhub-username/your-repository-name with your DockerHub username and the name of your DockerHub repository.

Documentation in README-CI.md
Add the following to your README-CI.md:

Process to Create Public Repo in DockerHub
Go to DockerHub and sign in.
Create a new public repository.
How to Authenticate with DockerHub via CLI
To authenticate with DockerHub via CLI, use the docker login command: `docker login -u your-dockerhub-username -p your-dockerhub-password`

Credentials Recommendation
I recommend providing your DockerHub username and password as the credentials.
How to Push Container Image to DockerHub (without GitHub Actions)
After logging into DockerHub using docker login, build your Docker image: `docker build -t your-dockerhub-username/your-image-name .`

Tag your image: `docker tag your-dockerhub-username/your-image-name your-dockerhub-username/your-repository-name:latest`

Push your image to DockerHub: `docker push your-dockerhub-username/your-repository-name:latest`

Link to Your DockerHub Repository
Provide a link to your DockerHub repository.
Configuring GitHub Secrets
To set a secret in GitHub, go to your repository Settings > Secrets, and click on "New repository secret".
Secrets Set for This Project
<<<<<<< HEAD
Two secrets are set for this project: DOCKERUSERNAME and DOCKERPASSWORD.
Behavior of GitHub Workflow
This GitHub workflow builds and pushes a Docker image to DockerHub whenever changes are pushed to the main branch.
  
Custom variables in the workflow are DOCKERUSERNAME and DOCKERPASSWORD, which are used for authentication with DockerHub.

=======
Two secrets are set for this project: DOCKER_USERNAME and DOCKER_PASSWORD.
Behavior of GitHub Workflow
This GitHub workflow builds and pushes a Docker image to DockerHub whenever changes are pushed to the main branch.
Custom variables in the workflow are DOCKER_USERNAME and DOCKER_PASSWORD, which are used for authentication with DockerHub.




