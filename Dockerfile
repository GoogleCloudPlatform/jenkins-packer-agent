FROM jpetazzo/dind

# Install supervisord and Java
RUN apt-get update && apt-get install -y supervisor default-jre
VOLUME /var/log/supervisor

# Install Packer
COPY third_party/packer_linux_amd64/* /usr/local/bin/

# Install Jenkins Swarm agent
ENV JENKINS_SWARM_VERSION 1.22
ENV HOME /home/jenkins-slave
RUN useradd -c "Jenkins Slave user" -d $HOME -m jenkins-slave
RUN curl --create-dirs -sSLo /usr/share/jenkins/swarm-client-$JENKINS_SWARM_VERSION-jar-with-dependencies.jar http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/$JENKINS_SWARM_VERSION/swarm-client-$JENKINS_SWARM_VERSION-jar-with-dependencies.jar \
  && chmod 755 /usr/share/jenkins
COPY third_party/carlossg/jenkins-slave.sh /usr/local/bin/jenkins-slave.sh

# Install Docker
RUN wget -qO- https://get.docker.com/ | sh
RUN usermod -aG docker jenkins-slave
COPY wrapdocker /usr/local/bin/wrapdocker

# Run Docker and Swarm processe with supervisord 
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY jenkins-docker-supervisor.sh /usr/local/bin/jenkins-docker-supervisor.sh
ENTRYPOINT ["/usr/local/bin/jenkins-docker-supervisor.sh"]
