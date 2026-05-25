---
nom: AWS CLI
description: Interface en ligne de commande d'Amazon Web Services — gestion EC2 (régions, images, instances, security groups, key pairs)
type: entite
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags: [aws, awscli, cloud, ec2, infrastructure]
sources: [sources/aws.cheat.md]
---

# AWS CLI

## Vue d'ensemble
L'**AWS CLI** est l'interface en ligne de commande pour interagir avec les services Amazon Web Services. Ce cheat couvre principalement les commandes EC2.

## Commandes EC2

### Régions
- Lister les régions : `aws ec2 describe-regions`

### Images
- Lister les AMI : `aws ec2 describe-images`
- Images Debian : filtre par owner `136693071363`, architecture `x86_64`, tri par date de création

### Instances
- Instances en cours : filtre par `instance-state-name=running`, `instance-type`
- Champs extraits : PublicIP, InstanceType, Name, State

### Security Groups
- Lister, filtrer le groupe par défaut
- Autoriser l'ingress : `aws ec2 authorize-security-group-ingress --group-id $SG_ID --protocol <PROTO> --port <PORT> --cidr 0.0.0.0/0`

### Key Pairs & Availability Zones
- Key pairs : `aws ec2 describe-key-pairs`
- Subnets/Availability Zones : `aws ec2 describe-subnets`

## Entités liées
- [[sources/aws.cheat.md]] — Source AWS CLI
