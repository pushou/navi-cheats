---
nom: variables-partagees — Variables communes navi
description: Variables transversales partagées entre les fichiers cheatsheets navi
type: concept
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags: [navi, variables, shared, cross-cutting, shell]
sources: [sources/common.cheat.md]
---

## Définition

Les **variables partagées** sont des variables de type `navi` centralisées dans `common.cheat`. Elles fournissent des menus déroulants communs à plusieurs cheatsheets sans duplication.

## Variables disponibles

| Variable | Contenu | Usage |
|---|---|---|
| `NNPORT2P` | Ports de `/etc/services` avec préfixe `:` | Filtrage de ports par nom de service |
| `IPSET_TYPE` | `hash:ip` | Sélection du type de ipset |
| `IPSET` | Résultat de `firewall-cmd --get-ipsets` | Sélection d'un ipset configuré |
| `PROTO_LETTER` | `t`, `u`, `a` (tcp, udp, any) | Sélection abrégée du protocole |

## Usage

### Inclusion dans un cheat

```bash
$(source /home/pouchou/Nextcloud/dev/wikiia/sources/common.cheat)
```

### Copier-coller

Les variables peuvent aussi être copiées directement dans un cheat spécifique.

## Variables dupliquées (non incluses)

Les variables suivantes ont été **retirées** de `common.cheat` car elles existent déjà dans les fichiers spécifiques :

- `PORT`
- `IP_VERSION` — présent aussi dans [[windows]] (`windows.cheat`)
- `PROTO`
- `TCP_FILTER`

## Voir aussi

- [[navi]] — L'outil navi et ses variables
- [[install_navi]] — Installation de navi
- [[navi_memo]] — Navigation des dépôts navi
