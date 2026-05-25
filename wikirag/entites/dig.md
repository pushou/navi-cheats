---
nom: dig
description: Outil de requête DNS du BIND — requêtes A, MX, reverse, trace, DoH
type: entite
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - dig
  - bind
  - dns
  - dns-client
  - resolution
sources:
  - sources/dns_client.cheat.md
---

# dig

> Outil de requête DNS inclus dans la suite BIND (Berkeley Internet Name Domain). Permet de faire des requêtes DNS complètes avec divers types d'enregistrements, traces, et support de DNS-over-HTTPS.

## Résumé

`dig` (Domain Information Groper) est l'outil de référence pour les diagnostiques DNS. Il est plus complet que `nslookup` et produit une sortie structurée facile à parser. Supporte les requêtes de tout type (A, AAAA, MX, TXT, SRV, SOA, CNAME), les traces, et le DNS-over-HTTPS.

## Détails

### Requêtes simples

```bash
# Requêter un FQDN
dig www.umontpellier.fr

# Requêter avec sortie courte
dig +short www.umontpellier.fr

# Se concentrer sur la réponse
dig www.umontpellier.fr +noall +answer
```

### Reverse lookup et traces

```bash
# Reverse DNS
dig -x 194.199.227.220

# Trace complète depuis les root servers
dig +trace umontpellier.fr

# Sans récursion (interroger directement)
dig +norec @a.root-servers.net. umontpellier.fr
```

### Types d'enregistrements spécifiques

```bash
# Enregistrements NS
dig +short fr. NS

# Enregistrements TXT
dig +noall +answer umontpellier.fr TXT

# Enregistrements MX
dig MX umontpellier.fr

# Enregistrements AAAA (IPv6)
dig -6 @2001:4860:4860::8888 google.com A
```

### DNS-over-HTTPS

```bash
# dig avec DoH via Cloudflare
dig @8.8.8.8 +https www.google.fr

# Requêtes multiples depuis un fichier
dig -f query.txt +short
```

## Références croisées

- Voir aussi : [[concepts/resolution-dns.md]] — concept de résolution DNS
- Voir aussi : [[entites/resolvectl.md]] — alternative systemd-resolved
- Voir aussi : [[entites/dns-client-q.md]] — client DoH `q`
- Voir aussi : [[sources/dns_client.cheat.md]] — source brute des snippets dig
