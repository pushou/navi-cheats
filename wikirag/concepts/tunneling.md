---
nom: Tunneling réseau
description: Technique de encapsulation de paquets dans un autre protocole pour traverser des réseaux
type: concept
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - tunneling
  - encapsulation
  - vpn
  - network
  - security
---

# Tunneling réseau

> Le tunneling réseau est une technique qui encapsule des paquets d'un protocole dans les paquets d'un autre protocole pour les transmettre à travers un réseau intermédiaire.

## Résumé

Le tunneling permet de créer une connexion privée (tunnel) à travers un réseau public. Les données sont encapsulées dans un paquet du protocole du réseau transporteur, transmises, puis désencapsulées à l'extrémité. Les principales applications sont les VPN, le proxy SOCKS, et le port forwarding.

## Types de tunneling

### SSH tunneling

Le tunneling SSH encapsule le trafic dans une connexion SSH chiffrée :
- **Port forwarding local** (`-L`) : redirige un port local vers un hôte distant
- **Port forwarding distant** (`-R`) : redirige un port distant vers un hôte local
- **Proxy SOCKS** (`-D`) : crée un proxy SOCKS dynamique

### VPN (WireGuard, OpenVPN)

Les VPN créent des tunnels de couche 3 (couche réseau) entre deux extrémités, permettant une communication réseau complète chiffrée.

## Références croées

- Voir aussi : [[entites/ssh.md]] — tunneling SSH (proxy SOCKS, port forwarding)
- Voir aussi : [[entites/wireguard.md]] — VPN WireGuard (tunneling couche 3)
- Voir aussi : [[concepts/vpn.md]] — concept VPN
- Voir aussi : [[entites/iproute2.md]] — configuration réseau des tunnels
