---
nom: navi_memo.cheat — Navigation dépôts navi
description: Commandes de navigation et d'utilisation des dépôts de cheats navi
type: source-brute
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags: [navi, tools, cli, interactive, shell, pushou]
source_file: sources/navi_memo.cheat
---

## Source brute

**Auteur :** pushou
**Tags :** `navi`, `tools`, `cli`, `interactive`, `category:shell`

### Contenu

#### Navigation des dépôts

| Commande | Description |
|---|---|
| `navi repo browse` | Parcourir les dépôts de cheats disponibles |
| `navi repo add <url>` | Ajouter un dépôt de cheats (ex: `https://github.com/pushou/navi-cheats.git`) |
| `navi --<OTHERS>` | Exécuter navi avec d'autres sources (cheatsh, tldr) |

#### Sources alternatives

| Source | Description |
|---|---|
| `cheatsh` | Accès à cheat.sh (Cheatsheet Hub) |
| `tldr` | Version simplifiée de man |

### Variable interactive

```
$ OTHERS: echo 'cheatsh tldr' | tr ' ' '\n'
```

Sélection dans navi pour choisir la source alternative.

## Notes

- `navi` est l'outil principal de cheatsheets interactives utilisé dans ce dépôt.
- Le dépôt personnel `pushou/navi-cheats` contient les cheats personnalisées.
- Voir aussi : [[install_navi]], [[navi]], [[variables-partagees]]
