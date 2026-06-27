# World Subsystems — Season of Ghosts   (hook: world-tick; fired by tick.py at bookkeeping)
# tick.py reads this table and reports which rows are DUE for the current scene number.
# cadence: "every scene" | "every N scenes" | "on trigger: <condition>".
# The engine then advances each by rolling its named table honestly / ticking its clock and
# records the result to campaign-state.md. Full rules for each in ../references/subsystems/.

| subsystem | cadence | advance by |
|-----------|---------|-----------|
| Season clock | every scene | Advance the year's calendar (Act 1 summer → Act 2 fall → Act 3 winter → Act 4 spring). Note the week; at an act boundary, roll new Themes for the next act and re-seed the Lists from that act's clusters. |
| Hauntings (the season of ghosts) | every scene | During summer / the long nights, a haunt or spirit may manifest: Fate Question "does the season's dread surface here?" (odds by region floor) → on Yes roll `generators/haunt.json`; run it per ../references/subsystems/hauntings.md. The Eight Practices modify the odds. |
| Willowshore Reputation | on trigger: a PC action helps/harms/sways a faction or notable NPC | Adjust Northridge / Southbank reputation and per-NPC attitude per ../references/subsystems/reputation.md; check threshold effects (unlocked support, hostility). Record to setting-canon live state. |
| Preparation Points | every 3 scenes | During the fall (Act 2) and winter (Act 3) defense, tally Preparation Points earned from downtime activities; at each season's deadline, the accumulated total sets the defense outcome (../references/subsystems/downtime.md → "Preparing Willowshore"). |
| The Willowshore Curse / mindscape decay | every 3 scenes | Advance the hidden curse clock (Act 1: the looping day's grip; later acts: Kugaptee's growing reach). A higher clock raises haunt odds and enemy boldness. Player ≠ PC knowledge: the clock is felt, not announced. |
| Enemy faction moves (noppera-bō, then Kugaptee's web) | every 3 scenes | The active antagonist makes an offscreen move: Random-Event-style Focus "Move Toward / Away a Thread" on the Threads List, or roll `generators/encounter.json` for a manifestation. NPCs/forces act to win. |
| Offscreen clocks (default) | every scene | Mythic default: advance any other ticking clocks (a wounded NPC's decline, an approaching merchant, rebuilding in progress) one notch. |
