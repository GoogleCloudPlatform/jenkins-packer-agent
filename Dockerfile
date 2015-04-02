FROM csanchez/jenkins-swarm-slave:1.22-jdk-8
USER root
RUN curl -L https://dl.bintray.com/mitchellh/packer/packer_0.7.5_linux_amd64.zip -o /tmp/packer.zip; unzip /tmp/packer.zip -d /usr/local/bin
USER jenkins-slave
