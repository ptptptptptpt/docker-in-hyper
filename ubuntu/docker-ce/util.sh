#!/bin/bash

set -e

repo="hyperhq/docker-in-hyper"
tag="ubuntu16.04-17.09.0"
image=${repo}:${tag}


function build(){
    echo "starting build..."
    echo "=============================================================="
    docker build --build-arg http_proxy=${http_proxy} --build-arg https_proxy=${https_proxy} -t ${image} .
}

function push(){
    echo -e "\nstarting push [${image}] ..."
    echo "=============================================================="
    docker push ${image}
}

function run(){
    echo "run 'curl http://127.0.0.1:23750/version' to test"
    echo "start run docker container"
    echo "=============================================================="
    docker run --privileged -it -p 23750:2375 --rm  ${image}
}

case "$1" in
    "push")
        build
        push
        ;;
    "build")
        build
        ;;
    "run")
        run
        ;;
    *)
        cat <<EOF
usage:
    ./util.sh             # show usage
    ./util.sh build       # build only
    ./util.sh push        # build and push
    ./util.sh run         # run dind
EOF
    exit 1
        ;;
esac



echo -e "\n=============================================================="
echo "Done!"
