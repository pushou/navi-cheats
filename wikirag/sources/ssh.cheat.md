---
nom: ssh.cheat
description: Cheatsheet navi de tunnels SSH et proxy SOCKS
type: source
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - ssh
  - tunneling
  - socks
  - proxy
  - network
  - cheat-sheet
  - navi
sources: []
---

# Source : ssh.cheat

> Cheatsheet navi original de pushou, catégorisé `category:network`.

## Description

Fichier de cheatsheet navi contenant des commandes pour créer des tunnels SSH et des proxys SOCKS à travers un hôte distant.

## Métadonnées

| Champ | Valeur |
|-------|--------|
| Fichier | `sources/ssh.cheat` |
| Auteur | pushou |
| Tags | `ssh, network, ssh, remote-access, tunneling, category:network` |
| Sections | 2 |
| Type | Cheatsheet navi |

## Pages wiki alimentées

- [[entites/ssh.md]] — Page d'entité SSH
- [[concepts/tunneling.md]] — Concept de tunneling réseau

## Contenu brut

```
% ssh,network,ssh,remote-access,tunneling,category:network,pushou

# create a socks proxy from our host to remot host then connect via curl to the socks proxy
ssh -vv -fND 1080  <remote-user>@<remote_host> && curl --socks5 <remote_host>  ipinfo.io/ip|toilet --metal

# tunnel to web server on remote host
ssh -L 19999:localhost:19999 user@ip
```
