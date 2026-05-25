---
nom: SandFly
description: Outil de threat hunting et de forensic malware pour Linux
type: entite
date_creation: 2026-05-24
date_modification: 2026-05-24
version: 1.0.0
tags:
  - security
  - threat-hunting
  - malware
  - forensics
  - linux
sources:
  - sources/sandfly.cheat.md
---

# SandFly

> Framework de threat hunting et de forensic malware pour systèmes Linux, fournissant des techniques de détection de malwares, de persistence et d'activités suspectes.

## Résumé

SandFly est un ensemble de techniques de threat hunting et de forensic pour Linux. Il couvre l'effacement de traces (bash history), l'analyse des processus malveillants (masquage comme thread noyau, attaques fileless via memfd), la détection de modules kernel malveillants, et l'analyse des processus suspects via `/proc`.

## Détails

### Effacement de traces — Bash history

**Réinitialiser l'historique bash :**

```bash
export HISTFILE=/dev/null
export HISTSIZE=0
export HISTFILESIZE=0
unset HISTFILE
rm $HISTFILE
shred $HISTFILE
rm .bash_history
cat /dev/null > $HISTFILE
set +o history
chattr +i $HISTFILE
```

### Analyse des processus

**Variables d'environnement d'un processus :**

```bash
cat /proc/<PID>/environ | tr '\0' '\n'
strings /proc/<PID>/environ
```

**Copier un binaire malveillant depuis `/proc` :**

```bash
cp /proc/<PID>/exe /tmp/badbin
```

**Trace d'un sniffer :**

```bash
strings /proc/<PID>/stack
ls -al /proc/<PID>/fd
```

**Capture eBPF d'un processus :**

```bash
ss -bp
```

### Détection de malwares masqués en thread noyau

**Rechercher des processus masqués avec crochets (=[] no argument) :**

```bash
cat /proc/<PID>/maps
ps auxwf | grep "\["
ps auxww | grep \\[ | awk '{print $2}' | xargs -I % sh -c 'echo PID: %; cat /proc/%/maps' 2> /dev/null
ps auxwf | grep \\[ | grep -v "\_" | grep -v kthreadd
```

### Détection d'attaques fileless (memfd_create)

**Rechercher des fichiers memfd supprimés mais toujours ouverts :**

```bash
ls -alR /proc/*/fd 2> /dev/null | grep "memfd: (deleted)"
grep "memfd_create" /proc/*/cmdline
strings /proc/PID/cmdline
```

**Exemple de payload memfd_create en Python :**

```python
python3 -c "import os;os.fork()or(os.setsid(),print(f'/proc/{os.getpid()}/fd/{os.memfd_create(str())},os.kill(os.getpid(),19))"
```

### Détection de modules kernel malveillants

```bash
sudo cat /proc/modules | grep \(.*\)
```

Les modules non signés ou portant des signes de masquage sont signalés.

### Altération de hash de fichier

```bash
echo -ne '\0' >> $1
```

### Shellcode whoami

```bash
dd bs=1 if=$(echo -e "\x2f\x75\x73\x72\x2f\x62\x69\x6e\x2f\x77\x68\x6f\x61\x6d\x69") of=./test; chmod +x ./test; echo -ne '\0' >> ./test; ./test
```

## Références croisées

- Voir aussi : [[entites/suricata.md]] — IDS/NIDS complémentaire pour la détection réseau
- Voir aussi : [[concepts/linux-capabilities.md]] — les capacités Linux peuvent être abusées par des malwares
