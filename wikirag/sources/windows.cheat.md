---
nom: windows.cheat — Administration Windows
description: PowerShell, PsExec, contournement cmd.exe sous Windows
type: source-brute
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags: [windows, powershell, cmd, microsoft, misc, pushou]
source_file: sources/windows.cheat
---

## Source brute

**Auteur :** pushou
**Tags :** `windows`, `powershell`, `cmd`, `microsoft`, `category:misc`

### Contenu

#### PsExec — Exécution de commandes à distance

**Méthode 1 : URL directe**

```
\\http://live.sysinternals.com\tools\PsExec.exe -s -c cmd.exe
```

**Méthode 2 : Montage réseau + exécution**

```
net use z: https://live.sysinternals.com/tools && z:\PsExec.exe -s -c cmd.exe
```

**Méthode 3 : Obfuscation de la commande (bypass de filtrage)**

```
net use z: htT^pS://li^ve.sysInTer^http://nals.com/toOls && z:\Ps^EXeC.eXe -s c^md.e^xe
```

### Variables

| Variable | Description |
|---|---|
| `IP_VERSION` | Version IP sélectionnable (4 ou 6) — `echo '4 6' \| tr ' ' '\n'` |

## Notes

- **PsExec** est un outil de la suite Sysinternals (Microsoft) pour exécuter des processus sur des systèmes distants.
- L'option `-s` exécute le processus dans le contexte du compte Système.
- L'option `-c` copie le fichier exécutable depuis l'emplacement spécifié.
- La méthode 3 montre une technique d'obfuscation en utilisant `^` (échappement) pour fragmenter les mots-clés et contourner les filtres de contenu.
- `IP_VERSION` est une variable partagée — voir aussi [[variables-partagees]].
- Voir aussi : [[psexec]], [[sysinternals]], [[commande-obfuscation]]
