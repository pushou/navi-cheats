---
nom: ethtools.cheat
description: Cheatsheet navi de statistiques et erreurs d'interface avec ethtool
type: source
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - ethtool
  - network
  - statistics
  - diagnostics
  - cheat-sheet
  - navi
sources: []
---

# Source : ethtools.cheat

> Cheatsheet navi original de pushou, catégorisé `category:network`.

## Description

Fichier de cheatsheet navi contenant des commandes `ethtool --statistics` pour inspecter les erreurs et paquets丢弃 sur les interfaces réseau physiques. Basé sur les conseils de Red Hat pour les tests réseau iperf3.

## Métadonnées

| Champ | Valeur |
|-------|--------|
| Fichier | `sources/ethtools.cheat` |
| Auteur | pushou |
| Tags | `ethtool, ethtools, network, networking, category:network` |
| Sections | 2 |
| Type | Cheatsheet navi |

## Pages wiki alimentées

- [[entites/ethtool.md]] — Page d'entité ethtool

## Contenu brut

```
% ethtool,ethtools,network,networking,category:network,pushou
; source https://www.redhat.com/sysadmin/network-testing-iperf3

# Errors on physical interfaces
sudo ethtool --statistics <PHY_NETWORK_INT> | rg -i -e 'dropped|error'
# Errors on physical interfaces
ethtool --statistics  <PHY_NETWORK_INT>  | grep errors

$ PHY_NETWORK_INT: echo $(sudo ip link show|awk '{print $2}'|egrep '^en|^wl'|sed 's/://')| tr ' ' '\n'
```
