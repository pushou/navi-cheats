---
nom: MPLS (Multi-Protocol Label Switching)
description: Technique de commutation par étiquettes pour acheminer efficacement les paquets dans les réseaux de transport
type: concept
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags: [mpls, label-switching, networking, cisco, ldp, vrf, forwarding-table]
sources: [sources/mpls-cisco.cheat.md]
---

# MPLS (Multi-Protocol Label Switching)

## Vue d'ensemble
Le **Multi-Protocol Label Switching** (MPLS) est une technique de commutation de paquets qui utilise des étiquettes (labels) pour acheminer les données à travers un réseau de transport. MPLS accélère le routage en évitant les recherches longues dans les tables de routage IP.

## Concepts clés

### Forwarding Table
- Table de commutation par étiquettes : `sh mpls forwarding-table`
- Associe une étiquette d'entrée à une étiquette de sortie et une interface de sortie

### LDP (Label Distribution Protocol)
- Protocole qui distribue les étiquettes MPLS
- Découverte des voisins : `sh mpls ldp discovery`
- Voisins LDP : `sh mpls ldp neighbor`
- Router ID LDP : configuré via `mpls ldp router-id`

### Interfaces MPLS
- Interfaces activées pour MPLS : `sh mpls interfaces`

### VRF (Virtual Routing and Forwarding)
- Permet l'isolement de tables de routage
- Interfaces VRF : `sh ip vrf interfaces`

## Entités liées
- [[BGP]] — MPLS souvent couplé avec BGP (BGP/LDP, VPLS)
- [[IGP]] — MPLS utilise un IGP (OSPF, IS-IS) pour la découverte des voisins
- [[Cisco IOS]] — Plateforme Cisco pour MPLS
