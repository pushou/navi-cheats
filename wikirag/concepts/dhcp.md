---
nom: DHCP
description: Protocole de distribution automatique d'adresses IP
type: concept
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - dhcp
  - network
  - auto-configuration
  - adresse-ip
---

# DHCP

> Le DHCP (Dynamic Host Configuration Protocol) est un protocole qui attribue automatiquement des adresses IP et autres paramètres de configuration (passerelle, serveurs DNS) aux équipements d'un réseau.

## Résumé

Le DHCP utilise un mécanisme DORA (Discover, Offer, Request, Acknowledge) pour attribuer des adresses IP de manière dynamique. Un client DHCP broadcast une demande Discover, le serveur répond avec un Offer, le client émet un Request, et le serveur confirme avec un Acknowledge.

## Outils de découverte

### nmap

Le script `broadcast-dhcp-discover` de Nmap permet de scanner le réseau local pour détecter les serveurs DHCP.

### dhcping

Outil permettant d'envoyer des requêtes DHCP personnalisées avec MAC, IP et options configurables.

## Références croées

- Voir aussi : [[entites/dhcp.md]] — entité DHCP avec nmap et dhcping
- Voir aussi : [[concepts/resolution-dns.md]] — DHCP distribue aussi les serveurs DNS
- Voir aussi : [[entites/iproute2.md]] — configuration des interfaces réseau
