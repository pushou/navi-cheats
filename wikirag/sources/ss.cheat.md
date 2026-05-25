---
nom: ss.cheat
description: Cheatsheet navi de socket statistics avec ss — filtres, timers, cgroups
type: source
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - ss
  - socket
  - network
  - debugging
  - netstat-replacement
  - cheat-sheet
  - navi
sources: []
---

# Source : ss.cheat

> Cheatsheet navi original de pushou, catégorisé `category:network`.

## Description

Fichier de cheatsheet navi contenant des commandes pour inspecter les sockets réseau avec `ss` : filtres TCP/UDP, états, timers, retransmissions, cgroups et eBPF. Alternative moderne à `netstat`.

## Métadonnées

| Champ | Valeur |
|-------|--------|
| Fichier | `sources/ss.cheat` |
| Auteur | pushou |
| Tags | `ss, network, networking, socket, category:network` |
| Sections | 8 |
| Type | Cheatsheet navi |

## Pages wiki alimentées

- [[entites/ss.md]] — Page d'entité ss (socket statistics)

## Contenu brut

```
% ss,network,networking,socket,category:network,pushou

# ss -tunlp (tcp udp numeric listening process)
ss -tunlp

# ss stats
ss -s

# ss display timer (-o)
ss -tn -o

# ss tcp filter
ss -<IP_VERSION> --<PROTO> state <TCP_FILTER>

# continuous read
watch -n 1 "ss -t4 state syn-sent"

# filter by address and text port number ss -at '( dport = :ssh or sport = :ssh )'
ss -<IP_VERSION> --<PROTO> '( dport = <NNPORT> or sport = <NNPORT> )'

# filter by address and numerical port number ss -at '( dport = :22 or sport = :22 )'
ss -<IP_VERSION> --<PROTO> '( dport = <PORT> or sport = <PORT> )'

# source port is greater than 5000
ss -<IP_VERSION> --<PROTO> src <IP_ADDRESS> sport gt <PORT>

# ss full with cgroups
ss -neopa

# ss get ebpf
sudo ss -0bp


# ss retransmissions tcp
ss -iuout
#


$ PROTO: echo 'tcp udp all' | tr ' ' '\n'
$ IP_VERSION: echo '4 6' | tr ' ' '\n'
$ AT_NT: echo 'at nt' | tr ' ' '\n'
$ TCP_FILTER: echo 'established syn-sent syn-recv fin-wait-1 fin-wait-2 time-wait closed close-wait last-ack closing synchronized'| tr ' ' '\n'
$ SD_PORT: echo 'sport dport'| tr ' ' '\n'
$ NNPORT :  cat /etc/services | awk '{print ":"$1}' | egrep -v '^:#'| tr ' ' '\n'
$ START_PORT: echo {1..6555} | tr ' ' '\n'
$ END_PORT: echo {1..6555} | tr ' ' '\n'
$ PORT: echo {1..6555} | tr ' ' '\n'
$ TO_PORT: echo {1..6555} | tr ' ' '\n'
```
