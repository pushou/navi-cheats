---
nom: Setcap / Getcap
description: Outils pour définir et vérifier les capacités Linux sur les fichiers exécutables
type: entite
date_creation: 2026-05-24
date_modification: 2026-05-24
version: 1.0.0
tags:
  - capabilities
  - security
  - linux
sources:
  - sources/capabilities.cheat.md
---

# Setcap / Getcap

> Outils pour attribuer (`setcap`) et vérifier (`getcap`) les capacités Linux sur les fichiers exécutables.

## Résumé

`setcap` permet d'attribuer des capacités spécifiques à un fichier binaire, lui permettant de s'exécuter avec des privilèges élevés sans être un programme setuid. `getcap` permet de vérifier quelles capacités un fichier possède ou de rechercher récursivement tous les binaires avec des capacités.

## Détails

### Attribuer une capacité à un binaire

**Donner la capacité `cap_net_raw` à ping :**

```bash
setcap cap_net_raw+ep /sbin/ping
```

- `+ep` signifie effective + permitted

### Vérifier les capacités d'un binaire

```bash
getpcap /sbin/ping
getcap /bin/ping
```

### Recherche récursive de binaires avec capacités

```bash
getcap -r /usr/bin 2>/dev/null
```

### Configuration systemd

Dans un service systemd, les capacités peuvent être définies avec :

```ini
AmbientCapabilities=CAP_NET_BIND_SERVICE
```

## Références croisées

- Voir aussi : [[concepts/linux-capabilities.md]]
- Voir aussi : [[entites/capsh.md]]
