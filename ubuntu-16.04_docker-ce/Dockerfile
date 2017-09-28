FROM  ubuntu:16.04
MAINTAINER Jimmy Xu <jimmy@hyper.sh>

#########################################
##              install docker         ##
#########################################

ENV DOCKER_VERSION=17.06.0

RUN apt-get update && apt-get install -y \
    apt-transport-https ca-certificates curl software-properties-common && \
    apt-get clean && \
    rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
          apt-key fingerprint 0EBFCD88  &&\
          add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

RUN apt-get update && apt-get install -y docker-ce cgroup-lite && \
    apt-get clean && \
    rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/*

#########################################
##                 other               ##
#########################################
ADD entrypoint.sh /entrypoint.sh

VOLUME /var/lib/docker

EXPOSE 2375

ENTRYPOINT ["/entrypoint.sh"]

CMD /usr/bin/dockerd --host=tcp://0.0.0.0:2375 --host=unix:///var/run/docker.sock

