---
nom: Capsh
description: Outil de manipulation et d'affichage des capacités Linux
type: entite
date_creation: 2026-05-24
date_modification: 2026-05-24
version: 1.0.0
tags:
  - capabilities
  - security
  - linux
  - debugging
sources:
  - sources/capabilities.cheat.md
---

# Capsh

> Outil en ligne de commande pour afficher, décoder et manipuler les capacités Linux (capabilities).

## Résumé

`capsh` est un outil interactif pour inspecter les capacités Linux. Il peut afficher les capacités du shell courant, décoder les valeurs hexadécimales de capacités, et lancer des commandes avec des capacités modifiées.

## Détails

### Affichage des capacités

**Afficher les capacités du shell courant :**

```bash
capsh --print
```

**Décoder une valeur de capacité :**

```bash
capsh --decode=0000000000000400
```

### Lancer une commande avec des capacités modifiées

**Drop (retirer) des capacités à une commande :**

```bash
sudo capsh --drop=cap_net_raw --print -- -c "tcpdump"
```

### Configuration des capacités

La configuration des capacités pour les utilisateurs se fait dans :

```
/etc/security/capability.conf
```

## Références croisées

- Voir aussi : [[concepts/linux-capabilities.md]]
- Voir aussi : [[entites/setcap.md]]
