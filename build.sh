#!/bin/bash

sudo apt-get update && \
    apt-get install -y \
        build-essential \
        check \
        cmake \
        cython3 \
        libcurl4-openssl-dev \
        libemu-dev \
        libev-dev \
        libglib2.0-dev \
        libloudmouth1-dev \
        libnetfilter-queue-dev \
        libnl-3-dev \
        libpcap-dev \
        libssl-dev \
        libtool \
        libudns-dev \
        python3 \
        python3-dev \
        python3-yaml 

# we need pip3, which is not installed by default
sudo apt-get install python3-pip

# mongo lib - dionaea a besoin d'un lib bson
sudo pip3 install pymongo

# clone the repository
git clone https://github.com/DinoTools/dionaea.git

# start build and install
cd dionaea && \
   mkdir build && \
   cd build && \
   cmake -DCMAKE_INSTALL_PREFIX:PATH=/opt/dionaea .. && \
    make && \
    make install

# remove the build folder
rm -rf build
