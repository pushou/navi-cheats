---
nom: q (client DNS)
description: Client DNS moderne pour DNS-over-HTTPS — requêtes rapides avec curl
type: entite
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - q
  - dns
  - doh
  - dns-client
  - resolution
sources:
  - sources/dns_client.cheat.md
---

# q (client DNS)

> `q` est un client DNS moderne spécialisé dans le DNS-over-HTTPS (DoH). Il permet de faire des requêtes DNS chiffrées vers des résolveurs DoH publics comme Cloudflare ou DNSwarden.

## Résumé

`q` est un outil CLI dédié au DNS-over-HTTPS. Il offre une interface simple pour requêter n'importe quel résolveur DoH, avec support des requêtes inverses, multi-types, et du mode verbeux. Alternative moderne aux outils DNS traditionnels.

## Détails

### Requêtes DoH avec q

```bash
# Requêter via DNSwarden
q A www.umontpellier.fr @https://doh.dnswarden.com

# Mode verbeux avec Cloudflare
q -v A www.umontpellier.fr @https://cloudflare-dns.com/dns-query

# Requêtes multi-types
q MX TXT umontpellier.fr

# Reverse lookup
q -x 194.199.227.80
```

### Comparaison DNS-over-HTTPS avec curl

Pour les cas où `q` n'est pas installé, `curl` peut aussi faire du DoH :

```bash
# DoH avec curl (format JSON)
curl -H 'accept: application/dns-json' \
  'https://cloudflare-dns.com/dns-query?name=www.example.com&type=A' | jq .

# DoH avec curl (format binaire wire-format)
curl -H 'accept: application/dns-message' \
  'https://dns.google/dns-query?dns=...' | hexdump -c
```

## Références croisées

- Voir aussi : [[concepts/dns-over-https.md]] — concept DoH
- Voir aussi : [[entites/dig.md]] — DNS traditionnel avec dig
- Voir aussi : [[entites/resolvectl.md]] — DNS systemd-resolved
- Voir aussi : [[sources/dns_client.cheat.md]] — source brute des snippets DNS
