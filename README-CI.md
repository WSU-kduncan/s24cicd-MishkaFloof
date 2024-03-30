Part 1 - Dockerize it

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
1. After building the Docker image, run the following command to start a container: `docker run -d -p 80:80 my-website-image`


### View the Project Running in the Container
- Open a web browser.
- Navigate to `http://44.222.7.138:80` to view the website running in the Docker container (the ip address is my aws instance ip).

## Additional Notes
- If you encounter any issues during installation or running the project, refer to Docker's documentation.
- Make sure to customize the Dockerfile and website content according to your specific requirements.


