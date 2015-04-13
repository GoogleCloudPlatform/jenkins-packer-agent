FROM jpetazzo/dind

# Install supervisord and Java
RUN apt-get update && apt-get install -y supervisor default-jre
VOLUME /var/log/supervisor

# Install Packer
COPY third_party/packer_linux_amd64/* /usr/local/bin/

# Install Jenkins Swarm agent
ENV HOME /home/jenkins-agent
RUN useradd -c "Jenkins agent" -d $HOME -m jenkins-agent
RUN curl --create-dirs -sSLo \
    /usr/share/jenkins/swarm-client-jar-with-dependencies.jar \
    http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/1.22/swarm-client-1.22-jar-with-dependencies.jar \
    && chmod 755 /usr/share/jenkins

# Install Docker
RUN wget -qO- https://get.docker.com/ | sh
RUN usermod -aG docker jenkins-agent

# Run Docker and Swarm processe with supervisord 
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY jenkins-docker-supervisor.sh /usr/local/bin/jenkins-docker-supervisor.sh
ENTRYPOINT ["/usr/local/bin/jenkins-docker-supervisor.sh"]
