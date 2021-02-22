#!/bin/bash -e

BASEDIR=$(mktemp -d)
NAME=waggle-common-tools
ARCH=all

# add package description
mkdir -p $BASEDIR/DEBIAN
cat <<EOF > $BASEDIR/DEBIAN/control
Package: ${NAME}
Version: ${VERSION_LONG}
Maintainer: sagecontinuum.org
Description: Common tools for Waggle OS administration and operations.
Architecture: ${ARCH}
Priority: optional
EOF

# add package tools
cp -pr ROOTFS/* ${BASEDIR}/

# build deb
dpkg-deb --root-owner-group --build $BASEDIR "${NAME}_${VERSION_SHORT}_${ARCH}.deb"
mv *.deb /output/
