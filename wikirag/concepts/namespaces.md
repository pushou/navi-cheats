---
nom: Namespaces Linux
description: Mécanisme d'isolation du noyau Linux — PID, NET, IPC, UTS, MNT, USER, TIME
type: concept
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - namespaces
  - linux-kernel
  - isolation
  - containers
  - pid
  - network
  - ipc
sources: []
---

# Namespaces Linux

> Les namespaces sont un mécanisme du noyau Linux qui isole les ressources système entre différents processus. C'est le fondement de la conteneurisation.

## Résumé

Chaque namespace donne à un ensemble de processus une vue isolée de l'environnement global. Il existe 7 types de namespaces : PID, NET, IPC, UTS, MNT, USER, TIME. Les conteneurs Docker utilisent massivement les namespaces pour l'isolation.

## Types de namespaces

| Namespace | Rôle | Commande d'inspection |
|-----------|------|----------------------|
| **PID** | Arborescence des processus | `ps` montre seulement les processus du namespace |
| **NET** | Ressources réseau (interfaces, routes, iptables) | `ip addr`, `netstat` |
| **IPC** | Communication inter-processus (semaphores, queues) | `ipcs` |
| **UTS** | Nom d'hôte et domaine | `hostname` |
| **MNT** | Point de montage | `mount`, `df` |
| **USER** | Identifiants utilisateur et groupe | `id`, `whoami` |
| **TIME** | Horloge du système | `date` |

### PID Namespace

Chaque PID namespace voit ses propres processus avec des PIDs à partir de 1. Un processus hors du namespace n'est pas visible depuis l'intérieur, et vice-versa.

### NET Namespace

Chaque namespace a son propre ensemble d'interfaces réseau, règles iptables, routes, sockets. C'est ce qui permet à un conteneur d'avoir sa propre IP sans conflit.

### Outils d'interaction

```bash
# nsenter — entrer dans les namespaces d'un processus
nsenter --target <pid> --net --pid --uts --ipc -- <commande>

# unshare — créer un nouveau namespace et y exécuter une commande
unshare --net --pid --uts --fork -- <commande>

# Voir les namespaces d'un processus
ls -l /proc/<pid>/ns/
```

## Références croisées

- [[entites/nsenter.md]] — nsenter : outil CLI pour pénétrer dans les namespaces
- [[entites/docker.md]] — Docker : utilise massivement les namespaces pour isoler les conteneurs
- [[concepts/virtualisation.md]] — Virtualisation vs conteneurisation (les namespaces sont une forme légère de virtualisation)
