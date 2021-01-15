#!/bin/bash -e

VERSION=0.1
GIT_SHA=$(git rev-parse --short HEAD)

build_dir=$(mktemp -d)

# add package description
mkdir -p $build_dir/DEBIAN
cat <<EOF > $build_dir/DEBIAN/control
Package: sage-common-tools
Version: ${VERSION}-${GIT_SHA}
Maintainer: sagecontinuum.org
Description: Common tools for Sage OS administration and operations.
Architecture: all
Priority: optional
EOF

# add package tools
mkdir -p $build_dir/usr/bin
cp tools/* $build_dir/usr/bin

# build deb
dpkg-deb --build $build_dir "sage-common-tools_${VERSION}_${GIT_SHA}.deb"
