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

## Cloudflare + attitudecycle.com

Your domain is proxied through Cloudflare. Typical setup:

### Main site (GoDaddy Website Builder)

In **Cloudflare → DNS**, keep the records GoDaddy gave you (often `A` `@` and `CNAME` `www`) with **Proxied** (orange cloud) on. Do not delete them when adding tools.

**SSL/TLS → Overview:** use **Full** (or **Full (strict)** if GoDaddy provides a valid origin certificate).

### Tools subdomain (recommended)

| Type | Name | Target | Proxy status |
|------|------|--------|----------------|
| `CNAME` | `tools` | `shayneismagic.github.io` | **DNS only** (grey cloud) |

GitHub Pages needs the `CNAME` file in this repo (`tools.attitudecycle.com`). Then in **GitHub → ZBTools → Settings → Pages**, set custom domain to `tools.attitudecycle.com` and wait for the DNS check.

Public tools URL: **https://tools.attitudecycle.com/**

### Harbor Compass (optional second subdomain)

Same pattern in the [wellness_wheel](https://github.com/ShayneIsMagic/wellness_wheel) repo if you want e.g. `compass.attitudecycle.com` → `shayneismagic.github.io`.

## Link from attitudecycle.com

On your GoDaddy site, add a navigation link or button:

- **Label:** Tools (or “Free Tools”)
- **URL:** `https://tools.attitudecycle.com/` (or `https://shayneismagic.github.io/ZBTools/` until DNS is live)

## Repo layout

```
/
├── index.html           # Tools hub (link from attitudecycle.com)
├── five-stages.html     # Five Stages tool
├── Pages/               # Legacy path (source copy)
├── Documentation/
└── .github/workflows/   # Pages deploy
```
