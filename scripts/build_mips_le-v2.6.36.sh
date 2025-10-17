#!/bin/bash
set -e

echo "[*] Configuring kernel for MIPS Malta"
make malta_defconfig

echo "[*] Building kernel"
make -j"$(nproc)"

echo "[*] Build finished!"
ls -lh arch/mips/boot/

echo "[*] Collecting artifacts"
mkdir -p /out/images
mkdir -p /out/debug
mkdir -p /out/config
mkdir -p /out/headers

cp -v arch/mips/boot/* /out/images/ 2>/dev/null || true
[ -d arch/mips/boot/compressed ] && cp -rv arch/mips/boot/compressed /out/images/

cp -v vmlinux /out/images/

[ -f System.map ] && cp -v System.map /out/debug/
[ -f vmlinux.map ] && cp -v vmlinux.map /out/debug/
[ -f Module.symvers ] && cp -v Module.symvers /out/debug/

cp -v .config /out/config/

[ -d include/generated ] && cp -rv include/generated /out/headers/

echo "[*] Kernel artifacts collected under /out:"
tree -h /out || ls -Rlh /out
