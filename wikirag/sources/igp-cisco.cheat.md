---
nom: IGP Cisco cheatsheet
description: Mémo des commandes IGP sur équipements Cisco (OSPF, EIGRP, configuration et debugging)
type: source
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags: [igp, cisco, ospf, eigrp, networking, routing, configuration, debug]
sources: []
---

# IGP Cisco cheatsheet

## Vue d'ensemble
Fichier cheat navi contenant les commandes OSPF et EIGRP pour l'administration et le dépannage de routeurs Cisco.

## Contenu

### Raccourcis Cisco
- CTRL-C (interrupt) : `CTRL SHIFT 6`
- Désactiver le domain lookup : `no ip domain-lookup`

### EIGRP
- Configuration :
  ```
  conf t
    router eigrp <AS>
      eigrp router-id 1.1.1.1
      network 0.0.0.0 255.255.255.255
      default-metric 100000 100 255 1 1500
  ```
- Affichage :
  - Protocoles : `show ip protocols`
  - Voisins : `show ip eigrp neighbors`
  - Route EIGRP : `show ip route eigrp`
  - Interfaces : `show ip eigrp interface <interface>`
  - Topologie : `show ip eigrp topology`

### OSPF — Configuration de base
```
router ospf 1
 passive-interface FastEthernet0/0
 network 0.0.0.0 255.255.255.255 area 0
```

### OSPF — Loopback point-to-point
```
interface Loopback3
 ip address 3.3.3.3 255.255.255.255
 ip ospf network point-to-point
 ip ospf 1 area 0
!
router ospf 1
 log-adjacency-changes
 network 3.3.3.3 0.0.0.0 area 0
 network 35.0.0.0 0.0.0.3 area 0
```

### OSPF — Types de réseau
- **Point-to-point** : `interface gigabitEthernet 2/0 ; ip ospf network point-to-point`
- **Broadcast (par défaut)** : `interface gigabitEthernet 2/0 ; ip ospf broadcast`

### OSPF — Nettoyage
- Reset adjacences : `clear ip ospf process`

### OSPF — Affichage courant
- Interfaces : `sh ip ospf interfaces`
- Adjacences : `sh ip ospf nei`
- Routes OSPF : `sh ip route ospf`
- LSA database : `sh ip ospf database`
- Interface loopback : `sh ip ospf interface loopback 2`
- Routeurs de bordure : `show ip ospf border-routers`
- Liens virtuels : `show ip ospf virtual-links`
- Données routeur : `show ip ospf data router 203.0.113.4`
- ASBR summary : `show ip ospf data asbr-summary 203.0.113.4`

### OSPF — Affichage avancé
- Type de réseau : `show ip ospf interface ethernet 0/3 | include Network`
- Transit : `show ip ospf | include transit`
- LSA externe : `show ip ospf database external 10.0.0.17 adv_router 10.0.0.15`
- Summary : `show ip ospf 1 3 database summary 10.0.15.0 adv_router 10.0.0.1`
- ASBR avancé : `show ip ospf database asbr-summary 10.0.0.15`

### OSPF — Debug
- Paquet : `debug ip ospf packet`
- Adjacence : `debug ip ospf adj`
- Hello : `debug ip ospf hello`
- LSA generation : `debug ip ospf lsa-generation`

## Entités liées
- [[BGP]]
- [[IGP]]
- [[Cisco IOS]]
- [[MPLS]]
