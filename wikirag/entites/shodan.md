---
nom: Shodan
description: Moteur de recherche et base de données pour les appareils connectés à Internet
type: entite
date_creation: 2026-05-24
date_modification: 2026-05-24
version: 1.0.0
tags:
  - security
  - tools
  - recon
  - osint
  - internet-scanner
sources:
  - sources/security-tools.cheat.md
---

# Shodan

> Moteur de recherche Internet qui indexe les appareils connectés, leurs services ouverts, certificats et expositions.

## Résumé

Shodan est un moteur de recherche et une base de données d'appareils connectés à Internet. Il scanne continuellement Internet et indexe les services ouverts, les certificats TLS, les versions logicielles et les expositions de sécurité. L'API publique Shodan est accessible via `https://internetdb.shodan.io`.

## Détails

### API publique Shodan

**Vérifier l'état et les quotas de l'API :**

```bash
curl https://internetdb.shodan.io | jq
```

Cette URL retourne des informations de base sur les services exposés d'une IP sans clé API.

### Intégration avec Nrich

Nrich utilise Shodan comme source de données principale pour le renseignement IP. Les requêtes Nrich interrogent l'API Shodan et formatent les résultats pour faciliter l'analyse.

Voir aussi : [[entites/nrich.md]]

## Références croisées

- Voir aussi : [[entites/nrich.md]] — Nrich interroge l'API Shodan
- Voir aussi : [[entites/suricata.md]] — Suricata pour la détection (complément OSINT)
