# docker image backbase-jenkins pushed to https://hub.docker.com/r/simran5mar/backbase-jenkins using this Dockerfile
FROM jenkins/jenkins:latest

# skip initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# installing required plugins
RUN /usr/local/bin/install-plugins.sh kubernetes workflow-job workflow-aggregator git 

# create initial pipeline
COPY create-job.groovy /usr/share/jenkins/ref/init.groovy.d/create-job.groovy

# Installing docker on jenkins master
USER root
RUN apt-get update -qq && \
    apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update  -qq && apt-get install docker-ce=17.12.1~ce-0~debian -y && \
    usermod -aG docker jenkins
