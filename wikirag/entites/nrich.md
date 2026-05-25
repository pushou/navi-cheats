---
nom: Nrich
description: Outil de recherche d'informations sur les adresses IP et les services en ligne
type: entite
date_creation: 2026-05-24
date_modification: 2026-05-24
version: 1.0.0
tags:
  - security
  - tools
  - recon
  - shodan
  - ip-research
sources:
  - sources/security-tools.cheat.md
---

# Nrich

> Outil de renseignement qui interroge Shodan et d'autres sources pour obtenir des informations sur les adresses IP, ports, services et expositions réseau.

## Résumé

Nrich est un outil de renseignement (OSINT) qui interroge Shodan pour extraire des informations détaillées sur les adresses IP. Il peut traiter une seule IP, une liste d'IPs, et formater la sortie en JSON pour un traitement ultérieur avec jq.

## Détails

### Recherche d'une IP unique

**Interroger une adresse IP unique :**

```bash
echo 194.199.227.220 | nrich -
```

### Recherche sur une liste d'IPs

**Lire une liste d'IPs depuis un fichier :**

```bash
wget http://opendbl.net/lists/tor-exit.list -O /tmp/tor-exit.list
nrich /tmp/tor-exit.list
```

**Scanner une plage /24 :**

```bash
seq -f "194.199.227.%g" 1 254 > /tmp/iplist.txt
nrich /tmp/iplist.txt
```

### Sortie JSON

**Format JSON avec jq :**

```bash
echo 194.199.227.220 | nrich - -o json | jq
```

### Vérification de la limite API Shodan

```bash
curl https://internetdb.shodan.io | jq
```

## Références croisées

- Voir aussi : [[entites/shodan.md]] — Shodan est la source de données principale utilisée par Nrich
- Voir aussi : [[entites/suricata.md]] — Suricata pour la détection réseau (complément OSINT)
