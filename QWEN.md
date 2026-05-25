# QWEN.md — Contexte du projet Wikiia

## Vue d'ensemble

**Wikiia** est un dépôt de connaissances personnelles structuré en deux couches complémentaires :

1. **`sources/`** — Collection de fichiers `.cheat` pour [navi](https://github.com/denisidoro/navi), un outil interactif de cheatsheets. Ces fichiers contiennent des snippets, commandes et patterns pour une cinquantaine de sujets (CLI, réseau, conteneurs, sécurité, virtualisation, etc.).
2. **`wikirag/`** — Vault Obsidian implémentant le pattern **LLM Wiki** : une base de connaissances personnelle maintenue par un LLM, avec ingestion de sources, requêtes, et nettoyage périodique.

L'auteur est **pushou** (alias `pouchou`). Le dépôt est synchronisé via **Nextcloud**.

---

## Structure du projet

```
wikiia/
├── sources/                 # Cheatsheets navi (54 fichiers .cheat)
│   ├── README.md            # Note : "testing cheat"
│   ├── navi_memo.cheat      # Mémo pour gérer les dépôts navi
│   ├── bash.cheat           # Snippets bash (sockets, scanners, transferts, reverse shells…)
│   ├── docker.cheat         # Docker (socat, debug, nsenter, sbom, scout)
│   ├── ssh.cheat            # SSH (socks proxy, tunnels web)
│   ├── common.cheat         # Variables et patterns communs (UFW, ports, ipset…)
│   ├── netfilter.cheat      # Netfilter/iptables
│   ├── wireguard.cheat      # WireGuard
│   ├── systemd-ctl.cheat    # systemd
│   ├── vim.cheat            # Vim
│   ├── ...                  # ~50 autres fichiers (aws, openssl, qemu, suricata, mikrotik…)
│   └── pushou__navi-cheats/ # Sous-répôt (cheats personnalisés pushou)
├── wikirag/                 # Vault Obsidian (LLM Wiki)
│   ├── Bienvenue.md         # Note par défaut Obsidian
│   └── .obsidian/           # Config Obsidian
│       ├── app.json
│       ├── appearance.json
│       ├── core-plugins.json
│       ├── graph.json
│       └── workspace.json
└── QWEN.md                  # Ce fichier — contexte pour les agents LLM
```

---

## Fichiers sources (`sources/`)

### Format navi

Chaque fichier `.cheat` suit le format de `navi` :

```
% tag1,tag2,auteur          # En-tête avec tags
$ VARIABLE: echo 'option1 option2' | tr ' ' '\n'   # Variables de sélection
# Titre du snippet           # Commentaire descriptif
commande ou code ici         # Commande pratique
```

- **`%`** : ligne d'en-tête avec tags et nom d'auteur
- **`$`** : définition de variables interactives (menu déroulant dans navi)
- **`#`** : commentaires descriptifs
- Le reste : snippets de commandes ou code

### Couverture thématique

| Catégorie | Fichiers représentatifs |
|---|---|
| **Shell / CLI** | `bash.cheat`, `awk.cheat`, `fzf.cheat`, `heredoc.cheat`, `nushell.cheat`, `vim.cheat` |
| **Réseau** | `ssh.cheat`, `wireguard.cheat`, `dhcp.cheat`, `dns_client.cheat`, `iproute2.cheat`, `mtr-traceroute-ping.cheat`, `wifi.cheat` |
| **Firewall / Sécurité** | `ufw.cheat`, `netfilter.cheat`, `capabilities.cheat`, `security-tools.cheat`, `suricata.cheat`, `sandfly.cheat` |
| **Conteneurs / VM** | `docker.cheat`, `docker-operations.cheat`, `qemu.cheat`, `vbox.cheat`, `virsh.cheat`, `nsenter.cheat` |
| **Système** | `systemd-ctl.cheat`, `cgroups.cheat`, `perf.cheat`, `privileged_port.cheat` |
| **Cloud / Infrastructure** | `aws.cheat`, `osquery-fleet.cheat`, `netlab.cheat` |
| **Cisco / Router** | `bgp-cisco.cheat`, `igp-cisco.cheat`, `mpls-cisco.cheat` |
| **Misc** | `markdown.cheat`, `term.cheat`, `windows.cheat`, `openssl.cheat` |

---

## Vault Obsidian (`wikirag/`)

Le dossier `wikirag/` est un **vault Obsidian** configuré avec les plugins suivants :

### Plugins actifs
- **Graph view** — Visualisation des liens entre notes
- **Backlinks** — Liens entrants
- **Canvas** — Tableaux blancs pour organiser des idées
- **Daily notes** — Notes quotidiennes
- **Tag pane** — Panneau des tags
- **Bookmarks** — Signets
- **Outline** — Plan des documents
- **Properties** — Propriétés YAML
- **Sync** — Synchronisation
- **Bases** — Bases de données (plugin Bases)
- **File explorer, Global search, Switcher, Outgoing link, Page preview, Word count, Templates, Note composer, Command palette, File recovery**

### Plugin inactifs
- Footnotes, Slash commands, Markdown importer, ZK prefixer, Random note, Slides, Audio recorder, Workspaces, Publish, Webviewer

### Pattern LLM Wiki

Le projet `wikirag/` est conçu pour implémenter le pattern **LLM Wiki** (document de référence fourni dans le prompt de l'utilisateur). Ce pattern repose sur trois couches :

1. **Sources brutes** — Documents immutables (articles, papers, notes…)
2. **Wiki** — Pages Markdown générées et maintenues par le LLM (résumés, entités, concepts, comparaisons)
3. **Schema** — Document de conventions (ici, potentiellement `QWEN.md` ou un fichier dédié)

Opérations principales :
- **Ingest** — Le LLM lit une source et met à jour le wiki
- **Query** — Requêtes sur le wiki avec citations
- **Lint** — Vérification périodique (contradictions, pages orphelines, données périmées)

---

## Utilisations attendues

### init
Read these papers and create entity pages in wiki/. For each key concept
create a markdown file with a summary, explanation, related links using
[[brackets]], and note any contradictions between papers.

### new source
A new source has been added. Read it alongside the existing wiki pages.
Update any existing entity pages affected by this new source.
Create new entity pages for any new concepts introduced.
Flag any contradictions with previously compiled knowledge.


### linting
Audit the entire wiki/ folder. Identify: 1. Orphan pages — pages that no other page links to 2. Missing pages — concepts referenced with [[brackets]] that dont have their own page yet 3. Contradictions — claims that conflict across pages 4. Stale claims — things that may have been superseded by a more recent source in raw/ Suggest fixes and, where confident, apply them directly.

### Avec navi
```bash
# Installer navi (selon la plateforme)
# Ajouter le dépôt de cheats
navi repo add https://github.com/pushou/navi-cheats.git

# Interagir avec les cheats
navi
```

### Avec le LLM Wiki
- Ingestion de nouvelles sources dans `wikirag/`
- Requêtes et synthèse de connaissances
- Maintenance du wiki (lint, cross-references, détection de contradictions)
- Navigation dans Obsidian pour explorer le graphique des connaissances

---

## Conventions

- **Langue de réponse** : Français (sauf demande explicite d'une autre langue)
- **Synchronisation** : Nextcloud
- **Auteur des cheats** : `pushou` (identifié dans les en-têtes `%`)
- **Format des cheats** : Format natif `navi` avec variables et tags
- **Vault** : Obsidian avec plugins standards (pas de plugins tiers complexes)

---

## Notes

- Ce dépôt n'a pas de `README.md` principal — il est remplacé par ce `QWEN.md` comme point d'entrée pour les agents LLM.
- Les fichiers `.cheat` contiennent des snippets pratiques mais certains sont incomplets (tronqués).
- Le dossier `wikirag/` est en phase initiale (note `Bienvenue.md` par défaut d'Obsidian).


