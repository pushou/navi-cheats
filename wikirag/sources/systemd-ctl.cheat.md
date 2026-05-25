---
nom: systemd-ctl cheatsheet
description: Mémo des commandes systemd (systemctl, journalctl, hostnamectl, networkctl, loginctl, timedatectl, systemd-run)
type: source
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags: [systemd, linux, systemctl, journalctl, networkctl, hostnamectl, loginctl, timedatectl, systemd-run, service-management]
sources: []
---

# systemd-ctl cheatsheet

## Vue d'ensemble
Fichier cheat navi contenant les commandes essentielles pour gérer et inspecter les composants de systemd.

## Contenu

### systemctl
- Lister les unités par état : `systemctl list-units -all --state=<STATE>`
- Test de démarrage conditionnel : `systemctl is-active --quiet wazuh-agent || systemctl start wazuh-agent`
- Masquage d'unités : `sudo systemctl mask poweroff.target`
- Contrôle de l'hypervisation : `systemd-detect-virt`

### journalctl
- Recherche par grep : `journalctl -k --grep "UFW BLOCK"`
- Filtre netfilter : `journalctl -k | grep "IN=.*OUT=.*"`
- Suivi du log kernel : `journalctl -kf`
- Format détaillé : `journalctl -o verbose`
- Listes des démarrages : `journalctl --list-boots`
- Log complet d'une unité : `journalctl --no-pager --full -u unbound`
- Nettoyage du journal : `journalctl --disk-usage`, `journalctl --vacuum-time="2 days"`, `journalctl --vacuum-size=4GB`
- Niveaux de priorité : `journalctl -p emerg..err`
- Sortie JSON pour nushell : `journalctl --list-boots | from ssv -a`

### hostnamectl
- Définir le nom d'hôte : `hostnamectl set-hostname hostname`
- Options complètes : `hostnamectl <HOSTNAMECTL_ORDERS>` (status, hostname, icon-name, chassis, deployment, location)

### networkctl
- Options et commandes : `networkctl <NETWORKCTL_OPTIONS> <NETWORKCTL_ORDERS>`
- Commandes : status, list, lldp, label, delete, up, down, reload, renew, forcerenew, reconfigure
- Options : -a, -s, -l, -asl

### loginctl
- Lister les utilisateurs : `loginctl list-users`
- Activer le linger pour un utilisateur : `loginctl enable-linger myuser`

### timedatectl
- Activer NTP : `timedatectl set-ntp true`
- Statut : `timedatectl status`

### systemd-run
- Exécution avec restrictions :
  - CPU/Quota mémoire : `systemd-run --unit stress-unit2 -p CPUQuota=50% -p MemoryLimit=512M -p OOMPolicy=continue /usr/bin/stress --cpu 4 --vm-bytes 8G`
  - Contrôle réseau : `systemd-run -p IPAddressDeny=any -p IPAddressAllow=8.8.8.8 -p IPAddressAllow=127.0.0.0/8 -t /bin/sh`
  - Audit complet : `systemd-run -p IPAccounting=yes -p IOAccounting=yes -p CPUAccounting=true -p MemoryAccounting=true -p TasksAccounting=true -p ProtectSystem=strict -p PrivateDevices=yes -t -S`
  - Inspection du comptage IP : `systemctl --no-pager show ip-accounting run-u282.service | grep IP`

## Entités liées
- [[systemd]]
- [[cgroups]]
