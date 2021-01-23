#!/bin/bash

[ -z "$ARCH" ] && ARCH="amd64"
[ -z "$VERSION" ] && VERSION="0.9.3"
REQUIRED_PACKAGES="wget xz-utils default-jdk-headless"

sudo apt-get install -y $REQUIRED_PACKAGES || apt-get install $REQUIRED_PACKAGES || exit 1
wget -O native-client.tar.xz "https://github.com/mozilla/DeepSpeech/releases/download/v${VERSION}/native_client.${ARCH}.cpu.linux.tar.xz" || exit 1
tar -xf native-client.tar.xz
rm native-client.tar.xz

mkdir build
cd build
cmake ..
cmake --build .

mv libdeepspeech-jni.so ..