---
nom: Policy routing
description: Routage basé sur des règles (source, marque, port) au-delà du simple destinataire
type: concept
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - policy-routing
  - routing
  - linux
  - network
---

# Policy routing

> Le policy routing (routage policé) permet de définir des règles de routage basées sur des critères autres que l'adresse de destination : adresse source, marque iptables (fwmark), interface d'arrivée, etc.

## Résumé

Le routage classique utilise uniquement l'adresse de destination du paquet pour choisir la route. Le policy routing ajoute la possibilité de choisir des routes basées sur l'adresse source (source-based routing) ou des marques iptables. C'est essentiel pour le multihoming, le VPN split tunneling, et le Quality of Service.

## Mécanisme

### Tables de routage

Linux utilise trois tables par défaut :
- **local** : routes locales (boucle, broadcast)
- **main** : routes principales
- **default** : route par défaut

Des tables personnalisées peuvent être ajoutées dans `/etc/iproute2/rt_tables`.

### Règles de policy routing

```bash
# Ajouter une règle : depuis telle IP, utiliser telle table
ip rule add from 10.0.0.0/8 lookup vpn_table

# Ajouter une route dans une table personnalisée
ip route add default via 10.0.0.1 dev tun0 table vpn_table
```

### Marque iptables (fwmark)

```bash
# Marquer les paquets TCP port 22 avec la marque 1
iptables -A PREROUTING -t mangle -i eth0 -p tcp --dport 22 -j MARK --set-mark 1

# Marquer les paquets TCP port 80 avec la marque 2
iptables -A PREROUTING -t mangle -i eth0 -p tcp --dport 80 -j MARK --set-mark 2

# Router les paquets marqués 1 vers vpn1, marqués 2 vers vpn2
ip rule add from all fwmark 1 table vpn1
ip rule add from all fwmark 2 table vpn2
```

## Références croées

- Voir aussi : [[entites/iproute2.md]] — gestion du policy routing avec ip
- Voir aussi : [[entites/ufw.md]] — pare-feu pour marquer les paquets
- Voir aussi : [[entites/netfilter.md]] — iptables et fwmark
- Voir aussi : [[entites/wireguard.md]] — VPN split tunneling
