---
nom: Networking
description: Concepts généraux de réseau — protocoles de routage, commutation, adressage IP, et outils de test réseau
type: concept
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags: [networking, routing, switching, ip-addressing, protocol, test, lab]
sources: [sources/bgp-cisco.cheat.md, sources/igp-cisco.cheat.md, sources/mpls-cisco.cheat.md, sources/mikrotik.cheat.md, sources/netlab.cheat.md]
---

# Networking

## Vue d'ensemble
Le **réseau** (networking) couvre l'ensemble des protocoles, équipements et techniques permettant la communication entre systèmes informatiques. Ce concept regroupe les notions de routage, commutation, adressage et test réseau.

## Protocoles de routage

### IGP (Interior Gateway Protocol)
- **OSPF** : link-state, open-standard, zones
- **EIGRP** : distance-vector avancé, Cisco-originé, DUAL
- Voir [[IGP]] pour les détails

### BGP (Border Gateway Protocol)
- Protocole de routage inter-domaine
- Routage entre systèmes autonomes
- Voir [[BGP]] pour les détails

### MPLS (Multi-Protocol Label Switching)
- Commutation par étiquettes pour le transport
- Voir [[MPLS]] pour les détails

## Outils de test réseau
- **iperf3** : benchmark de bande passante
- **netlab** : laboratoire réseau virtuel avec reporting, capture et exécution à distance

## Équipements
- **Cisco IOS** : routeurs et switchs Cisco
- **Mikrotik RouterOS** : routeurs Mikrotik

## Entités liées
- [[Cisco IOS]] — Routeurs Cisco
- [[BGP]] — Routage inter-domaine
- [[IGP]] — Routage intra-domaine
- [[MPLS]] — Commutation par étiquettes
- [[network-lab]] — Labo réseau virtuel
