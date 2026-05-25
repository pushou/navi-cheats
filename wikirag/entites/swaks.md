---
nom: Swaks
description: Outil d'envoi de emails SMTP de test — authentification, TLS, envoi vers serveur distant
type: entite
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - swaks
  - smtp
  - email
  - testing
sources:
  - sources/smtp-client.cheat.md
---

# Swaks

> Swaks (Swiss Army Knife for SMTP) est un outil de test SMTP flexible en ligne de commande. Permet d'envoyer des emails de test vers n'importe quel serveur SMTP, avec support de l'authentification, TLS, et divers ports.

## Résumé

`swaks` est l'outil de référence pour tester les connexions SMTP. Contrairement à `mailx` ou `sendmail`, il offre un contrôle fin sur le serveur, les ports, le TLS et l'authentification. Parfait pour le débogage de serveurs Postfix.

## Détails

### Envoi de test avec swaks

```bash
# Envoyer un email avec authentification et TLS
swaks -t destinataire@example.com \
  -s smtp.monservice.com:587 \
  -tls \
  -au username \
  -ap password \
  -f expediteur@domain.com
```

Paramètres principaux :
- `-t` : adresse du destinataire
- `-s` : serveur SMTP avec port (`serveur:port`)
- `-tls` : activer TLS
- `-au` : nom d'authentification
- `-ap` : mot de passe d'authentification
- `-f` : expéditeur (envelope FROM)

## Références croées

- Voir aussi : [[entites/postfix.md]] — serveur SMTP avec lequel tester
- Voir aussi : [[entites/openssl.md]] — vérification TLS alternative avec s_client
- Voir aussi : [[sources/smtp-client.cheat.md]] — source brute des snippets swaks
