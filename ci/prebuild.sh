#!/bin/bash
sudo apt-get -y install build-essential mesa-common-dev libglu1-mesa-dev pkg-config libssl-dev

sudo apt-get -y install bison gperf flex ruby python libdbus-1-dev \
    libasound2-dev libbz2-dev libcap-dev libcups2-dev libdrm-dev \
    libegl1-mesa-dev libgcrypt11-dev libnss3-dev libpci-dev libpulse-dev \
    libudev-dev libxtst-dev gyp ninja-build

sudo apt-get -y install libxcursor-dev libxcomposite-dev libxdamage-dev \
    libxrandr-dev libfontconfig1-dev libxss-dev libsrtp0-dev libwebp-dev \
    libjsoncpp-dev libopus-dev libminizip-dev libavutil-dev libavformat-dev \
    libavcodec-dev libevent-dev
