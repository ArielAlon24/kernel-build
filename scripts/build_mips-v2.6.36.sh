#!/bin/env bash
set -e

echo "[*] Configuring kernel for MIPS Malta"
make malta_defconfig

echo "[*] Building kernel"
make -j"$(nproc)"
