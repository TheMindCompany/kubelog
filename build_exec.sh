#!/bin/bash

cargo build --release
cp target/release/kubelog darwin
rm -rf target

docker build -t buildercontainer:debian -f docker/Dockerfile.debian .
docker create --name=buildercontainer-debian buildercontainer:debian
docker cp buildercontainer-debian:/opt/kubelog/target/release/kubelog debian
docker rm buildercontainer-debian
