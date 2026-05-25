---
nom: MTR (My TraceRoute)
description: Outil de diagnostic réseau combinant ping et traceroute — affichage curses, TCP, JSON
type: entite
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - mtr
  - traceroute
  - network
  - diagnostics
sources:
  - sources/mtr-traceroute-ping.cheat.md
---

# MTR (My TraceRoute)

> Outil de diagnostic réseau qui combine les fonctionnalités de ping et traceroute. Fournit un affichage en temps réel de la qualité du chemin réseau vers un hôte distant.

## Résumé

`mtr` (My TraceRoute) est un outil de diagnostic réseau qui combine les fonctionnalités de `ping` et `traceroute`. Il envoie des paquets ICMP (ou TCP) et affiche en temps réel les statistiques de chaque saut sur le chemin vers un hôte. L'interface curses permet un affichage interactif et continu.

## Détails

### MTR curses (TUI)

```bash
# MTR en mode curses (ncurses) — mode par défaut
mtr --tcp --port 443 --no-dns --curses www.example.com

# Options avancées : affichage des IPs, MPLS, AS lookup
mtr --tcp --port 443 --show-ips --mpls --aslookup --curses www.example.com
```

### MTR en mode batch (ligne de commande)

```bash
# Format court (batch)
mtr -P 443 -T -b -e -z -t www.example.com
```

### Traceroute TCP

```bash
# traceroute avec TCP (-A), sans DNS (-n), sur interface spécifique
traceroute -A -n -e -i eth0 www.example.com
```

### Analyse JSON de MTR

```bash
# Sortie JSON avec nushell
mtr -P 443 -T -c 2 -b -e -z -t -j www.example.com | from json | flatten | get hubs | flatten
```

## Références croées

- Voir aussi : [[entites/hping3.md]] — autre outil de diagnostic réseau (packet crafting)
- Voir aussi : [[entites/ethtool.md]] — diagnostiquer les erreurs au niveau de l'interface
- Voir aussi : [[sources/mtr-traceroute-ping.cheat.md]] — source brute des snippets MTR
