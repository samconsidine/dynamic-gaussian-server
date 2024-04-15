
FROM nvidia/cuda:11.6.2-devel-ubuntu20.04

# preparatory steps
RUN apt-get update

# install tools
RUN apt-get install -y \
    x11-apps \
    xauth

RUN adduser --disabled-password --gecos '' test
USER test
WORKDIR /home/test
