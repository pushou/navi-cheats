---
nom: awk.cheat
description: Cheatsheet navi de filtres awk — traitement de texte, pipeline avec fzf
type: source
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - awk
  - gawk
  - text-processing
  - shell
  - cheat-sheet
  - navi
sources: []
---

# Source : awk.cheat

> Cheatsheet navi original de pushou, catégorisé `category:shell`.

## Description

Fichier de cheatsheet navi contenant un unique snippet : un filtre awk appliqué sur les images Docker, avec filtrage sur la longueur du champ Tag et pipeline vers fzf pour l'interface interactive.

## Métadonnées

| Champ | Valeur |
|-------|--------|
| Fichier | `sources/awk.cheat` |
| Auteur | pushou |
| Tags | `awk, shell, gawk, text-processing, category:shell` |
| Sections | 1 |
| Type | Cheatsheet navi |

## Pages wiki alimentées

- [[entites/awk.md]] — Page d'entité awk
- [[entites/fzf.md]] — Page d'entité fzf (référence dans le pipeline)

## Contenu brut

```
% awk,shell,gawk,text-processing,category:shell,pushou

# awk filter on fields length and pipe to fzf
docker images --format "table {{.Repository}}\t{{.Tag}}"|awk '{if(length($2) < 9 && $2!="") print $1":"$2}'| egrep -v 'REPOSITORY:TAG|\<none\>'|fzf
```
