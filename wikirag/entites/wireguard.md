---
nom: WireGuard
description: VPN moderne et performant pour Linux — debug du module noyau
type: entite
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - wireguard
  - vpn
  - network
  - security
  - kernel-module
sources:
  - sources/wireguard.cheat.md
---

# WireGuard

> VPN moderne et performant intégré au noyau Linux. Ce snippet couvre le debug dynamique du module noyau WireGuard via le système de debugfs.

## Résumé

WireGuard est un serveur VPN simple, rapide et moderne intégré au noyau Linux depuis la version 5.6. Il utilise le chiffrement de pointe (ChaCha20, Poly1305, BLAKE2s) et une base de code minimale (~4000 lignes). Le snippet ci-dessous active le debug du module noyau via debugfs.

## Détails

### Debug du module noyau WireGuard

Active la trace dynamique du module noyau WireGuard via `dynamic_debug` et pipe les logs en temps réel.

```bash
# Activer le debug du module wireguard
echo 'module wireguard +p' > /sys/kernel/debug/dynamic_debug/control

# Suivre les logs en temps réel
journalctl -kf
```

Le flag `+p` active le logging avec les niveaux de fonction et fichier. Les logs WireGuard apparaissent alors dans le journal système.

## Références croisées

- Voir aussi : [[concepts/vpn.md]] — concept général de VPN
- Voir aussi : [[entites/ssh.md]] — SSH tunneling comme alternative légère au VPN
- Voir aussi : [[entites/iproute2.md]] — configuration réseau sous-jacente nécessaire
- Voir aussi : [[entites/ufw.md]] — pare-feu à configurer pour les rules WireGuard (port 51820/udp)
- Voir aussi : [[sources/wireguard.cheat.md]] — source brute du snippet WireGuard
