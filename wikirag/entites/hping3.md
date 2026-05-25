---
nom: Hping3
description: Outil d'injection de paquets réseau — tests MTU, ping fragmenté, sondage TCP/UDP/ICMP
type: entite
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - hping3
  - packet-crafting
  - network
  - security
  - diagnostics
sources:
  - sources/hping3.cheat.md
---

# Hping3

> Outil d'injection de paquets réseau en ligne de commande. Permet de créer et envoyer des paquets personnalisés TCP, UDP, ICMP ou raw IP pour le diagnostic réseau et le testing de sécurité.

## Résumé

`hping3` est un outil de packet crafting qui permet de générer et envoyer des paquets réseau personnalisés. Il est particulièrement utile pour les tests MTU, le diagnostic de fragmentation, le sondage de ports, et les tests de pare-feu. Alternative flexible à `ping`.

## Détails

### Test de MTU avec hping3

```bash
# Test de MTU avec paquets ICMP
sudo hping3 -H 4 --icmp --dontfrag --data 1472 8.8.8.8

# Test avec TCP SYN
sudo hping3 -H 4 --tcp --dontfrag --data 1472 -S 8.8.8.8
```

Le flag `--dontfrag` force le bit DF (Don't Fragment). Si le packet est trop gros pour le MTU, il sera rejeté — ce qui permet de déterminer le MTU maximum supporté.

### Ping classique pour test MTU

```bash
# Ping avec taille de paquet et contrôle de fragmentation
ping -M dontfrag -s 1472 -4 8.8.8.8
```

`-M dontfrag` équivaut au flag DF, `-s` définit la taille du payload, `-4` force IPv4.

### Types de paquets supportés

- `icmp` — paquets ICMP Echo Request (comme ping)
- `rawip` — paquets IP bruts
- `udp` — paquets UDP
- `tcp` — paquets TCP avec flags personnalisables

## Références croées

- Voir aussi : [[entites/mtr.md]] — autre outil de diagnostic réseau
- Voir aussi : [[entites/ss.md]] — inspecter les connexions créées par hping3
- Voir aussi : [[concepts/packet-crafting.md]] — concept de packet crafting
- Voir aussi : [[sources/hping3.cheat.md]] — source brute des snippets hping3
