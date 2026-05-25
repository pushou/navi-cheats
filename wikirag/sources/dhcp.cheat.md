---
nom: dhcp.cheat
description: Cheatsheet navi de découverte DHCP avec nmap et dhcping
type: source
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - dhcp
  - dhcping
  - nmap
  - network
  - cheat-sheet
  - navi
sources: []
---

# Source : dhcp.cheat

> Cheatsheet navi original de pushou, catégorisé `category:network`.

## Description

Fichier de cheatsheet navi contenant des commandes pour découvrir les serveurs DHCP sur un réseau local en utilisant `nmap` et `dhcping`.

## Métadonnées

| Champ | Valeur |
|-------|--------|
| Fichier | `sources/dhcp.cheat` |
| Auteur | pushou |
| Tags | `dhcp, dhcping, network, dhcp-client, category:network` |
| Sections | 2 |
| Type | Cheatsheet navi |

## Pages wiki alimentées

- [[entites/dhcp.md]] — Page d'entité DHCP
- [[concepts/dhcp.md]] — Concept DHCP

## Contenu brut

```
% dhcp,dhcping,network,dhcp-client,category:network,pushou

# Simple query with nmap
sudo nmap --script broadcast-dhcp-discover -e <PHY_NETWORK_INT>

# dhcping
sudo dhcping -t 8 -c <request-this-ip> -s <dhcp-server-address> -h <GENERATE_MAC_ADDRESS>


$ PHY_NETWORK_INT: echo $(sudo ip link show|awk '{print $2}'|egrep '^en|^wl'|sed 's/://')| tr ' ' '\n'
$ GENERATE_MAC_ADDRESS: echo $(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/:$//')
```
