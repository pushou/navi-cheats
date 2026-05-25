---
nom: qemu.cheat
description: Cheatsheet navi — QEMU/KVM : création disque, VM macOS et Windows, conversion images, sparsify
type: source
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - qemu
  - virtualization
  - kvm
  - vm
  - virt-install
  - cheat-sheet
  - navi
sources: []
---

# Source : qemu.cheat

> Cheatsheet navi original de pushou, catégorisé `category:virtualization`.

## Description

Fichier de cheatsheet navi contenant des commandes QEMU/KVM pour la gestion de machines virtuelles :
1. **Création de disque** — `qemu-img create` pour créer des images QCOW2
2. **VM macOS (HVF)** — Ligne de commande QEMU avec accélération Apple Hypervisor Framework
3. **VM Windows (Linux)** — `virt-install` pour créer une VM Windows 11 avec UEFI Secure Boot et TPM
4. **Conversion d'images** — `qemu-img convert` VMDK vers QCOW2
5. **Sparsification** — `virt-sparsify` pour compacter une image disque

## Métadonnées

| Champ | Valeur |
|-------|--------|
| Fichier | `sources/qemu.cheat` |
| Auteur | pushou |
| Tags | `qemu, virtualization, kvm, vm, virt-install, category:virtualization` |
| Sections | 5 |
| Type | Cheatsheet navi |

## Pages wiki alimentées

- [[entites/qemu.md]] — Page d'entité QEMU
- [[entites/libvirt.md]] — Page d'entité Libvirt/virsh (section virt-install)

## Contenu brut

```
% qemu,virtualization,kvm,vm,virt-install,category:virtualization,pushou

# create disk
qemu-img create -f qcow2 <DISK_NAME>.img <DISK_SIZE>


# create vm (macos hvf)
qemu-system-x86_64
-m 2048 \
-vga virtio \
-display cocoa,show-cursor=on \
-usb \
-device usb-tablet \
-drive file=./ubuntu-22.04-amd64.qcow2,if=virtio \
-device e1000,netdev=net0 \
-netdev user,id=net0,hostfwd=tcp::10022-:22 \
-accel hvf \
-cpu Penryn,vendor=GenuineIntel

# create windows vm Linux
virt-install \
--name Windows_11 \
--ram 8096 \
--disk path=/var/lib/libvirt/images/Windows_11.img,size=60 \
--cpu host-passthrough \
--vcpus=4 \
--os-variant=win10 \
--network bridge=virbr0 \
--graphics vnc,listen=0.0.0.0,password=password \
--video virtio \
--cdrom /home/pouchou/quickemu/windows-11/Win11_22H2_French_x64v1.iso \
--features kvm_hidden=on,smm=on \
--tpm backend.type=emulator,backend.version=2.0,model=tpm-tis \
--boot loader=/usr/share/OVMF/OVMF_CODE.secboot.fd,loader_ro=yes,loader_type=pflash,nvram_template=/usr/share/OVMF/OVMF_VARS.ms.fd

# qemu convert vmdk to qcow2
qemu-img convert -p -f vmdk -O qcow2 packer-debian-11-amd64-disk001.vmdk debian11-ova.qcow2

# virt-sparsify
sudo virt-sparsify  debian11-ova.qcow2 --compress  debian11.qcow2
```
