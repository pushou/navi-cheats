---
nom: Virtualisation
description: Exécution d'un ou plusieurs systèmes invités sur un hôte — hyperviseurs type 1 et type 2
type: concept
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - virtualisation
  - kvm
  - qemu
  - virtualbox
  - libvirt
  - hyperviseur
sources: []
---

# Virtualisation

> La virtualisation consiste à exécuter un ou plusieurs systèmes d'exploitation invités (VMs) sur un hôte physique via un hyperviseur.

## Résumé

La virtualisation permet d'abstraire les ressources matérielles pour les partager entre plusieurs systèmes isolés. Deux catégories principales d'hyperviseurs : type 1 (bare-metal) et type 2 (hosted). Linux utilise KVM comme module noyau pour la virtualisation matérielle, avec Libvirt comme couche de gestion.

## Types d'hyperviseurs

| Type | Description | Exemples |
|------|-------------|----------|
| **Type 1 (bare-metal)** | S'exécute directement sur le matériel | KVM, VMware ESXi, Hyper-V |
| **Type 2 (hosted)** | S'exécute sur un OS hôte | VirtualBox, VMware Workstation, QEMU (mode user) |

## Écosystème Linux

```
┌─────────────────────────────────────────────┐
│              Applications VM                 │
│  (Windows, Linux, macOS, ... )              │
├─────────────────────────────────────────────┤
│           Hyperviseur noyau                  │
│              KVM (kernel)                    │
├─────────────────────────────────────────────┤
│           Couche de gestion                  │
│           Libvirt + virsh                    │
├─────────────────────────────────────────────┤
│          Outils auxiliaires                  │
│   qemu-img, virt-install, virt-sparsify      │
├─────────────────────────────────────────────┤
│           Matériel physique                  │
└─────────────────────────────────────────────┘
```

### Accélération matérielle

| Technologie | Plateforme | Principe |
|-------------|------------|----------|
| **KVM** | Linux | Module noyau exploitant les extensions CPU (Intel VT-x / AMD-V) |
| **HVF** | macOS | Apple Hypervisor Framework |
| **WHPX** | Windows | Windows Hypervisor Platform |

Sans accélération, QEMU émule le matériel logiciellement (très lent).

### Formats d'images disque

| Format | Description |
|--------|-------------|
| **QCOW2** | Format natif QEMU, supporte snapshots, compression, chiffrement |
| **RAW** | Image brute, simple mais pas de métadonnées |
| **VMDK** | Format VMware |
| **VHDX** | Format Hyper-V |

## Références croisées

- [[entites/qemu.md]] — QEMU : émulateur et outils de gestion d'images
- [[entites/libvirt.md]] — Libvirt : couche de gestion des VMs
- [[entites/virtualbox.md]] — VirtualBox : hyperviseur type 2
- [[concepts/kvm.md]] — KVM : module noyau Linux pour l'accélération matérielle
- [[concepts/namespaces.md]] — Conteneurisation (alternative légère à la virtualisation)
