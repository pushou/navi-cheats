---
nom: glab (GitLab CLI) cheatsheet
description: Mémo de glab pour l'authentification, la gestion de dépôts et les merge requests sur GitLab
type: source
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags: [glab, gitlab, cloud, vcs, git, merge-requests, cli]
sources: []
---

# glab (GitLab CLI) cheatsheet

## Vue d'ensemble
Fichier cheat navi contenant les commandes pour interagir avec GitLab via l'interface CLI glab.

## Contenu

### Installation
```bash
apt install makedeb
wget -qO - 'https://proget.makedeb.org/debian-feeds/prebuilt-mpr.pub' | gpg --dearmor | sudo tee /usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg 1> /dev/null
echo "deb [arch=all,$(dpkg --print-architecture) signed-by=/usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg] https://proget.makedeb.org prebuilt-mpr $(lsb_release -cs)" | sudo tee /etc/apt/sources.list.d/prebuilt-mpr.list
sudo apt update
git clone 'https://mpr.makedeb.org/glab'
cd glab/
makedeb -si
```

### Configuration
- Éditeur : `glab config set --global editor vim`
- Complétion zsh : `source <(glab completion -s zsh); compdef _glab glab`
- Config YAML (`~/.config/glab-cli/config.yml`) :
  - Hôte, token, API host, git host, protocol, user

### Authentification
- Depuis un fichier : `glab auth login --hostname gitlab.domain.edu --stdin < ~/.dev/gitlabtoken.txt`
- Vérifier : `glab auth status`
- Liste des clés SSH : `glab list ssh-keys`

### Configuration hôte
- Variable d'environnement : `export GITLAB_HOST=gitlab.domain.edu`

### Mises à jour
- Vérifier : `glab check-update`

### Dépôts (repos)
- Cloner : `glab repo clone https://gitlab.domain.eu/debianedu.git`
- Créer : `glab repo create pushou/debianedu`
- Créer public : `glab repo create --public`
- Lister : `glab repo list`
- Rechercher : `glab repo search -s debian`
- Supprimer : `glab repo delete pushou/debianedu`
- Voir détails : `glab project view pushou/debianedu`

### Merge Requests
- Créer : `glab mr create --source-branch migratebranch --target-branch main --title "pushou feature" --description "recup file"`
- Lister : `glab mr list`
- Approuver : `glab mr approve`
- Fusionner : `glab mr merge`
- Supprimer (MR #1) : `glab mr delete 1`

## Entités liées
- [[git]]
- [[gitlab]]
