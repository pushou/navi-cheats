---
nom: virsh.cheat
description: Cheatsheet navi — Libvirt/virsh : gestion VM, pools, volumes, connexions distantes
type: source
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - virsh
  - virtualization
  - kvm
  - libvirt
  - vm
  - cheat-sheet
  - navi
sources: []
---

# Source : virsh.cheat

> Cheatsheet navi original de pushou, catégorisé `category:virtualization`.

## Description

Fichier de cheatsheet navi contenant des commandes virsh pour la gestion de machines virtuelles via Libvirt :
1. **Connexions** — Locale, SSH vers Linux, SSH vers macOS
2. **Listage** — Domaines (VMs), réseaux, interfaces, pools, node info
3. **Gestion des pools/volumes** — Lister, supprimer, rafraîchir des pools de stockage
4. **Cycle de vie VM** — start, stop, shutdown, destroy, reboot, undefine, save, restore
5. **Nettoyage complet** — Destroy + undefine avec purge du stockage
6. **Boucle d'extinction** — Arrêt gracieux de toutes les VMs en une commande

## Métadonnées

| Champ | Valeur |
|-------|--------|
| Fichier | `sources/virsh.cheat` |
| Auteur | pushou |
| Tags | `virsh, virtualization, kvm, libvirt, vm, category:virtualization` |
| Sections | 6 |
| Type | Cheatsheet navi |

## Pages wiki alimentées

- [[entites/libvirt.md]] — Page d'entité Libvirt/virsh

## Contenu brut

```
% virsh,virtualization,kvm,libvirt,vm,category:virtualization,pushou

# Connect to a local hypervisor
virsh -c qemu:///system list --all

# Connect to a hypervisor session on a remote Linux
virsh --connect qemu+ssh://<USERNAME>@<IP_ADDRESS>/system

# Connect to a hypervisor session on a remote mac (user network => session)
connect qemu+ssh://<USERNAME>@<IP_ADDRESS>/session?socket=/usr/local/var/run/libvirt/libvirt-sock

# list interfaces
virsh -c qemu:///system iface-list --all

# List all domains
virsh list --all

# List all network
virsh net-list --all

# Node info
virsh nodeinfo

# pool list
virsh pool-list --details

# system socket
export LIBVIRT_DEFAULT_URI=qemu:///system
virsh list --all


# volume delete from pool
sudo virsh pool-list
sudo virsh vol-list --pool default
sudo virsh vol-delete test_vol2.qcow2 --pool default
sudo virsh pool-refresh default
sudo virsh vol-list default

# quit console (FRENCH Keyboard)
CTRL+Shift+5
CTRL+Shift+$€*

# stop all VM
for i in $(sudo virsh list | grep running | awk '{print $2}')
do
    sudo virsh shutdown $i
done

# Create a guest from a configuration file
virsh create <path_to_config_file_xml>

# start stop shutdown destroy reboot undefine edit dumpxml save a guest
virsh <COMMAND> <domain>

# Delete a running guest && purge storage
virsh destroy <domain> && virsh undefine <domain> --remove-all-storage

$ COMMAND: echo 'start stop shutdown destroy reboot undefine edit dumpxml save' | tr ' ' '\n'
```
