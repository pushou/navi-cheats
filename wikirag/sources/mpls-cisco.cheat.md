---
nom: MPLS Cisco cheatsheet
description: Mémo des commandes MPLS sur équipements Cisco (forwarding-table, LDP, interfaces, VRF)
type: source
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags: [mpls, cisco, networking, ldp, vrf, forwarding-table]
sources: []
---

# MPLS Cisco cheatsheet

## Vue d'ensemble
Fichier cheat navi contenant les commandes MPLS et LDP pour l'administration de routeurs Cisco.

## Contenu

### VRF et interfaces
- Interfaces VRF : `sh ip vrf interfaces`

### Configuration MPLS
- Configuration MPLS complète : `sh run mpls`
- Router ID LDP : `sh run | include mpls ldp router-id`

### Table des labels
- Forwarding-table MPLS : `sh mpls forwarding-table`

### Interfaces MPLS
- Interfaces activées : `sh mpls interfaces`

### LDP Neighbor
- Voisins LDP : `sh mpls ldp neighbor`

### Découverte LDP
- Découverte LDP : `sh mpls ldp discovery`

## Entités liées
- [[BGP]]
- [[MPLS]]
- [[Cisco IOS]]
