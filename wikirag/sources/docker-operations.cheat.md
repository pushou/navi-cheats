---
nom: docker-operations.cheat
description: Cheatsheet navi — opérations Docker avancées : Trivy, docker-browse, containers non sécurisés, audit
type: source
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - docker
  - containers
  - cheat-sheet
  - navi
  - trivy
  - security-audit
sources: []
---

# Source : docker-operations.cheat

> Cheatsheet navi original de pushou, catégorisé `category:containers`.

## Description

Fichier de cheatsheet navi contenant 4 sections de commandes Docker avancées :
1. **Trivy** — Scannage de vulnérabilités des images Docker
2. **docker-browse** — Navigation et export d'un registre Docker privé
3. **Container non sécurisé** — Exemple de conteneur exécuté avec le maximum de privilèges
4. **Audit Docker** — Vérification ICC et activation d'audit Linux pour Docker

## Métadonnées

| Champ | Valeur |
|-------|--------|
| Fichier | `sources/docker-operations.cheat` |
| Auteur | pushou |
| Tags | `docker, trivy, containers, security, vulnerability-scanning, category:containers` |
| Sections | 4 |
| Type | Cheatsheet navi |

## Pages wiki alimentées

- [[entites/docker.md]] — Page d'entité Docker (nouvelles sections ajoutées)

## Contenu brut

```
% docker,trivy,containers,security,vulnerability-scanning,category:containers,pushou

# Trivy scan local image
sudo trivy image <IMAGES>

# install Trivy (u22)
sudo apt-get install wget apt-transport-https gnupg lsb-release
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt-get update
sudo apt-get install trivy


$ image_id: docker images --- --headers 1 --column 3
$ IMAGES: docker images --format '{{.Repository}}:{{.Tag}}'|egrep -v "<none"


% docker,docker-browse,containers,docker-registry,category:containers,pushou

# docker-browse repo
docker-browse -r registry.iutbeziers.fr images

# docker-browse save default registry
docker-browse -r registry.iutbeziers.fr save


% docker,insecure,containers,security,category:containers,pushou

# docker most insecure container
docker run -it --privileged --net=host --pid=host --ipc=host --volume /:/host busybox chroot /host


% docker,security,containers,audit,category:containers,pushou


# Network is enable between containers icc:true?
docker network ls --quiet | xargs docker network inspect --format '{{ .Name }}: {{ .Options }}' |grep enable_icc:true


# Activate audit for Docker
cat <<EOF | sudo tee -a /etc/audit/rules.d/audit.rules
-w /usr/bin/dockerd -k docker
-w /etc/docker -p rwxa -k docker
-w /etc/default/docker -p rwxa -k docker
-w /etc/docker/daemon.json -p rwxa -k docker
-w /var/lib/docker -p rwxa -k docker
-w /usr/lib/systemd/system/docker.service -p rwxa -k docker
-w /usr/lib/systemd/system/docker.socket -p rwxa -k docker
-w /usr/bin/docker-runc -p rwxa -k docker
-w /usr/bin/docker-containerd -p rwxa -k docker
-w /usr/bin/containerd -p rwxa -k docker
EOF
sudo systemctl restart auditd


# get ip address for a container
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <ID_C_DOCKER>

$ID_C_DOCKER:  docker ps -q
```
