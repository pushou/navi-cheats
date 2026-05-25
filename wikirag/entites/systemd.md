---
nom: systemd
description: Système et service manager Linux par défaut — gestion des unités, logs, contrôle des ressources, réseau et horloge
type: entite
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags: [systemd, linux, service-manager, init-system, cgroups, journal]
sources: [sources/systemd-ctl.cheat.md, sources/cgroups.cheat.md, sources/privileged_port.cheat.md]
---

# systemd

## Vue d'ensemble
**systemd** est le système d'init et le service manager par défaut de la plupart des distributions Linux modernes. Il gère le démarrage, les services, les logs, la configuration réseau, l'horloge, et l'identification des utilisateurs.

## Composants

### systemctl
Contrôle des unités de service :
- État des unités : `systemctl list-units -all --state=<STATE>`
- Test et démarrage conditionnel : `systemctl is-active --quiet <service> || systemctl start <service>`
- Masquage d'unités : `systemctl mask <unit>`
- Détection d'hypervisation : `systemd-detect-virt`

### journalctl
Système de logging unifié :
- Recherche et filtrage : `-k --grep`, `--no-pager --full -u <unit>`, `-p emerg..err`
- Format et suivi : `-o verbose`, `-kf`
- Historique : `--list-boots`
- Nettoyage : `--disk-usage`, `--vacuum-time`, `--vacuum-size`

### hostnamectl
Gestion du nom d'hôte et des métadonnées : `status`, `set-hostname`, `icon-name`, `chassis`, `deployment`, `location`

### networkctl
Gestion des interfaces réseau : `status`, `list`, `lldp`, `label`, `up/down`, `reload`, `renew`, `reconfigure`

### loginctl
Gestion des sessions utilisateurs : `list-users`, `enable-linger`

### timedatectl
Gestion de l'heure et NTP : `set-ntp true`, `status`

### systemd-run
Exécution éphémère de commandes avec isolation :
- Quotas CPU/mémoire : `CPUQuota`, `MemoryLimit`, `OOMPolicy`
- Contrôle réseau : `IPAddressDeny`, `IPAddressAllow`
- Audit : `IPAccounting`, `IOAccounting`, `CPUAccounting`, `MemoryAccounting`, `TasksAccounting`
- Isolation : `ProtectSystem=strict`, `PrivateDevices=yes`

### Cgroups et systemd
systemd utilise les cgroups v2 pour l'isolation des ressources. Voir [[cgroups]] pour les commandes cgcreate/cgset.

### Ports privilégiés
Par défaut seuls les processus root peuvent binder les ports < 1024. Voir [[sources/privileged_port.cheat.md]] pour la configuration sysctl.

## Entités liées
- [[cgroups]] — Contrôle des ressources via cgroups v2
- [[performance-diagnostic]] — Outils de monitoring système
- [[osquery]] — Monitoring de flottes avec requêtes SQL
- [[sources/privileged_port.cheat.md]] — Configuration sysctl des ports non-root
