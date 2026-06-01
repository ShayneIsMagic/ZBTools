# Five Stages of Change

A single-page reference tool presenting the *Five Stages of Change* framework — a philosophy for living with purpose, grounded in the question-based structure: **Why · What · How · When · Who**.

---

## About

This is a polished, scroll-based one-pager built in plain HTML, CSS, and JavaScript — no build tools, no dependencies beyond two Google Fonts. It is designed to be opened directly in a browser or hosted on any static file server.

The page covers:

- **Hero** — Framework introduction with the five-stage navigation spine
- **Map** — Side-by-side overview of all five stages
- **Stage sections (×5)** — Reflection questions and curated quotes for each of Why, What, How, When, and Who
- **Attitude** — The thread running through every stage (Viktor Frankl's laws)
- **Closing** — A final reflection prompt

---

## File Structure

```
/
├── index.html          # The entire tool — all HTML, CSS, and JS in one file
├── README.md           # This file
└── AGENTS.md           # Guidelines for AI agents working on this project
```

> **Single-file architecture:** All styles and scripts are intentionally kept inline within `index.html`. This is a deliberate choice for a self-contained, portable one-pager. Do not split into separate CSS/JS files unless the project scope changes significantly.

---

## Running Locally

No build step required. Open the file directly:

```bash
# Option 1 — open directly in your browser
open index.html

# Option 2 — serve with Python (recommended to avoid CORS quirks)
python3 -m http.server 8000
# then visit http://localhost:8000

# Option 3 — serve with Node
npx serve .
```

---

## Fonts

Loaded from Google Fonts at runtime. No self-hosted files needed.

| Family | Weights Used |
|---|---|
| Cormorant Garamond | 300, 400, 600 (+ italic variants) |
| Jost | 200, 300, 400, 500 |

---

## Color Palette

All colors are defined as CSS custom properties in `:root` at the top of `index.html`.

| Token | Value | Role |
|---|---|---|
| `--ink` | `#1a1714` | Primary text |
| `--ink-soft` | `#4a4540` | Secondary text |
| `--ink-mute` | `#8a8078` | Muted / labels |
| `--gold` | `#b8965a` | Accent |
| `--gold-light` | `#d4b07a` | Light accent |
| `--gold-pale` | `#f0e4cc` | Pale accent / borders |
| `--cream` | `#faf7f2` | Base background |
| `--cream-dark` | `#f0ebe2` | Alternate section bg |
| `--s1` | `#4a3d6b` | Stage 1 — Why (purple) |
| `--s2` | `#2d6b5e` | Stage 2 — What (teal) |
| `--s3` | `#7a5a18` | Stage 3 — How (amber) |
| `--s4` | `#7a3028` | Stage 4 — When (coral) |
| `--s5` | `#1e4468` | Stage 5 — Who (blue) |

---

## Deployment

Drop `index.html` into any static hosting environment:

- **GitHub Pages** — push to `main`, enable Pages in repo settings
- **Netlify / Vercel** — drag and drop the file or connect the repo
- **Any web server** — copy `index.html` to the document root

No server-side processing required.

---

## Browser Support

Targets the last 2 major versions of Chrome, Safari, Edge, and Firefox. Uses:

- CSS custom properties
- CSS Grid and Flexbox
- `IntersectionObserver` (for scroll reveal and nav active state)
- `scroll-behavior: smooth`

No polyfills are included. If older browser support is needed, add them manually.
