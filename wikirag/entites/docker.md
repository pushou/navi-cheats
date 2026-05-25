---
nom: Docker
description: Plateforme de conteneurisation Linux — commandes pratiques de debug, monitoring et sécurité
type: entite
date_creation: 2026-05-24
date_modification: 2026-05-25
version: 2.0.0
tags:
  - docker
  - containers
  - docker-cli
  - conteneurisation
  - socat
  - nsenter
  - sbom
  - scout
sources:
  - docker.cheat.md
  - docker-operations.cheat.md
---

# Docker

> Plateforme de conteneurisation Linux. Ce wiki recense les commandes pratiques pour le debug, le monitoring et la sécurité des conteneurs.

## Résumé

Docker est un moteur de conteneurisation largement utilisé pour exécuter des applications isolées. Les snippets ci-dessous couvrent des cas avancés : exposition du socket Docker via TCP, debug de conteneurs avec BusyBox, accès interne via `nsenter`, analyse de sécurité avec les plugins `sbom` et `scout`, scannage de vulnérabilités avec Trivy, navigation de registre via docker-browse, et audit Docker.

## Détails

### Exposition du socket Docker via socat

Permet d'interagir avec le daemon Docker via un endpoint TCP, utile pour le debugging réseau ou l'accès distant (attention : non chiffré).

```bash
# Écouter sur le port 2375 et forwarder vers le socket UNIX
socat -d -v -d TCP-L:2375,fork UNIX:/var/run/docker.sock

# Pointer Docker vers cet endpoint
export DOCKER_HOST=localhost:2375

# Utiliser normalement
docker run ...
```

### Debug de conteneurs avec BusyBox

Copier BusyBox dans un conteneur pour exécuter des commandes de diagnostic même si l'image ne les contient pas.

```bash
# Copier busybox dans le conteneur
docker cp ./busybox <container_id>:/

# Exécuter des commandes de debug
docker exec -it <container_id> /busybox ip a
```

### Accès interne au conteneur avec nsenter

Entrer dans le namespace du conteneur directement depuis l'hôte.

```bash
# Récupérer le PID du conteneur
docker inspect <container_id> | grep -i pid

# Entrer dans les namespaces (pid, uts, network, init)
nsenter --target <PID> -p -u -n -i
```

### Analyse SBOM (Software Bill of Materials)

Lister tous les paquets installés dans une image Docker.

```bash
# Plugin docker-sbom
docker sbom <registry>/debianiut
```

### Analyse CVE et recommandations de sécurité

Utiliser Docker Scout pour détecter les vulnérabilités et obtenir des recommandations.

```bash
# Scanner les CVE
docker scout cves <registry>/debianiut

# Obtenir des recommandations d'amélioration
docker scout recommendations <registry>/debianiut:latest
```

### Scannage de vulnérabilités avec Trivy

[Trivy](https://aquasecurity.github.io/trivy/) est un scanner de vulnérabilités universel, supportant les images Docker, les systèmes de fichiers, les dépôts Git, etc.

```bash
# Scanner une image Docker locale
sudo trivy image <nom_image>

# Installation sur Ubuntu 22.04
sudo apt-get install wget apt-transport-https gnupg lsb-release
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt-get update
sudo apt-get install trivy
```

### Navigation de registre avec docker-browse

`docker-browse` est un outil CLI pour explorer et gérer les registres Docker privés.

```bash
# Lister les images d'un registre
docker-browse -r registry.iutbeziers.fr images

# Sauvegarder le registre par défaut
docker-browse -r registry.iutbeziers.fr save
```

### Conteneur non sécurisé (exemple)

Ce conteneur est exécuté avec le maximum de privilèges — **jamais en production** :

```bash
docker run -it \
  --privileged \
  --net=host \
  --pid=host \
  --ipc=host \
  --volume /:/host \
  busybox chroot /host
```

Flags utilisés :
| Flag | Impact |
|------|--------|
| `--privileged` | Accès complet au matériel et aux capacités du noyau |
| `--net=host` | Partage de la stack réseau de l'hôte |
| `--pid=host` | Visibilité de tous les processus de l'hôte |
| `--ipc=host` | Partage de la mémoire IPC de l'hôte |
| `--volume /:/host` | Montage complet de l'hôte dans le conteneur |

### Audit Docker

**Vérifier si les communications inter-conteneurs sont activées** (ICC) :

```bash
docker network ls --quiet \
  | xargs docker network inspect --format '{{ .Name }}: {{ .Options }}' \
  | grep enable_icc:true
```

**Activer l'audit Linux pour Docker** :

```bash
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
```

**Récupérer l'IP d'un conteneur** :

```bash
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <ID_DU_CONTENEUR>
```

- Voir aussi :
  - [[sources/docker.cheat.md]] — Source brute des snippets (socat, busybox, nsenter, sbom, scout)
  - [[sources/docker-operations.cheat.md]] — Source brute (Trivy, docker-browse, audit, insecure containers)
  - [[concepts/namespaces.md]] — Concept des namespaces Linux (fondement de la conteneurisation)
  - [[concepts/virtualisation.md]] — Virtualisation vs conteneurisation
