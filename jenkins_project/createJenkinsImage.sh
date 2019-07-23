#!/bin/bash
git clone https://github.com/jenkinsci/docker.git
cd docker
\cp Dockerfile-centos Dockerfile
### Insert anywhere before ENTRYPOINT
echo 'RUN yum -y install ansible' >> Dockerfile
docker build -t jenk-ans .
