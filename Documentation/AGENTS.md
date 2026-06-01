# AGENTS — Five Stages of Change

Guidelines for AI agents (Claude, Copilot, Cursor, etc.) working on this project.

---

## Project Context

This is a **single-file, static one-pager** (`index.html`). All HTML, CSS, and JavaScript live in one file by design. It has no build system, no bundler, no framework. Keep it that way unless the scope changes and the owner explicitly requests a restructure.

---

## Architecture Rules

### Do not split the file
All CSS lives in a `<style>` block in `<head>`. All JS lives in a `<script>` block before `</body>`. Do not extract to separate files unless explicitly asked.

### Do not add a build step
No npm, no webpack, no PostCSS, no Tailwind compilation. The file must remain openable by double-clicking it.

### Do not add new dependencies
The only external resources are two Google Fonts imports. Do not add CDN scripts, icon libraries, or animation libraries unless the owner specifically requests them.

---

## Design System — Do Not Break These

### Fonts
| Variable | Family | Role |
|---|---|---|
| Headings | Cormorant Garamond (serif) | All large display text, quotes, stage Q-words |
| Body | Jost (sans-serif) | All UI text, labels, body copy |

**Do not** introduce a third font. **Do not** change font families without explicit approval.

### Color Tokens
All colors are CSS custom properties on `:root`. Always use tokens — never hardcode hex values in new rules.

```css
/* Neutrals */
--ink, --ink-soft, --ink-mute
--cream, --cream-dark, --white
--gold, --gold-light, --gold-pale

/* Stage accent colors */
--s1  (Why  — purple)
--s2  (What — teal)
--s3  (How  — amber)
--s4  (When — coral)
--s5  (Who  — blue)
```

### Spacing & Layout
- Max content width: `880px` via `.container`
- Section min-height: `100vh` with `padding: 80px 2rem 60px`
- Mobile breakpoint: `680px`
- Nav height: `54px` (fixed, frosted glass)

### Reveal Animation Pattern
Scroll-triggered elements use `.reveal` + optional `.rd1`–`.rd5` delay classes. The `IntersectionObserver` in the script block adds `.visible` on entry. Do not change this pattern — just add the classes to new elements.

```html
<div class="reveal rd1">…</div>
```

---

## Content Structure

| Section ID | Purpose | Background |
|---|---|---|
| `#hero` | Opening — title, Frankl quote, 5-stage spine | `--ink` (dark) |
| `#map` | Side-by-side overview grid of all five stages | `--cream-dark` |
| `#s1` | Stage 1 — Why | `#f7f5fc` (purple tint) |
| `#s2` | Stage 2 — What | `#f2f9f7` (teal tint) |
| `#s3` | Stage 3 — How | `#fdf8ee` (amber tint) |
| `#s4` | Stage 4 — When | `#fcf2f1` (coral tint) |
| `#s5` | Stage 5 — Who | `#f1f6fc` (blue tint) |
| `#attitude` | Attitude — the thread through all stages | `--ink` (dark) |
| `#closing` | Final reflection prompt and closing quotes | `--cream-dark` |

Each stage section (`#s1`–`#s5`) follows this internal structure:
1. Stage watermark (giant italic Q-word, `opacity: 0.04`)
2. Stage header: Q-word, stage name row, tag pills
3. `.stage-body` grid (2-col): `.q-panel` left, `.qt-panel` right
4. `.att-bar` — attitude callout at the bottom

---

## Nav Pills

Nav buttons use `data-stage` attributes and `onclick="goTo('#id')"`. Active state is managed by `IntersectionObserver` in the script block.

```html
<button class="nav-pill" data-stage="1" onclick="goTo('#s1')">Why</button>
```

`data-stage` values: `0` = neutral (ink), `1`–`5` = stage colors, `6` = gold. Do not rename or reorder without updating both the HTML and the `sectionMap` array in the script.

---

## JavaScript

The inline script does three things only:

1. `goTo(id)` — smooth-scroll helper used by nav and hero spine
2. Reveal observer — adds `.visible` to `.reveal` elements on scroll
3. Nav active observer — highlights the correct nav pill based on visible section

**Do not** add global functions. If new JS is needed, wrap it in an IIFE or add it to the existing `DOMContentLoaded`-safe pattern (scripts are at end of body).

**Do not** use `var`. Use `const` and `let`.

**Do not** add `onclick` attributes to new elements — prefer `addEventListener` via `querySelectorAll` + `data-*` attributes for anything beyond the existing nav/spine pattern.

---

## What Needs an Owner Decision Before Changing

These things affect the brand and should not be changed by an agent without explicit instruction:

- Font families or weights
- Stage color assignments (`--s1` through `--s5`)
- Gold accent color (`--gold`)
- The five Q-words: Why · What · How · When · Who
- Attribution / quote sources
- The Frankl quote in the hero and Attitude sections

---

## Common Agent Tasks

### Add a new quote to a stage
Find the `.qt-panel` inside the target stage section. Add a `.qt-card` div following the existing pattern:

```html
<div class="qt-card">
  <blockquote>"Quote text here."</blockquote>
  <cite>Author Name — Source Title</cite>
</div>
```

Add `.lead` and the appropriate border style only for the featured/top quote.

### Add a new reflection question to a stage
Find the `.q-panel` inside the target stage section. Add a `.q-item` div:

```html
<div class="q-item">
  <span class="q-bullet">→</span>
  <span class="q-text"><strong>Question Label</strong>The question text here.</span>
</div>
```

### Adjust a section's copy or heading
Edit directly in the HTML. The CSS classes handle all styling — do not add inline styles for color, font, or spacing unless the value is truly dynamic (set at runtime).

### Add a new section
If a new full-viewport section is needed, follow this shell:

```html
<section id="new-section">
  <div class="container">
    <div class="reveal">
      <p class="eyebrow">Label</p>
      <h2 class="section-title">Title <em>Subtitle</em></h2>
    </div>
    <p class="section-lead reveal rd1">Lead paragraph text.</p>
    <!-- content here -->
  </div>
</section>
```

Then add a nav pill and update `sectionMap` in the script.

---

## Anti-Patterns — Never Do These

| Avoid | Do instead |
|---|---|
| Hardcoding hex values in new CSS rules | Use existing `--token` variables |
| Adding `!important` except where already used for `.stag.outline` overrides | Increase specificity |
| Extracting CSS or JS to separate files | Keep everything in `index.html` |
| Adding a third font family | Use Cormorant Garamond (display) or Jost (UI) |
| Changing `--s1` through `--s5` stage colors | Ask the owner |
| Removing the `IntersectionObserver` reveal pattern | It's the scroll animation system |
| Adding a framework or bundler | This is intentionally dependency-free |
| Skipping heading levels | The page uses `h1` → `h2` only; maintain that |
| Adding inline `style="color:…"` or `style="font-size:…"` for static values | Use a CSS class |
