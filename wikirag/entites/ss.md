---
nom: ss (socket statistics)
description: Outil d'inspection des sockets réseau — alternative moderne à netstat
type: entite
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - ss
  - socket
  - network
  - debugging
  - netstat-replacement
sources:
  - sources/ss.cheat.md
---

# ss (socket statistics)

> Outil de ligne de commande pour inspecter les sockets réseau. Alternative moderne et plus rapide à `netstat`. Fait partie de la suite `iproute2`.

## Résumé

`ss` (socket statistics) permet d'afficher l'état des sockets réseau, y compris les connexions TCP, UDP, UNIX, et les informations sur les processus qui les utilisent. C'est l'équivalent moderne de `netstat` et `ss -tunlp` remplace `netstat -tunlp`.

## Détails

### Commande de base

```bash
# Afficher toutes les sockets TCP/UDP avec les processus (équivalent netstat -tunlp)
ss -tunlp
```

### Statistiques

```bash
# Statistiques sockets résumées
ss -s
```

### Filtres TCP

```bash
# Filtre par état TCP
ss -4 --tcp state established
ss -4 --tcp state syn-sent

# Filtre par numéro de port (nommé)
ss -4 --tcp '( dport = :ssh or sport = :ssh )'

# Filtre par numéro de port (numérique)
ss -4 --tcp '( dport = :22 or sport = :22 )'

# Filtre par adresse source et port > N
ss -4 --tcp src 192.168.1.0/24 sport gt 5000
```

### Timers et retransmissions

```bash
# Afficher les timers TCP
ss -tn -o

# Voir les retransmissions TCP
ss -iuout
```

### Cgroups et eBPF

```bash
# Sockets avec info cgroups complète
ss -neopa

# Sockets avec eBPF attachés
sudo ss -0bp
```

### Monitoring continu

```bash
watch -n 1 "ss -t4 state syn-sent"
```

## Références croisées

- Voir aussi : [[entites/iproute2.md]] — ss fait partie de la suite iproute2
- Voir aussi : [[entites/ssh.md]] — inspecter les sockets SSH
- Voir aussi : [[sources/ss.cheat.md]] — source brute des snippets ss
- Voir aussi : [[sources/smtp-client.cheat.md]] — exemple d'utilisation de ss pour vérifier les ports SMTP
