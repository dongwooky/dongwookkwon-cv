#!/bin/bash
set -e

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

mkdir -p pdfs

# Ensure TeX Live is on PATH
export PATH="$HOME/texlive/2026/bin/x86_64-linux:$PATH"

if ! command -v xelatex >/dev/null 2>&1; then
  echo "ERROR: xelatex not found. Install TeX Live (scheme-medium + roboto, fontawesome5, fontawesome6, pdfx, biblatex, simpleicons)." >&2
  exit 1
fi

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

# Compile each upstream design with xelatex. Two passes for cross-references;
# first pass may exit non-zero due to undefined refs (suppressed with || true).
# -shell-escape + -output-driver needed for pdfx (AltaCV PDF/A output).
for dir in designs/*/; do
  [ -f "$dir/main.tex" ] || continue
  name=$(basename "$dir")
  out="$TMP/$name"
  mkdir -p "$out"

  echo "Building $name..."
  for _ in 1 2; do
    (cd "$dir" && xelatex -shell-escape -output-driver="xdvipdfmx -z 0" \
                          -interaction=nonstopmode -output-directory="$out" main.tex \
                          >/dev/null 2>&1) || true
  done

  if [ -f "$out/main.pdf" ]; then
    cp "$out/main.pdf" "pdfs/$name.pdf"
  else
    echo "  FAILED to produce $name PDF" >&2
  fi
done

echo ""
echo "Done. PDFs in pdfs/:"
ls -la pdfs/*.pdf 2>/dev/null || echo "(none)"
