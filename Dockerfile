FROM jenkins/agent:latest-alpine-jdk11
ENV UID=1000 GID=1000
USER root
RUN apk add --update --no-cache --virtual virtual_packages shadow \
  && groupmod -g ${GID} jenkins \
  && usermod -u ${UID} -g ${GID} jenkins \
  && apk del virtual_packages \
  && chown -R jenkins:jenkins /home/jenkins
WORKDIR /home/jenkins
USER jenkins
