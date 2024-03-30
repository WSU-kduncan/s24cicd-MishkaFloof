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




