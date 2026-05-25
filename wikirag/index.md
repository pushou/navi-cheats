---
nom: Index du Wiki LLM
description: Catalogue content-oriented de toutes les pages du wiki
type: meta
date_creation: 2026-05-24
date_modification: 2026-05-25
version: 3.0.0
tags:
  - meta
  - index
  - catalogue
---

# Index du Wiki LLM

> Catalogue structuré des connaissances du wiki, organisé par type de contenu.

## Concepts (17)

Pages expliquant des notions, des principes et des patterns.

| Page | Résumé |
|------|--------|
| `[[concepts/bgp.md]]` | Protocole de routage inter-domaine (BGP) |
| `[[concepts/cgroups.md]]` | Control Groups — isolation et limitation des ressources système |
| `[[concepts/dhcp.md]]` | Protocole de distribution automatique d'adresses IP (DORA) |
| `[[concepts/dns-over-https.md]]` | Encapsulation des requêtes DNS dans HTTPS |
| `[[concepts/igp.md]]` | Protocoles de routage intra-domaine (OSPF, EIGRP) |
| `[[concepts/interfaces-virtuelles.md]]` | veth, macvlan, ipvlan, macvtap, dummy, VLAN |
| `[[concepts/kvm.md]]` | Kernel-based Virtual Machine — virtualisation matérielle |
| `[[concepts/mpls.md]]` | Commutation par étiquettes multi-protocoles |
| `[[concepts/namespaces.md]]` | Isolation des ressources au niveau du noyau |
| `[[concepts/network-namespaces.md]]` | Isolation des ressources réseau dans le noyau |
| `[[concepts/networking.md]]` | Concepts généraux de réseau — routage, commutation, adressage, lab |
| `[[concepts/packet-crafting.md]]` | Création et injection de paquets personnalisés |
| `[[concepts/policy-routing.md]]` | Routage basé sur source, fwmark, interface |
| `[[concepts/resolution-dns.md]]` | Traduction nom de domaine → adresse IP |
| `[[concepts/routage.md]]` | Configuration des routes statiques et dynamiques |
| `[[concepts/tunneling.md]]` | Encapsulation de paquets pour traverser des réseaux |
| `[[concepts/virtualisation.md]]` | Principes et outils de virtualisation Linux |

## Entités (41)

Pages décrivant des outils, des logiciels, des protocoles, des normes — des objets concrets.

### Shell / CLI

| Page | Résumé |
|------|--------|
| `[[entites/navi.md]]` | Navi — navigateur interactif de cheatsheets |
| `[[entites/variables-partagees.md]]` | Variables partagées entre cheatsheets navi |
| `[[entites/commande-obfuscation.md]]` | Techniques d'obfuscation de commandes |
| `[[entites/psexec.md]]` | PsExec — exécution distante sous Windows |

### Réseau

| Page | Résumé |
|------|--------|
| `[[entites/ssh.md]]` | SSH — tunnels SOCKS, proxy et transferts |
| `[[entites/wireguard.md]]` | WireGuard — VPN moderne et léger |
| `[[entites/dhcp.md]]` | Serveur DHCP — configuration et gestion |
| `[[entites/dig.md]]` | Outil DNS dig — interrogations et diagnostics DNS |
| `[[entites/resolvectl.md]]` | Résolution DNS avec systemd-resolved |
| `[[entites/dns-client-q.md]]` | Client DNS — résolution et diagnostics |
| `[[entites/iproute2.md]]` | Suite de gestion réseau Linux — interfaces, routes, netns, macvlan |
| `[[entites/mtr.md]]` | Diagnostic réseau combinant ping et traceroute en temps réel |
| `[[entites/ss.md]]` | ss — inspection des sockets réseau |
| `[[entites/ethtool.md]]` | Diagnostic des interfaces réseau — statistiques et erreurs matérielles |
| `[[entites/hping3.md]]` | Injection de paquets — tests MTU, ping fragmenté, sondage TCP/UDP/ICMP |
| `[[entites/wifi-tools.md]]` | Outils WiFi — iw, nmcli, iwconfig, wavemon |
| `[[entites/postfix.md]]` | MTA Postfix — ports, file d'attente, TLS, Docker macvlan |
| `[[entites/swaks.md]]` | Swaks — envoi de test SMTP avec authentification et TLS |

### Sécurité

| Page | Résumé |
|------|--------|
| `[[entites/apparmor.md]]` | Module MAC du noyau Linux — profils de confinement par application |
| `[[entites/ufw.md]]` | UFW — interface simplifiée du pare-feu netfilter |
| `[[entites/netfilter.md]]` | Framework noyau Linux pour le filtrage réseau et NAT |
| `[[entites/openssl.md]]` | Bibliothèque SSL/TLS — test de cipher suites et certificats |
| `[[entites/sandfly.md]]` | Framework threat hunting et forensic malware Linux |
| `[[entites/suricata.md]]` | IDS/NIDS — détection d'intrusion et analyse pcap |
| `[[entites/capsh.md]]` | Capsh — gestion des capacités Linux |
| `[[entites/setcap.md]]` | Setcap/Getcap — attribution de capacités aux fichiers |
| `[[entites/nrich.md]]` | Nrich — renseignement IP via API Shodan |
| `[[entites/shodan.md]]` | Shodan — moteur de recherche Internet |

### Conteneurs / VM

