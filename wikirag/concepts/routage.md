---
nom: Routage
description: Configuration des routes réseau statiques et dynamiques sous Linux
type: concept
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - routing
  - routes
  - netplan
  - network
  - debian
---

# Routage

> Le routage est le processus d'acheminement des paquets IP vers leur destination à travers un ou plusieurs réseaux intermédiaires (gateways). Sous Linux, il se configure via `iproute2`, Netplan, ou des scripts.

## Résumé

Linux supporte le routage statique (routes fixes) et dynamique (protocoles comme BGP, OSPF). Les routes sont stockées dans des tables de routage accessibles via `ip route`. La configuration persistante se fait via Netplan (distributions modernes) ou des scripts if-up.d (Debian traditionnel).

## Méthodes de configuration

### iproute2 (statique, non persistant)

```bash
# Ajouter une route
ip route add 172.16.0.0/28 via 10.255.255.135 dev eth0
```

### Netplan (Debian moderne, YAML)

```yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    ens18:
      addresses:
        - 10.255.255.207/16
      routes:
        - to: default
          via: 10.255.255.254
        - to: 172.16.0.0/28
          via: 10.255.255.135
```

### Scripts if-up.d (Debian traditionnel)

```bash
#!/bin/sh
if [ "$IFACE" = "eth0" ]; then
   ip route add 172.16.0.0/28 via 10.255.255.135 dev eth0
fi
```

## Références croées

- Voir aussi : [[entites/iproute2.md]] — gestion des routes avec l'outil `ip`
- Voir aussi : [[concepts/policy-routing.md]] — routage basé sur des règles
- Voir aussi : [[sources/route.cheat.md]] — source brute des snippets routage
