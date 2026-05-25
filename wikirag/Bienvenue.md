---
nom: Bienvenue sur le Wiki LLM
description: Page d'accueil — présentation du wiki et de son usage
type: meta
date_creation: 2026-05-24
date_modification: 2026-05-24
version: 1.0.0
tags:
  - meta
  - accueil
  - introduction
---

# Bienvenue sur le Wiki LLM

> Un wiki de connaissances structuré, maintenu automatiquement par un LLM.

## C'est quoi ?

Ce wiki est un système de connaissances qui transforme des sources brutes (cheat sheets, documentation, notes) en pages structurées et interconnectées. Il repose sur trois couches :

1. **Sources brutes** — Les documents originaux, immuables, dans `sources/`.
2. **Wiki** — Les pages Markdown générées et maintenues par le LLM.
3. **Schema** — Les conventions qui guident le LLM (`schema.md`).

## Comment l'utiliser ?

Le wiki supporte trois opérations principales :

| Opération | Description | Exemple |
|-----------|-------------|---------|
| **Ingest** | Ajouter des connaissances depuis une source brute | `ingest docker.cheat` |
| **Query** | Requêter le wiki avec citations | `query : "comment fonctionnent les namespaces Docker ?"` |
| **Lint** | Vérifier la santé du wiki | `lint` |

## Navigation rapide

- [[index.md]] — Catalogue complet des pages
- [[schema.md]] — Conventions et workflows du wiki
- [[log.md]] — Historique de toutes les actions
- [[synthese.md]] — Vue d'ensemble du wiki

## Structure des répertoires

```
wikirag/
├── index.md           # Catalogue des pages
├── log.md             # Journal chronologique
├── schema.md          # Conventions du wiki
├── synthese.md        # Vue d'ensemble
├── concepts/          # Notions, principes, patterns
├── entites/           # Outils, logiciels, protocoles
├── sources/           # Références aux sources ingérées
├── comparaisons/      # Comparaisons entre entités/concepts
└── synthèses/         # Synthèses multi-sources
```

---

*Wiki LLM — Initialisé le 2026-05-24*
