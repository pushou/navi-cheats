---
nom: Packet crafting
description: Création et injection de paquets réseau personnalisés
type: concept
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - packet-crafting
  - hping3
  - network
  - security
  - diagnostics
---

# Packet crafting

> Le packet crafting est la technique de création manuelle de paquets réseau personnalisés. Il est utilisé pour le diagnostic réseau, le test de sécurité, et l'ingénierie inverse.

## Résumé

Le packet crafting consiste à construire des paquets réseau octet par octet ou à l'aide d'outils comme `hping3`. Il permet de contrôler chaque aspect du paquet : type (ICMP, TCP, UDP, raw IP), taille, flags, fragmentation, adresse source, etc.

## Outils

### Hping3

Outil principal de packet crafting CLI. Supporte TCP, UDP, ICMP et raw IP. Permet de tester le MTU, les pare-feux, et la fragmentation.

### ping

L'outil `ping` de base permet aussi un certain packet crafting : contrôle de taille (`-s`), fragmentation (`-M`), et version IP (`-4` ou `-6`).

## Cas d'usage

- **Test de MTU** : envoyer des paquets de taille variable avec le bit DF (Don't Fragment)
- **Test de pare-feu** : envoyer différents types de paquets TCP/UDP pour voir lesquels passent
- **Sonicage réseau** : déterminer la présence d'un hôte en envoyant des paquets
- **Diagnostic de fragmentation** : tester la gestion de la fragmentation par les routeurs

## Références croées

- Voir aussi : [[entites/hping3.md]] — outil principal de packet crafting
- Voir aussi : [[entites/mtr.md]] — diagnostic réseau complémentaire
- Voir aussi : [[entites/ss.md]] — inspection des sockets résultant du crafting
- Voir aussi : [[entites/ethtool.md]] — diagnostiquer les erreurs au niveau de l'interface
