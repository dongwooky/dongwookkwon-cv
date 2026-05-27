---
name: build-cv
description: Regenerate the CV LaTeX templates from data/cv.yaml and rebuild every (or selected) design PDF. Use this whenever the user edits data/cv.yaml, edits a Jinja2 template under designs/*/main.tex.j2, or just says things like "rebuild the CV", "rebuild design 02", "sync the CV", or "build all the PDFs".
---

# Build CV pipeline

This project's CV is generated in two steps:

1. **Sync** — `python3 scripts/sync.py` reads `data/cv.yaml` + the `designs/*/main.tex.j2` Jinja2 templates and writes the rendered `designs/*/main.tex` files plus the human-readable `_CV__Dongwook_Kwon.md`.
2. **Build** — `bash scripts/build-all.sh` compiles each `designs/*/main.tex` to `pdfs/<design>.pdf` with TeX Live's `xelatex`.

This skill is the one-liner that runs both.

## Steps

Run the two stages and report a short summary. Do **not** stop to ask questions — this skill is a build wrapper, not an interview.

### 1. Decide the scope

- If the user gave a design prefix (e.g. "rebuild 02", "/build-cv 02 05") → pass those prefixes to `scripts/sync.py` and only build PDFs whose name starts with those prefixes.
- Otherwise → sync + build everything.

### 2. Sync the templates

```bash
python3 scripts/sync.py [prefix...]
```

Capture the output. Look for lines starting with `wrote` (file changed) or `WOULD WRITE` (only with `--check`).

### 3. Build the PDFs

```bash
bash scripts/build-all.sh
```

(The script always builds every design — there's no per-design flag. If the user asked for a subset, after the build copy/keep only those PDFs untouched and don't mention the others.)

### 4. Report

One short message back to the user:

- How many `.tex` files were re-rendered by sync (e.g. "3 of 8 templates regenerated").
- How many PDFs were rebuilt successfully (count the `pdfs/*.pdf` modified in the last minute, or just trust the build script's "Done." line).
- If any design failed to compile, name it and quote the first error line from the log.

If everything was already in sync and the build was a no-op, say so plainly — don't pretend work happened.

## Don't

- Don't edit `designs/*/main.tex` directly — those are generated artifacts. Tell the user that and edit `designs/*/main.tex.j2` or `data/cv.yaml` instead.
- Don't run `xelatex` directly. Always go through `scripts/build-all.sh`, which already knows the right flags (`-shell-escape`, `-output-driver`, two passes for cross-refs).
- Don't `git commit` unless the user explicitly asks. Building PDFs is normal; committing them is a deliberate choice.
- Don't open or render PDFs unless the user asks for visual verification.

## Common quick references

- TeX Live binaries live at `~/texlive/2026/bin/x86_64-linux/`. The build script puts them on `$PATH` itself, so you don't usually need the full path.
- `data/cv.yaml` is the master content; everything else is derived.
- `_CV__Dongwook_Kwon.md` is also derived from yaml (via `data/cv.md.j2`). Never edit it by hand.
