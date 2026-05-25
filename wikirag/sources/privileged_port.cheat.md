---
nom: privileged_port cheatsheet
description: Configuration des ports privilégiés pour les utilisateurs non-root (sysctl)
type: source
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags: [privileged-ports, security, sysctl, linux, networking]
sources: []
---

# privileged_port cheatsheet

## Vue d'ensemble
Fichier cheat navi contenant la configuration sysctl pour autoriser les utilisateurs non-root à accéder aux ports privilégiés.

## Contenu

### Autoriser les ports non privilégiés
- Baisser la limite de port : `sudo sysctl -w net.ipv4.ip_unprivileged_port_start=80`
- Permet aux processus non-root de binding sur les ports 1-65535 (au lieu de la valeur par défaut 1024)

## Entités liées
- [[systemd]]
