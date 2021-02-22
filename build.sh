#!/bin/bash -e

if [ -z "$RELEASE_VERSION" ]; then
    echo "RELEASE_VERSION must be defined"
    exit 1
fi

GIT_SHA=$(git rev-parse --short HEAD)

build_dir=$(mktemp -d)
NAME=waggle-common-tools
ARCH=all
VERSION=${RELEASE_VERSION}-${GIT_SHA}

# add package description
mkdir -p $build_dir/DEBIAN
cat <<EOF > $build_dir/DEBIAN/control
Package: ${NAME}
Version: ${VERSION}
Maintainer: sagecontinuum.org
Description: Common tools for Waggle OS administration and operations.
Architecture: ${ARCH}
Priority: optional
EOF

# add package tools
mkdir -p $build_dir/usr/bin
cp tools/* $build_dir/usr/bin

# build deb
dpkg-deb --root-owner-group --build $build_dir "${NAME}_${VERSION}_${ARCH}.deb"
