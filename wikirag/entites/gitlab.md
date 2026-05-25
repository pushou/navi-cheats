---
nom: GitLab (glab)
description: Interface CLI GitLab — gestion d'authentification, dépôts, merge requests et projets
type: entite
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags: [gitlab, glab, vcs, git, merge-requests, cli, cloud]
sources: [sources/glab.cheat.md]
---

# GitLab (glab)

## Vue d'ensemble
**glab** est l'interface en ligne de commande pour GitLab. Elle permet d'interagir avec GitLab depuis le terminal : authentification, gestion de dépôts, merge requests et projets.

## Fonctionnalités

### Authentification
- Connexion depuis un fichier token : `glab auth login --hostname <host> --stdin < <token_file>`
- Vérification : `glab auth status`
- Clés SSH : `glab list ssh-keys`
- Config YAML dans `~/.config/glab-cli/config.yml`

### Gestion de dépôts
- Cloner : `glab repo clone <url>`
- Créer (public/privé) : `glab repo create <owner/name>`
- Lister : `glab repo list`
- Rechercher : `glab repo search -s <keyword>`
- Supprimer : `glab repo delete <owner/name>`
- Détails : `glab project view <owner/name>`

### Merge Requests
- Créer : `glab mr create --source-branch <src> --target-branch <tgt> --title <t> --description <d>`
- Lister : `glab mr list`
- Approuver : `glab mr approve`
- Fusionner : `glab mr merge`
- Supprimer : `glab mr delete <id>`

### Mises à jour
- Vérifier les mises à jour : `glab check-update`

## Entités liées
- [[sources/glab.cheat.md]] — Source glab CLI
