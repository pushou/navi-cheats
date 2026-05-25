---
nom: Namespaces réseau (netns)
description: Isolation des ressources réseau dans le noyau Linux
type: concept
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - network-namespaces
  - netns
  - containerisation
  - isolation
  - linux
---

# Namespaces réseau (netns)

> Les namespaces réseau permettent d'isoler les ressources réseau (interfaces, routes, tables de routage, règles firewall) dans le noyau Linux. Chaque namespace a sa propre vue du réseau.

## Résumé

Un network namespace (netns) est une abstraction du noyau Linux qui isole l'état du réseau. Chaque namespace a sa propre table de routage, ses propres interfaces, ses propres règles iptables. C'est le mécanisme fondamental derrière la conteneurisation réseau (Docker, LXC, etc.).

## Utilisation

### Création et gestion

```bash
# Créer un namespace
ip netns add mon-namespace

# Lister les namespaces
ip netns list

# Exécuter une commande dans un namespace
ip netns exec mon-namespace ifconfig

# Attacher une interface virtuelle à un namespace
ip link set veth0 netns mon-namespace
```

### Cas d'usage

- **Docker** : chaque conteneur a son propre namespace réseau
- **VPN** : router du trafic via un tunnel sans affecter le reste du système
- **Tests réseau** : isoler des services de test du réseau principal
- **Réseaux multi-locataires** : isoler le trafic de différentes applications

## Références croées

- Voir aussi : [[entites/iproute2.md]] — gestion des netns avec ip
- Voir aussi : [[entites/docker.md]] — Docker utilise les namespaces
- Voir aussi : [[entites/wireguard.md]] — VPN utilise les netns
- Voir aussi : [[concepts/interfaces-virtuelles.md]] — veth connecte des namespaces
