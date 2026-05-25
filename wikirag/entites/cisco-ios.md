---
nom: Cisco IOS
description: Système d'exploitation des routeurs et switchs Cisco — commandes BGP, OSPF, EIGRP, MPLS, LDP et configuration réseau
type: entite
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags: [cisco, ios, networking, routing, bgp, ospf, eigrp, mpls, ldp, routeros]
sources: [sources/bgp-cisco.cheat.md, sources/igp-cisco.cheat.md, sources/mpls-cisco.cheat.md, sources/mikrotik.cheat.md]
---

# Cisco IOS

## Vue d'ensemble
**Cisco IOS** (Internetwork Operating System) est le système d'exploitation des routeurs et commutateurs Cisco. Il fournit les commandes de configuration et de diagnostic pour le routage, le commutage et les services réseau.

## Protocoles de routage

### BGP (Border Gateway Protocol)
- Affichage : `show ip bgp`, `show ip bgp neighbors`, `show ip bgp ipv4 unicast summary`
- Routes des voisins : received-routes, routes (apprises), advertised-routes
- Soft-reconfiguration inbound sur un voisin
- Reset : soft `clear ip bgp <neighbor> soft in|out`, hard (à éviter en prod)
- Debug : `debug ip bgp`, `debug ip packet`
- Looking glass : connexion telnet aux route-views

### OSPF (Open Shortest Path First)
- Configuration de base : `router ospf <id>`, network, passive-interface
- Types de réseau : point-to-point, broadcast (par défaut)
- Affichage : interfaces, adjacences, route, database, border-routers, virtual-links
- Debug : packet, adj, hello, lsa-generation
- Reset : `clear ip ospf process`

### EIGRP (Enhanced Interior Gateway Routing Protocol)
- Configuration : router-id, network, default-metric
- Affichage : protocols, neighbors, route, interface, topology

### MPLS (Multi-Protocol Label Switching)
- LDP : neighbor, discovery
- Forwarding-table : `sh mpls forwarding-table`
- Interfaces MPLS : `sh mpls interfaces`
- VRF : `sh ip vrf interfaces`
- Configuration : `sh run mpls`

### Mikrotik RouterOS
- Configuration IP de base : `ip add add <ADDRESS> interface=<INTERFACE>`
- Variables interactives pour ports, protocoles, filtres TCP

## Raccourcis CLI
- Interrupt : `CTRL SHIFT 6`
- Désactiver le domain lookup : `no ip domain-lookup`

## Entités liées
- [[BGP]] — Protocole de routage inter-domaine
- [[IGP]] — Protocoles de routage intra-domaine (OSPF, EIGRP)
- [[MPLS]] — Commutation par étiquettes
- [[networking]] — Concepts réseau généraux
