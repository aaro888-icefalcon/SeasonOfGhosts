# Seed Sources — Season of Ghosts   (hook: seeds)
- deck size: 35            # 30–40
- refresh: each bookkeeping
- sources:
  - setting-canon entries near the PC (the Willowshore location they're in/adjacent to; the
    NPCs who live/work there; the faction tensions in play) — `setting-canon.md`
  - the loaded act's clusters & un-used fragments from
    `adventures/season-of-ghosts/` (use `index.json` to pull fragments tagged to the current
    location / active Threads / active Characters; bias toward UN-USED fragments via the
    usage ledger)
  - live world state — the season/week, active clocks (curse, prep points), current
    Reputation standings, which haunts/enemies are active
  - random rolls for novelty on: `generators/haunt.json`, `generators/encounter.json`,
    `generators/lore_hook.json`, `generators/willowshore_resident.json`,
    `generators/region.json`  (show the rolls)
- tagging: each seed notes the threads / characters / elements / location it touches and its
  source (canon cite, cluster id, or generator roll), so a scene/Turning Point/Random Event
  can consume the right one.
- consumed when a seed is invoked by a scene / Turning Point / Random Event; mark used in the
  ledger so the deck leans fresh on refresh.
- (Optional) offload the refresh to the `mythic-scout` agent at end-of-scene; the main AI can
  also do it inline.
