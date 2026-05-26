#!/bin/bash
set -e

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

mkdir -p pdfs

# Ensure TeX Live (if installed) is on PATH
export PATH="$HOME/texlive/2026/bin/x86_64-linux:$PATH"

# Designs that REQUIRE TeX Live (upstream templates with fontawesome5/6,
# pdfx, or biblatex that tectonic can't handle). Anything not in this list
# is compiled with tectonic.
TEXLIVE_ONLY=("10-awesome-cv-upstream" "11-altacv-upstream" "13-friggeri-upstream")

is_texlive_only() {
  local name="$1"
  for n in "${TEXLIVE_ONLY[@]}"; do
    [ "$n" = "$name" ] && return 0
  done
  return 1
}

# --- Typst builds (main.typ -> pdfs/<name>.pdf) ---
for dir in designs/*/; do
  if [ -f "$dir/main.typ" ]; then
    name=$(basename "$dir")
    echo "Building (typst)   $name..."
    typst compile "$dir/main.typ" "pdfs/$name.pdf"
  fi
done

TMP_TEX_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_TEX_DIR"' EXIT

# --- LaTeX builds (main.tex -> pdfs/<name>-tex.pdf) ---
for dir in designs/*/; do
  if [ -f "$dir/main.tex" ]; then
    name=$(basename "$dir")
    out="$TMP_TEX_DIR/$name"
    mkdir -p "$out"

    if is_texlive_only "$name"; then
      if command -v xelatex >/dev/null 2>&1; then
        echo "Building (texlive) $name..."
        # -shell-escape + -output-driver needed for pdfx (AltaCV's PDF/A output)
        # Two passes to let cross-references settle. First pass may exit non-zero
        # due to undefined refs/aux file not yet existing; suppress with `|| true`.
        for _ in 1 2; do
          (cd "$dir" && xelatex -shell-escape -output-driver="xdvipdfmx -z 0" \
                                -interaction=nonstopmode -output-directory="$out" main.tex \
                                >/dev/null 2>&1) || true
        done
        if [ -f "$out/main.pdf" ]; then
          cp "$out/main.pdf" "pdfs/$name-tex.pdf"
        else
          echo "  FAILED to produce $name PDF"
        fi
      else
        echo "(skip) xelatex not found - $name needs TeX Live"
      fi
    else
      if command -v tectonic >/dev/null 2>&1; then
        echo "Building (tectonic) $name..."
        tectonic -X compile "$dir/main.tex" --outdir "$out" >/dev/null
        cp "$out/main.pdf" "pdfs/$name-tex.pdf"
      else
        echo "(skip) tectonic not found - $name not built"
      fi
    fi
  fi
done

echo ""
echo "Done. PDFs in pdfs/:"
ls -la pdfs/*.pdf 2>/dev/null || echo "(none)"
