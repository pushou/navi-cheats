---
nom: BGP (Border Gateway Protocol)
description: Protocole de routage inter-domaine (IGP) utilisé pour acheminer les paquets entre systèmes autonomes sur Internet
type: concept
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags: [bgp, routing, inter-domain, internet, cisco, routing-protocol]
sources: [sources/bgp-cisco.cheat.md]
---

# BGP (Border Gateway Protocol)

## Vue d'ensemble
Le **Border Gateway Protocol** (BGP) est le protocole de routage inter-domaine qui achemine le trafic entre les systèmes autonomes (AS) sur Internet. C'est le protocole de routage le plus critique de l'Internet mondial.

## Types
- **iBGP** (internal BGP) — Routage au sein d'un même système autonome
- **eBGP** (external BGP) — Routage entre systèmes autonomes différents

## Concepts clés

### Table de routage BGP
- Stockée via `show ip bgp`
- Affiche les chemins (paths) vers chaque réseau
- Utilise des attributs (AS_PATH, NEXT_HOP, LOCAL_PREF, etc.) pour choisir le meilleur chemin

### Voisins (peers/neighbors)
- Session TCP (port 179) entre routeurs BGP
- `show ip bgp neighbors` — Liste et état des voisins
- Soft-reconfiguration inbound pour réanalyser les routes reçues sans reset

### Routes
- **received-routes** : toutes les routes reçues d'un voisin
- **routes** : routes réellement installées dans la table de routage
- **advertised-routes** : routes annoncées à un voisin

### Operations
- **Hard reset** : `clear ip bgp *` — détruit toutes les sessions (à éviter en prod)
- **Soft reset** : `clear ip bgp <neighbor> soft in|out` — reset logiciel sans disruption

### Debugging
- `debug ip bgp` — Messages de debug BGP
- `debug ip packet` — Messages de debug paquets
- Looking glass (route-views) pour inspecter la table BGP publique

## Entités liées
- [[IGP]] — Protocoles de routage intra-domaine (OSPF, EIGRP)
- [[MPLS]] — Commutation par étiquettes, souvent couplé avec BGP
- [[Cisco IOS]] — Plateforme Cisco pour BGP
