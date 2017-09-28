FROM ubuntu:16.04

RUN apt-get update  &&  apt-get install docker.io cgroup-lite -y  &&  apt-get clean

ADD entrypoint.sh /entrypoint.sh

VOLUME /var/lib/docker

EXPOSE 2375

ENTRYPOINT ["/entrypoint.sh"]

CMD /usr/bin/dockerd --host=tcp://0.0.0.0:2375 --host=unix:///var/run/docker.sock

