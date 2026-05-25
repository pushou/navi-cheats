---
nom: IGP (Interior Gateway Protocol)
description: Protocole de routage intra-domaine — OSPF et EIGRP pour le routage au sein d'un même système autonome
type: concept
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags: [igp, ospf, eigrp, routing, intra-domain, cisco, routing-protocol]
sources: [sources/igp-cisco.cheat.md]
---

# IGP (Interior Gateway Protocol)

## Vue d'ensemble
Les **Interior Gateway Protocols** (IGP) sont des protocoles de routage utilisés à l'intérieur d'un même système autonome (AS). Ils déterminent le meilleur chemin pour acheminer les paquets au sein d'une organisation ou d'un provider.

## OSPF (Open Shortest Path First)

### Type de protocole
- **Link-State** : chaque routeur a une carte complète de la topologie
- Utilise l'algorithme de Dijkstra (SPF) pour calculer les plus courts chemins

### Concepts clés
- **Areas** — L'OSPF divise le réseau en zones (Area 0 = backbone)
- **DR/BDR** — Sur les réseaux broadcast, un Designated Router et un Backup DR sont élus
- **LSA** — Link State Advertisement : information diffusée par les routeurs
- **Adjacences** — Relation entre routeurs voisins OSPF

### Types de réseau
- **Broadcast** (Ethernet) : élection DR/BDR, hello toutes les 10s
- **Point-to-point** : pas de DR/BDR, hello toutes les 10s
- **Point-to-point sur loopback** : configuration spécifique avec `ip ospf network point-to-point`

### Debugging
- `debug ip ospf packet`, `adj`, `hello`, `lsa-generation`
- `clear ip ospf process` pour reset des adjacences

## EIGRP (Enhanced Interior Gateway Routing Protocol)

### Type de protocole
- **Distance-vector avancé** (ou "hybrid") — développé par Cisco (propriétaire, ouvert depuis 2013)
- Utilise l'algorithme DUAL (Diffusing Update Algorithm)

### Concepts clés
- **Router-ID** : `eigrp router-id <ip>`
- **Default-metric** : configuration des métriques pour le redistribution
- **Hello/Keepalive** : mécanisme de découverte des voisins

### Comparaison OSPF vs EIGRP
| Critère | OSPF | EIGRP |
|---|---|---|
| Type | Link-state | Distance-vector avancé |
| Ouvert | Oui (RFC) | Cisco (devenu ouvert) |
| Algorithme | Dijkstra (SPF) | DUAL |
| Vitesse de convergence | Bonne | Excellente |
| Complexité | Plus élevée | Plus simple |

## Entités liées
- [[BGP]] — IGP pour intra-domaine, BGP pour inter-domaine
- [[MPLS]] — MPLS utilise un IGP pour la découverte des voisins
- [[Cisco IOS]] — Plateforme Cisco pour OSPF et EIGRP
