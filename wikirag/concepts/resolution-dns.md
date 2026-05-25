---
nom: Résolution DNS
description: Processus de traduction de noms de domaine en adresses IP
type: concept
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - dns
  - resolution
  - network
  - resolution
---

# Résolution DNS

> La résolution DNS (Domain Name System) est le processus de traduction d'un nom de domaine lisible par un humain en une adresse IP. C'est un service fondamental d'Internet.

## Résumé

Le DNS est un système de nommage hiérarchique distribué. Un client DNS envoie une requête à un serveur DNS qui résout le nom de domaine en une adresse IP (ou un autre type d'enregistrement). Les types d'enregistrements courants incluent A (IPv4), AAAA (IPv6), MX (mail), TXT (texte), CNAME (alias), SRV (service), et SOA (autoritaire).

## Méthodes de résolution

### systemd-resolved (resolvectl)

Service résolveur intégré à systemd. Fournit un stub DNS local, la mise en cache, et la résolution par interface.

### BIND (dig)

La suite BIND est la référence en matière d'implémentation DNS. `dig` est l'outil CLI pour interagir avec les serveurs DNS.

### DNS-over-HTTPS (DoH)

Encapsule les requêtes DNS dans des requêtes HTTPS pour plus de confidentialité. Supporté par Cloudflare, Google, et d'autres.

### Client `q`

Client DoH dédié en ligne de commande.

## Références croées

- Voir aussi : [[entites/resolvectl.md]] — résolveur systemd
- Voir aussi : [[entites/dig.md]] — outil BIND dig
- Voir aussi : [[entites/dns-client-q.md]] — client DoH `q`
- Voir aussi : [[concepts/dns-over-https.md]] — DNS-over-HTTPS
- Voir aussi : [[entites/dhcp.md]] — DHCP distribue souvent les serveurs DNS
