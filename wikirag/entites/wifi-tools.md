---
nom: Outils WiFi
description: Ensemble d'outils pour le diagnostic et la gestion WiFi — iw, nmcli, iwconfig, iwlist, wavemon, networkctl
type: entite
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - wifi
  - wireless
  - iw
  - nmcli
  - iwconfig
  - wavemon
  - network
sources:
  - sources/wifi.cheat.md
---

# Outils WiFi

> Ensemble d'outils CLI pour le diagnostic et la gestion des interfaces WiFi sous Linux.

## Résumé

Les outils WiFi sous Linux permettent de détecter les cartes PCI, scanner les réseaux, afficher les connexions et diagnostiquer la qualité du signal. `nmcli` (NetworkManager), `iw` (déplacement de `iwconfig`), `iwlist` et `wavemon` (moniteur en temps réel) forment la suite principale.

## Détails

### Détection des cartes WiFi

```bash
# Lister les cartes WiFi PCI
lspci | grep -i --color 'wifi|wlan|wireless'

# Détails d'une carte PCI
lspci -vv -s <ID_CARTE>

# Informations matérielles complètes
sudo lshw -C network
```

### iwconfig et iwlist

```bash
# Qualité du signal avec iwconfig
iwconfig wlan0 | grep -i --color quality

# Scanner les réseaux
iwlist wlan0 scanning

# Canal utilisé
iwlist wlan0 channel
```

### nmcli (NetworkManager)

```bash
# Lister les réseaux WiFi visibles
nmcli dev wifi
```

### iw (outil moderne)

```bash
# Lister les connexions, scans, et infos
sudo iw dev wlan0 link
sudo iw dev wlan0 scan
sudo iw dev wlan0 info

# Dump détaillé d'une station
iw dev wlan0 station dump
```

### networkctl

```bash
# Status de l'interface WiFi
networkctl status wlan0
```

### wavemon (moniteur temps réel)

```bash
# Moniteur WiFi en temps réel dans le terminal
wavemon wlan0
```

## Références croisées

- Voir aussi : [[concepts/network-namespaces.md]] — les interfaces WiFi peuvent être dans des namespaces
- Voir aussi : [[entites/iproute2.md]] — gestion des interfaces réseau (inclut WiFi)
- Voir aussi : [[sources/wifi.cheat.md]] — source brute des snippets WiFi
