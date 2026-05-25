---
nom: docker.cheat
description: Cheatsheet navi de commandes Docker — socat, busybox, nsenter, sbom, scout
type: source
date_creation: 2026-05-24
date_modification: 2026-05-24
version: 1.0.0
tags:
  - docker
  - containers
  - cheat-sheet
  - navi
sources: []
---

# Source : docker.cheat

> Cheatsheet navi original de pushou, catégorisé `category:containers`.

## Description

Fichier de cheatsheet navi contenant des commandes pratiques pour Docker, organisé en 5 sections :
1. Exposition du socket Docker via socat
2. Debug de conteneurs avec BusyBox
3. Accès interne au conteneur via nsenter
4. Analyse SBOM (Software Bill of Materials)
5. Analyse CVE et recommandations de sécurité avec Docker Scout

## Métadonnées

| Champ | Valeur |
|-------|--------|
| Fichier | `sources/docker.cheat` |
| Auteur | pushou |
| Tags | `docker, containers, docker-cli, category:containers` |
| Sections | 5 |
| Type | Cheatsheet navi |

## Pages wiki alimentées

- [[entites/docker.md]] — Page d'entité Docker

## Contenu brut

```
% docker,containers,docker-cli,category:containers,pushou

# listen to docker.sock with socat
socat -d -v -d TCP-L:2375,fork UNIX:/var/run/docker.sock
export DOCKER_HOST=localhost:2375
docker run ..

# busybox debug
docker cp ./busybox id_du_container:/
docker exec -it 1edd81a917315bf /busybox ip a

# nsenter
docker inspect id-du-container|grep -i pid
nsenter --target PID_trouvé_précedemment -p -u -n -i

# docker plugin sbom
docker sbom registry.iutbeziers.fr/debianiut

# docker plugin scout
docker scout cves registry.iutbeziers.fr/debianiut
docker scout recommendations registry.iutbeziers.fr/debianiut:latest
```
