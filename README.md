import os, zipfile, textwrap

base = "/mnt/data/tecblog-cyberpunk"
os.makedirs(base + "/.github/workflows", exist_ok=True)
os.makedirs(base + "/assets", exist_ok=True)

readme = r'''<div align="center">

<img src="assets/neon-banner.svg" width="100%" alt="TecBlog animated neon banner" />

# ⚡ TecBlog

### `Ideas → Code → Creation`

**A modern Flutter project for technology content and creative UI experiments.**

<p>
  <img src="https://img.shields.io/badge/Flutter-Framework-54C5F8?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter" />
  <img src="https://img.shields.io/badge/Dart-Language-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart" />
  <img src="https://img.shields.io/badge/Platform-Flutter-7C3AED?style=for-the-badge&logo=github" alt="Flutter project" />
  <img src="https://img.shields.io/badge/Status-In%20Development-00C896?style=for-the-badge" alt="In development" />
</p>

[**Explore Repository ↗**](https://github.com/abolfazl662/tecblog)

</div>

---

## `01` — About the Project

TecBlog is a Flutter application project built to explore modern mobile UI, reusable widgets, and technology-focused content experiences.

The interface is being developed with Flutter and Dart, with attention to clean layouts, Persian-language UI, and a polished user experience.

## `02` — Highlights

- 🎨 Modern, carefully designed interface
- 📱 Built with Flutter and Dart
- 🧩 Reusable UI components
- 📰 Content-oriented screens and article-writing UI
- 🏷️ Category and tag selection interfaces
- ⚡ Ongoing improvements and experiments

> Features listed here describe the project direction; availability may change as development continues.

## `03` — Tech Stack

| Tool | Role |
| --- | --- |
| [Flutter](https://flutter.dev/) | Cross-platform UI toolkit |
| [Dart](https://dart.dev/) | Programming language |
| [Material](https://m3.material.io/) | UI foundations |
| [GitHub Actions](https://github.com/features/actions) | Automatic banner updates |

## `04` — Run Locally

Make sure Flutter is installed, then run:

```bash
git clone https://github.com/abolfazl662/tecblog.git
cd tecblog
flutter pub get
flutter run
```

## `05` — Latest Build Activity

The animated banner is refreshed by GitHub Actions after pushes to `main` or `master`. It displays the latest commit message, short SHA, and update timestamp.

If the banner has not updated yet, open the repository's **Actions** tab and check the latest `Update TecBlog Neon Banner` run.

## `06` — Project Links

- **Repository:** [abolfazl662/tecblog](https://github.com/abolfazl662/tecblog)
- **Issues & ideas:** [Open an issue](https://github.com/abolfazl662/tecblog/issues)

---

<div align="center">

### `BUILD • LEARN • SHIP • REPEAT`

*Made with Flutter and a lot of curiosity.*

</div>
'''

