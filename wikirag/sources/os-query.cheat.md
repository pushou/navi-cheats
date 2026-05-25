---
nom: os-info cheatsheet
description: Mémo pour l'installation et l'utilisation de os-info (liste des images OS, requêtes osinfo)
type: source
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags: [os-info, osquery, os-information, libosinfo, images]
sources: []
---

# os-info cheatsheet

## Vue d'ensemble
Fichier cheat navi contenant les commandes pour installer et utiliser os-info (libosinfo-bin) sur Ubuntu.

## Contenu

### Installation sur Ubuntu
```bash
sudo apt install libosinfo-bin
```

### Requêtes osinfo
- Lister toutes les images OS : `osinfo-query os`
- Filtre par vendor : `osinfo-query os vendor="Fedora Project"`

## Entités liées
- [[osquery]]
