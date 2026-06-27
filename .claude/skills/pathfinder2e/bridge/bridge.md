# Bridge manifest — Pathfinder 2e (Tian Xia / Season of Ghosts)

This companion supplies the **Pathfinder Second Edition** ruleset (d20 + four degrees of
success, level-based DCs, the three-action economy, skills, combat, conditions, death, and
the PF2e subsystems), the **Tian Xia / Shenmen** setting centered on the town of
**Willowshore**, and the **Season of Ghosts** Adventure Path atomized into clusters +
fragments for pure-sandbox play. The mythic-gm engine keeps its scenes / Chaos / Fate /
Random-Event / Turning-Point loop and discipline; this bridge fills the rules, the world,
the generators, the world-tick subsystems, and the module. Edition: **Remaster-primary,
legacy Core Rulebook-aware** (mechanics are identical across editions).

```json
{
  "companion": "Pathfinder 2e — Season of Ghosts",
  "engine": "mythic-gm>=2",
  "overrides": ["resolve","meaning","chaos","themes","generate:character","generate:element","world-tick","seeds","adventure-ingest"],
  "files": {
    "system_profile": "system-profile.md",
    "interpretation": "interpretation.md",
    "chaos": "chaos-tendency.md",
    "themes": "theme-weights.md",
    "generators": "generators/registry.md",
    "subsystems": "subsystems.md",
    "seeds": "seeds.md",
    "canon": "setting-canon.md"
  },
  "generators_map": {
    "character": { "mode": "conjunction", "table": "generators/willowshore_resident.json",
                   "note": "Flesh the NPC as a Willowshore/Shenmen local: roll willowshore_resident.json for their place in town, layer the AC Character Crafter for trait/identity, then ground them in setting-canon.md (factions Northridge/Southbank, faiths, the season-of-ghosts dread). Tengu draw jorogumo animosity; most townsfolk start indifferent." }
  }
}
```

`generators_map.character` auto-fires on every **NEW CHARACTER** result (a two-stage
`character-list` rolling NEW, an Event Focus of *New NPC*, or an AC Plot Point that calls
for a Character). `mode: conjunction` runs the companion table **and** the AC Character
Crafter. Other generator needs (haunts, encounters, lore hooks, regions) are rolled on
demand via `dice.py table <path>` — see `generators/registry.md`. Anything not listed
defers to the Mythic/AC default.
