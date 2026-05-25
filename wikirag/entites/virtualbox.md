---
nom: VirtualBox
description: Hyperviseur de virtualisation type 2 — gestion des VMs via VBoxManage
type: entite
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - virtualbox
  - vbox
  - virtualization
  - vm
  - nat
  - vboxmanage
sources:
  - sources/vbox.cheat.md
---

# VirtualBox

> Hyperviseur de virtualisation open-source de Oracle, permettant d'exécuter plusieurs systèmes invités sur un hôte.

## Résumé

VirtualBox est un hyperviseur de type 2 (hosted) largement utilisé pour la virtualisation sur desktop. La CLI `VBoxManage` permet un contrôle complet de toutes les VMs, y compris la configuration réseau NAT avancée via le port forwarding dynamique.

## Détails

### NAT Port Forwarding Dynamique

`VBoxManage` permet de configurer le forwarding de ports depuis l'hôte vers une VM via le réseau NAT de VirtualBox.

```bash
# Rediriger le port 2222 de l'hôte vers le port 22 de la VM
VBoxManage modifyvm <vm_name> --natpf1 "ssh,tcp,127.0.0.1,2222,10.0.2.15,22"
```

### Sélection dynamique de VM par nom

Exemple : trouver une VM dont le nom contient "debian" et lui ajouter un port forwarding :

```bash
VBoxManage modifyvm \
  $(VBoxManage list vms | grep "debian" | awk -F '"' '{print $2}') \
  --natpf1 "ssh,tcp,127.0.0.1,2222,10.0.2.15,22"
```

### Format du NAT rule

```
--natpf1 "<nom_règle>,<protocole>,<adresse_hôte>,<port_hôte>,<adresse_vm>,<port_vm>"
```

- **règle** : nom identifiant la règle
- **protocole** : `tcp` ou `udp`
- **adresse_hôte** : IP de l'hôte (0.0.0.0 pour écouter sur toutes les interfaces)
- **port_hôte** : Port exposé sur l'hôte
- **adresse_vm** : IP de la VM dans le réseau NAT (généralement 10.0.2.15)
- **port_vm** : Port dans la VM

## Références croisées

- [[concepts/virtualisation.md]] — Concept général de virtualisation
- [[entites/qemu.md]] — Alternative QEMU/KVM avec accélération matérielle
- [[sources/vbox.cheat.md]] — Cheatsheet navi des commandes VirtualBox
