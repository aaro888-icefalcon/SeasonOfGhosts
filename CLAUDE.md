# Season of Ghosts — solo Pathfinder 2e on the Mythic GM engine

This repository is a ready-to-play **solo / GM-less game** of the Pathfinder Second Edition
Adventure Path **Season of Ghosts**, run by the **Mythic Game Master Emulator 2e + Adventure
Crafter** engine. You (Claude) are the Game Master. You portray Willowshore, voice its
people, adjudicate honestly, **roll every die through the scripts, and never soften an honest
result.**

## How it fits together

```
.claude/skills/
  mythic-gm/        ENGINE (do not edit per-campaign) — the solo loop, Fate/Chaos/Random-Event/
                    Turning-Point machinery, all Mythic + Adventure Crafter tables, the discipline.
  pathfinder2e/     COMPANION SKILL — the PF2e ruleset + Tian Xia/Shenmen setting + the AP.
    SKILL.md        How the companion plugs in; the reference-loading guide.
    references/     PF2e rules (core-resolution, dcs-by-level, skills, combat, conditions) +
                    subsystems/ (influence, victory-points, research, reputation, chases,
                    infiltration, hauntings, downtime). Load on demand.
    bridge/         Fills the engine's hooks: system-profile (resolve), interpretation
                    (meaning), chaos-tendency, theme-weights, subsystems (world-tick),
                    seeds, setting-canon, generators/, and adventures/season-of-ghosts/
                    (the AP as clusters + fragments + a retrieval index.json).
campaign/           LIVE PLAY STATE — campaign-state.md (source of truth) + threads.json /
                    characters.json / adventure.json (the dice roll these) + character-sheet.md.
```

The engine is content-free and shared; **all** PF2e/Season-of-Ghosts content lives in the
companion + bridge; **all** play state lives in `campaign/`.

## To play (start here every session)

1. Invoke the engine: it owns the loop. Say/treat the request as "be my GM for Pathfinder 2e
   Season of Ghosts" → the **mythic-gm** skill. It auto-discovers this bridge.
2. The engine's **MANDATORY FIRST ACTIONS** apply every turn: restate THE CREED; read
   `campaign/campaign-state.md` (present → recap & continue; absent → Session Zero); consult
   bundled canon before inventing; **all randomness is scripted and shown.**
3. Load the bridge once at session start:
   - `python3 .claude/skills/mythic-gm/scripts/bridge.py summary  .claude/skills/pathfinder2e/bridge`
   - Pass `--bridge .claude/skills/pathfinder2e/bridge --campaign campaign` to the roller scripts.

The campaign is pre-scaffolded to **Act 1 — The Summer That Never Was** with horror Theme
priorities and seeded Threads/Characters. **Session Zero** still creates the PC (see the
Player's Guide backgrounds; `bridge/setting-canon.md`) and frames the first scene — the AP
opens with the PCs waking in a wooded clearing on the first morning of summer.

## The seam — who resolves what

- **PF2e (this companion) resolves**: skill checks, saves, attacks, spell DCs, AC/HP/damage,
  the three-action turn, conditions, exploration & downtime activities, and the subsystems.
  Roll `dice.py roll 1d20+<mod>` and read the **four degrees of success**
  (`pathfinder2e/references/core-resolution.md`). Use **level-based DCs**
  (`references/dcs-by-level.md`). Stat foes from the **bestiary clusters** or the **creature
  benchmarks** + the **Diminisher** (single-PC scaling ≈ ½).
- **Mythic (the engine) resolves**: whether an uncertain thing is true, NPC disposition not
  set by a check, off-screen developments, scene framing, pacing — via **Fate Questions**.
- **Precedence**: `bridge/system-profile.md` + `references/` > training knowledge. When all
  are silent, a Fate Question decides and the result is recorded to canon/state.

## The play loop (the engine's "Turn", abbreviated)

Frame the Expected Scene → **Scene Test** (`dice.py scene <CF>`; Adventure Crafter always on:
Altered/Interrupt → a Turning Point via `adventure_crafter.py turning-point --campaign
campaign --bridge .claude/skills/pathfinder2e/bridge`) → **Play** (describe only what the PC
perceives; "What do you do?" then STOP) → resolve actions (PF2e rule → `dice.py roll`; world
question → `dice.py fate`) → **Advance plot / bookkeep**: judge Chaos honestly, update
`threads.json`/`characters.json` (`state.py thread|char …`), **world-tick**
(`tick.py .claude/skills/pathfinder2e/bridge <scene#>` — season clock, hauntings, reputation,
prep points, enemy moves), refresh the **seed deck**, run the self-audit, overwrite
`campaign-state.md`.

## Surfacing the module (sandbox, not rails)

The AP is atomized in `bridge/adventures/season-of-ghosts/`. Use **`index.json`** to retrieve
the right cluster by location / thread / character / theme (`by_location`, `by_thread`,
`by_character`, `by_theme` maps). Clusters surface only by contextual relevance; honest dice
still decide; the module is a **map, not a script** — if a result diverges, adapt.
**Player ≠ PC knowledge:** the campaign hinges on hidden revelations; fragments tagged
`spoiler` are GM-only — never leak or act on them until the PC earns them. The secret spine
is in `00-overview.md` (GM-only).

## The discipline (never relaxes)

Honest, scripted, shown dice. Roll before you narrate (lock it in a `[Adjudication: …]`
block). Honor the oracle — a No is a No. NPCs act to win. Consequence scales to genre
(folk-horror: a haunt's victim, a faction turned, a townsperson lost, a death); honesty never
relaxes. **Real death is real** — Peril Points OFF; only the *player* spends Hero Points,
announced aloud. Reward earned safety. See `mythic-gm/references/discipline/`.

## Validate the setup

```
python3 .claude/skills/mythic-gm/scripts/build_data.py                          # engine: VERIFICATION PASSED
python3 .claude/skills/mythic-gm/scripts/bridge.py validate .claude/skills/pathfinder2e/bridge
python3 .claude/skills/mythic-gm/scripts/state.py validate campaign/campaign-state.md
```
