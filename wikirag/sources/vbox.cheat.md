---
nom: vbox.cheat
description: Cheatsheet navi — VirtualBox : NAT port forwarding dynamique via VBoxManage
type: source
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - vbox
  - virtualbox
  - virtualization
  - vm
  - nat
  - cheat-sheet
  - navi
sources: []
---

# Source : vbox.cheat

> Cheatsheet navi original de pushou, catégorisé `category:virtualization`.

## Description

Fichier de cheatsheet navi contenant une seule section de commande VirtualBox :
- **NAT port forwarding dynamique** — Utilisation de `VBoxManage` pour configurer le forwarding de ports NAT sur une VM sélectionnée par nom

## Métadonnées

| Champ | Valeur |
|-------|--------|
| Fichier | `sources/vbox.cheat` |
| Auteur | pushou |
| Tags | `vbox, virtualbox, virtualization, vm, category:virtualization` |
| Sections | 1 |
| Type | Cheatsheet navi |

## Pages wiki alimentées

- [[entites/virtualbox.md]] — Page d'entité VirtualBox

## Contenu brut

```
% vbox,virtualbox,virtualization,vm,category:virtualization,pushou

# dnat 2222 to a  vm that contains debian in its name
VBoxManage modifyvm $(VBoxManage list vms | grep "debian" | awk -F '"' '{print $2}') --natpf1 "ssh,tcp,127.0.0.1,2222,10.0.2.15,22"
```
