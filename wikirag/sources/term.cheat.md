---
nom: term.cheat
description: Cheatsheet navi de terminaux — configuration terminfo d'Alacritty
type: source
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - term
  - alacritty
  - terminal
  - cheat-sheet
  - navi
  - terminfo
sources: []
---

# Source : term.cheat

> Cheatsheet navi original de pushou, catégorisé `category:shell`.

## Description

Fichier de cheatsheet navi contenant une commande pour installer le terminfo personnalisé d'Alacritty à partir du dépôt officiel GitHub, en cas de terminal non reconnu.

## Métadonnées

| Champ | Valeur |
|-------|--------|
| Fichier | `sources/term.cheat` |
| Auteur | pushou |
| Tags | `term, alacritty, terminal, category:shell` |
| Sections | 1 |
| Type | Cheatsheet navi |

## Pages wiki alimentées

- [[entites/alacritty.md]] — Page d'entité Alacritty

## Contenu brut

```
% term,alacritty,terminal,category:shell,pushou

# term unknown
curl -sSL https://raw.githubusercontent.com/alacritty/alacritty/master/extra/alacritty.info | tic -x -
```
