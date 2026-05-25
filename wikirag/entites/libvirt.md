---
nom: Libvirt
description: API et outils de virtualisation Linux — virsh CLI pour gérer VMs, réseaux et pools de stockage
type: entite
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - libvirt
  - virsh
  - kvm
  - virtualization
  - vm
  - storage-pools
  - qemu
sources:
  - sources/virsh.cheat.md
---

# Libvirt

> API open-source et suite d'outils pour gérer les virtualisations sous Linux (QEMU/KVM, LXC, VMware, Hyper-V).

## Résumé

Libvirt est l'infrastructure standard de virtualisation sur Linux. L'outil CLI `virsh` permet d'interagir avec le daemon libvirt pour gérer le cycle de vie des VMs, les réseaux virtuels, les pools de stockage et les interfaces réseau. Les connexions peuvent être locales ou distantes (SSH).

## Détails

### Connexions

```bash
# Connexion locale au système
virsh -c qemu:///system list --all

# Connexion distante SSH (Linux)
virsh --connect qemu+ssh://<user>@<ip>/system

# Connexion distante SSH (macOS — socket user)
virsh --connect qemu+ssh://<user>@<ip>/session?socket=/usr/local/var/run/libvirt/libvirt-sock

# URI par défaut (persiste dans l'environnement)
export LIBVIRT_DEFAULT_URI=qemu:///system
```

### Gestion des domaines (VMs)

```bash
# Lister toutes les VMs
virsh list --all

# Lister les VMs actives uniquement
virsh list

# Démarrer, arrêter, détruire, redémarrer, undefine
virsh start <domain>
virsh shutdown <domain>
virsh destroy <domain>
virsh reboot <domain>
virsh undefine <domain> --remove-all-storage

# Créer à partir d'un fichier XML
virsh create <config_file.xml>

# Voir/modifier l'XML d'une VM
virsh dumpxml <domain>
virsh edit <domain>
```

### Pools et volumes de stockage

```bash
# Lister les pools
virsh pool-list --details

# Lister les volumes d'un pool
virsh vol-list --pool <pool_name>

# Supprimer un volume
virsh vol-delete <vol.qcow2> --pool <pool_name>

# Rafraîchir un pool après modification externe
virsh pool-refresh <pool_name>
```

### Réseaux et interfaces

```bash
# Lister les réseaux virtuels
virsh net-list --all

# Lister les interfaces physiques
virsh iface-list --all
```

### Informations système

```bash
# Info nœud (CPU, mémoire, hypervisor)
virsh nodeinfo
```

### Arrêt massif de VMs

```bash
# Arrêt gracieux de toutes les VMs en cours
for i in $(sudo virsh list | grep running | awk '{print $2}'); do
    sudo virsh shutdown $i
done
```

### Nettoyage complet d'une VM

```bash
# Supprimer une VM et tout son stockage
virsh destroy <domain> && virsh undefine <domain> --remove-all-storage
```

## Références croisées

- [[entites/qemu.md]] — QEMU : l'hyperviseur le plus couramment géré par Libvirt
- [[concepts/kvm.md]] — KVM : hyperviseur noyau Linux géré par Libvirt
- [[concepts/virtualisation.md]] — Concept général de virtualisation
- [[sources/virsh.cheat.md]] — Cheatsheet navi des commandes virsh
