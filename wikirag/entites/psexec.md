---
nom: psexec — Exécution à distance Windows
description: Outil Sysinternals pour exécuter des processus sur des systèmes Windows distants
type: concept
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags: [psexec, windows, remote-execution, sysinternals, microsoft, misc]
sources: [sources/windows.cheat.md]
---

## Définition

**PsExec** est un outil de la suite **Sysinternals** (Microsoft) qui permet d'exécuter des processus de manière interactive sur des systèmes Windows distants. Il fonctionne via les partages administratifs (IPC$).

## Utilisation

### Méthode 1 : URL directe

```
\\http://live.sysinternals.com\tools\PsExec.exe -s -c cmd.exe
```

### Méthode 2 : Montage réseau

```
net use z: https://live.sysinternals.com/tools && z:\PsExec.exe -s -c cmd.exe
```

### Options courantes

| Option | Description |
|---|---|
| `-s` | Exécuter dans le contexte du compte Système |
| `-c` | Copier le fichier depuis l'emplacement spécifié |
| `-f` | Copier et exécuter même si le fichier existe déjà |
| `-i` | Exécuter en interactif (avec session) |
| `-d` | Exécuter de manière non bloquante (ne pas attendre) |

## Obfuscation de commande

Voir [[commande-obfuscation]].

## Sources officielles

- Sysinternals : `https://live.sysinternals.com/tools/`

## Voir aussi

- [[commande-obfuscation]] — Techniques de contournement de filtrage
- [[windows]] — Administration Windows
