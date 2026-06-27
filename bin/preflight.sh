#!/usr/bin/env bash
# Preflight readiness check for the Season of Ghosts solo game.
# Verifies the Mythic GM engine data, the Pathfinder 2e bridge, and the campaign state.
# Non-fatal: prints a readiness banner and how to start. Run on SessionStart and on demand.
set -uo pipefail
cd "$(dirname "$0")/.." 2>/dev/null || cd "${CLAUDE_PROJECT_DIR:-.}"

ENGINE=".claude/skills/mythic-gm"
BRIDGE=".claude/skills/pathfinder2e/bridge"
CAMP="campaign"
PY="$(command -v python3 || command -v python)"

echo "🎴 Season of Ghosts — solo PF2e on the Mythic GM engine"

if [ -z "$PY" ]; then
  echo "   ⚠ python3 not found — the engine scripts need Python 3."
  exit 0
fi

# 1) Engine data present (built & verified)?
if [ -f "$ENGINE/data/manifest.json" ]; then
  echo "   ✓ engine tables present ($ENGINE/data)"
else
  echo "   … building engine tables…"
  "$PY" "$ENGINE/scripts/build_data.py" >/dev/null 2>&1 \
    && echo "   ✓ engine tables built" || echo "   ⚠ engine table build reported issues — run: $PY $ENGINE/scripts/build_data.py"
fi

# 2) Bridge valid?
if [ -d "$BRIDGE" ]; then
  OUT="$("$PY" "$ENGINE/scripts/bridge.py" validate "$BRIDGE" 2>&1)"
  if echo "$OUT" | grep -q "valid"; then echo "   ✓ PF2e bridge valid — $OUT"
  else echo "   ⚠ bridge check: $OUT"; fi
else
  echo "   ⚠ bridge not found at $BRIDGE"
fi

# 3) Campaign state valid?
if [ -f "$CAMP/campaign-state.md" ]; then
  OUT="$("$PY" "$ENGINE/scripts/state.py" validate "$CAMP/campaign-state.md" 2>&1)"
  echo "   ✓ campaign: $OUT"
  "$PY" "$ENGINE/scripts/state.py" adventure show "$CAMP" 2>/dev/null | sed 's/^/      /'
else
  echo "   • no campaign yet — Session Zero will scaffold it."
fi

echo "   ▶ To play: invoke the mythic-gm skill (\"be my GM — Pathfinder 2e, Season of Ghosts\"). See CLAUDE.md."
exit 0
