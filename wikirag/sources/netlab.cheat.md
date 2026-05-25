---
nom: netlab cheatsheet
description: Mémo pour netlab (reporting d'adressage IP, capture de trafic, exécution distante de commandes)
type: source
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags: [netlab, network-lab, testing, reporting, capture, exécution-distante]
sources: []
---

# netlab cheatsheet

## Vue d'ensemble
Fichier cheat navi contenant les commandes pour netlab, un outil de labo réseau pour le reporting, la capture de trafic et l'exécution distante.

## Contenu

### Reporting d'adressage IP
- Rapport complet : `netlab report addressing`

### Capture de trafic
- Capture sur un hôte (Ethernet1, tout trafic) : `netlab capture s1 Ethernet1 -i any`
- Capture filtrée par protocol (OSPF) : `netlab capture ceos1 Ethernet1 -i any proto ospf`

### Exécution de commandes à distance
- Sur un hôte (H1) : `netlab exec H1 /bin/bash -c 'ip a'`

## Entités liées
- [[networking]]
