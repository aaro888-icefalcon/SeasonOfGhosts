# Generator Index — Season of Ghosts   (hooks: generate:*)
# The human index; the engine reads the machine-readable generators_map in ../bridge.md.
# need | when it's called | table(s) | mode (replace | conjunction | default)
| need | when called | table(s) | mode |
|------|-------------|----------|------|
| new NPC (Willowshore local) | any NEW CHARACTER result (auto-fires) | AC Character Crafter + `willowshore_resident.json` | conjunction |
| new NPC (role / function) | an NPC needs a clearer station/job | `npc_role.json` | replace |
| haunt / spirit manifestation | the season's dread surfaces (world-tick or a scene) | `haunt.json` | replace |
| random encounter (region + season) | a wandering/keyed threat is called for | `encounter.json` | replace |
| lore hook / rumor / omen | a clue, rumor, or ill omen is needed; seed-deck novelty | `lore_hook.json` | replace |
| hinterland region / place | a scene needs an unplaced wilderness spot | `region.json` | replace |
| generic inspiration | Discover Meaning, no specific need | Mythic Elements | default |
# Anything not listed -> Mythic/AC default. Tables are list_d100/list_d10 JSON in this folder,
# rolled with: python3 .claude/skills/mythic-gm/scripts/dice.py table <abs path to the json>
# All tables are contiguous-range (1..100 or 1..10) so bridge.py validate roll-tests them.
# Ground every roll in setting-canon.md (factions Northridge/Southbank, the faiths, the
# season-of-ghosts superstitions/Eight Practices, and Player != PC knowledge of the secrets).
