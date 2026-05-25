---
nom: cgroups
description: Control groups Linux — mécanisme du noyau pour limiter, isoler et mesurer les ressources système (CPU, mémoire, I/O, réseau)
type: concept
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags: [cgroups, linux, kernel, resource-management, memory-pressure, cgroup-v2]
sources: [sources/cgroups.cheat.md]
---

# Cgroups (Control Groups)

## Vue d'ensemble
Les **cgroups** (control groups) sont une fonctionnalité du noyau Linux qui permet de limiter, d'isoler et de mesurer l'utilisation des ressources système (CPU, mémoire, disque, réseau) par les groupes de processus.

## Versions
- **cgroups v1** : organisé en hiérarchies de contrôles (controllers) indépendants (memory, cpu, blkio, etc.)
- **cgroups v2** : hiérarchie unique, controllers combinés, meilleur comportement par défaut

## Concepts clés

### Limitation mémoire
- `memory.max` — Limite absolue de mémoire pour le cgroup
- `memory.pressure` — Signal de pression mémoire (low, medium, critical)
- Lecture de la pression : `cat /sys/fs/cgroup/system.slice/memory.pressure`

### Création et gestion
- `cgcreate` — Créer un nouveau cgroup
- `cgset` — Définir une ressource pour un cgroup
- `gexec` — Exécuter un processus dans un cgroup

### Intégration avec systemd
systemd utilise les cgroups v2 nativement. Chaque service systemd est un cgroup avec ses propres quotas.

## Entités liées
- [[systemd]] — Utilise les cgroups pour l'isolation des services
- [[performance-diagnostic]] — Outils de monitoring des ressources
- [[sources/privileged_port.cheat.md]] — Configuration sysctl des ports non-root
