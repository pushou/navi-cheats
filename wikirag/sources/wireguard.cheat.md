---
nom: wireguard.cheat
description: Cheatsheet navi de debug WireGuard
type: source
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - wireguard
  - vpn
  - network
  - debug
  - cheat-sheet
  - navi
sources: []
---

# Source : wireguard.cheat

> Cheatsheet navi original de pushou, catégorisé `category:network`.

## Description

Fichier de cheatsheet navi contenant une commande de debug pour le module noyau WireGuard.

## Métadonnées

| Champ | Valeur |
|-------|--------|
| Fichier | `sources/wireguard.cheat` |
| Auteur | pushou |
| Tags | `wireguard, vpn, network, category:network` |
| Sections | 1 |
| Type | Cheatsheet navi |

## Pages wiki alimentées

- [[entites/wireguard.md]] — Page d'entité WireGuard

## Contenu brut

```
% wireguard,vpn,network,vpn,category:network,pushou

# debug wireguard
echo module wireguard +p > /sys/kernel/debug/dynamic_debug/control
journalctl -kf
```
