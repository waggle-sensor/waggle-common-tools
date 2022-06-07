#!/bin/bash -e

docker run --rm \
  -e NAME="waggle-common-tools" \
  -e DESCRIPTION="Common tools for Waggle OS administration and operations." \
  -v "$PWD:/repo" \
  waggle/waggle-deb-builder:latest
