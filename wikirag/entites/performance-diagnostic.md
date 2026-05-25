---
nom: performance-diagnostic
description: Suite d'outils de diagnostic de performance système et réseau (iperf3, perf, bpftrace, dstat, pidstat, iotop, slabtop, numastat)
type: entite
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags: [performance, diagnostic, monitoring, iperf3, perf, bpftrace, dstat, pidstat, iotop, numastat, numa]
sources: [sources/perf.cheat.md, sources/cgroups.cheat.md]
---

# Performance et diagnostic

## Vue d'ensemble
Ensemble d'outils Linux pour mesurer et diagnostiquer les performances du système et du réseau.

## Outils réseau

### iperf3
Benchmark de bande passante réseau :
- Affinité CPU : `iperf3 --affinity 2 --client remotehost`
- Bind NUMA : `numactl --physcpubind=2 iperf3 -c remotehost`

## Outils système

### perf
Profilage au niveau noyau : `perf stat -p <PID>` pour les statistiques sur un processus.

### bpftrace
Tracing eBPF :
- Comptage des lectures système : `bpftrace -e 'kprobe:vfs_read {@[comm]=count()}'`

### dstat
Métriques système temps réel (CPU, disque, réseau, mémoire, yaml) : `dstat -cdngy 1`

### pidstat
Surveillance par processus (CPU + I/O) : `pidstat -u -d 1`

### iotop
Surveillance I/O disque : `iotop -o` (seuls les processus actifs)

### slabtop
Information sur les slab caches du noyau : `slabtop -s c` (tri par consommation)

### numastat
Métriques NUMA par processus : `numastat -p <PID>`

### NUMA
- Détection : `lscpu | rg NUMA`

### Cgroups et mémoire pressure
- Lecture de la pression mémoire : `cat /sys/fs/cgroup/system.slice/memory.pressure`

## Entités liées
- [[systemd]] — Monitoring via journalctl
- [[cgroups]] — Isolation des ressources
- [[osquery]] — Monitoring de flottes
