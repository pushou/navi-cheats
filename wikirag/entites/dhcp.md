---
nom: DHCP
description: Protocole de distribution automatique d'adresses IP — découverte avec nmap et dhcping
type: entite
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - dhcp
  - dhcping
  - nmap
  - network
  - auto-configuration
sources:
  - sources/dhcp.cheat.md
---

# DHCP

> Protocole de distribution automatique d'adresses IP (Dynamic Host Configuration Protocol). Ce snippet couvre la découverte de serveurs DHCP sur un réseau local avec `nmap` et `dhcping`.

## Résumé

Le protocole DHCP permet l'attribution automatique d'adresses IP aux clients sur un réseau. Ces commandes permettent de scanner un réseau pour détecter les serveurs DHCP actifs et d'envoyer des requêtes DHCP personnalisées.

## Détails

### Découverte DHCP avec nmap

Utilise le script Nmap `broadcast-dhcp-discover` pour envoyer un broadcast DHCP Discover sur le réseau local.

```bash
# Scanner le réseau local pour les serveurs DHCP
sudo nmap --script broadcast-dhcp-discover -e <interface_physique>
```

Où `<interface_physique>` est une interface Ethernet (`en*`) ou WiFi (`wl*`).

### Envoi de requêtes DHCP personnalisées avec dhcping

`dhcping` est un outil de test DHCP permettant d'envoyer des requêtes DHCP personnalisées à un serveur spécifique.

```bash
# Envoyer une requête DHCP pour une IP spécifique
sudo dhcping -t 8 -c <ip-demandee> -s <ip-serveur-dhcp> -h <adresse-mac-generée>
```

Génération d'une adresse MAC aléatoire pour le test :

```bash
openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/:$//'
```

## Références croisées

- Voir aussi : [[concepts/dhcp.md]] — concept général du protocole DHCP
- Voir aussi : [[entites/iproute2.md]] — configuration des interfaces réseau
- Voir aussi : [[entites/dns_client.md]] — résolution DNS souvent configurée via DHCP
- Voir aussi : [[sources/dhcp.cheat.md]] — source brute des snippets DHCP
