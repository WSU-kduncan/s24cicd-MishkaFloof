Part 1 - Dockerize it
Tasks
Create new GitHub repo (link to create located in Pilot in Content -> CI/CD Projects)
To your repo in a folder named website, add the contents of your website
this can be a site you created in another class, pet project of yours, or the site in site.tar.gz
if using site.tar.gz put your own flair / text in index.html (#makegradingfunagain)
Install Docker
You can install Docker in WSL2 or in an EC2 instance.
Create a container image that will run a webserver and contains your website
you can use apache2 or nginx as the webserver
Create a Dockerfile and use it to build an image with your website files and dependencies
Add site content & Dockerfile to your repo
Documentation
Create README-CI.md in main folder of your repo that details the following:

CI Project Overview
(what are you doing, why, what tools)
Run Project Locally
how to install docker + dependencies (WSL2, for example)
how to build an image from the Dockerfile
how to run the container
how to view the project running in the container (open a browser...go to IP and port...)



## CI Project Overview
This project aims to dockerize a website and set up a web server using Docker. The website files will be served using nginx as the web server.

## Run Project Locally
### Install Docker + Dependencies
- If using WSL2:
  - Install Docker Desktop for Windows.
  - Enable WSL2 integration in Docker Desktop.
- If using an EC2 instance:
  - Follow Docker's installation guide for Linux.

### Build Docker Image
1. Clone this repository to your local machine.
2. Navigate to the root directory of the repository.
3. Run the following command to build the Docker image: 'docker build -t my-website-image .'


### Run the Container
1. After building the Docker image, run the following command to start a container: 'docker run -d -p 80:80 my-website-image'


### View the Project Running in the Container
- Open a web browser.
- Navigate to `http://44.222.7.138:80` to view the website running in the Docker container (the ip address is my aws instance ip).

## Additional Notes
- If you encounter any issues during installation or running the project, refer to Docker's documentation or seek assistance from the community.
- Make sure to customize the Dockerfile and website content according to your specific requirements.


Create DockerHub Account
Go to DockerHub and sign up for an account.
Select the Free tier if prompted.
Once logged in, create a Public Repository on DockerHub.
Set GitHub Secrets
Go to your GitHub repository.
Navigate to Settings > Secrets.
Click on "New repository secret".
Add two secrets: DOCKER_USERNAME and DOCKER_PASSWORD, with your DockerHub username and password respectively.
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
Two secrets are set for this project: DOCKER_USERNAME and DOCKER_PASSWORD.
Behavior of GitHub Workflow
This GitHub workflow builds and pushes a Docker image to DockerHub whenever changes are pushed to the main branch.
Custom variables in the workflow are DOCKER_USERNAME and DOCKER_PASSWORD, which are used for authentication with DockerHub.