| Page | Résumé |
|------|--------|
| `[[entites/docker.md]]` | Docker — conteneurisation |
| `[[entites/nsenter.md]]` | nsenter — entrée dans les namespaces |
| `[[entites/qemu.md]]` | QEMU/KVM — machines virtuelles |
| `[[entites/virtualbox.md]]` | VirtualBox — NAT port forwarding |
| `[[entites/libvirt.md]]` | Libvirt/virsh — gestion VM |

### Cloud / Infrastructure

| Page | Résumé |
|------|--------|
| `[[entites/aws-cli.md]]` | AWS CLI — interface en ligne de commande |
| `[[entites/osquery.md]]` | Osquery — monitoring de flottes |
| `[[entites/gitlab.md]]` | GitLab CLI (glab) — gestion GitLab |
| `[[entites/network-lab.md]]` | Netlab — labo réseau |

### Cisco / Router

| Page | Résumé |
|------|--------|
| `[[entites/cisco-ios.md]]` | Cisco IOS — BGP, OSPF, EIGRP, MPLS |

### Système / Diagnostic

| Page | Résumé |
|------|--------|
| `[[entites/systemd.md]]` | systemd — systemctl, journalctl, etc. |
| `[[entites/performance-diagnostic.md]]` | Outils de performance (perf, dstat, etc.) |

### Divers

| Page | Résumé |
|------|--------|
| `[[entites/marp.md]]` | Marp — génération de présentations |

## Sources (51)

Pages documentant les sources brutes ingérées dans le wiki.

| Fichier source | Entités wiki alimentées |
|---|---|
| `[[sources/apparmor.cheat.md]]` | apparmor |
| `[[sources/awk.cheat.md]]` | — |
| `[[sources/aws.cheat.md]]` | aws-cli |
| `[[sources/bash.cheat.md]]` | commande-obfuscation |
| `[[sources/bgp-cisco.cheat.md]]` | cisco-ios |
| `[[sources/capabilities.cheat.md]]` | capsh, setcap |
| `[[sources/cgroups.cheat.md]]` | cgroups (concept) |
| `[[sources/common.cheat.md]]` | variables-partagees |
| `[[sources/dhcp.cheat.md]]` | dhcp |
| `[[sources/dns_client.cheat.md]]` | dig, resolvectl, dns-client-q |
| `[[sources/docker-operations.cheat.md]]` | — |
| `[[sources/docker.cheat.md]]` | docker |
| `[[sources/ethtools.cheat.md]]` | ethtool |
| `[[sources/fzf.cheat.md]]` | — |
| `[[sources/glab.cheat.md]]` | gitlab |
| `[[sources/heredoc.cheat.md]]` | — |
| `[[sources/hping3.cheat.md]]` | hping3 |
| `[[sources/igp-cisco.cheat.md]]` | cisco-ios |
| `[[sources/install_navi.cheat.md]]` | navi |
| `[[sources/iproute2.cheat.md]]` | iproute2 |
| `[[sources/markdown.cheat.md]]` | marp |
| `[[sources/mikrotik.cheat.md]]` | cisco-ios |
| `[[sources/mpls-cisco.cheat.md]]` | cisco-ios |
| `[[sources/mtr-traceroute-ping.cheat.md]]` | mtr |
| `[[sources/navi_memo.cheat.md]]` | navi |
| `[[sources/netfilter.cheat.md]]` | netfilter |
| `[[sources/netlab.cheat.md]]` | network-lab |
| `[[sources/nsenter.cheat.md]]` | nsenter |
| `[[sources/nushell.cheat.md]]` | — |
| `[[sources/openssl.cheat.md]]` | openssl |
| `[[sources/os-query.cheat.md]]` | — |
| `[[sources/osquery-fleet.cheat.md]]` | osquery |
| `[[sources/perf.cheat.md]]` | performance-diagnostic |
| `[[sources/privileged_port.cheat.md]]` | — |
| `[[sources/qemu.cheat.md]]` | qemu |
| `[[sources/route.cheat.md]]` | routage (concept) |
| `[[sources/sandfly.cheat.md]]` | sandfly |
| `[[sources/security-tools.cheat.md]]` | nrich, shodan |
| `[[sources/smtp-client.cheat.md]]` | postfix, swaks |
| `[[sources/ss.cheat.md]]` | ss |
| `[[sources/ssh.cheat.md]]` | ssh |
| `[[sources/suricata.cheat.md]]` | suricata |
| `[[sources/systemd-ctl.cheat.md]]` | systemd |
| `[[sources/term.cheat.md]]` | — |
| `[[sources/ufw.cheat.md]]` | ufw |
| `[[sources/vbox.cheat.md]]` | virtualbox |
| `[[sources/vim.cheat.md]]` | — |
| `[[sources/virsh.cheat.md]]` | libvirt |
| `[[sources/wifi.cheat.md]]` | wifi-tools |
| `[[sources/windows.cheat.md]]` | psexec |
| `[[sources/wireguard.cheat.md]]` | wireguard |

## Comparaisons

| Page | Résumé |
|------|--------|
| *(aucune comparaison créée pour le moment)* | — |

## Synthèses

| Page | Résumé |
|------|--------|
| `[[synthese.md]]` | Vue d'ensemble du wiki et des connaissances accumulées |

---

**Statistiques du wiki**
- Total pages : **70**
- Concepts : 17
- Entités : 41
- Sources : 51
- Comparaisons : 0
- Synthèses : 1
- Pages méta : 4 (index, log, schema, synthese)

*Dernière mise à jour : 2026-05-25*
