---
nom: Vue d'ensemble
description: Synthèse générale des connaissances du wiki
type: synthese
date_creation: 2026-05-24
date_modification: 2026-05-25
version: 2.0.0
tags:
  - meta
  - synthese
  - vue-d-ensemble
sources: []
---

# Vue d'ensemble du Wiki LLM

> Cette page présente l'état actuel des connaissances du wiki et les axes de développement.

---

## À quoi sert ce wiki ?

Ce wiki LLM est un système de connaissances structuré et maintenu automatiquement par un LLM. Il s'appuie sur trois couches :

1. **Sources brutes** — Les documents originaux (cheat sheets navi) qui servent de matière première. Ces documents sont immuables.
2. **Wiki** — Les pages Markdown qui synthétisent, organisent et relient les connaissances issues des sources.
3. **Schema** — Le document de conventions (`schema.md`) qui guide le LLM dans toutes ses opérations.

## Comment ça marche ?

Le wiki fonctionne avec trois opérations principales :

- **Ingest** — Le LLM lit une source brute et met à jour le wiki (crée des pages, met à jour l'index, ajoute des cross-references).
- **Query** — On interroge le wiki pour obtenir des réponses structurées et citées.
- **Lint** — Le wiki vérifie périodiquement sa propre santé (liens brisés, pages orphelines, contradictions, données périmées).

## État actuel

| Métrique | Valeur |
|----------|--------|
| Pages totales | 70 |
| Concepts | 17 |
| Entités | 41 |
| Sources ingérées | 51 |
| Dernier ingest | 2026-05-25 (réinitialisation complète) |
| Dernier lint | — |

### Répartition par catégorie des sources

| Catégorie | Fichiers | Entités créées | Statut |
|-----------|----------|----------------|--------|
| **Shell / CLI** | bash, awk, fzf, heredoc, nushell, vim, term | navi, variables-partagees, commande-obfuscation, psexec | ✅ 4 entités |
| **Réseau** | ssh, wireguard, dhcp, dns, iproute2, mtr, wifi, ss, route, ethtools, hping3, smtp | ssh, wireguard, dhcp, dig, resolvectl, dns-client-q, iproute2, mtr, ss, ethtool, hping3, wifi-tools, postfix, swaks | ✅ 14 entités |
| **Firewall / Sécurité** | ufw, netfilter, capabilities, security-tools, suricata, sandfly, openssl, apparmor | ufw, netfilter, capsh, setcap, shodan, nrich, suricata, sandfly, openssl, apparmor | ✅ 10 entités |
| **Conteneurs / VM** | docker, docker-operations, nsenter, qemu, vbox, virsh | docker, nsenter, qemu, virtualbox, libvirt | ✅ 5 entités |
| **Système** | systemd-ctl, cgroups, perf, privileged_port | systemd, performance-diagnostic | ✅ 2 entités + 1 concept |
| **Cloud / Infrastructure** | aws, osquery-fleet, os-query, netlab, glab | aws-cli, osquery, gitlab, network-lab | ✅ 4 entités |
| **Cisco / Router** | bgp-cisco, igp-cisco, mpls-cisco, mikrotik | cisco-ios | ✅ 1 entité + 3 concepts |
| **Misc** | markdown, windows | marp | ✅ 1 entité |

## Cross-references créées

Le wiki établit déjà des liens entre plusieurs entités :

- **Docker** ↔ **nsenter** (accès interne aux conteneurs)
- **UFW** ↔ **Netfilter** (UFW utilise netfilter comme sous-couche)
- **UFW** ↔ **AppArmor** (deux mécanismes de sécurité Linux)
- **Netfilter** ↔ **UFW** (netfilter est le framework sous-jacent)
- **AppArmor** ↔ **Linux capabilities** (interagissent dans le contrôle d'accès)
- **Nrich** ↔ **Shodan** (Nrich utilise Shodan comme source de données)
- **Suricata** ↔ **SandFly** (complémentaires : détection réseau + forensic)
- **Capsh** ↔ **Setcap/Getcap** (outils complémentaires de gestion des capacités)
- **Cisco IOS** ↔ **BGP/IGP/MPLS** (protocoles de routage)
- **WireGuard** ↔ **Tunneling** (protocole de tunneling)
- **SSH** ↔ **Tunneling** (tunneling SSH)
- **Resolvectl** ↔ **Dig** ↔ **DNS client q** (résolution DNS)

## Prochaines étapes

- [ ] Créer des pages de comparaison (UFW vs iptables, Suricata vs Snort, QEMU vs KVM)
- [ ] Lier les pages de concepts aux entités correspondantes (cross-references bidirectionnelles)
- [ ] Exécuter un premier `lint` complet pour valider la cohérence
- [ ] Créer des pages de synthèse multi-sources par domaine (ex: "Sécurité Linux", "Réseau Linux")
- [ ] Définir un cycle régulier d'ingest et de lint
