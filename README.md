jenkins-swarm-builder-packer
====================

# This repository is now deprecated

For up-to-date instructions checkout:
  - [Jenkins on Container Engine Best Practices](https://cloud.google.com/solutions/jenkins-on-container-engine)
  - [Jenkins on Container Engine Tutorial](https://cloud.google.com/solutions/jenkins-on-container-engine-tutorial)
  - [Customizing Jenkins agent Docker image](https://cloud.google.com/solutions/jenkins-on-container-engine#customizing_the_docker_image)

# This repository is now deprecated

Docker image with Jenkins Swarm client and [Packer](packer.io) installed. Designed to handle running packer build jobs from Jenkins. Docker is installed in the image to allow Packer to build docker images. Docker and Jenkins Swarm client are managed by supervisord.

Based on the [Jenkins Swarm Worker image](https://github.com/carlossg/jenkins-swarm-slave-docker).

Using wrapdocker script from [jpetazzo](https://github.com/jpetazzo/dind/blob/master/wrapdocker)
