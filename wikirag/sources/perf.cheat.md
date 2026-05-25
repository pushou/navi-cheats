---
nom: perf & outils de performance cheatsheet
description: Mémo des outils de diagnostic de performance (iperf3, perf, bpftrace, dstat, pidstat, iotop, slabtop, numastat)
type: source
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags: [perf, iperf3, performance, diagnostics, numa, bpftrace, dstat, pidstat, iotop, slabtop, numastat]
sources: []
---

# perf & outils de performance cheatsheet

## Vue d'ensemble
Fichier cheat navi regroupant les outils de mesure et de diagnostic de performance système et réseau.

## Contenu

### NUMA
- Détection NUMA via lscpu : `lscpu | rg NUMA`

### iperf3 (benchmarks réseau)
- CPU pinned : `iperf3 --affinity 2 --client remotehost`
- numactl bind : `numactl --physcpubind=2 iperf3 -c remotehost`

### perf (profilage système)
- Statistiques sur un PID : `perf stat -p <PID>`

### bpftrace (tracing BPF)
- Comptage des lectures système par processus : `bpftrace -e 'kprobe:vfs_read {@[comm]=count()}'`

### dstat (métriques système en temps réel)
- Toutes métriques, intervalle 1s : `dstat -cdngy 1`

### pidstat (surveillance processus)
- CPU et I/O, intervalle 1s : `pidstat -u -d 1`

### iotop (surveillance I/O)
- Seuls les processus actifs : `iotop -o`

### slabtop (information sur les slab caches)
- Tri par consommation : `slabtop -s c`

### numastat (métriques NUMA par processus)
- Métriques NUMA pour un PID : `numastat -p <PID>`

## Entités liées
- [[performance-diagnostic]]
