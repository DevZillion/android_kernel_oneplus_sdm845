#!/bin/bash

pathtoclang=$(pwd)/clang
pathtogcc=$(pwd)/aarch64-linux-android-4.9
path=$(pwd)

cd $path
git clone https://github.com/RaghuVarma331/aarch64-linux-android-4.9.git -b master --depth=1 aarch64-linux-android-4.9
git clone https://github.com/xiangfeidexiaohuo/Snapdragon-LLVM --depth=1 clang
clear

make O=out ARCH=arm64 sdm845_defconfig
PATH=$pathtoclang/bin:$pathtogcc/bin:${PATH} \
make -j$(nproc --all) O=out \
                      ARCH=arm64 \
                      CC=clang \
                      CLANG_TRIPLE=aarch64-linux-gnu- \
                      CROSS_COMPILE=aarch64-linux-android-
