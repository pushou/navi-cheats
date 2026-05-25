---
nom: Postfix
description: MTA (Mail Transfer Agent) Linux — configuration, file d'attente, TLS, Docker macvlan
type: entite
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - postfix
  - smtp
  - mta
  - email
  - tls
sources:
  - sources/smtp-client.cheat.md
---

# Postfix

> MTA (Mail Transfer Agent) Linux standard. Ce snippet couvre la vérification des ports d'écoute, la gestion de la file d'attente, la configuration TLS, et le déploiement Docker avec macvlan.

## Résumé

Postfix est un MTA (Mail Transfer Agent) open-source développé par IBM et maintenu par la communauté. C'est le serveur SMTP par défaut de nombreuses distributions Linux. Ce cheatsheet couvre la vérification des ports, la gestion de file d'attente, TLS, et le déploiement avec Docker.

## Détails

### Vérification des ports SMTP

```bash
# Avec lsof
lsof -i :110,995,143,993,25,587

# Avec ss (plus moderne et rapide)
ss -tnlp | egrep :(110|995|143|993|25|587)
```

Ports standards :
- **25** : SMTP (relay)
- **587** : SMTP submission (client → serveur)
- **465** : SMTPS (SSL/TLS implicite)
- **143** : IMAP
- **993** : IMAPS
- **110** : POP3
- **995** : POP3S

### Gestion de la file d'attente

```bash
# Voir la file d'attente
mailq

# Vider la file
sudo postfix flush

# Supprimer tous les messages de la file
postsuper -d ALL

# Forcer la lecture (si nécessaire)
sudo ostqueue -f
```

### Configuration et logs

```bash
# Afficher la configuration active
postconf -n

# Logs systemd
journalctl -u postfix
```

### Vérification TLS

```bash
# Test SSL pour SMTPS (port 465)
openssl s_client -connect localhost:465

# Vérification STARTTLS
openssl s_client -connect <serveur-smtp>:<port> -starttls smtp

# Debug TLS
posttls-finger -c -Ldebug "[<serveur-smtp>]:<port>"
```

### Déploiement Docker avec macvlan

```bash
# Créer un réseau macvlan Docker
docker network create -d macvlan \
  --subnet=192.168.1.0/24 \
  --gateway=192.168.1.1 \
  --ip-range=192.168.1.251/30 \
  -o parent=enp0s3 \
  net-192

# Lancer Postfix dans le macvlan
docker run -d --network=net-192 \
  -v ~/postfix:/etc/postfix \
  --name postfix-192-0 \
  --hostname postfix-192-0 \
  -it registry.iutbeziers.fr/postfixiut:latest
```

## Références croées

- Voir aussi : [[entites/swaks.md]] — outil d'envoi de test SMTP
- Voir aussi : [[entites/openssl.md]] — vérification TLS avec s_client
- Voir aussi : [[entites/docker.md]] — déploiement conteneurisé
- Voir aussi : [[entites/iproute2.md]] — réseau macvlan avec iproute2
- Voir aussi : [[sources/smtp-client.cheat.md]] — source brute des snippets Postfix
