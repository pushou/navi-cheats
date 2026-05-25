---
nom: ethtool
description: Outil de diagnostic et configuration des interfaces réseau Ethernet — statistiques et erreurs
type: entite
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - ethtool
  - network
  - diagnostics
  - ethernet
sources:
  - sources/ethtools.cheat.md
---

# ethtool

> Outil de diagnostic et configuration des pilotes et interfaces réseau, en particulier Ethernet. Permet d'inspecter les statistiques matérielles, les erreurs et la configuration des interfaces.

## Résumé

`ethtool` est l'outil de référence pour inspecter et configurer les interfaces réseau sous Linux. Il permet de voir les statistiques matérielles (paquets envoyés/reçus, erreurs, collisions), modifier la configuration du lien (vitesse, duplex), et diagnostiquer les problèmes physiques.

## Détails

### Statistiques et erreurs

```bash
# Afficher les statistiques avec erreurs/dropped
sudo ethtool --statistics enp0s3 | rg -i -e 'dropped|error'

# Version grep (plus portable)
ethtool --statistics enp0s3 | grep errors
```

Ces commandes permettent d'identifier les pertes de paquets, les erreurs de transmission, les collisions et autres problèmes au niveau du driver/matériel réseau.

## Références croées

- Voir aussi : [[entites/iproute2.md]] — gestion des interfaces réseau
- Voir aussi : [[sources/ethtools.cheat.md]] — source brute des snippets ethtool
