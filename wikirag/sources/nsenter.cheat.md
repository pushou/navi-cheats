---
nom: nsenter.cheat
description: Cheatsheet navi — nsenter : entrée dans les namespaces Linux (PID, NET, IPC, UTS)
type: source
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - nsenter
  - namespaces
  - containers
  - debugging
  - cheat-sheet
  - navi
sources: []
---

# Source : nsenter.cheat

> Cheatsheet navi original de pushou, catégorisé `category:containers`.

## Description

Fichier de cheatsheet navi contenant des commandes `nsenter` pour pénétrer dans les namespaces d'un processus existant. Utilitaire Linux permettant de rejoindre les namespaces PID, NET, IPC, UTS, TIME d'un autre processus.

## Métadonnées

| Champ | Valeur |
|-------|--------|
| Fichier | `sources/nsenter.cheat` |
| Auteur | pushou |
| Tags | `nsenter, containers, namespaces, debugging, category:containers` |
| Sections | 1 |
| Type | Cheatsheet navi |

## Pages wiki alimentées

- [[entites/nsenter.md]] — Page d'entité nsenter

## Contenu brut

```
% nsenter,containers,namespaces,debugging,category:containers,pushou

# nsenter
# Run a new command in a running process' namespace.
# Particularly useful for docker images or chroot jails.
# More information: <https://manned.org/nsenter>.

# Run a specific command using the same namespaces as an existing process:
nsenter --target pid --all command command_arguments

# Run a specific command in an existing process's network namespace:
nsenter --target pid --net command command_arguments

# Run a specific command in an existing process's PID namespace:
nsenter --target pid --pid command command_arguments

# Run a specific command in an existing process's IPC namespace:
nsenter --target pid --ipc command command_arguments

# Run a specific command in an existing process's UTS, time, and IPC namespaces:
nsenter --target pid --uts --time --ipc -- command command_arguments

# Run a specific command in an existing process's namespace by referencing procfs:
nsenter --pid=/proc/pid/pid/net -- command command_arguments
```
