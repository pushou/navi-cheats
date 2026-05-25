---
nom: iproute2
description: Suite complète de gestion réseau Linux — interfaces, routes, netns, VLAN, macvlan, ipvlan, policy routing
type: entite
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - iproute2
  - ip
  - network
  - routing
  - netns
  - vlan
  - macvlan
  - ipvlan
  - veth
  - dummy
  - policy-routing
sources:
  - sources/iproute2.cheat.md
---

# iproute2

> Suite d'outils de gestion réseau du noyau Linux. Remplace l'ancienne suite `net-tools` (ifconfig, route, arp). L'outil principal est `ip`.

## Résumé

`iproute2` est la suite complète d'outils de configuration réseau sous Linux. L'outil central `ip` permet de gérer les interfaces (link), les adresses (address), les routes (route), les邻居表 (neighbour), les namespaces (netns), et bien plus. C'est l'outil le plus complet pour l'administration réseau Linux.

## Détails

### Gestion des interfaces et adresses

```bash
# Afficher brièvement toutes les interfaces et adresses
ip -c --brief a

# Afficher les interfaces (link)
ip -c -br link show

# Activer/désactiver une interface
sudo ip link set enp0s3 up
sudo ip link set enp0s3 down

# Flush des adresses d'une interface
sudo ip a flush dev enp0s3

# Voir les statistiques par interface
ip -s link show
```

### Gestion des routes

```bash
# Voir les routes
ip route list

# Ajouter une route
sudo ip route add 10.0.0.0/8 via 192.168.1.1 dev enp0s3

# Route IPv6
sudo ip -6 route add default via fe80::1 dev enp0s3
```

### Interfaces virtuelles

**VLAN :**

```bash
ip link add link enp0s3 name enp0s3.10 type vlan id 10
ip link set enp0s3.10 up
```

**veth (pairs de liens virtuels) :**

```bash
sudo ip link add veth0 type veth peer name veth1
```

**macvlan :**

```bash
sudo ip link add macvlan1 link enp0s3 type macvlan mode bridge
```

**ipvlan (mode L2) :**

```bash
sudo ip link add name ipvl0 link enp0s3 type ipvlan mode l2
```

**macvtap :**

```bash
sudo ip link add link enp0s3 name macvtap0 type macvtap
```

**dummy :**

```bash
sudo ip link add dummy1 type dummy
sudo ip addr add 1.1.1.1/24 dev dummy1
sudo ip link set dummy1 up
```

### Namespaces réseau (netns)

```bash
# Créer et lister les namespaces
sudo ip netns add netns1
sudo ip netns list

# Exécuter une commande dans un namespace
sudo ip netns exec netns1 python3 -m http.server 8080

# Attacher une veth à un namespace
sudo ip link set veth1 netns netns1
```

### Policy routing

```bash
# Lister les règles de policy routing
ip rule

# Créer une table personnalisée
echo 100 vpn1 >> /etc/iproute2/rt_tables

# Ajouter une règle
ip rule add from 10.0.0.0/8 lookup vpn1

# Ajouter une route dans la table
ip route add default via 10.0.0.1 dev tun0 table vpn1
```

### Monitoring

```bash
# Monitorer les événements réseau
sudo ip monitor link
sudo ip monitor address
```

## Références croisées

- Voir aussi : [[concepts/network-namespaces.md]] — concept des namespaces réseau
- Voir aussi : [[concepts/policy-routing.md]] — concept de policy routing
- Voir aussi : [[concepts/interfaces-virtuelles.md]] — macvlan, ipvlan, veth, dummy
- Voir aussi : [[entites/ss.md]] — inspection des sockets réseau
- Voir aussi : [[concepts/routage.md]] — configuration des routes statiques et dynamiques
- Voir aussi : [[sources/iproute2.cheat.md]] — source brute des snippets iproute2
