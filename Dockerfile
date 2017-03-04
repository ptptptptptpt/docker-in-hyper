FROM centos:7

RUN yum clean all && yum install e2fsprogs iptables docker -y &&  yum clean all

ADD entrypoint.sh /entrypoint.sh

VOLUME /var/lib/docker

EXPOSE 2375

ENTRYPOINT ["/entrypoint.sh"]

CMD /usr/bin/dockerd-current \
          --add-runtime docker-runc=/usr/libexec/docker/docker-runc-current \
          --host=unix:///var/run/docker.sock \
          --host=tcp://0.0.0.0:2375 \
          --default-runtime=docker-runc \
          --userland-proxy-path=/usr/libexec/docker/docker-proxy-current
