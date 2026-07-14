#!/usr/bin/env bash
# Studio Machine Kit — installer
# Kopieert het agent-team en de skills naar ~/.claude zodat ze in elke repo werken.
# Idempotent: bestaande bestanden met dezelfde naam worden overschreven met de kit-versie.
set -euo pipefail

KIT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST="${CLAUDE_HOME:-$HOME/.claude}"

echo "Studio Machine Kit → $DEST"
mkdir -p "$DEST/agents" "$DEST/skills"

# Agents
n_agents=$(find "$KIT_DIR/agents" -name '*.md' | wc -l | tr -d ' ')
cp "$KIT_DIR/agents/"*.md "$DEST/agents/"
echo "  agents:  $n_agents geïnstalleerd → $DEST/agents/"

# Skills (hele mappen)
n_skills=0
for d in "$KIT_DIR/skills/"*/; do
  name="$(basename "$d")"
  rm -rf "$DEST/skills/$name"
  cp -R "$d" "$DEST/skills/$name"
  n_skills=$((n_skills+1))
done
echo "  skills:  $n_skills geïnstalleerd → $DEST/skills/"

# Python-check voor de ui-ux-pro-max zoekengine
if command -v python3 >/dev/null 2>&1; then
  if python3 "$DEST/skills/ui-ux-pro-max/scripts/search.py" "test" --domain ux -n 1 >/dev/null 2>&1; then
    echo "  engine:  ui-ux-pro-max zoekengine draait (python3 OK)"
  else
    echo "  engine:  LET OP — zoekengine gaf een fout; check python3."
  fi
else
  echo "  engine:  LET OP — python3 niet gevonden. ui-check/ui-ux-pro-max hebben Python 3 nodig."
fi

echo ""
echo "Klaar. Nieuwe skills o.a.: /turbo (parallelle audit), /ui-check (a11y + performance)."
echo "Docs (optionele studio-context): $KIT_DIR/docs/"