workflow = r'''name: Update TecBlog Neon Banner

on:
  push:
    branches:
      - main
      - master
  workflow_dispatch:

permissions:
  contents: write

jobs:
  update-banner:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Generate animated banner
        env:
          COMMIT_SHA: ${{ github.sha }}
          COMMIT_MESSAGE: ${{ github.event.head_commit.message }}
        run: |
          python3 - <<'PY'
          import html
          import os
          from datetime import datetime, timezone

          sha = os.environ.get("COMMIT_SHA", "manual")[:7]
          message = os.environ.get("COMMIT_MESSAGE") or "TecBlog is evolving..."
          message = " ".join(message.split())[:68]
          commit = html.escape(message)
          updated = datetime.now(timezone.utc).strftime("%Y-%m-%d %H:%M UTC")

          svg = f'''<svg xmlns="http://www.w3.org/2000/svg" width="1000" height="340" viewBox="0 0 1000 340" role="img" aria-labelledby="title desc">
            <title id="title">TecBlog animated neon banner</title>
            <desc id="desc">A futuristic animated banner showing the latest TecBlog commit.</desc>
            <defs>
              <linearGradient id="bg" x1="0" y1="0" x2="1" y2="1">
                <stop offset="0" stop-color="#070A13"/>
                <stop offset=".52" stop-color="#17102F"/>
                <stop offset="1" stop-color="#061D2A"/>
              </linearGradient>
              <linearGradient id="neon">
                <stop offset="0" stop-color="#00F5FF">
                  <animate attributeName="stop-color" values="#00F5FF;#A855F7;#00FFB2;#00F5FF" dur="7s" repeatCount="indefinite"/>
                </stop>
                <stop offset="1" stop-color="#A855F7">
                  <animate attributeName="stop-color" values="#A855F7;#00FFB2;#00F5FF;#A855F7" dur="7s" repeatCount="indefinite"/>
                </stop>
              </linearGradient>
              <pattern id="grid" width="34" height="34" patternUnits="userSpaceOnUse">
                <path d="M34 0H0V34" fill="none" stroke="#94A3B8" stroke-opacity=".12"/>
              </pattern>
              <filter id="glow">
                <feGaussianBlur stdDeviation="4" result="blur"/>
                <feMerge><feMergeNode in="blur"/><feMergeNode in="SourceGraphic"/></feMerge>
              </filter>
            </defs>
            <rect width="1000" height="340" rx="26" fill="url(#bg)"/>
            <rect width="1000" height="340" rx="26" fill="url(#grid)"/>
            <circle cx="865" cy="70" r="95" fill="#8B5CF6" opacity=".12">
              <animate attributeName="r" values="70;112;70" dur="6s" repeatCount="indefinite"/>
              <animate attributeName="opacity" values=".08;.2;.08" dur="6s" repeatCount="indefinite"/>
            </circle>
            <circle cx="120" cy="315" r="105" fill="#06B6D4" opacity=".10">
              <animate attributeName="r" values="105;70;105" dur="8s" repeatCount="indefinite"/>
            </circle>
            <rect x="18" y="18" width="964" height="304" rx="21" fill="none" stroke="url(#neon)" stroke-width="1.8" opacity=".9"/>
            <path d="M20 88H980" stroke="url(#neon)" stroke-opacity=".35"/>
            <text x="54" y="57" fill="#A5B4FC" font-family="monospace" font-size="14" letter-spacing="4">FLUTTER / OPEN SOURCE / IN DEVELOPMENT</text>
            <text x="52" y="139" fill="url(#neon)" filter="url(#glow)" font-family="monospace" font-size="65" font-weight="700" letter-spacing="-2">TEC BLOG</text>
            <text x="56" y="174" fill="#E2E8F0" font-family="monospace" font-size="17">Ideas into code. Code into experiences.</text>
            <path d="M56 194H490" stroke="url(#neon)" stroke-width="2" stroke-linecap="round" stroke-dasharray="120 320">
              <animate attributeName="stroke-dashoffset" values="440;0" dur="4s" repeatCount="indefinite"/>
            </path>
            <text x="56" y="229" fill="#67E8F9" font-family="monospace" font-size="13">&gt; LATEST COMMIT: {commit}</text>
            <text x="56" y="255" fill="#C4B5FD" font-family="monospace" font-size="13">SHA: {sha}</text>
            <text x="56" y="281" fill="#94A3B8" font-family="monospace" font-size="12">UPDATED: {updated}</text>
            <g>
              <rect x="738" y="112" width="190" height="128" rx="18" fill="#0B1222" stroke="url(#neon)" stroke-width="2"/>
              <path d="M782 155L760 176L782 197" fill="none" stroke="#00F5FF" stroke-width="5" stroke-linecap="round" stroke-linejoin="round"/>
              <path d="M884 155L906 176L884 197" fill="none" stroke="#A855F7" stroke-width="5" stroke-linecap="round" stroke-linejoin="round"/>
              <path d="M861 145L835 207" fill="none" stroke="#E2E8F0" stroke-width="4" stroke-linecap="round"/>
              <text x="833" y="224" fill="#E2E8F0" font-family="monospace" font-size="10" text-anchor="middle" letter-spacing="2">CODE MODE</text>
              <animateTransform attributeName="transform" type="translate" values="0 0;0 -7;0 0" dur="4s" repeatCount="indefinite"/>
            </g>
            <circle cx="944" cy="55" r="4" fill="#00FFB2">
              <animate attributeName="opacity" values="1;.15;1" dur="1.6s" repeatCount="indefinite"/>
            </circle>
            <circle cx="710" cy="275" r="3" fill="#00F5FF">
              <animate attributeName="cy" values="275;255;275" dur="3s" repeatCount="indefinite"/>
              <animate attributeName="opacity" values=".2;1;.2" dur="3s" repeatCount="indefinite"/>
            </circle>
          </svg>'''

          os.makedirs("assets", exist_ok=True)
          with open("assets/neon-banner.svg", "w", encoding="utf-8") as file:
              file.write(svg)
          PY

      - name: Commit updated banner
        run: |
          git config user.name "github-actions[bot]"
          git config user.email "41898282+github-actions[bot]@users.noreply.github.com"
          git add assets/neon-banner.svg
          if ! git diff --cached --quiet; then
            git commit -m "chore: refresh neon banner [skip ci]"
            git push
          fi
'''

