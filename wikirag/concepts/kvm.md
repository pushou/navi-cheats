---
nom: KVM
description: Kernel Virtual Machine — module noyau Linux pour la virtualisation avec accélération matérielle
type: concept
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - kvm
  - kernel
  - virtualization
  - qemu
  - libvirt
sources: []
---

# KVM

> KVM (Kernel Virtual Machine) est le module noyau Linux qui transforme un système en hyperviseur de type 1.

## Résumé

KVM est un module du noyau Linux qui permet d'exécuter des machines virtuelles avec accélération matérielle via les extensions Intel VT-x ou AMD-V. Il est généralement combiné avec QEMU comme gestionnaire de matériel virtuel et Libvirt comme interface de gestion.

## Architecture

```
┌──────────────────────────────────────┐
│         Machine virtuelle            │
│   (OS invité + applications)         │
├──────────────────────────────────────┤
│       QEMU (gestion matériel virtuel)│
│   - CPU, RAM, disques, réseau, GPU   │
├──────────────────────────────────────┤
│       KVM (module noyau)             │
│   - Exécution en espace noyau        │
│   - Accélération matérielle CPU      │
├──────────────────────────────────────┤
│         Matériel physique            │
└──────────────────────────────────────┘
```

## Prérequis

```bash
# Vérifier le support CPU
grep -E '(vmx|svm)' /proc/cpuinfo

# Charger le module
sudo modprobe kvm
sudo modprobe kvm_intel  # Intel
sudo modprobe kvm_amd    # AMD
```

## Interaction avec QEMU et Libvirt

| Outil | Rôle |
|-------|------|
| **QEMU** | Émule le matériel, lance les VMs, gère les disques/images |
| **Libvirt** | API de gestion : cycle de vie, réseaux, stockage, snapshots |
| **virsh** | CLI de Libvirt pour les commandes interactives |
| **virt-install** | Script CLI pour créer des VMs à partir de templates |

## Modes d'accélération

| Mode | Usage |
|------|-------|
| `-accel kvm` | Mode production sur Linux (performance quasi-native) |
| `-accel hvf` | macOS (Apple Hypervisor Framework) |
| (aucun) | Émulation pure QEMU (lent, pour l'émulation cross-architecture) |

## Fonctionnalités avancées

- **kvm_hidden** — Masquer la virtualisation de la VM (utile pour certains logiciels de licence)
- **TPM virtuel** — `--tpm backend.type=emulator` pour le Secure Boot et BitLocker
- **OVMF** — BIOS UEFI open-source pour les VMs modernes (取代 legacy BIOS)
- **host-passthrough** — Exposer directement le CPU hôte à la VM

## Références croisées

- [[entites/qemu.md]] — QEMU : gestionnaire de matériel virtuel couplé à KVM
- [[entites/libvirt.md]] — Libvirt : orchestration des VMs KVM
- [[concepts/virtualisation.md]] — Contexte général de virtualisation et hyperviseurs
- [[sources/qemu.cheat.md]] — Exemples de VMs KVM (Windows 11, macOS)
