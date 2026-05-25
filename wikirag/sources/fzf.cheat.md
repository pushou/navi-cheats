---
nom: fzf.cheat
description: Cheatsheet navi d'installation et configuration de fzf — fuzzy finder
type: source
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - fzf
  - shell
  - interactive
  - terminal
  - cheat-sheet
  - navi
sources: []
---

# Source : fzf.cheat

> Cheatsheet navi original de pushou, catégorisé `category:shell`.

## Description

Fichier de cheatsheet navi contenant la procédure d'installation de fzf (fuzzy finder) de junegunn, avec clonage du dépôt, installation interactive, et sourçage automatique du shell.

## Métadonnées

| Champ | Valeur |
|-------|--------|
| Fichier | `sources/fzf.cheat` |
| Auteur | pushou |
| Tags | `fzf, shell, interactive, terminal, category:shell` |
| Sections | 1 |
| Type | Cheatsheet navi |

## Pages wiki alimentées

- [[entites/fzf.md]] — Page d'entité fzf

## Contenu brut

```
% fzf,shell,interactive,terminal,category:shell,pushou

# fzf install
rm -fR ~/.fzf && git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all|source ~/.bashrc
```
