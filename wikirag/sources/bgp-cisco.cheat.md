---
nom: BGP Cisco cheatsheet
description: Mémo des commandes BGP sur équipements Cisco (show, clear, debug, neighbor routes)
type: source
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags: [bgp, cisco, networking, routing, show, debug, neighbor]
sources: []
---

# BGP Cisco cheatsheet

## Vue d'ensemble
Fichier cheat navi contenant les commandes BGP pour l'administration et le dépannage de routeurs Cisco.

## Contenu

### Looking Glass
- Connexion telnet : `telnet route-views.optus.net.au`
- Requête BGP : `show ip bgp 1.0.0.0/24`

### Configuration en cours
- Section BGP : `sh run | section bgp` ou `sh run | s bgp`
- Vue BGP : `sh bgp`

### Affichage BGP
- Table BGP complète : `show ip bgp`
- Voisins : `show ip bgp neighbor`
- Résumé voisins : `show ip bgp neighbors | include BGP`
- Résumé IPv4 unicast : `show ip bgp ipv4 unicast summary`
- Transport TCP et PMTUD : `show ip bgp neigh 10.10.10.2 | in tcp`

### Routes des voisins
- Soft-reconfiguration inbound : `neighbor 5.5.5.5 soft-reconfiguration inbound`
- Routes reçues (toutes) : `sh ip bgp neighbors 1.1.1.1 received-routes`
- Routes réellement apprises : `sh ip bgp neighbors 1.1.1.1 routes`
- Routes annoncées : `sh ip bgp neighbors 1.1.1.1 advertised-routes`

### Reset de session BGP
- **Hard reset (NE PAS faire en prod)** : `clear ip bgp *`
- Soft reset avec adresse voisine : `clear ip bgp 192.168.100.1 soft in|out`

### Debug
- Debug TCP : `debug ip tcp transactions`
- Debug BGP : `debug ip bgp`
- Debug packet IP : `debug ip packet`
- Arrêter tous les debugs : `u all`

## Entités liées
- [[BGP]]
- [[Cisco IOS]]
- [[MPLS]]
