---
nom: Mikrotik RouterOS cheatsheet
description: Mémo des commandes de base pour RouterOS Mikrotik (configuration IP, variables)
type: source
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags: [mikrotik, routeros, networking, ip-address, configuration]
sources: []
---

# Mikrotik RouterOS cheatsheet

## Vue d'ensemble
Fichier cheat navi contenant les commandes de base pour la configuration RouterOS Mikrotik.

## Contenu

### Configuration IP
- Ajouter une adresse IP : `ip add add <ADDRESS> interface=<INTERFACE>`

## Variables interactives (navi)
- `PROTO` : tcp, udp, all
- `IP_VERSION` : 4, 6
- `AT_NT` : at, nt
- `TCP_FILTER` : established, syn-sent, syn-recv, fin-wait-1, fin-wait-2, time-wait, closed, close-wait, last-ack, closing, synchronized
- `SD_PORT` : sport, dport
- `NNPORT` : ports du fichier /etc/services
- `START_PORT` : 1-65535
- `END_PORT` : 1-65535
- `PORT` : 1-65535
- `TO_PORT` : 1-65535

## Entités liées
- [[Cisco IOS]]
