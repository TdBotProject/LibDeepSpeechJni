#!/bin/bash

[ -z "$ARCH" ] && ARCH="amd64"
[ -z "$TYPE" ] && TYPE="cpu"
[ -z "$VERSION" ] && VERSION="0.9.3"
REQUIRED_PACKAGES="wget xz-utils default-jdk cmake g++"

sudo apt-get update || apt-get update
sudo apt-get install -y $REQUIRED_PACKAGES || apt-get install -y $REQUIRED_PACKAGES || exit 1
wget -O native-client.tar.xz "https://github.com/mozilla/DeepSpeech/releases/download/v${VERSION}/native_client.${ARCH}.${TYPE}.linux.tar.xz" || exit 1
tar -xf native-client.tar.xz
rm native-client.tar.xz

mkdir build
cd build
cmake ..
cmake --build .

mv libdeepspeech-jni.so ..
