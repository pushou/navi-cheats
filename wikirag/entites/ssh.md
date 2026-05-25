---
nom: SSH (Secure Shell)
description: Protocole de connexion distante sécurisée — tunnels, proxy SOCKS, port forwarding
type: entite
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - ssh
  - remote-access
  - tunneling
  - socks
  - port-forwarding
  - network
sources:
  - sources/ssh.cheat.md
---

# SSH (Secure Shell)

> Protocole de connexion distante sécurisée. Les snippets ci-dessous couvrent la création de proxys SOCKS et de tunnels SSH (port forwarding local).

## Résumé

SSH (Secure Shell) est un protocole de réseau crypté utilisé pour accéder à distance à des systèmes Linux/Unix. Au-delà du shell distant, SSH offre des fonctionnalités puissantes de tunneling réseau : proxy SOCKS dynamique et port forwarding local (L).

## Détails

### Proxy SOCKS via SSH

La combinaison `-fND` crée un tunnel SSH en arrière-plan (`-f`) agissant comme un proxy SOCKS (`-D 1080`) sur le port local 1080. Le `-N` empêche l'exécution d'une commande distante.

```bash
# Créer un proxy SOCKS via SSH
ssh -vv -fND 1080 <remote-user>@<remote_host>

# Utiliser curl avec ce proxy SOCKS pour accéder à ipinfo.io
curl --socks5 <remote_host>:1080 https://ipinfo.io/ip
```

Cela permet de router le trafic de n'importe quel client via le tunnel SSH chiffré.

### Tunneling local (port forwarding)

La `-L` forwarding redirige un port local vers un hôte accessible depuis la machine distante.

```bash
# Forwarder le port local 19999 vers localhost:19999 sur la machine distante
ssh -L 19999:localhost:19999 user@ip
```

Utile pour accéder à des services web ou bases de données exposés uniquement depuis la machine distante.

## Références croisées

- Voir aussi : [[concepts/tunneling.md]] — concept général de tunneling réseau
- Voir aussi : [[entites/wireguard.md]] — autre solution de tunneling sécurisé (VPN)
- Voir aussi : [[entites/ss.md]] — inspecter les sockets SSH avec ss
- Voir aussi : [[sources/ssh.cheat.md]] — source brute des snippets SSH
