jenkins-swarm-builder-packer
====================

Docker image with Jenkins Swarm client and [Packer](packer.io) installed. Designed to handle running packer build jobs from Jenkins. Docker is installed in the image to allow Packer to build docker images. Docker and Jenkins Swarm client are managed by supervisord.

Based on the [Jenkins Swarm Worker image](https://github.com/carlossg/jenkins-swarm-slave-docker).
