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
