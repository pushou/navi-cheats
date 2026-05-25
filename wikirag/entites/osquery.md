---
nom: osquery
description: Framework de monitoring et d'audit de flottes de machines — requêtes SQL pour processus, paquets, hardware, sockets, fichiers, Docker
type: entite
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags: [osquery, monitoring, security, fleet, audit, sql, linux]
sources: [sources/osquery-fleet.cheat.md, sources/os-query.cheat.md]
---

# osquery

## Vue d'ensemble
**osquery** est un framework open-source qui expose l'état d'un système d'exploitation via des tables SQLite interrogeables en SQL. Utilisé pour le monitoring de flottes, l'audit de sécurité et l'analyse forensique.

## Tables principales

### Système
- `os_version` — Version du système d'exploitation
- `system_info` — hostname, CPU, mémoire, UUID, matériel
- `osinfo-query os` — Images OS disponibles (via libosinfo)

### Processus
- `processes` — Tous les processus avec détails
- `process_events` — Événements de processus (utile pour l'audit : commandes exécutées)
- Détection de binaire supprimé du disque (`on_disk = 0`) — indicateur de malware

### Utilisateurs
- `logged_in_users` — Utilisateurs connectés

### Paquets
- `deb_packages` — Paquets Debian/Ubuntu installés (filtrable par nom)

### Réseau
- `process_open_sockets` — Sockets ouverts
- `arp_cache` — Cache ARP
- `interface_details` — Détails des interfaces réseau
- `curl` — Requêtes HTTP et temps de réponse
- `curl_certificate` — Certificats TLS

### Fichiers
- `file` — Attributs de fichiers
- `hash` — Hashes (MD5, SHA, etc.)

### Matériel
- `hardware_events` — Changements matériels (USB, disques)

### Docker
- `docker_info` — Statut des containers
- `docker_container_processes` — Processus dans un container donné

## Format de sortie
Toutes les commandes utilisent `--json` avec `jq` pour un formatage en JSON structuré.

## Entités liées
- [[systemd]] — Monitoring système alternatif
- [[performance-diagnostic]] — Complément de monitoring
- [[docker]] — Monitoring des containers via osquery
