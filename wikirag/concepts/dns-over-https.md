---
nom: DNS-over-HTTPS (DoH)
description: Encapsulation des requêtes DNS dans HTTPS pour plus de confidentialité
type: concept
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - doh
  - dns
  - privacy
  - encryption
  - network
---

# DNS-over-HTTPS (DoH)

> Le DNS-over-HTTPS (DoH) encapsule les requêtes DNS dans des connexions HTTPS pour éviter l'interception et la manipulation par des tiers.

## Résumé

Le DNS traditionnel (port 53, UDP/TCP) envoie les requêtes en clair, ce qui permet à quiconque sur le chemin de voir quels domaines sont consultés. DoH résout ce problème en utilisant HTTPS (port 443) comme transport. Les principaux fournisseurs sont Cloudflare (1.1.1.1) et Google (8.8.8.8).

## Implémentations

### curl

`curl` peut faire des requêtes DoH en spécifiant le bon header `Accept` :
- `application/dns-json` : réponse JSON (Cloudflare)
- `application/dns-message` : réponse binaire wire-format (Google)

### Client `q`

Outil CLI dédié au DoH. Supporte les requêtes A, AAAA, MX, TXT, SRV, reverse, et le mode verbeux.

### dig +https

`dig` supporte le DoH avec le flag `+https` :

```bash
dig @8.8.8.8 +https www.google.com
```

## Références croées

- Voir aussi : [[concepts/resolution-dns.md]] — concept de résolution DNS
- Voir aussi : [[entites/dns-client-q.md]] — client DoH `q`
- Voir aussi : [[entites/dig.md]] — dig +https
- Voir aussi : [[entites/openssl.md]] — vérification TLS pour DoH
