---
nom: wifi.cheat
description: Cheatsheet navi d'outils WiFi — iw, nmcli, iwconfig, wavemon
type: source
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
  - cheat-sheet
  - navi
sources: []
---

# Source : wifi.cheat

> Cheatsheet navi original de pushou, catégorisé `category:network`.

## Description

Fichier de cheatsheet navi contenant des commandes pour gérer et diagnostiquer les interfaces WiFi : détection PCI, iw, nmcli, iwlist, iwconfig, networkctl, et wavemon.

## Métadonnées

| Champ | Valeur |
|-------|--------|
| Fichier | `sources/wifi.cheat` |
| Auteur | pushou |
| Tags | `wifi, network, wifi, wireless, nmcli, category:network` |
| Sections | 7 |
| Type | Cheatsheet navi |

## Pages wiki alimentées

- [[entites/wifi-tools.md]] — Page d'entité outils WiFi

## Contenu brut

```
% wifi,network,wifi,wireless,nmcli,category:network,pushou


# list pci wifi card
lspci | egrep -i --color 'wifi|wlan|wireless'

# get info on wlan card(lspci)
lspci -vv -s <ID_NETWORK_CARD>

# get info on wlan card (lshw)
sudo lshw -C network

# iwconfig
iwconfig <WIFI_DEVICE> |  grep -i --color quality

# nmcli
nmcli dev wifi

# iwlist scan
iwlist  <WIFI_DEVICE> scanning

# iwlist channel
iwlist  <WIFI_DEVICE> channel

# networkctl
networkctl status  <WIFI_DEVICE>

# iw
sudo iw dev <WIFI_DEVICE> <IW_ORDERS>

# iw station dump
iw dev <WIFI_DEVICE> station dump

# wavemon
wavemon  <WIFI_DEVICE>

$ ID_NETWORK_CARD:  lspci | egrep -i --color 'wifi|wlan|wireless'|awk '{print $1}'
$ WIFI_DEVICE: echo $(sudo ip link show|awk '{print $2}'|egrep '^wl'|sed 's/://')| tr ' ' '\n'
$ IW_ORDERS: echo 'link scan info' | tr ' ' '\n'
```
