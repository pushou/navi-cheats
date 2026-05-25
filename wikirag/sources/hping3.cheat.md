---
nom: hping3.cheat
description: Cheatsheet navi Hping3 — tests MTU, ping fragmenté, injection de paquets
type: source
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - hping3
  - packet-crafting
  - network
  - security
  - mtu
  - cheat-sheet
  - navi
sources: []
---

# Source : hping3.cheat

> Cheatsheet navi original de pushou, catégorisé `category:network`.

## Description

Fichier de cheatsheet navi contenant des commandes Hping3 pour le packet crafting : tests de MTU, ping fragmenté, et sondage réseau avec paquets TCP/UDP/ICMP.

## Métadonnées

| Champ | Valeur |
|-------|--------|
| Fichier | `sources/hping3.cheat` |
| Auteur | pushou |
| Tags | `hping3, network, security, packet-crafting, ping, category:network` |
| Sections | 2 |
| Type | Cheatsheet navi |

## Pages wiki alimentées

- [[entites/hping3.md]] — Page d'entité Hping3
- [[concepts/packet-crafting.md]] — Concept de packet crafting

## Contenu brut

```
% hping3,network,security,packet-crafting,ping,category:network,pushou

# hping MTU
sudo hping3  -H <IP_VERSION> --<TYPE_PACKET> --dontfrag --data <PACKET_SIZE> <IP_ADDRESS>

# ping MTU
ping -M <FLAG_PING_FRAG> -s <PACKET_SIZE>  -<IP_VERSION>  <IP_ADDRESS>

$ PROTO: echo 'tcp udp all' | tr ' ' '\n'
$ IP_VERSION: echo '4 6' | tr ' ' '\n'
$ TYPE_PACKET: echo ' icmp rawip udp tcp' | tr ' ' '\n'
$ FLAG_PING_FRAG: echo 'dont do want' | tr ' ' '\n'
$ PACKET_SIZE: echo '1472 9000' | tr ' ' '\n'
$ PORT: echo {1..6555} | tr ' ' '\n'
$ TO_PORT: echo {1..6555} | tr ' ' '\n'
```
