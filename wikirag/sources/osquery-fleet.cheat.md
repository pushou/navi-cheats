---
nom: osquery fleet cheatsheet
description: Mémo des requêtes osquery pour le monitoring et l'audit de flottes de machines (processus, paquets, hardware, sockets, fichiers, Docker)
type: source
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags: [osquery, fleet, monitoring, security, audit, sql, processes, packages, hardware, sockets, docker]
sources: []
---

# osquery fleet cheatsheet

## Vue d'ensemble
Fichier cheat navi contenant les requêtes osquery pour l'audit et la surveillance de flottes de machines Linux. Inspiré de [Hackertarget osquery Linux tutorial](https://hackertarget.com/osquery-linux-tutorial/).

## Contenu

### Version OS
- Version : `osqueryi --json "SELECT version FROM os_version;" | jq '[.]'`

### Informations système
- Hardware : `osqueryi --json "SELECT hostname, cpu_brand, cpu_physical_cores, cpu_logical_cores, physical_memory FROM system_info;" | jq '[.]'`
- Détails complets : `osqueryi --json "SELECT uuid, hardware_serial, hostname, cpu_subtype, cpu_brand, physical_memory, hardware_vendor, hardware_model FROM system_info;" | jq '.[]'`

### Processus
- Tous les processus : `osqueryi --json "SELECT * FROM processes;" | jq '[.]'`
- Derniers 10 démarrés : `echo "select pid, name FROM processes order by start_time desc limit 10;" | osqueryi --json | jq '.[]' | jq '[.]'`
- Nom seul : `echo "select * from processes;" | osqueryi --json | jq '.[].name'`
- Binaire supprimé du disque (malware) : `osqueryi --json "SELECT name, path, pid FROM processes WHERE on_disk = 0;" | jq '[.]'`
- Events avec filtre : `osqueryi --json "SELECT * FROM process_events WHERE cmd_line LIKE 'nmap%';" | jq '[.]'`

### Utilisateurs connectés
- `osqueryi --json "SELECT * FROM logged_in_users;" | jq '[.]'`

### Paquets (Debian)
- Filtre python3 : `osqueryi --json "SELECT * FROM deb_packages WHERE name LIKE 'python3%';" | jq '[.]'`
- Limit 2 : `echo "select * from deb_packages limit 2;" | osqueryi --json | jq '.[]'`

### Réseau
- Sockets ouverts : `osqueryi --json "SELECT * FROM process_open_sockets;" | jq '[.]'`
- ARP cache : `echo "select * from arp_cache;" | osqueryi --json | jq '.[]'`
- Détails interfaces : `echo "select * from interface_details;" | osqueryi --json | jq '.[].interface'`
- Curl et temps de réponse : `osqueryi --json "SELECT url, round_trip_time, response_code FROM curl WHERE url = 'https://github.com/';" | jq '[.]'`
- Certificats : `osqueryi --json "SELECT * FROM curl_certificate WHERE hostname = 'api.hackertarget.com:443';" | jq '[.]'`

### Fichiers
- Attributs : `osqueryi --json "SELECT * FROM file WHERE path = '/etc/passwd';" | jq '[.]'`
- Hash MD5 : `osqueryi --json "SELECT md5 FROM hash WHERE path = '/etc/passwd';" | jq '[.]'`

### Matériel
- Events (USB, disques) : `osqueryi --json "SELECT * FROM hardware_events;" | jq '[.]'`

### Docker
- Info Docker : `osqueryi --json "SELECT containers, containers_running, containers_paused, containers_stopped FROM docker_info;" | jq '[.]'`
- Processus dans un container : `osqueryi --json "SELECT pid, cmdline FROM docker_container_processes WHERE id = '$container_id';" | jq '[.]'`

## Entités liées
- [[osquery]]
- [[docker]]
