#!/usr/bin/env python3
"""Render each designs/*/main.tex.j2 with data/cv.yaml -> designs/*/main.tex.

Usage:
    python3 scripts/sync.py             # render every design with a .j2
    python3 scripts/sync.py 02 05       # render only designs whose dir name starts with these prefixes
    python3 scripts/sync.py --check     # error if any .tex would change (CI-friendly)

After syncing, run `bash scripts/build-all.sh` to (re)compile the PDFs.
"""

from __future__ import annotations

import argparse
import re
import sys
import pathlib
from typing import Iterable

import yaml
import jinja2

ROOT = pathlib.Path(__file__).resolve().parent.parent
DATA = ROOT / "data" / "cv.yaml"
DESIGNS = ROOT / "designs"
MD_TEMPLATE = ROOT / "data" / "cv.md.j2"
MD_OUTPUT = ROOT / "_CV__Dongwook_Kwon.md"


# --- LaTeX escaping helpers (used inside templates as Jinja filters) ---
#
# Templates own their own LaTeX formatting; we only escape strings that we
# know are *user text* and may contain bare specials like `&` or `%`.
# Fields already containing intentional LaTeX (e.g. `\textbf{...}` in author
# lists) are passed through with the `raw` filter (default Jinja behaviour).
_SPECIALS = {
    "\\": r"\textbackslash{}",
    "&":  r"\&",
    "%":  r"\%",
    "$":  r"\$",
    "#":  r"\#",
    "_":  r"\_",
    "{":  r"\{",
    "}":  r"\}",
    "~":  r"\textasciitilde{}",
    "^":  r"\textasciicircum{}",
}


def tex_escape(value) -> str:
    """Escape LaTeX specials. Use as `{{ value | tex }}` in templates."""
    if value is None:
        return ""
    s = str(value)
    # Escape backslash first, otherwise we'd double-escape our own replacements.
    out = []
    for ch in s:
        out.append(_SPECIALS.get(ch, ch))
    return "".join(out)


# Strip the most common LaTeX-isms when piping into markdown.
_TEX_TO_MD_RULES = [
    (re.compile(r"\\textbf\{([^}]*)\}"), r"**\1**"),
    (re.compile(r"\\emph\{([^}]*)\}"),   r"*\1*"),
    (re.compile(r"\\textit\{([^}]*)\}"), r"*\1*"),
    (re.compile(r"\\href\{([^}]*)\}\{([^}]*)\}"), r"[\2](\1)"),
    (re.compile(r"\$\^\{\\dagger\}\$"),  "†"),
    (re.compile(r"\$\^\{(\d+)\}\$"),     r"<sup>\1</sup>"),
    (re.compile(r"\\&"),                 "&"),
    (re.compile(r"\\%"),                 "%"),
    (re.compile(r"~"),                   " "),
    (re.compile(r"\\\\ ?"),              " "),
    (re.compile(r"\s+---\s+"),           " — "),
    (re.compile(r"\\ "),                 " "),
]


def tex_to_md(value) -> str:
    """Best-effort conversion of LaTeX-flavored strings into Markdown."""
    if value is None:
        return ""
    s = str(value)
    for pattern, repl in _TEX_TO_MD_RULES:
        s = pattern.sub(repl, s)
    return s


def load_data() -> dict:
    with open(DATA, "r", encoding="utf-8") as f:
        return yaml.safe_load(f)


def build_env() -> jinja2.Environment:
    env = jinja2.Environment(
        loader=jinja2.FileSystemLoader(str(DESIGNS)),
        # Use distinct delimiters so % and { in LaTeX don't collide with Jinja.
        block_start_string="<%",
        block_end_string="%>",
        variable_start_string="<<",
        variable_end_string=">>",
        comment_start_string="<#",
        comment_end_string="#>",
        trim_blocks=True,
        lstrip_blocks=True,
        keep_trailing_newline=True,
        undefined=jinja2.StrictUndefined,
    )
    env.filters["tex"] = tex_escape
    return env


def iter_templates(prefixes: list[str] | None) -> Iterable[pathlib.Path]:
    """Yield each designs/<name>/main.tex.j2; optionally filter by prefix."""
    for design_dir in sorted(DESIGNS.iterdir()):
        if not design_dir.is_dir():
            continue
        if prefixes and not any(design_dir.name.startswith(p) for p in prefixes):
            continue
        tpl = design_dir / "main.tex.j2"
        if tpl.exists():
            yield tpl


def render_one(env: jinja2.Environment, tpl_path: pathlib.Path, data: dict) -> str:
    rel = tpl_path.relative_to(DESIGNS)
    template = env.get_template(str(rel))
    return template.render(**data)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("prefix", nargs="*",
                        help="design name prefix(es) to render (default: all)")
    parser.add_argument("--check", action="store_true",
                        help="exit 1 if any output would differ from the file on disk")
    args = parser.parse_args()

    data = load_data()
    env = build_env()

    templates = list(iter_templates(args.prefix or None))
    if not templates:
        print(f"No main.tex.j2 templates found under {DESIGNS}", file=sys.stderr)
        return 0

    changed = []
    for tpl_path in templates:
        out_path = tpl_path.with_suffix("")  # main.tex.j2 -> main.tex
        new_content = render_one(env, tpl_path, data)
        existing = out_path.read_text(encoding="utf-8") if out_path.exists() else None

        if existing == new_content:
            print(f"  unchanged   {out_path.relative_to(ROOT)}")
            continue

        changed.append(out_path)
        if args.check:
            print(f"  WOULD WRITE {out_path.relative_to(ROOT)}")
        else:
            out_path.write_text(new_content, encoding="utf-8")
            print(f"  wrote       {out_path.relative_to(ROOT)}")

    # Also (re)render the human-readable markdown view, unless the user
    # asked for a subset of designs.
    if MD_TEMPLATE.exists() and not args.prefix:
        md_env = jinja2.Environment(
            loader=jinja2.FileSystemLoader(str(MD_TEMPLATE.parent)),
            block_start_string="<%", block_end_string="%>",
            variable_start_string="<<", variable_end_string=">>",
            comment_start_string="<#", comment_end_string="#>",
            trim_blocks=True, lstrip_blocks=True, keep_trailing_newline=True,
            undefined=jinja2.StrictUndefined,
        )
        md_env.filters["tex"] = tex_escape
        md_env.filters["md"] = tex_to_md
        md_content = md_env.get_template(MD_TEMPLATE.name).render(**data)
        existing_md = MD_OUTPUT.read_text(encoding="utf-8") if MD_OUTPUT.exists() else None
        if existing_md != md_content:
            changed.append(MD_OUTPUT)
            if args.check:
                print(f"  WOULD WRITE {MD_OUTPUT.relative_to(ROOT)}")
            else:
                MD_OUTPUT.write_text(md_content, encoding="utf-8")
                print(f"  wrote       {MD_OUTPUT.relative_to(ROOT)}")
        else:
            print(f"  unchanged   {MD_OUTPUT.relative_to(ROOT)}")

    if args.check and changed:
        print(f"\n{len(changed)} file(s) would change. Run without --check to apply.",
              file=sys.stderr)
        return 1

    print(f"\nDone. {len(changed)} of {len(templates)} file(s) updated.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
