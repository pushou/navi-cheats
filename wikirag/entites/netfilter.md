---
nom: Netfilter
description: Framework du noyau Linux pour la gestion du trafic réseau et le pare-feu
type: entite
date_creation: 2026-05-24
date_modification: 2026-05-24
version: 1.0.0
tags:
  - firewall
  - security
  - netfilter
  - conntrack
  - noyau-linux
sources:
  - sources/netfilter.cheat.md
---

# Netfilter

> Framework du noyau Linux pour la gestion du trafic réseau, le filtrage paquet et la translation d'adresses.

## Résumé

Netfilter est le framework intégré au noyau Linux qui fournit les mécanismes de filtrage, de translation d'adresses (NAT) et d'inspection du trafic réseau. UFW et iptable s'appuient tous deux sur Netfilter. Conntrack est un module netfilter dédié au suivi d'état des connexions réseau.

## Détails

### Conntrack — Suivi de connexions

`conntrack` est un outil en espace utilisateur qui interagit avec le module `nf_conntrack` du noyau. Il permet de suivre et d'interagir avec les connexions réseau enregistrées par netfilter.

**Écouter les événements de nouvelles connexions UDP :**

```bash
conntrack -E -o timestamp -p udp -e NEW
```

Cela permet de déboguer en temps réel les connexions UDP entrantes.

### Relation avec UFW

UFW est une interface simplifiée de netfilter. Toutes les règles définies via UFW sont traduites en règles iptables/nftables qui interagissent avec le framework netfilter.

Voir aussi : [[entites/ufw.md]]

## Références croisées

- Voir aussi : [[entites/ufw.md]] — UFW utilise netfilter comme sous-couche
- Voir aussi : [[concepts/linux-capabilities.md]] — les capacités Linux peuvent limiter l'accès aux sockets réseau
