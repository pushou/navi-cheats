---
nom: Schéma du Wiki LLM
description: Conventions, formats et workflows du pattern LLM Wiki
type: meta
date_creation: 2026-05-24
date_modification: 2026-05-24
version: 1.0.0
tags:
  - meta
  - schema
  - conventions
  - workflow
---

# Schéma du Wiki LLM

> Ce document définit les conventions du wiki. Il est lu par le LLM avant chaque opération (ingest, query, lint).
> Toute modification du schéma doit être consignée dans `log.md`.

---

## 1. Structure des répertoires

```
wikirag/
├── index.md              # Catalogue content-oriented
├── log.md                # Journal chronologique append-only
├── schema.md             # Ce document — conventions du wiki
├── synthese.md           # Page de synthèse/générale
├── concepts/             # Pages de concepts (notions, principes, patterns)
│   └── .gitkeep
├── entites/              # Pages d'entités (outils, logiciels, protocoles)
│   └── .gitkeep
├── sources/              # Références aux sources brutes ingérées
│   └── .gitkeep
├── comparaisons/         # Pages comparant deux entités/concepts
│   └── .gitkeep
└── synthèses/            # Pages de synthèse agrégée
    └── .gitkeep
```

**Règles :**
- Les pages à la racine (`index.md`, `log.md`, `schema.md`, `synthese.md`) sont des pages méta.
- Les pages dans les sous-répertoires sont des pages de contenu.
- Un sous-répertoire n'est créé que si au moins une page de contenu y vit.

---

## 2. Conventions de nommage

### 2.1 Fichiers

| Règle | Exemple |
|-------|---------|
| Minuscules uniquement | `docker.md`, pas `Docker.md` |
| Séparateur : tiret bas `_` ou tiret `-` | `netfilter.md` ou `net-filter.md` |
| Nom du fichier = nom de la page (sans le chemin) | `concepts/tcp.md` → page `TCP` |
| Les pages méta sont à la racine : `index.md`, `log.md`, `schema.md`, `synthese.md` | — |
| Fichiers dans les sous-répertoires : `repertoire/nom-page.md` | `sources/bash.cheat.md` |

### 2.2 Liens internes

- Utiliser le format Obsidian `[[nom-de-page.md]]` pour les liens vers d'autres pages du wiki.
- Pour les pages dans les sous-répertoires : `[[repertoire/nom-de-page.md]]`.
- Pour les liens vers des sections dans la même page : `[[#titre-de-section]]`.

---

## 3. Format des pages

Chaque page de contenu doit commencer par un frontmatter YAML :

```yaml
---
nom: Nom lisible de la page
description: Résumé d'une ligne de ce que contient la page
type: concept|entite|source|comparaison|synthese
date_creation: AAAA-MM-JJ
date_modification: AAAA-MM-JJ
version: 1.0.0
tags:
  - tag1
  - tag2
sources:
  - source1.md
  - source2.md
---
```

### 3.1 Champs du frontmatter

| Champ | Obligatoire | Description |
|-------|-------------|-------------|
| `nom` | Oui | Nom lisible de la page |
| `description` | Oui | Résumé d'une ligne |
| `type` | Oui | L'un de : `concept`, `entite`, `source`, `comparaison`, `synthese` |
| `date_creation` | Oui | Date de création (AAAA-MM-JJ) |
| `date_modification` | Oui | Date de dernière modification |
| `version` | Non | Numéro de version (par défaut `1.0.0`) |
| `tags` | Oui | Liste de tags pour le filtrage et la recherche |
| `sources` | Non | Liste des pages source qui alimentent cette page |

### 3.2 Sections de contenu

Structure recommandée pour une page de contenu :

```markdown
# Titre de la page

> Citation ou résumé en une phrase (blockquote).

## Résumé

Paragraphe court (2-3 phrases) résumant le contenu principal.

## Détails

Sections détaillées selon le besoin :
- Définition
- Fonctionnement
- Exemples
- Cas d'usage
- Limitations
- Références croisées

## Références croisées

Liens vers des pages connexes :
- Voir aussi : [[page-connexes.md]]
```

### 3.3 Pages spéciales

- **`index.md`** : Utilise le format tableau pour le catalogue. Mettre à jour après chaque `ingest`.
- **`log.md`** : Format strict `## [AAAA-MM-JJ] action | Description`. Append-only.
- **`schema.md`** : Ce document. Modifier uniquement via consensus ou décision.
- **`synthese.md`** : Vue d'ensemble. Peut contenir des sections multi-sources.

---

## 4. Workflows

