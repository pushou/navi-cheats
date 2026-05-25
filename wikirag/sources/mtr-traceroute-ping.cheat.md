---
nom: mtr-traceroute-ping.cheat
description: Cheatsheet navi de diagnostic réseau — MTR, traceroute, ping avancé
type: source
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - mtr
  - traceroute
  - ping
  - network
  - diagnostics
  - cheat-sheet
  - navi
sources: []
---

# Source : mtr-traceroute-ping.cheat

> Cheatsheet navi original de pushou, catégorisé `category:network`.

## Description

Fichier de cheatsheet navi contenant des commandes de diagnostic réseau avec MTR (My TraceRoute), traceroute TCP, et analyse de paquets.

## Métadonnées

| Champ | Valeur |
|-------|--------|
| Fichier | `sources/mtr-traceroute-ping.cheat` |
| Auteur | pushou |
| Tags | `mtr, traceroute, ping, network, diagnostics, category:network` |
| Sections | 3 |
| Type | Cheatsheet navi |

## Pages wiki alimentées

- [[entites/mtr.md]] — Page d'entité MTR

## Contenu brut

```
% mtr,traceroute,ping,network,diagnostics,category:network,pushou


# mtr speed
mtr --tcp --port 443 --no-dns --curses <FQDN>
# mtr clear options
mtr --tcp --port 443 --show-ips --mpls --aslookup --curses <FQDN>
# mtr short options
mtr -P 443 -T  -b -e -z -t  <FQDN>
# traceroute
traceroute -A -n -e -i eth0  <FQDN>
# nu-shell from json
mtr  -P 443 -T -c 2  -b -e -z -t -j  <FQDN> | from json|flatten|get hubs|flatten
```
