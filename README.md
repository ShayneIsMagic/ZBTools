# Attitude Cycle · ZBTools

Static site for [Attitude Cycle](https://attitudecycle.com) — landing page plus interactive tools.

## Site map

| Path | Description |
|------|-------------|
| `/` (`index.html`) | **Landing** — Attitude as the soil of every stage; links to tools |
| `/tool.html` | **Purpose Driven Exercise** — Five Stages framework (Why · What · How · When · Who) |
| `/wellness/` | **Harbor Compass** — Wellness wheel, ten dimensions, vision, actions, and budget |

## Running locally

```bash
npx --yes serve .
# → http://localhost:3000
```

## Deploy

GitHub Pages via `.github/workflows/deploy-pages.yml` on push to `main`.

- **GitHub URL:** https://shayneismagic.github.io/ZBTools/
- **Custom domain (optional):** `tools.attitudecycle.com` — CNAME target must be `shayneismagic.github.io` only (no path)

To use **attitudecycle.com** as the homepage for this site, point Cloudflare `@` and `www` to GitHub Pages and set the custom domain in repo Settings → Pages.

## Harbor Compass source

The wellness tool is copied from [wellness_wheel](https://github.com/ShayneIsMagic/wellness_wheel). After editing there, sync into `wellness/`:

```bash
cp ../Wellness_Wheel/index.html wellness/
cp ../Wellness_Wheel/css/main.css wellness/css/
cp ../Wellness_Wheel/js/main.js wellness/js/
```

Preserve the `ac-site-nav` block at the top of `wellness/index.html` when syncing.
