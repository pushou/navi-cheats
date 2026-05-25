---
nom: resolvectl
description: Outil de résolution DNS de systemd-resolved — requêtes, statistiques, debug
type: entite
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - resolvectl
  - systemd-resolved
  - dns
  - dns-client
  - resolution
sources:
  - sources/dns_client.cheat.md
---

# resolvectl

> Outil de ligne de commande pour interagir avec `systemd-resolved`, le résolveur DNS intégré aux distributions Linux modernes. Ce snippet couvre les requêtes DNS, la configuration par interface, les statistiques et le debug.

## Résumé

`resolvectl` (anciennement `systemd-resolve`) est l'interface CLI de systemd-resolved, le résolveur DNS stub intégré à systemd. Il permet de faire des requêtes DNS, de configurer les serveurs DNS par interface, de gérer le LLMNR/mdns, et de déboguer la résolution.

## Détails

### Requêtes DNS simples

```bash
# Requêter un domaine
resolvectl query registry.iutbeziers.fr

# Reverse lookup
resolvectl query 194.199.227.220

# Requêter un type d'enregistrement spécifique
resolvectl -t MX query umontpellier.fr
resolvectl -t AAAA query umontpellier.fr
resolvectl -t SRV query _sip._tcp.umontpellier.fr
```

### Configuration par interface

```bash
# Voir les DNS configurés par interface
resolvectl dns

# Voir les domaines par interface
resolvectl domain

# Activer/désactiver le default-route par interface
resolvectl default-route enp0s3 false
```

### Statistiques et debug

```bash
# Voir les statistiques de résolution
resolvectl statistics

# Voir le statut global
resolvectl status

# Debug systemd-resolved
sudo resolvectl log-level debug
sudo journalctl -f -u systemd-resolved.service
```

### Ordres disponibles

`resolvectl` accepte de nombreux ordres : `query`, `service`, `openpgp`, `tlsa`, `status`, `statistics`, `reset-statistics`, `flush-caches`, `reset-server-features`, `dns`, `domain`, `default-route`, `llmnr`, `mdns`, `dnsovertls`, `dnssec`, `nta`, `revert`, `log-level`.

## Références croisées

- Voir aussi : [[concepts/resolution-dns.md]] — concept de résolution DNS
- Voir aussi : [[entites/dig.md]] — alternative DNS avec dig (BIND)
- Voir aussi : [[entites/dns-client-q.md]] — client DoH `q` pour DNS-over-HTTPS
- Voir aussi : [[entites/openssl.md]] — vérification TLS (utile pour DoH)
- Voir aussi : [[sources/dns_client.cheat.md]] — source brute des snippets resolvectl
