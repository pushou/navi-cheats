---
nom: navi — Cheatsheets interactives
description: Outil CLI interactif pour naviguer et exécuter des commandes depuis des cheatsheets
type: concept
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags: [navi, cli, interactive, cheatsheets, shell, tool]
sources: [sources/install_navi.cheat.md, sources/navi_memo.cheat.md]
---

## Définition

`navi` est un outil CLI interactif permettant de naviguer, rechercher et exécuter des commandes à partir de collections de cheatsheets. Il fonctionne comme une interface de type `ctrl+t` pour les commandes shell.

## Installation

Voir [[install_navi]].

```bash
# Via cargo (Rust)
cargo install --locked navi

# Dépendances recommandées
sudo apt install ripgrep
sudo apt install libosinfo-bin
```

## Utilisation

### Navigation des dépôts

```bash
navi repo browse          # Parcourir les dépôts
navi repo add <url>       # Ajouter un dépôt
```

Dépôt personnel : `https://github.com/pushou/navi-cheats.git`

### Sources alternatives

```bash
navi --cheatsh            # Utiliser cheat.sh
navi --tldr               # Utiliser tldr
```

### Variables interactives

Les cheatsheets utilisent des variables pour créer des menus déroulants :

```
$ VARIABLE: echo 'option1 option2' | tr ' ' '\n'
```

Voir aussi [[variables-partagees]].

## Écosystème

| Composant | Description | Source |
|---|---|---|
| `navi` | Outil principal | [[install_navi]], [[navi_memo]] |
| `common.cheat` | Variables partagées | [[variables-partagees]] |
| `ripgrep` | Recherche rapide dans les cheats | [[install_navi]] |
| `cheat.sh` | Hub de cheatsheets en ligne | [[navi_memo]] |
| `tldr` | Pages de manuel simplifiées | [[navi_memo]] |

## Voir aussi

- [[variables-partagees]] — Variables communes entre cheats
- [[install_navi]] — Installation et dépendances
- [[navi_memo]] — Navigation des dépôts
