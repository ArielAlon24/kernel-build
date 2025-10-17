#!/usr/bin/env bash
set -euo pipefail

OUT_DIR=/out
ARCH_DIR="arch/${ARCH}"

echo "[*] Collecting artifacts for ARCH=${ARCH}"

mkdir -p "$OUT_DIR/images" "$OUT_DIR/debug" "$OUT_DIR/headers"

if [ -f "$ARCH_DIR/boot/vmlinux" ]; then
    echo "[*] Found vmlinux under $ARCH_DIR/boot/"
    cp -v "$ARCH_DIR/boot/vmlinux" "$OUT_DIR/images/"
elif [ -f "vmlinux" ]; then
    echo "[*] Found vmlinux in project root"
    cp -v vmlinux "$OUT_DIR/images/"
elif [ -f "$ARCH_DIR/boot/vmlinuz" ]; then
    echo "[*] Found vmlinuz under $ARCH_DIR/boot/"
    cp -v "$ARCH_DIR/boot/vmlinuz" "$OUT_DIR/images/"
elif [ -f "vmlinuz" ]; then
    echo "[*] Found vmlinuz in project root"
    cp -v vmlinuz "$OUT_DIR/images/"
else
    echo "[!] No vmlinux or vmlinuz found! Checking for other boot images..."
    if compgen -G "$ARCH_DIR/boot/*" > /dev/null; then
        cp -v $ARCH_DIR/boot/* "$OUT_DIR/images/" || true
    else
        echo "[!] No kernel image artifacts detected."
    fi
fi

[ -f System.map ]     && cp -v System.map     "$OUT_DIR/debug/"
[ -f vmlinux.map ]    && cp -v vmlinux.map    "$OUT_DIR/debug/"
[ -f Module.symvers ] && cp -v Module.symvers "$OUT_DIR/debug/"

[ -f .config ] && cp -v .config "$OUT_DIR/config"

[ -d include/generated ] && cp -rv include/generated "$OUT_DIR/headers/"

echo "[*] Kernel artifacts collected under $OUT_DIR:"
tree -h $OUT_DIR
