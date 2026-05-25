---
nom: cgroups cheatsheet
description: Mémo des commandes cgroups (contrôle de la pression mémoire, création de groupes, quotas)
type: source
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags: [cgroups, resource-management, memory-pressure, linux, systemd]
sources: []
---

# cgroups cheatsheet

## Vue d'ensemble
Fichier cheat navi contenant les commandes essentielles pour gérer les cgroups Linux.

## Contenu

### Mémoire pressure
- Lecture de la pression mémoire d'une slice : `cat /sys/fs/cgroup/system.slice/memory.pressure`

### Création de cgroup
- Créer un cgroup mémoire : `cgcreate -g memory:/new-cgroup`
- Définir la limite mémoire : `cgset -r memory.max="1000M" new-cgroup`
- Exécuter dans le cgroup : `gexec -g memory:new-cgroup ~/app`

## Entités liées
- [[systemd]]
- [[performance-diagnostic]]
