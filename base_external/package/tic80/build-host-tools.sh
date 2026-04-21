#!/bin/bash

# Referenced from Claude Chat Log: https://claude.ai/share/dcab2d1f-6627-4877-890a-af3e6facc60e
set -e

SRC_DIR="$1"
HOST_BUILD_DIR="$SRC_DIR/build-host"

unset CC
unset CXX
unset AR
unset AS
unset LD
unset NM
unset RANLIB
unset STRIP
unset CFLAGS
unset CXXFLAGS
unset LDFLAGS
unset PKG_CONFIG
unset PKG_CONFIG_PATH
unset PKG_CONFIG_SYSROOT_DIR
unset PKG_CONFIG_LIBDIR

rm -rf "$HOST_BUILD_DIR"
mkdir -p "$HOST_BUILD_DIR"

cmake -S "$SRC_DIR" -B "$HOST_BUILD_DIR" \
    -DCMAKE_C_COMPILER=/usr/bin/gcc \
    -DCMAKE_CXX_COMPILER=/usr/bin/g++ \
    -DCMAKE_BUILD_TYPE=MinSizeRel \
    -DBUILD_WITH_ALL=Off \
    -DBUILD_PLAYER=Off \
    -DBUILD_SDL=Off \
    -DBUILD_SOKOL=Off \
    -DBUILD_LIBRETRO=Off \
    -DBUILD_DEMO_CARTS=On \
    -DBUILD_STUB=Off \
    -DUSE_NAETT=Off \
    -DBUILD_WITH_MRUBY=Off \
    -DBUILD_WITH_RUBY=Off

cmake --build "$HOST_BUILD_DIR" --parallel

echo "Host tools built successfully:"
file "$HOST_BUILD_DIR/bin/prj2cart"
file "$HOST_BUILD_DIR/bin/bin2txt"
file "$HOST_BUILD_DIR/bin/wasmp2cart" 2>/dev/null || echo "No wasmp2cart built"