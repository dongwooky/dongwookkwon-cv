---
name: build-cv
description: Rebuild the CV. Runs `python3 scripts/sync.py` (yaml + Jinja2 templates -> .tex + MD) then `bash scripts/build-all.sh` (xelatex -> PDFs). Trigger when the user edits data/cv.yaml, edits a designs/*/main.tex.j2 template, or asks to "rebuild the CV", "sync the CV", "build all PDFs", etc.
---

# Build the CV

Run the sync + build pipeline and report a one-line summary.

## Steps

1. **Sync** templates from `data/cv.yaml`:
   ```bash
   python3 scripts/sync.py $ARGUMENTS
   ```
   `$ARGUMENTS` is whatever the user passed after `/build-cv` (e.g. `02 05` to only sync those designs). If no args, sync all.

2. **Build** PDFs:
   ```bash
   bash scripts/build-all.sh
   ```
   (The build script always rebuilds every design — there's no per-design flag.)

3. **Report** in one or two short sentences:
   - How many `.tex` files sync re-rendered (look for `wrote` lines from step 1).
   - Whether the build succeeded (look for `Done.` in step 2 and check `pdfs/*.pdf` modification times).
   - If any design failed, name it and quote the first error line.

## Don't

- Don't edit `designs/*/main.tex` directly — those are generated. Tell the user to edit `data/cv.yaml` or `designs/*/main.tex.j2` instead.
- Don't run `xelatex` directly. Always use `scripts/build-all.sh` (it knows the right flags).
- Don't git-commit unless the user asks.
- Don't render or open PDFs unless the user asks for visual verification.
