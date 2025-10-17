#!/usr/bin/env bash
set -euo pipefail

# Add i386 architecture and update package list
dpkg --add-architecture i386
apt-get update

# Install base dependencies
apt-get install -y --no-install-recommends \
    wget ca-certificates xz-utils bzip2 tar curl \
    build-essential bc git make flex bison \
    libc6:i386 libstdc++6:i386 zlib1g:i386 \
    libssl-dev libbz2-dev libz-dev libreadline-dev tree

# Clean up
rm -rf /var/lib/apt/lists/*
