# Season of Ghosts — Solo Pathfinder 2e, run by the Mythic GM engine

A self-contained repository for playing the Pathfinder Second Edition Adventure Path
**Season of Ghosts** *solo / GM-less*, with **Claude as the Game Master**. It combines two
Claude Code skills:

- **`mythic-gm`** — the system-agnostic solo-RPG engine (Mythic Game Master Emulator 2e + The
  Adventure Crafter). It runs the scene/Chaos/Fate-Question/Random-Event/Turning-Point loop,
  rolls every die through scripts, and enforces a hardcore *no-softening* discipline.
- **`pathfinder2e`** — a **companion skill** that supplies the PF2e ruleset, the Tian Xia /
  Shenmen setting, and the *Season of Ghosts* module, via a **bridge** that fills the engine's
  hooks. Mythic paces and answers world questions; Pathfinder 2e owns task resolution, combat,
  and the subsystems.

> Engine + companion is the design from the engine's own `COMPANION-SKILLS.md` / `CONVERSION.md`:
> one shared, content-free engine; the RPG is a thin declarative `bridge/` over its content.

## Layout

| Path | What |
|---|---|
| `.claude/skills/mythic-gm/` | the engine (scripts, data, references, the discipline) — kept pristine |
| `.claude/skills/pathfinder2e/` | the PF2e companion: `references/` (rules + subsystems) and `bridge/` |
| `.claude/skills/pathfinder2e/bridge/` | `system-profile.md`, `interpretation.md`, `chaos-tendency.md`, `theme-weights.md`, `subsystems.md`, `seeds.md`, `setting-canon.md`, `generators/`, `adventures/season-of-ghosts/` |
| `campaign/` | live play state — `campaign-state.md` + `threads.json` / `characters.json` / `adventure.json` + `character-sheet.md` |
| `CLAUDE.md` | the operating guide Claude reads each session |
| `bin/preflight.sh` | readiness check (engine data, bridge, campaign); runs on SessionStart |

## How the module is stored (atomized for retrieval)

The 4-act AP is chopped into **clusters** (authored scenes/locations) and **fragments**
(atomic beats) under `bridge/adventures/season-of-ghosts/`, each tagged
(threads/characters/elements/themes/location) and **cited to page**, with a master
**`index.json`** providing inverted maps (`by_location`, `by_thread`, `by_character`,
`by_theme`) so the GM surfaces the right content by relevance. It runs as a **pure sandbox**:
no forced order, honest dice decide, the module is a map not a script. Hidden revelations are
tagged `spoiler` and withheld under **Player ≠ PC knowledge**.

## Play

Open the project with Claude Code and ask Claude to **be your GM for Pathfinder 2e, Season of
Ghosts**. Claude loads the engine, discovers the bridge, runs Session Zero (create a
Willowshore hero), and begins. The campaign is pre-scaffolded to **Act 1 — The Summer That
Never Was** with horror Theme priorities and seeded Threads/Characters. See `CLAUDE.md` for
the loop, the seam, and the commands.

Default configuration: **Remaster-primary, legacy-aware** PF2e; **single PC** with a
**Diminisher ≈ ½** for encounter scaling (change at Session Zero in `campaign-state.md`).

## Validate

```bash
python3 .claude/skills/mythic-gm/scripts/build_data.py
python3 .claude/skills/mythic-gm/scripts/bridge.py validate .claude/skills/pathfinder2e/bridge
python3 .claude/skills/mythic-gm/scripts/state.py validate campaign/campaign-state.md
bash bin/preflight.sh
```

## Content & copyright

The *Season of Ghosts* AP and the Pathfinder 2e rules are © Paizo Inc.; the Mythic GME 2e /
Adventure Crafter tables bundled in the engine are © Tana Pigeon / Word Mill Games. This
repository is for **personal play**. The module is stored as a transformed, page-cited
play-aid (structured clusters/fragments and condensed scene summaries), not a verbatim
reproduction. Bring your own copies of the source books to play.
