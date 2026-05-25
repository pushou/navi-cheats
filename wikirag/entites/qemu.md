---
nom: QEMU
description: Machine virtuelle universelle et suite d'outils de gestion d'images disque
type: entite
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - qemu
  - virtualization
  - kvm
  - qcow2
  - virtio
  - hvf
sources:
  - sources/qemu.cheat.md
---

# QEMU

> QEMU est un émulateur/visualiseur de machine (QEMU/KVM) capable d'émuler différentes architectures et de s'accélérer avec KVM (x86) ou HVF (macOS).

## Résumé

QEMU (Quick Emulator) est une solution de virtualisation complète qui combine émulation et virtualisation. En mode KVM sur Linux ou HVF sur macOS, il offre des performances quasi-natives. Les outils `qemu-img` et `virt-sparsify` complètent l'écosystème pour la gestion des images disque.

## Détails

### Création de disques

```bash
# Créer une image QCOW2
qemu-img create -f qcow2 <nom>.img <taille>
```

### Lancement de VM

**macOS (accélération HVF)** :

```bash
qemu-system-x86_64 \
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
```

**Linux avec virt-install (Libvirt)** :

```bash
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
  --cdrom /chemin/vers/windows.iso \
  --features kvm_hidden=on,smm=on \
  --tpm backend.type=emulator,backend.version=2.0,model=tpm-tis \
  --boot loader=/usr/share/OVMF/OVMF_CODE.secboot.fd,loader_ro=yes,loader_type=pflash,nvram_template=/usr/share/OVMF/OVMF_VARS.ms.fd
```

### Conversion d'images disque

```bash
# Convertir VMDK vers QCOW2
qemu-img convert -p -f vmdk -O qcow2 source.vmdk cible.qcow2

# Sparsifier une image (gain d'espace)
sudo virt-sparsify --compress source.qcow2 cible.qcow2
```

### Options clés

| Option | Rôle |
|--------|------|
| `-accel hvf` | Accélération via Apple Hypervisor Framework (macOS) |
| `-accel kvm` | Accélération via KVM (Linux) |
| `-cpu host-passthrough` | Exposera le CPU hôte à la VM |
| `-device virtio` | Pilotes semi-virtualisés (performants) |
| `-device e1000` | Carte réseau émulée (compatible mais lente) |
| `if=virtio` | Interface de stockage semi-virtualisée |
| OVMF | BIOS UEFI pour les VMs modernes |

## Références croisées

- [[entites/libvirt.md]] — Libvirt/virsh : gestion avancée des VMs (virt-install, pools, réseaux)
- [[concepts/kvm.md]] — Concept KVM : accélération matérielle de virtualisation
- [[concepts/virtualisation.md]] — Concept général de virtualisation
- [[sources/qemu.cheat.md]] — Cheatsheet navi des commandes QEMU
