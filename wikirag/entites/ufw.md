---
nom: UFW (Uncomplicated Firewall)
description: Interface simplifiée de gestion du pare-feu netfilter sous Linux
type: entite
date_creation: 2026-05-24
date_modification: 2026-05-24
version: 1.0.0
tags:
  - firewall
  - security
  - netfilter
  - ufw
sources:
  - sources/ufw.cheat.md
---

# UFW (Uncomplicated Firewall)

> Interface de ligne de commande simplifiée pour gérer les règles du pare-feu Linux (netfilter).

## Résumé

UFW (Uncomplicated Firewall) est une interface de gestion de pare-feu conçue pour être facile à utiliser. Elle sert d'interface front-end pour `iptables` (netfilter). Ce cheatsheet couvre les commandes essentielles : affichage du statut, activation/désactivation, gestion des politiques par défaut, ajout/suppression de règles, et affichage des règles.

## Détails

### Affichage du statut et des règles

Afficher l'état du pare-feu avec les numéros de règles :

```bash
sudo ufw status numbered
```

Afficher les règles en cours d'écoute ou ajoutées manuellement :

```bash
sudo ufw show listening
sudo ufw show added
```

### Activation et désactivation

```bash
sudo ufw enable
sudo ufw disable
sudo ufw reset
```

### Politiques par défaut

Définir la politique par défaut (allow, deny) pour le trafic entrant ou sortant :

```bash
sudo ufw default <POLICY> <WAY>
```

Où `WAY` est `incoming` ou `outgoing`, et `POLICY` est `allow` ou `deny`.

### Ajout de règles

**Autoriser par nom de service :**

```bash
sudo ufw allow <PORT>/<PROTO>
```

**Autoriser par numéro de port :**

```bash
sudo ufw allow <PORT>/<PROTO> comment <COMMENT>
```

**Autoriser une plage de ports :**

```bash
sudo ufw allow <START_PORT>:<END_PORT> proto <PROTO>
```

**Autoriser depuis une IP ou un réseau :**

```bash
sudo ufw allow from <IP> to any port <PORT> proto <PROTO>
```

### Suppression de règles

Supprimer une règle par son numéro (affiché avec `ufw status numbered`) :

```bash
sudo ufw delete <UFW_RULES_NUMBER>
```

### Variables utiles

| Variable | Valeur |
|----------|--------|
| `POLICY` | `allow`, `deny` |
| `STATUS` | `enable`, `disable`, `reset` |
| `WAY` | `outgoing`, `incoming` |
| `PROTO` | `tcp`, `udp` |
| `SHOW_SOCKETS` | `listening`, `added` |

Voir aussi : [[entites/netfilter.md]], [[concepts/linux-capabilities.md]]

## Références croisées

- Voir aussi : [[entites/netfilter.md]] — netfilter est le framework sous-jacent utilisé par UFW
- Voir aussi : [[entites/apparmor.md]] — autre mécanisme de sécurité Linux
