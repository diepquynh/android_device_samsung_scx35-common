#!/bin/bash
LOCALDIR=$(pwd)

# Copy the patches
cp ${LOCALDIR}/patches/build.patch ../../../build
cp ${LOCALDIR}/patches/external_tinyalsa.patch ../../../external/tinyalsa
cp ${LOCALDIR}/patches/frameworks_av.patch ../../../frameworks/av

# Apply them
cd ../../..
cd build && patch -p1 < *.patch
cd ../external/tinyalsa && patch -p1 < *.patch
cd ../../frameworks/av && patch -p1 < *.patch
