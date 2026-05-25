---
nom: markdown.cheat — Markdown et Marp présentations
description: Génération de présentations PPTX depuis Markdown avec Marp
type: source-brute
date_creation: 2026-05-25
date_modification: 2026-05-25
version: 1.0.0
tags: [markdown, marp, presentation, pptx, misc, pushou]
source_file: sources/markdown.cheat
---

## Source brute

**Auteur :** pushou
**Tags :** `markdown`, `marp`, `presentation`, `category:misc`

### Contenu

#### Génération de présentation PPTX

**Commande Marp :**

```bash
marp --allow-local-files --html --pptx \
  --author "Jean-Marc Pouchoulon" \
  --description "mise en oeuvre Catalyst 8200" \
  Pres-Catalyst-8000-Cisco.md \
  -o Pres-Catalyst-8000-Cisco.pptx
```

**Options utilisées :**

| Option | Description |
|---|---|
| `--allow-local-files` | Autoriser le chargement de fichiers locaux (images, CSS) |
| `--html` | Support du code HTML inline dans Markdown |
| `--pptx` | Export en format PowerPoint (.pptx) |
| `--author` | Auteur de la présentation |
| `--description` | Description de la présentation |

## Notes

- Marp (Markdown Presentation) est un outil de création de présentations à partir de Markdown.
- Le format de sortie `.pptx` est compatible avec Microsoft PowerPoint et LibreOffice Impress.
- Le format Markdown pour Marp utilise des séparateurs `---` entre les slides.
- Voir aussi : [[marp]], [[presentations]]