# Create an initial SVG so the README displays before the first workflow run.
# This is intentionally a static first render; Actions regenerates it on push.
initial_svg = r'''<svg xmlns="http://www.w3.org/2000/svg" width="1000" height="340" viewBox="0 0 1000 340" role="img" aria-labelledby="title desc">
<title id="title">TecBlog animated neon banner</title><desc id="desc">TecBlog neon banner; GitHub Actions updates commit details on pushes.</desc>
<defs>
<linearGradient id="bg" x1="0" y1="0" x2="1" y2="1"><stop offset="0" stop-color="#070A13"/><stop offset=".52" stop-color="#17102F"/><stop offset="1" stop-color="#061D2A"/></linearGradient>
<linearGradient id="neon"><stop offset="0" stop-color="#00F5FF"><animate attributeName="stop-color" values="#00F5FF;#A855F7;#00FFB2;#00F5FF" dur="7s" repeatCount="indefinite"/></stop><stop offset="1" stop-color="#A855F7"><animate attributeName="stop-color" values="#A855F7;#00FFB2;#00F5FF;#A855F7" dur="7s" repeatCount="indefinite"/></stop></linearGradient>
<pattern id="grid" width="34" height="34" patternUnits="userSpaceOnUse"><path d="M34 0H0V34" fill="none" stroke="#94A3B8" stroke-opacity=".12"/></pattern>
<filter id="glow"><feGaussianBlur stdDeviation="4" result="blur"/><feMerge><feMergeNode in="blur"/><feMergeNode in="SourceGraphic"/></feMerge></filter>
</defs>
<rect width="1000" height="340" rx="26" fill="url(#bg)"/><rect width="1000" height="340" rx="26" fill="url(#grid)"/>
<circle cx="865" cy="70" r="95" fill="#8B5CF6" opacity=".12"><animate attributeName="r" values="70;112;70" dur="6s" repeatCount="indefinite"/></circle>
<circle cx="120" cy="315" r="105" fill="#06B6D4" opacity=".10"><animate attributeName="r" values="105;70;105" dur="8s" repeatCount="indefinite"/></circle>
<rect x="18" y="18" width="964" height="304" rx="21" fill="none" stroke="url(#neon)" stroke-width="1.8"/>
<path d="M20 88H980" stroke="url(#neon)" stroke-opacity=".35"/>
<text x="54" y="57" fill="#A5B4FC" font-family="monospace" font-size="14" letter-spacing="4">FLUTTER / OPEN SOURCE / IN DEVELOPMENT</text>
<text x="52" y="139" fill="url(#neon)" filter="url(#glow)" font-family="monospace" font-size="65" font-weight="700">TEC BLOG</text>
<text x="56" y="174" fill="#E2E8F0" font-family="monospace" font-size="17">Ideas into code. Code into experiences.</text>
<path d="M56 194H490" stroke="url(#neon)" stroke-width="2" stroke-linecap="round" stroke-dasharray="120 320"><animate attributeName="stroke-dashoffset" values="440;0" dur="4s" repeatCount="indefinite"/></path>
<text x="56" y="229" fill="#67E8F9" font-family="monospace" font-size="13">&gt; LATEST COMMIT: First neon banner</text>
<text x="56" y="255" fill="#C4B5FD" font-family="monospace" font-size="13">SHA: awaiting first push</text>
<text x="56" y="281" fill="#94A3B8" font-family="monospace" font-size="12">UPDATED: GitHub Actions will refresh this</text>
<g><rect x="738" y="112" width="190" height="128" rx="18" fill="#0B1222" stroke="url(#neon)" stroke-width="2"/><path d="M782 155L760 176L782 197" fill="none" stroke="#00F5FF" stroke-width="5" stroke-linecap="round" stroke-linejoin="round"/><path d="M884 155L906 176L884 197" fill="none" stroke="#A855F7" stroke-width="5" stroke-linecap="round" stroke-linejoin="round"/><path d="M861 145L835 207" fill="none" stroke="#E2E8F0" stroke-width="4" stroke-linecap="round"/><text x="833" y="224" fill="#E2E8F0" font-family="monospace" font-size="10" text-anchor="middle" letter-spacing="2">CODE MODE</text><animateTransform attributeName="transform" type="translate" values="0 0;0 -7;0 0" dur="4s" repeatCount="indefinite"/></g>
<circle cx="944" cy="55" r="4" fill="#00FFB2"><animate attributeName="opacity" values="1;.15;1" dur="1.6s" repeatCount="indefinite"/></circle>
</svg>'''

with open(base + "/README.md", "w", encoding="utf-8") as f:
    f.write(readme)
with open(base + "/.github/workflows/update-banner.yml", "w", encoding="utf-8") as f:
    f.write(workflow)
with open(base + "/assets/neon-banner.svg", "w", encoding="utf-8") as f:
    f.write(initial_svg)

zip_path = "/mnt/data/tecblog-cyberpunk-pack.zip"
with zipfile.ZipFile(zip_path, "w", zipfile.ZIP_DEFLATED) as z:
    for rel in ["README.md", ".github/workflows/update-banner.yml", "assets/neon-banner.svg"]:
        z.write(base + "/" + rel, arcname="tecblog/" + rel)

print("Created:", zip_path)
print("Files:")
for rel in ["README.md", ".github/workflows/update-banner.yml", "assets/neon-banner.svg"]:
    print(rel, os.path.getsize(base + "/" + rel), "bytes")
