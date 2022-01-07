# busybox

A tools box for container network testing and troubleshooting.

The image contains lots of tools, as well as a nginx web server.

## Usage examples

basic usage:

    docker run --rm -it wardenlym/busybox bash

or

    kubectl run busybox --image=wardenlym/busybox -i --tty

invoke command with container:

    docker run --rm -it wardenlym/busybox curl www.baidu.com

run as a daemon:

    docker run --rm -d wardenlym/busybox

or on host network with using `HTTP_PORT` and `HTTPS_PORTS`

    docker run --network host -e HTTP_PORT=1180 -e HTTPS_PORT=11443 \
        -p 1180:1180 -p 11443:11443 -d wardenlym/busybox

run as workload in kubernetes cluster:

    kubectl create deployment busybox --image=wardenlym/busybox
    kubectl exec -it <pod-name> /bin/bash

and for kubernetes daemonset working on host network of each node

    kubectl apply -f https://raw.githubusercontent.com/wardenlym/busybox/main/daemonset.yaml

## Thanks

strongly inspired by https://github.com/wbitt/Network-MultiTool
