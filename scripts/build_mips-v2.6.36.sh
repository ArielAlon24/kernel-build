#!/bin/env bash
set -e

echo "[*] Generating default config for MIPS Malta"
make malta_defconfig

echo "[*] Adding pcent32 and e1000 as modules"
scripts/config --module CONFIG_PCNET32
scripts/config --module CONFIG_E1000

echo "[*] Using initrd config option"
scripts/config --enable CONFIG_BLK_DEV_INITRD

echo "[*] Enabling CONFIG_HIGHMEM"
scripts/config --enable CONFIG_HIGHMEM
scripts/config --enable CONFIG_HIGHMEM4G

echo "[*] Saving config"
yes "" | make oldconfig

echo "[*] Building kernel"
make -j"$(nproc)" vmlinux

echo "[*] Building modules"
make -j"$(nproc)" modules

echo "[*] Installing modules to /out/modules"
make modules_install INSTALL_MOD_PATH=/out/modules

echo "[*] Building kernel"
make -j"$(nproc)"
