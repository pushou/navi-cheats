---
nom: OpenSSL
description: Bibliothèque open-source d'outils de chiffrement, SSL/TLS et certificats
type: entite
date_creation: 2026-05-24
date_modification: 2026-05-24
version: 1.0.0
tags:
  - security
  - crypto
  - ssl
  - tls
  - chiffrement
sources:
  - sources/openssl.cheat.md
---

# OpenSSL

> Bibliothèque open-source et suite d'outils pour le chiffrement, les protocoles SSL/TLS et la gestion de certificats.

## Résumé

OpenSSL fournit une interface en ligne de commande pour tester et diagnostiquer les connexions chiffrées TLS/SSL. L'outil `openssl s_client` permet de se connecter à un serveur distant et d'inspecter la négociation TLS, les certificats et les cipher suites disponibles.

## Détails

### Vérification des cipher suites STARTTLS

**Tester les cipher suites disponibles pour un serveur SMTP :**

```bash
openssl s_client -connect smtp.umontpellier.fr:587 -starttls smtp
```

Cela établit une connexion au serveur SMTP sur le port 587 et effectue une négociation STARTTLS pour tester quelles cipher suites TLS sont supportées.

## Références croisées

- Voir aussi : [[concepts/linux-capabilities.md]] — les capacités Linux peuvent limiter l'accès aux sockets chiffrés
