FROM csanchez/jenkins-swarm-slave:1.22-jdk-8

USER root

# Install supervisord
RUN apt-get update && apt-get install -y supervisor
RUN mkdir -p /var/log/supervisord
VOLUME /var/log/supervisord

# Install Packer
RUN curl -L https://dl.bintray.com/mitchellh/packer/packer_0.7.5_linux_amd64.zip -o /tmp/packer.zip; unzip /tmp/packer.zip -d /usr/local/bin

# Install Docker
RUN wget -qO- https://get.docker.com/ | sh
RUN systemctl enable docker
RUN usermod -aG docker jenkins-slave
COPY wrapdocker /usr/local/bin/wrapdocker

# Run Docker and Swarm processe with supervisord 
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY jenkins-docker-supervisor.sh /usr/local/bin/jenkins-docker-supervisor.sh
ENTRYPOINT ["/usr/local/bin/jenkins-docker-supervisor.sh"]
