#!/bin/bash

set -e

echo "[*] Configuring kernel for MIPS Malta..."
make malta_defconfig

echo "[*] Building kernel..."
make -j"$(nproc)"

echo "[*] Build finished!"

echo "Kernel images are under: arch/mips/boot/"
ls -lh arch/mips/boot/
