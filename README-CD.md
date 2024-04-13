## CD Project Overview
### What are you doing, why, what tools?

We are implementing Continuous Deployment (CD) for our project to automate the process of deploying new versions of our Docker image to production. This ensures faster delivery of updates and improves overall efficiency. We are using GitHub Actions as our automation tool and Docker Hub as our image repository.

### Behavior of GitHub Workflow
What does it do and when?

The GitHub workflow triggers when a tag is pushed to the repository. It uses the docker/metadata-action to generate Docker image tags based on the Git tag version and pushes the images to Docker Hub with tags corresponding to the Git tag version and latest.

## Part 1 - Semantic Versioning
### Task 1: Generating Semantic Version Tag
To generate a semantic version tag for your commit, you can follow these steps:

1. Determine the type of change introduced:
* Major: Significant changes that may break compatibility.
* Minor: New features added in a backward-compatible manner.
* Patch: Bug fixes or minor improvements without breaking changes.

2. Increase the version number accordingly:
* For a major change, increment the first digit (e.g., 1.0.0 -> 2.0.0).
* For a minor change, increment the second digit (e.g., 1.0.0 -> 1.1.0).
* For a patch, increment the third digit (e.g., 1.0.0 -> 1.0.1).

3. Tag your commit with the generated version:

```

git tag <version>
git push --tags

```
### Task 2: GitHub Action Workflow
To set up a GitHub Action workflow that runs when a tag is pushed and generates tags for Docker images, follow these steps:

1. Amend your existing GitHub Action workflow or create a new one to trigger on tag events:

```
on:
  push:
    tags:
      - '*'
```

2. Use the docker/metadata-action to generate tags based on your repository metadata:

```
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v2

      - name: Generate Docker tags
        uses: docker/metadata-action@v3
        with:
          images: docker.io/yourusername/yourimage
          tags: |
            latest
            ${{ github.ref }}

```

3. Push images to DockerHub with tags based on your Git tag version and latest.

## Part 2 - Deployment

### Step 1: Installing Docker on the Instance

SSH into your EC2 instance and install Docker:

```
sudo apt-get update
sudo apt-get install docker.io
sudo systemctl start docker
sudo systemctl enable docker
```

