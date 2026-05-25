---
nom: Suricata
description: IDS/NIDS open-source pour la détection d'intrusions et l'analyse de trafic réseau
type: entite
date_creation: 2026-05-24
date_modification: 2026-05-24
version: 1.0.0
tags:
  - ids
  - nids
  - security
  - network
  - surveillance
  - pcap
sources:
  - sources/suricata.cheat.md
---

# Suricata

> IDS/NIDS (Intrusion Detection System / Network IDS) open-source produit par l'OISF, capable d'analyse pcap en temps réel et de détection basée sur des signatures.

## Résumé

Suricata est un moteur IDS/NIDS hautement performant qui peut fonctionner en mode passif (analyse de pcap) ou actif (surveillance réseau). Il produit des logs structurés en JSON dans `eve.json`. `suricata-update` est l'outil d'accompagnement pour la gestion des sources de règles et mises à jour. `suricatasc` permet le contrôle à distance de Suricata.

## Détails

### Mise à jour des règles

**Activer des sources de règles :**

```bash
suricata-update enable-source tgreen/hunting
suricata-update enable-source oisf/trafficid
suricata-update enable-source etnetera/aggressive
suricata-update enable-source sslbl/ssl-fingerprints
suricata-update enable-source et/open
suricata-update enable-source sslbl/ja3-fingerprints
suricata-update enable-source ptresearch/attackdetection
```

**Mettre à jour les règles :**

```bash
suricata-update update-sources
suricata-update
```

**Lister les sources :**

```bash
suricata-update list-sources
suricata-update list-enabled-sources
```

### Analyse de pcap

**Générer `eve.json` à partir d'un pcap :**

```bash
sudo suricata -S "rules/*.rules" -l logs/ -k none -r fichier.pcap
```

**Lire un pcap avec `suricatasc` :**

```bash
suricatasc -c "pcap-file /chemin/vers/fichier.pcap /var/log/suricata"
```

### Rechargement des règles

```bash
suricatasc -c reload-rules
```

### Analyse de `eve.json` avec jq

**Couleuriser la sortie :**

```bash
tail -f eve.json | jq -c '.'
```

**Requêtes courantes sur eve.json :**

```bash
# Domaines NXDOMAIN
tail -f eve.json | jq -c 'select(.dns.rcode=="NXDOMAIN")'

# User-agents HTTP uniques (avec comptage)
cat eve.json | jq -s '[.[]|.http.http_user_agent]|group_by(.)|map({key:.[0],value:(.|length)})|from_entries'

# Payloads d'alertes (base64 décodé)
cat eve.json | jq -r -c 'select(.event_type=="alert")|.payload'|base64 --decode

# Top 10 des ports
cat eve.json | jq -c 'select(.event_type=="flow")|[.proto, .dest_port]'|sort |uniq -c|sort -nr|head -n10

# Somme des événements par type
head -5000 eve.json |jq -s '[.[]|select(.event_type)]'|from json| get event_type|uniq -c

# Bytes totaux vers le client
head -50000 eve.json |jq -s 'map(select(.event_type == "flow").flow.bytes_toclient)|add'|numfmt --to=iec
```

### Analyse complète de pcap avec jq (exemple Qakbot)

```bash
sudo suricata -S "rules/*.rules" -l logs/ -k none -r 2023-02-27-Qakbot-infection-traffic.pcap

# Types d'événements
jq -r .event_type logs/eve.json | sort | uniq -c | sort -rn

# Alertes
grep '"event_type":"alert"' logs/eve.json | jq .alert.signature | sort -rn | uniq -c | sort -rn

# TLS SNIs
jq 'select(.event_type=="tls")' logs/eve.json | jq .tls.sni | sort -rn | uniq -c | sort -rn

# Versions TLS
jq 'select(.event_type=="tls")' logs/eve.json | jq .tls.version | sort -rn | uniq -c | sort -rn

# Hostnames HTTP
jq 'select(.event_type=="http")' logs/eve.json | jq .http.hostname | sort -rn | uniq -c | sort -rn

# Requêtes DNS
jq 'select(.event_type=="dns")' logs/eve.json | jq .dns.rrname | sort -rn | uniq -c | sort -rn

# Protocoles de transfert de fichiers
jq 'select(.event_type=="fileinfo")' logs/eve.json | jq .app_proto | sort -rn | uniq -c | sort -rn

# Noms de fichiers
jq 'select(.event_type=="fileinfo")' logs/eve.json | jq .fileinfo.filename | sort -rn | uniq -c | sort -rn

# Magic des fichiers
jq 'select(.event_type=="fileinfo")' logs/eve.json | jq .fileinfo.magic | sort -rn | uniq -c | sort -rn

# Kerberos (SMB)
jq 'select(.event_type=="smb" and .smb.command=="SMB2_COMMAND_SESSION_SETUP" and .smb.status=="STATUS_SUCCESS")' logs/eve.json | jq .smb.kerberos.snames[1] | uniq -c | sort -rn

# SMB hostnames
jq 'select(.event_type=="smb" and .smb.command=="SMB1_COMMAND_SESSION_SETUP_ANDX" and .smb.status=="STATUS_SUCCESS" and .smb.ntlmssp)' logs/eve.json | jq .smb.ntlmssp.host | uniq -c | sort -rn
```

### Docker (TPOT style)

```bash
docker exec -it $(docker ps|grep suricata|awk '{print $1}') sh -c "suricata-update enable-source tgreen/hunting"
docker exec -it $(docker ps|grep suricata|awk '{print $1}') sh -c "suricata-update update-sources"
docker exec -it $(docker ps|grep suricata|awk '{print $1}') sh -c "suricata-update"
```

## Références croisées

- Voir aussi : [[entites/sandfly.md]] — outil complémentaire de threat hunting et forensic malware
- Voir aussi : [[entites/nrich.md]] — autre outil de recherche de surface d'attaque
