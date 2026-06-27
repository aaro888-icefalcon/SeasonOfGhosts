---
name: pathfinder2e
description: >-
  Pathfinder Second Edition (PF2e) companion for the mythic-gm solo engine. Supplies the
  PF2e ruleset (d20 + degrees of success, level-based DCs, the three-action economy, skills,
  combat, conditions, death) and its subsystems (Influence, Victory Points, Research,
  Reputation, Chases, Infiltration, Hauntings, downtime), plus the Tian Xia / Shenmen
  setting and the "Season of Ghosts" Adventure Path atomized for sandbox play. Use this
  whenever the user wants to PLAY Pathfinder 2e / PF2e solo or GM-less, run "Season of
  Ghosts", resolve a PF2e skill check / save / attack / spell, run a PF2e subsystem, or
  asks to be GMed through Willowshore. Pairs with mythic-gm (the engine): mythic-gm owns
  scenes, Fate Questions, Chaos, Random Events and Turning Points; THIS skill owns task
  resolution, the rules, the setting, and the module. All randomness still runs through the
  engine's scripts — honest, shown, cited. The bridge lives in ./bridge/.
---

# PATHFINDER 2e — Companion for mythic-gm

This is a **companion content pack** for the `mythic-gm` engine, not a standalone GM. The
engine runs the solo loop (scenes, Chaos, Fate Questions, Random Events, Turning Points,
the no-softening discipline, all Mythic + Adventure Crafter tables). **This skill fills the
engine's hooks** with Pathfinder 2e rules, the Tian Xia / Shenmen setting, and the *Season
of Ghosts* Adventure Path.

**To play, the engine drives.** Start `mythic-gm` (say "be my GM, let's play Pathfinder 2e
Season of Ghosts"). The engine, at session start, discovers this bridge and loads it:

```
python3 .claude/skills/mythic-gm/scripts/bridge.py summary  .claude/skills/pathfinder2e/bridge
python3 .claude/skills/mythic-gm/scripts/bridge.py validate .claude/skills/pathfinder2e/bridge
```

Pass `--bridge .claude/skills/pathfinder2e/bridge` to the engine's roller scripts so the
companion overrides (character generator, etc.) are seen, and `--campaign campaign` so the
JSON Lists are rolled. The loop does this automatically once the bridge is loaded.

## What this companion supplies (the bridge hooks)

| Hook | Filled by | What it gives the engine |
|---|---|---|
| `resolve` | `bridge/system-profile.md` (+ `references/`) | PF2e d20 resolution, DoS, level DCs, combat, death, NPC statting, the Diminisher |
| `meaning` | `bridge/interpretation.md` | folk-horror + cozy-community + mystery GM/NPC lens for Shenmen |
| `chaos` | `bridge/chaos-tendency.md` | start 5, harsh control-lean, seasonal floors |
| `themes` | `bridge/theme-weights.md` | fixed horror weighting (Tension/Mystery first) |
| `generate:character` | `bridge/generators/` | Willowshore residents + NPC roles (conjunction with the AC Crafter) |
| `generate:element` | `bridge/generators/` | haunts, encounters, lore hooks, hinterland regions |
| `world-tick` | `bridge/subsystems.md` | season clock, reputation, prep points, hauntings, enemy moves |
| `seeds` | `bridge/seeds.md` | seed-deck sources (canon + clusters + generators) |
| `adventure-ingest` | `bridge/adventures/season-of-ghosts/` | the AP as clusters + fragments (pure sandbox) + a retrieval `index.json` |

Setting ground truth: `bridge/setting-canon.md` (Willowshore + Shenmen). It overrides
recollection — consult it before inventing.

## The seam (who resolves what)

- **PF2e resolves**: skill checks, saves, attacks, spell attacks/DCs, AC/HP/damage, the
  three-action turn, conditions, exploration & downtime activities, and the subsystems
  (`references/subsystems/`). Roll honest dice via `dice.py roll 1d20+<mod>` and read the
  four degrees of success (`references/core-resolution.md`).
- **Mythic resolves**: whether something uncertain is true at all, NPC disposition not
  governed by a check, off-screen developments, scene framing, and pacing — via Fate
  Questions. When PF2e has no rule, the engine's Fate Question decides (rule-mode for a
  missing mechanic) and the result is recorded to canon/state.
- **Precedence**: `system-profile.md` + `references/` > training knowledge. When all are
  silent, a Fate Question decides.

## Reference loading guide (load on demand — don't preload everything)

| When you need… | Read |
|---|---|
| The core d20 roll, four degrees of success, crit rules | `references/core-resolution.md` |
| Level-based DCs, simple DCs, adjusting difficulty | `references/dcs-by-level.md` |
| Skills, their actions, and what each can attempt | `references/skills.md` |
| The three-action turn, attacks, MAP, damage, death/dying | `references/combat.md` |
| Conditions and their numeric effects | `references/conditions.md` |
| A specific subsystem (Influence, VP, Research, Reputation, Chase, Infiltration, Hauntings, downtime) | `references/subsystems/<name>.md` |
| On-the-fly NPC/monster stats by level + Diminisher | `bridge/system-profile.md` → "NPC statting" |
| Setting facts (Willowshore, Shenmen, NPCs, timeline) | `bridge/setting-canon.md` |
| A specific scene/location/beat of the module | `bridge/adventures/season-of-ghosts/` (use `index.json` to find the cluster) |

## Running Season of Ghosts (pure sandbox, the module is a map not a script)

The AP is atomized into **clusters** (authored scenes/locations) and **fragments** (atomic
beats) under `bridge/adventures/season-of-ghosts/`, each tagged and cited to page. Use
`index.json` to retrieve the right cluster by location/thread/character/theme. Behavior is
the engine's default ingestion (`references/ingest-adventure.md`): no forced order, content
bias medium, weighted-random with an un-used lean, clusters surface by relevance, Turning
Points prefer sibling fragments. Honest dice still decide; if a result diverges from the
book, **adapt** — and apply **Player ≠ PC knowledge** (the campaign hinges on hidden
revelations; never leak them). See `bridge/adventures/season-of-ghosts/00-overview.md` for
the spoiler-aware act map and the campaign's secret spine.

**Companion bridge for mythic-gm: `./bridge/`.**
