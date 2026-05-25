---
nom: nsenter
description: Outil CLI Linux pour entrer dans les namespaces d'un processus existant
type: entite
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - nsenter
  - namespaces
  - containers
  - debugging
  - pid-namespace
  - network-namespace
sources:
  - sources/nsenter.cheat.md
---

# nsenter

> Outil CLI Linux permettant de rejoindre les namespaces d'un processus existant. Essentiel pour le debugging de conteneurs et les environnements isolés.

## Résumé

`nsenter` est un utilitaire GNU util-linux qui permet d'exécuter une commande dans les namespaces d'un autre processus. Il est particulièrement utile pour pénétrer dans des conteneurs Docker ou des chroot jails depuis l'hôte, sans avoir à y accéder via `docker exec`.

## Détails

### Principe

Chaque processus Linux vit dans un ensemble de namespaces (PID, NET, IPC, UTS, MNT, USER, TIME). `nsenter` permet de rejoindre ces mêmes namespaces et d'y exécuter une commande, donnant l'impression d'être à l'intérieur du processus cible.

### Commandes principales

```bash
# Entrer dans tous les namespaces d'un processus
nsenter --target <pid> --all <commande>

# Entrer uniquement dans le namespace réseau
nsenter --target <pid> --net <commande>

# Entrer uniquement dans le namespace PID
nsenter --target <pid> --pid <commande>

# Entrer dans le namespace IPC
nsenter --target <pid> --ipc <commande>

# Entrer dans UTS + TIME + IPC
nsenter --target <pid> --uts --time --ipc -- <commande>

# Références via procfs
nsenter --pid=/proc/<pid>/pid/net -- <commande>
```

### Utilisation avec Docker

```bash
# Récupérer le PID du conteneur
docker inspect <container_id> | grep -i pid

# Entrer dans les namespaces du conteneur
nsenter --target <PID> -p -u -n -i
```

### Cas d'usage

- Debug réseau d'un conteneur sans ajouter d'image de debug
- Accéder aux interfaces réseau d'un conteneur depuis l'hôte
- Explorer l'arborescence de fichiers d'un conteneur (namespace MNT)
- Debug IPC entre conteneurs

## Références croisées

- [[entites/docker.md]] — Docker : `nsenter` est utilisé pour le debug interne des conteneurs
- [[concepts/namespaces.md]] — Concept des namespaces Linux
- [[sources/nsenter.cheat.md]] — Cheatsheet navi des commandes nsenter
