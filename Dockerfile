FROM jenkins/jenkins:alpine

ENV JENKINS_USER admin
ENV JENKINS_PASS admin

# Skip initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

ARG JENKINS_HOME=/var/jenkins_home
COPY plugins.txt /usr/share/jenkins/plugins.txt
COPY ci-demo /usr/share/jenkins/ref/jobs/ci-demo
#COPY ci-demo /var/jenkins_home/jobs/
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt
USER root
RUN apk add docker
RUN apk add py-pip
RUN apk add python-dev libffi-dev openssl-dev gcc libc-dev make
USER jenkins

