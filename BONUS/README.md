## Bonus 2 - [Zhu Li, Do the Thing!](https://www.youtube.com/watch?v=mofRHlO1E_A)
## Automated Docker Container Update Process

### Diagram

```mermaid
graph TD;
    DockerHub_Repo["DockerHub Repository"];
    Cron_Job["Cron Job"];
    Update_Check_Script["update-check.sh Script"];
    New_Image["New Image Available?"];
    Update_Containers_Script["update-containers.sh Script"];
    Docker_Containers["Docker Containers"];
    Load_Balancer["Load Balancer"];

    DockerHub_Repo -->|Contains Latest Images| Update_Check_Script;
    Cron_Job -->|Periodically Executes| Update_Check_Script;
    Update_Check_Script -->|Checks for Updates| New_Image;
    New_Image -->|Yes| Update_Containers_Script;
    New_Image -->|No| Cron_Job;
    Update_Containers_Script -->|Updates Containers| Docker_Containers;
    Update_Containers_Script -->|Updates Load Balancer| Load_Balancer;
    Docker_Containers -->|Serves traffic| Load_Balancer;

```
#### Description:

1. **DockerHub Repository:** The DockerHub repository contains the latest Docker images for your web application services.
2. **Cron Job:** A cron job is scheduled to run periodically on each host.
3. **update-check.sh Script:** The cron job executes the `update-check.sh` script, which checks the DockerHub repository for updates.
4. **New Image Available:** If a new image is available on DockerHub, the script pulls the latest image.
5. **update-containers.sh Script:** The script then updates the Docker containers using the `update-containers.sh` script.
6. **Docker Containers:** The Docker containers are restarted with the latest image.

### Documentation
#### Implementation Overview:

* The automation process involves using two bash scripts (`update-check.sh` and `update-containers.sh`) and a cron job to periodically check for updates in the DockerHub repository and update Docker containers accordingly.
* The `update-check.sh` script checks for updates in the DockerHub repository and pulls the latest image if available.
* If a new image is pulled, the script triggers the `update-containers.sh` script to update the Docker containers with the latest image.
* The cron job schedules the execution of the `update-check.sh` script at regular intervals, ensuring that the Docker containers are kept up-to-date.

#### Steps to Recreate:

1. Create Bash Scripts:
    * Create the `update-check.sh` and `update-containers.sh` bash scripts with the provided code.
    * Ensure both scripts have execute permissions (`chmod +x update-check.sh update-containers.sh`).

2. Set Up Cron Job:
    * Open the crontab file for editing using `crontab -e`.
    * Add the following line to schedule the `update-check.sh` script to run every hour:
    `0 * * * * /home/ubuntu/s24cicd-MishkaFloof/BONUS/update-check.sh >> /home/ubuntu/s24cicd-MishkaFloof/BONUS/update-check.log 2>&1`
    * Replace `/home/ubuntu/s24cicd-MishkaFloof/BONUS/update-check.sh` with the actual path to your update-check.sh script.
    * Optionally, specify a log file path to redirect the output of the cron job for monitoring purposes.

3. Configure Docker Containers:
    * Ensure that your Docker containers are configured to use the latest image from DockerHub.
    * Update your `docker-compose.yml` file to specify the image tag or use the latest tag to pull the latest image automatically.

4. Test the Automation:
    * Test the automation by pushing a new image to your DockerHub repository.
    * Monitor the cron job logs (`update-check.log`) to verify that the update process is triggered successfully.
    * Check the Docker container logs or status to ensure that the containers are updated with the latest image.

**Note: Ensure that Docker is installed and configured properly on your hosts before setting up the automation process.**
