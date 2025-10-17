#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 1 ]; then
    echo "Usage: $0 <toolchain-url>"
    exit 1
fi

TOOLCHAIN_URL="$1"
WORKDIR=/opt

cd "$WORKDIR"

# Download and extract toolchain
wget -q "$TOOLCHAIN_URL" -O toolchain.tar.bz2
tar -xf toolchain.tar.bz2
rm toolchain.tar.bz2

# Find the extracted toolchain dir
TOOLCHAIN_DIR=$(echo OpenWrt-Toolchain-*/toolchain-*)

# Create a symlink for convenience
ln -s "$TOOLCHAIN_DIR" /opt/toolchain
