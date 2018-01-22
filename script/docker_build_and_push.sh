#!/usr/bin/env bash

docker_build_and_push() {
    docker build -t $1 -f $2 $3 .
    docker build -t ${1/:*/:latest} -f $2 $3 .
    docker push $1
    docker push ${1/:*/:latest}
}
