# busybox

A tools box for container network testing and troubleshooting.

The image contains lots of tools, as well as a nginx web server.

## Usage examples

    $ docker run -d wardenlym/busybox

or on host network

    $ docker run --network host -d wardenlym/busybox

    $ docker exec -it <container-name> /bin/bash

    $ kubectl run busybox --image=wardenlym/busybox -i --tty

    $ kubectl create deployment busybox --image=wardenlym/busybox

    $ kubectl exec -it <pod-name> /bin/bash

and for kubernetes daemonset working on host network of each node

    $ kubectl apply -f https://raw.githubusercontent.com/wardenlym/busybox/main/daemonset.yaml

strongly inspired by https://github.com/wbitt/Network-MultiTool