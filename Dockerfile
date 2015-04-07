FROM csanchez/jenkins-swarm-slave:1.22-jdk-8

USER root

# Install supervisord
RUN apt-get update && apt-get install -y supervisor
RUN mkdir -p /var/log/supervisord
VOLUME /var/log/supervisord

# Install Packer
RUN curl -L https://dl.bintray.com/mitchellh/packer/packer_0.7.5_linux_amd64.zip -o /tmp/packer.zip; unzip /tmp/packer.zip -d /usr/local/bin
