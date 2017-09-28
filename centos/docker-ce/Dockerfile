FROM centos:7.3.1611

#############################
## install common package
#############################
RUN yum install -y curl yum-utils device-mapper-persistent-data lvm2 e2fsprogs iptables && \
    yum clean all

#############################
## install docker
#############################
ENV DOCKER_VERSION=17.09.0
RUN yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo && \
    yum makecache fast && \
    yum install -y docker-ce-${DOCKER_VERSION}.ce-1.el7.centos && \
    yum clean all

#############################
## other
#############################
ADD entrypoint.sh /entrypoint.sh
VOLUME /var/lib/docker
EXPOSE 2375
ENTRYPOINT ["/entrypoint.sh"]

CMD /usr/bin/dockerd \
          --add-runtime docker-runc=/usr/libexec/docker/docker-runc \
          --host=unix:///var/run/docker.sock \
          --host=tcp://0.0.0.0:2375 \
          --default-runtime=docker-runc \
          --userland-proxy-path=/usr/libexec/docker/docker-proxy
