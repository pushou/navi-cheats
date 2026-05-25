# Navi Cheats — Wikiia

Collection de cheatsheets pour [navi](https://github.com/dbugger/navi), un client de cheatsheet interactif en ligne de commande.

## Format

Chaque fichier `.cheat` utilise le format navi :

```
% tag1,tag2,category:nom_categorie,auteur

# Titre de la commande
commande avec <VARIABLES>

$ VARIABLE: echo 'option1 option2' | tr ' ' '\n'
```

- Les **tags** permettent de rechercher et filtrer les cheats dans navi.
- Le tag `category:xxx` indique la catégorie du cheat.
- L'auteur est toujours `pushou`.
- Les variables sont définies avec `$ NOM: ...` et utilisables avec `<NOM>` dans les commandes.
- Les commentaires avec `;` (point-virgule) au début de la ligne sont ignorés par navi.

## Utilisation

```bash
# Lancer navi avec tous les cheats
navi

# Rechercher par tag
navi --tag docker

# Rechercher par catégorie
navi --tag category:network

# Exécuter un cheat spécifique
navi --file sources/bash.cheat
```

## Liste des cheats

### shell — Terminal et lignes de commande

| Fichier | Description |
|---------|-------------|
| `bash.cheat` | Commandes bash : heredoc, sockets, reverse shell, HTTP, scanners |
| `awk.cheat` | Filtres awk, traitement de texte, pipeline avec fzf |
| `fzf.cheat` | Installation et configuration de fzf |
| `heredoc.cheat` | Utilisations de l'héritage (heredoc) en bash |
| `nushell.cheat` | Commandes nushell : sys, CSV, JSON, Docker, osquery, ICS |
| `vim.cheat` | Configuration de l'éditeur vim par défaut |
| `term.cheat` | Terminals (alacritty terminfo) |
| `install_navi.cheat` | Installation de navi et dépendances |
| `navi_memo.cheat` | Navigation des dépôts de cheats navi |
| `common.cheat` | Variables partagées (uniquement les uniques non dupliquées) |

### network — Réseau et diagnostics

| Fichier | Description |
|---------|-------------|
| `ssh.cheat` | Tunnels SSH, proxy SOCKS |
| `wireguard.cheat` | Debug WireGuard |
| `dhcp.cheat` | Découverte DHCP avec nmap et dhcping |
| `dns_client.cheat` | Résolution DNS : resolvectl, dig, curl DoH, q |
| `iproute2.cheat` | iproute2 complet : liens, routes, netns, vlan, macvlan, ipvlan, policy routing |
| `ss.cheat` | ss (socket statistics) : filtres tcp/udp, timers, cgroups |
| `mtr-traceroute-ping.cheat` | MTR, traceroute, ping avancé |
| `wifi.cheat` | Outils WiFi : iw, nmcli, iwconfig, wavemon |
| `smtp-client.cheat` | Postfix, SMTP, TLS, swaks, Docker macvlan |
| `route.cheat` | Routes Debian, Netplan, configuration statique |
| `netlab.cheat` | Netlab : reporting, capture, exécution distante |
| `ethtools.cheat` | Statistiques et erreurs interface avec ethtool |
| `hping3.cheat` | Hping3 MTU, ping fragmenté, test réseau |

### security — Sécurité et forensics

| Fichier | Description |
|---------|-------------|
| `ufw.cheat` | UFW firewall : rules, ports, services, IP |
| `netfilter.cheat` | Netfilter, conntrack, monitoring connexions UDP |
| `capabilities.cheat` | Linux capabilities : capsh, setcap, getcap, systemd |
| `security-tools.cheat` | Outils de sécurité : nrich, Shodan, Tor exit nodes |
| `suricata.cheat` | Suricata IDS/IPS : rules, eve.json, pcap, jq forensics |
| `openssl.cheat` | OpenSSL SSL/TLS : STARTTLS, cipher testing |
| `sandfly.cheat` | Threat hunting, malware forensics, shellcode, memfd attacks |
| `apparmor.cheat` | AppArmor profiles (Snap Ubuntu 22) |
| `privileged_port.cheat` | Ports privilégiés non-root (sysctl) |

### containers — Docker et namespaces

| Fichier | Description |
|---------|-------------|
| `docker.cheat` | Docker : socat socket, busybox debug, nsenter, sbom, scout |
| `docker-operations.cheat` | Trivy scan, docker-browse repo, insecure containers, audit Docker |
| `nsenter.cheat` | nsenter : entrée dans les namespaces (PID, NET, IPC, UTS) |

### virtualization — Machines virtuelles

| Fichier | Description |
|---------|-------------|
| `qemu.cheat` | QEMU/KVM : création disque, VM macOS et Windows, conversion, sparsify |
| `vbox.cheat` | VirtualBox : NAT port forwarding dynamique |
| `virsh.cheat` | Libvirt/virsh : gestion VM, pools, volumes, connexions distantes |

### system — Système et diagnostics

| Fichier | Description |
|---------|-------------|
| `systemd-ctl.cheat` | systemd : systemctl, journalctl, networkctl, hostnamectl, loginctl, timedatectl, systemd-run |
| `cgroups.cheat` | Cgroups : mémoire pressure, création, quotas |
| `perf.cheat` | Performance : iperf3, perf, bpftrace, dstat, pidstat, iotop, slabtop, numastat |
| `os-query.cheat` | os-info : requêtes OS, listes images |
| `osquery-fleet.cheat` | Osquery : processus, paquets, hardware, sockets, curl, fichiers |

### cloud — Cloud et DevOps

| Fichier | Description |
|---------|-------------|
| `aws.cheat` | AWS CLI : EC2 regions, images, instances, security groups, key pairs |
| `glab.cheat` | GitLab CLI (glab) : auth, repos, merge requests, configuration |

### networking-cisco — Cisco et Mikrotik

| Fichier | Description |
|---------|-------------|
| `bgp-cisco.cheat` | BGP Cisco : show, clear, debug, neighbor routes |
| `bgpcommandes.cheat` | BGP : config basique, loopback, avancée, agrégation, default, RR, debug |
| `bgp-theorie.cheat` | BGP : définitions, eBGP/iBGP, sessions, messages, états, troubleshooting |
| `igp-cisco.cheat` | IGP Cisco : OSPF, EIGRP, configuration et debugging |
| `mpls-cisco.cheat` | MPLS Cisco : LSR/PE config, VRF, LDP, label forwarding, diagnostic |
| `mpls-theorie.cheat` | MPLS : LER/LSR, FEC, LSP, LDP, RD/RT, VPN, traffic engineering |
| `mikrotik.cheat` | Mikrotik RouterOS : firewall, IP, routing, OSPF, DHCP, wireless |

### misc — Divers

| Fichier | Description |
|---------|-------------|
| `markdown.cheat` | Markdown/Marp : génération de présentations PPTX |
| `windows.cheat` | Windows : PowerShell, PsExec, cmd bypass |

## Catégories

Les catégories utilisées sont :

| Catégorie | Couvre |
|-----------|--------|
| `category:shell` | Bash, shell, éditeurs, terminal, outils CLI |
| `category:network` | Réseau, DNS, DHCP, WiFi, SSH, routing, diagnostics |
| `category:security` | Firewall, IDS/IPS, forensics, crypto, capabilities |
| `category:containers` | Docker, namespaces |
| `category:virtualization` | QEMU, VirtualBox, libvirt/KVM |
| `category:system` | systemd, cgroups, performance, osquery |
| `category:cloud` | AWS, GitLab |
| `category:networking-cisco` | Cisco IOS, Mikrotik RouterOS |
| `category:misc` | Divers (Windows, Markdown) |

## Fichiers de backup

Les fichiers de backup sont archivés dans `sources/backup/` :

| Fichier | Description |
|---------|-------------|
| `backup/sandfly.cheat.bad` | Version corrompue de sandfly (162 octets) |
| `backup/sandfly.cheat.sav` | Version sauvegardée de sandfly (1804 octets) |

Le fichier principal actif est `sources/sandfly.cheat`.

## Structure des fichiers

```
sources/
├── README.md              # Ce fichier
├── backup/
│   ├── sandfly.cheat.bad  # Backup corrompu
│   └── sandfly.cheat.sav  # Backup sauvegardé
├── apparmor.cheat
├── awk.cheat
├── aws.cheat
├── bash.cheat
├── bgp-cisco.cheat
├── bgpcommandes.cheat
├── bgp-theorie.cheat
├── capabilities.cheat
├── cgroups.cheat
├── common.cheat           # Variables partagées
├── dhcp.cheat
├── dns_client.cheat
├── docker.cheat
├── docker-operations.cheat
├── ethtools.cheat
├── fzf.cheat
├── glab.cheat
├── heredoc.cheat
├── hping3.cheat
├── igp-cisco.cheat
├── install_navi.cheat
├── iproute2.cheat
├── markdown.cheat
├── mikrotik.cheat
├── mpls-cisco.cheat
├── mpls-theorie.cheat
├── mtr-traceroute-ping.cheat
├── navi_memo.cheat
├── netfilter.cheat
├── netlab.cheat
├── nsenter.cheat
├── nushell.cheat
├── openssl.cheat
├── os-query.cheat
├── osquery-fleet.cheat
├── perf.cheat
├── privileged_port.cheat
├── qemu.cheat
├── route.cheat
├── sandfly.cheat
├── security-tools.cheat
├── smtp-client.cheat
├── ss.cheat
├── ssh.cheat
├── suricata.cheat
├── systemd-ctl.cheat
├── term.cheat
├── ufw.cheat
├── vbox.cheat
├── vim.cheat
├── virsh.cheat
├── wifi.cheat
├── windows.cheat
└── wireguard.cheat
```

## Notes

- **dns_client.cheat** contient 4 sections distinctes : resolvectl, dig, curl (DoH), et q.
- **docker-operations.cheat** contient 4 sections : trivy, docker-browse, insecure, audit.
- Les variables dupliquées (PORT, IP_VERSION, PROTO, TCP_FILTER, etc.) ont été conservées dans les fichiers qui les utilisent plutôt que dans common.cheat pour éviter les problèmes de sourcing.
