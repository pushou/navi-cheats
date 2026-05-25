---
nom: AWS CLI cheatsheet
description: Mémo des commandes AWS CLI pour EC2 (regions, images, instances, security groups, key pairs)
type: source
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags: [aws, awscli, cloud, ec2, regions, images, instances, security-groups, key-pairs]
sources: []
---

# AWS CLI cheatsheet

## Vue d'ensemble
Fichier cheat navi contenant les commandes AWS CLI pour la gestion des ressources EC2.

## Contenu

### Régions EC2
- Lister toutes les régions : `aws ec2 describe-regions --output json | jq -r '.Regions[].RegionName'`

### Images EC2
- Lister toutes les images : `aws ec2 describe-images`
- Image Debian dans eu-west-1 :
  ```
  aws ec2 describe-images --region eu-west-1 --owners 136693071363 \
    --filters 'Name=architecture,Values=x86_64' \
    --query 'sort_by(Images, &CreationDate)[].[CreationDate,Name,ImageId]' \
    --output table
  ```

### Instances EC2
- Instances en cours d'exécution :
  ```
  aws ec2 describe-instances \
    --query "Reservations[*].Instances[*].{PublicIP:PublicIpAddress,Type:InstanceType,Name:Tags[?Key=='Name']|[0].Value,Status:State.Name}" \
    --filters "Name=instance-state-name,Values=running" "Name=instance-type,Values=t2.medium,t2.micro" \
    --output table
  ```

### Security Groups
- Lister : `aws ec2 describe-security-groups`
- Groupe par défaut : `aws ec2 describe-security-groups | jq '.SecurityGroups[] | select (.GroupName == "default") | .GroupId'`
- Stocker dans variable : `SG_ID=$(aws ec2 describe-security-groups | jq -r '.SecurityGroups[] | select (.GroupName == "default") | .GroupId')`
- Autoriser ingress : `aws ec2 authorize-security-group-ingress --group-id $SG_ID --protocol <PROTO> --port <PORT> --cidr 0.0.0.0/0`

### Key Pairs
- Lister : `aws ec2 describe-key-pairs`

### Availability Zones
- Zone spécifique : `aws ec2 describe-subnets | jq '.Subnets[] | select(.AvailabilityZone == "eu-west-1a")'`

## Variables interactives
- `IP_VERSION` : 4, 6
- `PROTO` : tcp, udp, icmp
- `PORT` : 1-65535
- `FAMILY` : inet, inet6

## Entités liées
- [[aws-cli]]
