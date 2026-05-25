---
nom: network-lab
description: Outil de labo réseau — reporting d'adressage IP, capture de trafic, exécution de commandes à distance sur les nœuds du labo
type: entite
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags: [netlab, network-lab, testing, reporting, capture, exécution-distante, virtualisation]
sources: [sources/netlab.cheat.md]
---

# Network Lab

## Vue d'ensemble
**netlab** est un outil de laboratoire réseau permettant de créer, tester et analyser des topologies réseau virtuelles. Il offre le reporting, la capture de trafic et l'exécution de commandes à distance sur les nœuds.

## Fonctionnalités

### Reporting
- Adressage IP : `netlab report addressing`

### Capture de trafic
- Capture sur interface d'un hôte : `netlab capture <host> <interface> -i any`
- Capture filtrée par protocole : `netlab capture <host> <interface> -i any proto <proto>`

### Exécution distante
- Commande sur un hôte du labo : `netlab exec <host> <command>`

## Entités liées
- [[networking]]
