# ZBTools · Attitude Cycle

Interactive tools hosted for [Attitude Cycle](https://attitudecycle.com).

## Tools

| Tool | File / URL | Description |
|------|------------|-------------|
| **Tools hub** | `index.html` | Directory of all Attitude Cycle tools |
| **Five Stages of Change** | `five-stages.html` | Why · What · How · When · Who framework |
| **Harbor Compass** (Wellness Wheel) | [wellness_wheel](https://github.com/ShayneIsMagic/wellness_wheel) | Ten-domain well-being wheel (separate repo) |

## Running locally

```bash
npx --yes serve .
# → http://localhost:3000
```

## Public URLs (GitHub Pages)

After Pages is enabled on this repo:

- **Tools list:** `https://shayneismagic.github.io/ZBTools/`
- **Five Stages:** `https://shayneismagic.github.io/ZBTools/five-stages.html`
- **Harbor Compass:** `https://shayneismagic.github.io/wellness_wheel/`

## Link from attitudecycle.com

On your GoDaddy site, add a navigation link or button:

- **Label:** Tools (or “Free Tools”)
- **URL:** `https://shayneismagic.github.io/ZBTools/`

Optional: use a custom subdomain (e.g. `tools.attitudecycle.com`) with a CNAME to `shayneismagic.github.io` and a `CNAME` file in this repo—see [GitHub Pages custom domains](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site).

## Repo layout

```
/
├── index.html           # Tools hub (link from attitudecycle.com)
├── five-stages.html     # Five Stages tool
├── Pages/               # Legacy path (source copy)
├── Documentation/
└── .github/workflows/   # Pages deploy
```
