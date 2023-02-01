#!/bin/bash

CONTAINER_TAG=gccrs-dreamcast

set -e

docker build \
    -t $CONTAINER_TAG \
    .

# build libronin
docker run \
    --rm -it \
    -v $(pwd):$(pwd) \
    -w=$(pwd)/libronin \
    $CONTAINER_TAG make

# build rust example
docker run \
    --rm -it \
    -v $(pwd):$(pwd) \
    -w=$(pwd)/libronin \
    $CONTAINER_TAG make rust_example

# docker run \
#     --rm -it \
#     -v $(pwd):$(pwd) \
#     -w=$(pwd) \
#     $CONTAINER_TAG "$@"
