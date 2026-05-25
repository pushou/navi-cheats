---
nom: heredoc.cheat
description: Cheatsheet navi sur l'héritage (heredoc) en Bash — expansion, redirection, SSH, pipe
type: source
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags:
  - bash
  - heredoc
  - shell
  - cheat-sheet
  - navi
sources: []
---

# Source : heredoc.cheat

> Cheatsheet navi original de pushou, catégorisé `category:shell`.

## Description

Fichier de cheatsheet navi couvrant six utilisations du heredoc en Bash : expansion standard, expansion désactivée, indentation sécurisée, redirection vers fichier, pipe vers sed, et transfert vers SSH.

## Métadonnées

| Champ | Valeur |
|-------|--------|
| Fichier | `sources/heredoc.cheat` |
| Auteur | pushou |
| Tags | `bash, heredoc, shell, category:shell` |
| Sections | 6 |
| Type | Cheatsheet navi |

## Pages wiki alimentées

- [[concepts/heredoc.md]] — Concept du heredoc en Bash

## Contenu brut

```
% bash,heredoc,shell,category:shell,pushou

# heredoc simple expand
cat << EOF
The current working directory is: $PWD
You are logged in as: $(whoami)
EOF

# heredoc do not expand parameter
cat << "EOF"
The current working directory is: $PWD
You are logged in as: $(whoami)
EOF

# heredoc keep indent safe
cat <<- "EOF"
  The current working directory is: $PWD
  You are logged in as: $(whoami)
EOF

# heredoc redirect to a file
cat << EOF > /tmp/file.txt
The current working directory is: $PWD
You are logged in as: $(whoami)
EOF

# heredoc sed
cat <<'EOF' |  sed 's/l/e/g'
Hello
World
EOF

# heredoc ssh
ssh -T user@host.com << EOF
echo "The current local working directory is: $PWD"
echo "The current remote working directory is: \$PWD"
EOF
```
