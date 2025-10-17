#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 1 ]; then
    echo "Usage: $0 <kernel-tarball-url>"
    echo "Example: $0 https://mirrors.edge.kernel.org/pub/linux/kernel/v2.6/linux-2.6.36.tar.xz"
    exit 1
fi

KERNEL_URL="$1"
WORKDIR=/build

cd "$WORKDIR"

FILENAME=$(basename "$KERNEL_URL")
wget -q "$KERNEL_URL" -O "$FILENAME"

tar -xf "$FILENAME"
rm "$FILENAME"
