---
nom: marp — Markdown Presentations
description: Outil de génération de présentations à partir de fichiers Markdown
type: concept
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags: [marp, markdown, presentation, pptx, tool, misc]
sources: [sources/markdown.cheat.md]
---

## Définition

**Marp** (Markdown Presentation) est un outil qui permet de créer des présentations à partir de fichiers Markdown. Il supporte la conversion vers plusieurs formats de sortie, incluant HTML, PDF et PowerPoint (.pptx).

## Options courantes

| Option | Description |
|---|---|
| `--allow-local-files` | Autoriser les fichiers locaux (images, CSS) |
| `--html` | Support du code HTML inline |
| `--pptx` | Export en format PowerPoint |
| `--pdf` | Export en PDF |
| `--html` | Export en HTML |
| `--author` | Auteur de la présentation |
| `--description` | Description de la présentation |
| `-o <fichier>` | Fichier de sortie |

## Exemple

```bash
marp --allow-local-files --html --pptx \
  --author "Jean-Marc Pouchoulon" \
  --description "mise en oeuvre Catalyst 8200" \
  Pres-Catalyst-8000-Cisco.md \
  -o Pres-Catalyst-8000-Cisco.pptx
```

## Format Markdown pour Marp

Les slides sont séparées par des lignes de trois tirets (`---`) :

```markdown
# Slide 1
Contenu de la première slide

---

# Slide 2
Contenu de la deuxième slide
```

## Voir aussi

- [[presentations]] — Généralités sur la génération de présentations
