---
nom: apparmor.cheat
description: Cheatsheet navi — AppArmor profiles for snap applications
type: source
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - apparmor
  - security
  - mac
  - snap
sources: []
---

# apparmor.cheat

> Cheatsheet navi pour la gestion des profils AppArmor de snap Ubuntu 22.

## Résumé

Ce cheatsheet contient des commandes pour recompiler les profils AppArmor de snap et gérer les problèmes de permissions.

## Contenu

- Recompilation des profils AppArmor de snap : `sudo apparmor_parser -r /var/lib/snapd/apparmor/profiles/snap-confine*`
- Emplacement des profils : `/etc/apparmor.d/` et `/var/lib/snapd/apparmor/profiles/`

## Entités wiki alimentées

- `[[entites/apparmor.md]]`

---

*Source brute navi — tag : `% apparmor,snap,category:security,pushou`*
