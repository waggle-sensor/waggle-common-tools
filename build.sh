#!/bin/bash -e

if [ -z "$RELEASE_VERSION" ]; then
    echo "RELEASE_VERSION must be defined"
    exit 1
fi

GIT_SHA=$(git rev-parse --short HEAD)

build_dir=$(mktemp -d)

# add package description
mkdir -p $build_dir/DEBIAN
cat <<EOF > $build_dir/DEBIAN/control
Package: sage-common-tools
Version: ${RELEASE_VERSION}-${GIT_SHA}
Maintainer: sagecontinuum.org
Description: Common tools for Sage OS administration and operations.
Architecture: all
Priority: optional
EOF

# add package tools
mkdir -p $build_dir/usr/bin
cp tools/* $build_dir/usr/bin

# build deb
dpkg-deb --build $build_dir "sage-common-tools_${RELEASE_VERSION}_${GIT_SHA}.deb"