### 4.1 Ingest — Ingérer une source

**Objectif** : Lire une source brute et mettre à jour le wiki en conséquence.

**Étapes :**

1. **Identifier la source**
   - Lire le fichier source (ex: `sources/docker.cheat`).
   - Déterminer le type de contenu : concept, entité, ou autre.

2. **Créer ou mettre à jour les pages**
   - Si la page n'existe pas, la créer dans le répertoire approprié (`concepts/` ou `entites/`).
   - Si la page existe, la mettre à jour avec les nouvelles informations.
   - Toujours mettre à jour `date_modification` et `version` dans le frontmatter.

3. **Enregistrer la source**
   - Créer ou mettre à jour `sources/nom-de-la-source.md` si nouvelle.
   - Lister les pages wiki alimentées par cette source.

4. **Mettre à jour l'index**
   - Ajouter ou modifier l'entrée correspondante dans `index.md`.

5. **Consigner dans le log**
   - Ajouter une entrée dans `log.md` :
     ```
     ## [2026-05-24] ingest | Source 'docker.cheat' ingérée — 3 pages créées, 2 mises à jour
     ```

6. **Créer des cross-references**
   - Ajouter des liens `[[page-sible.md]]` entre pages connexes.
   - Mettre à jour les sections « Références croisées ».

**Règles d'ingest :**
- Toujours citer les sources dans le frontmatter (`sources:`).
- Ne jamais inventer d'information — tout doit être tracé vers une source.
- Une page peut avoir plusieurs sources (liste dans `sources:` du frontmatter).
- En cas de contradiction entre sources, mentionner les deux versions.

### 4.2 Query — Interroger le wiki

**Objectif** : Répondre à une question en s'appuyant sur les pages du wiki, avec citations.

**Étapes :**

1. **Rechercher dans l'index**
   - Utiliser `index.md` comme point d'entrée.
   - Chercher dans les tags, descriptions, et noms de pages.

2. **Lire les pages pertinentes**
   - Ouvrir les pages liées au sujet de la requête.
   - Lire les sections pertinentes (pas nécessairement tout le contenu).

3. **Synthétiser la réponse**
   - Compiler les informations des pages pertinentes.
   - Citer toujours les sources avec `[[nom-page.md]]`.

4. **Signaler l'absence d'information**
   - Si le wiki ne contient pas la réponse, le dire explicitement.
   - Suggérer une source brute à ingérer pour combler le manque.

**Format de réponse :**
```markdown
[début de réponse]

→ Voir aussi : [[page-1.md]], [[page-2.md]]
→ Source : [[sources/source.md]]

[fin de réponse]
```

### 4.3 Lint — Health-check du wiki

**Objectif** : Vérifier périodiquement la cohérence et la santé du wiki.

**Vérifications :**

1. **Pages orphelines**
   - Lister les pages qui ne sont référencées par aucune autre page.
   - Consigner dans le log si des pages orphelines sont détectées.

2. **Liens brisés**
   - Vérifier que tous les liens `[[...]]` pointent vers des pages existantes.

3. **Contredictons**
   - Identifier les contradictions entre pages partageant les mêmes sources.
   - Ex: deux pages donnant des versions différentes d'une même information.

4. **Données périmées**
   - Vérifier la date de dernière modification des pages.
   - Pages non modifiées depuis > 90 jours → potentiellement périmées (à vérifier).

5. **Frontmatter manquant**
   - Vérifier que chaque page de contenu a un frontmatter complet.

6. **Index désynchronisé**
   - Vérifier que chaque page de contenu apparaît dans `index.md`.

**Sortie de lint :**
```
## [2026-05-24] lint | Health-check : 0 liens brisés, 0 pages orphelines, 0 contradictions
```

**Fréquence recommandée** : Après chaque session d'ingest majeure, ou au moins une fois par semaine.

---

## 5. Types de pages et leur usage

| Type | Répertoire | Usage |
|------|------------|-------|
| `concept` | `concepts/` | Notions abstraites, principes, patterns, théories |
| `entite` | `entites/` | Outils, logiciels, protocoles, normes, standards — objets concrets |
| `source` | `sources/` | Documentation des sources brutes ingérées |
| `comparaison` | racine ou `comparaisons/` | Mettre en relation deux entités/concepts |
| `synthese` | `synthese.md` ou `syntheses/` | Vue d'ensemble multi-sources |

---

## 6. Versioning du schéma

| Version | Date | Changements |
|---------|------|-------------|
| 1.0.0 | 2026-05-24 | Version initiale du schéma |

---

*Dernière modification du schéma : 2026-05-24*
