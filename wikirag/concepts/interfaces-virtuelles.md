---
nom: Interfaces réseau virtuelles
description: Types d'interfaces virtuelles Linux — veth, macvlan, ipvlan, macvtap, dummy, vlan
type: concept
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - interfaces-virtuelles
  - macvlan
  - ipvlan
  - veth
  - dummy
  - vlan
  - network
---

# Interfaces réseau virtuelles

> Linux supporte plusieurs types d'interfaces réseau virtuelles créées sur des interfaces physiques. Chacune a un comportement et un cas d'usage spécifique.

## Résumé

Les interfaces virtuelles permettent de créer des points d'entrée réseau additionnels sur une seule interface physique. Elles sont fondamentales pour la conteneurisation, le multi-tenancy, et l'isolation réseau.

## Types d'interfaces

### veth (virtual ethernet pair)

Crée un couple de liens virtuels connectés entre eux. Utilisé pour connecter des namespaces.

```bash
ip link add veth0 type veth peer name veth1
```

### macvlan

Crée une interface avec une adresse MAC propre sur une interface physique. Chaque interface macvlan a sa propre MAC et IP. Mode bridge (par défaut) ou router.

```bash
ip link add macvlan1 link eth0 type macvlan mode bridge
```

### ipvlan

Similaire à macvlan mais partage la même MAC que l'interface parente. Deux modes : L2 (bridge) et L3 (routing). Plus léger que macvlan.

```bash
ip link add ipvl0 link eth0 type ipvlan mode l2
```

### macvtap

Extension de macvlan pour la virtualisation (QEMU/KVM). Permet à une VM d'accéder directement au réseau.

```bash
ip link add macvtap0 link eth0 type macvtap
```

### dummy

Interface virtuelle qui ne fait rien — toutes les paquets envoyés sont immédiatement recyclés. Utilisé pour créer des points d'écoute ou tester des scripts.

```bash
ip link add dummy1 type dummy
```

### VLAN

Interface VLAN sur une interface physique. Permet d'isoler le trafic par ID VLAN.

```bash
ip link add link eth0 name eth0.10 type vlan id 10
```

## Références croées

- Voir aussi : [[entites/iproute2.md]] — création et gestion de toutes les interfaces virtuelles
- Voir aussi : [[concepts/network-namespaces.md]] — veth connecte les namespaces
- Voir aussi : [[entites/docker.md]] — Docker utilise macvlan pour les réseaux
- Voir aussi : [[sources/smtp-client.cheat.md]] — exemple de macvlan Docker pour Postfix
