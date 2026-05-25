---
nom: common.cheat — Variables partagées navi
description: Variables communes partagées entre les fichiers cheats navi
type: source-brute
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags: [navi, variables, shared, shell, pushou]
source_file: sources/common.cheat
---

## Source brute

**Auteur :** pushou
**Tags :** `common`, `variables`, `shared`, `category:shell`

Fichier de variables communes destinées à être incluses dans d'autres cheatsheets navi.

### Contenu

Le fichier définit 4 variables :

| Variable | Description | Source |
|---|---|---|
| `NNPORT2P` | Liste des ports de services (`/etc/services`) avec préfixe `:` | `cat /etc/services \| awk '{print ":"$1}' \| egrep -v '^:#' \| tr ' ' '\n'` |
| `IPSET_TYPE` | Types de sets ipset disponibles | `echo 'hash:ip'` |
| `IPSET` | Listes les ipsets configurés via `firewall-cmd` | `firewall-cmd --get-ipsets \| tr ' ' '\n'` |
| `PROTO_LETTER` | Abréviations des protocoles (tcp, udp, any) | `echo 't u a' \| tr ' ' '\n'` |

### Usage

Pour inclure ces variables dans un autre cheat :

```
$(source /home/pouchou/Nextcloud/dev/wikiia/sources/common.cheat)
```

Ou copier-coller les variables nécessaires directement.

## Notes

- Les variables dupliquées (PORT, IP_VERSION, PROTO, TCP_FILTER, etc.) ont été supprimées de ce fichier car elles sont définies dans les fichiers spécifiques.
- Ce fichier sert de **référentiel central** pour les variables partagées — il ne constitue pas une entité à part entière mais un utilitaire transversal.
- Voir aussi : [[navi_memo]], [[install_navi]], [[variables-partagees]]
