---
nom: AppArmor
description: Module de sécurité Linux de type Mandatory Access Control (MAC)
type: entite
date_creation: 2026-05-24
date_modification: 2026-05-24
version: 1.0.0
tags:
  - security
  - mac
  - mandatory-access-control
  - noyau-linux
  - profiles
sources:
  - sources/apparmor.cheat.md
---

# AppArmor

> Module de sécurité du noyau Linux implémentant le Mandatory Access Control (MAC) via des profils de confinement par application.

## Résumé

AppArmor est un module de sécurité Linux qui restreint les programmes selon des profils définis. Chaque profil décrit quels fichiers, permissions et capacités un programme peut utiliser. Les profils sont généralement stockés dans `/var/lib/snapd/apparmor/profiles/` pour les applications snap.

## Détails

### Résolution de problèmes de permissions snap

**Recompiler les profils AppArmor de snap :**

```bash
sudo apparmor_parser -r /var/lib/snapd/apparmor/profiles/snap-confine*
```

Cela force la recompilation des profils AppArmor liés à snap, résolvant les problèmes de permissions bloquées par AppArmor.

### Emplacement des profils

Les profils AppArmor se trouvent généralement dans :
- `/etc/apparmor.d/` — profils système
- `/var/lib/snapd/apparmor/profiles/` — profils snap

## Références croisées

- Voir aussi : [[entites/ufw.md]] — UFW est un autre mécanisme de sécurité Linux (pare-feu)
- Voir aussi : [[concepts/linux-capabilities.md]] — les capacités Linux et AppArmor interagissent dans le contrôle d'accès
