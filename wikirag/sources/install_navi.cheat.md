---
nom: install_navi.cheat — Installation navi et dépendances
description: Commandes d'installation de navi, feroxbuster et rustscan
type: source-brute
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags: [navi, install, setup, tools, shell, cargo, apt, pushou]
source_file: sources/install_navi.cheat
---

## Source brute

**Auteur :** pushou
**Tags :** `navi`, `install`, `setup`, `tools`, `category:shell`

### Contenu

Installe navi et quelques outils complémentaires :

| Outil | Méthode | Canal |
|---|---|---|
| `navi` | `cargo install --locked navi` | Rust/cargo |
| `feroxbuster` | `cargo install feroxbuster` | Rust/cargo |
| `rustscan` | `cargo install rustscan` | Rust/cargo |
| `ripgrep` | `sudo apt install ripgrep` | Debian/Ubuntu APT |
| `libosinfo-bin` | `sudo apt install libosinfo-bin` | Debian/Ubuntu APT |

## Notes

- `ripgrep` est une dépendance utile pour la recherche rapide dans les cheatsheets.
- `libosinfo-bin` fournit `osinfo-query`, utile pour les outils de virtualisation.
- Voir aussi : [[navi_memo]], [[navi]], [[variables-partagees]]
