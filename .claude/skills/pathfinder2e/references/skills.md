# Skills & Their Actions (PF2e)

Perception plus the 16 skills, with each skill's **key ability** and the **actions** it
enables. Resolution itself (d20 + four degrees) lives in
[./core-resolution.md](./core-resolution.md); how to pick the DC lives in
[./dcs-by-level.md](./dcs-by-level.md). Conditions that modify these rolls live in
[./conditions.md](./conditions.md).

> **Every roll runs through the engine — never invent a result:**
> `python3 .claude/skills/mythic-gm/scripts/dice.py roll 1d20+<mod>`
> where `<mod> = ability mod + (proficiency rank + level if trained) + circumstance/status/item`.

**Reading the action entries below.** Each names its **traits** (key ones: *exploration* =
done while exploring, ~10 min; *secret* = GM rolls, narrate by Player ≠ PC knowledge;
*manipulate* = needs a free hand, triggers reactions; *attack* = adds to/from the multiple
attack penalty; *auditory*/*visual*/*linguistic*/*mental* = how it reaches the target;
*concentrate* = breaks on certain effects; *move* = involves movement). Most actions print
all four degrees; the **gist** below is the operational summary. Edition note: Remaster
(Player Core) skill list matches the legacy CRB (2019); a few action names were tidied
(e.g. legacy "Identify Magic" folded into Recall Knowledge / Decipher Writing).

**Recall Knowledge** is a general action keyed to whichever skill fits the topic; the
per-skill "RK" line below names what each covers. RK is usually *secret*; vs a **level-based
DC** for the subject (+rarity). Crit Success = bonus/precise fact; Success = one fact;
Failure = nothing; **Crit Failure = a wrong belief.** See
[./dcs-by-level.md](./dcs-by-level.md) §5–6.

---

## Perception — key ability: **Wisdom** (not a skill, but rolled like one)

Sets initiative by default; governs noticing things.

| Action | Traits | Gist |
|---|---|---|
| **Seek** | 1 action; concentrate, secret | Search a 5-ft burst (or 30-ft area) for hidden creatures/objects. Crit = pinpoint (observed); Success = hidden creature becomes *hidden* to you (not undetected). |
| **Point Out** | 1 action; auditory/visual, manipulate | Indicate an unseen-to-allies creature; it's *hidden* (not undetected) to them. (Solo: rarely needed.) |
| **Sense Motive** (RK-like) | 1 action; concentrate, secret | Read whether someone is lying/under an effect. Crit = true read; Failure = wrong read; Crit Fail = confidently wrong. |

Initiative for sneaking uses **Stealth**; social initiative may use **Deception/Diplomacy**.

---

## Acrobatics — key ability: **Dexterity**

| Action | Traits | Gist |
|---|---|---|
| **Balance** | 1 action; move | Cross narrow/slippery footing. Fail = lose action / *off-guard*; Crit Fail = fall/fall prone. |
| **Tumble Through** | 1 action; move | Move through an enemy's space (vs its Reflex DC); Success = treat its space as difficult terrain, no provoke. Fail = stop, movement wasted. |
| **Maneuver in Flight** | 1 action; move | Tricky aerial maneuver (trained). |
| **Squeeze** | exploration; move | Slip through a too-tight gap (trained). |
| RK | — | Acrobatic feats/performers (uncommon). |

---

## Arcana — key ability: **Intelligence**

| Action | Traits | Gist |
|---|---|---|
| **Recall Knowledge** | secret | Arcane theory, constructs, dragons, magical beasts, planes; identify arcane magic/effects. |
| **Decipher Writing** | exploration, secret (trained) | Read coded/arcane text over time. |
| **Identify Magic** | exploration, secret (trained) | Determine what a magic item/effect/location does (10 min; legacy term, folded into RK/identify in Remaster). |
| **Learn a Spell** | exploration (trained) | Add a spell to your repertoire/book (vs level-based DC). |

---

## Athletics — key ability: **Strength** (most actions; *attack* ones vs target's defense)

| Action | Traits | Gist |
|---|---|---|
| **Climb** | 1 action; move | Vs Climb DC. Success = move ¼ Speed up/across; Crit = ¼ Speed + faster; Crit Fail = fall. |
| **Swim** | 1 action; move | Vs Swim DC. Success = move ¼ Speed; Crit Fail = sink / drown risk. |
| **High Jump / Long Jump** | (part of a Stride) | Jump up/across; Success scales distance with the result. |
| **Grapple** | 1 action; attack | Vs target Fortitude DC. Success = *grabbed* (until end of your next turn); Crit = *restrained*; Crit Fail = you fall prone / it escapes. |
| **Trip** | 1 action; attack | Vs Reflex DC. Success = target *prone*; Crit = prone + 1d6 bludgeoning; Crit Fail = you fall prone. Needs a free hand. |
| **Shove** | 1 action; attack | Vs Fortitude DC. Success = push 5 ft (Crit 10 ft, can follow). |
| **Disarm** | 1 action; attack | Vs Reflex DC. Success = −2 to target's attacks with it (+2 to further Disarms); Crit = knock item to the ground in its space; Crit Fail = **you** become *off-guard* until your next turn. |
| **Force Open** | 1 action; attack | Break a door/lock/restraint by strength (often with a crowbar) vs an item/level DC. |
| RK | secret | Sports, athletes, physical feats (rare). |

---

## Crafting — key ability: **Intelligence**

| Action | Traits | Gist |
|---|---|---|
| **Recall Knowledge** | secret | Alchemy, items, materials, traps, identify objects/their function. |
| **Craft** | downtime (trained) | Make an item (have formula + materials; days of work vs level-based DC; Crit = faster/cheaper). |
| **Repair** | exploration; manipulate | Restore Hit Points to an item or shield (vs item-level DC; tools needed). |
| **Earn Income** | downtime (trained) | Practice a trade for daily income by task level + proficiency (see [./dcs-by-level.md](./dcs-by-level.md)). |
| **Identify Alchemy** | exploration, secret (trained) | Determine an alchemical item (10 min). |

---

## Deception — key ability: **Charisma**

| Action | Traits | Gist |
|---|---|---|
| **Lie** | auditory, concentrate, linguistic, mental, secret | Vs target Perception DC. Success = believed (for now); Crit Fail = target sure you lied. Sustained lies allow new checks. |
| **Feint** | 1 action; mental | Vs target Perception DC in melee. Success = target *off-guard* to your next melee attack (Crit = until end of your next turn); Crit Fail = you're *off-guard* to it. |
| **Create a Diversion** | 1 action; mental | Gesture/trick/distract vs targets' Perception DCs → become *hidden* to fooled foes (enables Sneak/Hide). |
| **Impersonate** | exploration/downtime; concentrate, manipulate, secret | Disguise as someone; opposed by Perception when scrutinized. |
| RK | secret | Con artistry, criminal underworld, schemes. |

---

## Diplomacy — key ability: **Charisma**

| Action | Traits | Gist |
|---|---|---|
| **Make an Impression** | 1 min; auditory, concentrate, exploration, linguistic, mental | Vs target Will DC → shift attitude one step (Crit = two) up; Crit Fail = one step worse. Basis of the **Influence** subsystem ([./subsystems/](./subsystems/)). |
| **Request** | 1 action; auditory, concentrate, linguistic, mental | Ask a favor from a target whose attitude allows it; Success = grants (maybe with caveat); Crit Fail = refuses + attitude worsens. |
| **Gather Information** | exploration/downtime; secret | Spend time canvassing for a specific fact vs a level/Simple DC; basis of social legwork. |
| RK | secret | Politics, prominent people, local customs/etiquette. |

---

## Intimidation — key ability: **Charisma**

| Action | Traits | Gist |
|---|---|---|
| **Demoralize** | 1 action; auditory, concentrate, emotion, fear, mental | Vs target Will DC → *frightened 1* (Crit = *frightened 2*). −4 if no shared language. 10-min immunity to your Demoralize on that target after one attempt. |
| **Coerce** | 1 min; auditory, concentrate, emotion, exploration, linguistic, mental | Threaten for info/compliance vs Will DC; Crit Fail = target won't cooperate / turns hostile. |
| RK | secret | Threats, scary creatures' weaknesses (often overlaps with topical skills). |

---

## Lore — key ability: **Intelligence** (each Lore is a separate, **narrow** skill)

You pick a specific subject per Lore subskill; it only covers that niche. RK with the right
Lore can substitute for a broad skill at the GM's call.

| Action | Traits | Gist |
|---|---|---|
| **Recall Knowledge** | secret | Facts within that one narrow subject. |
| **Earn Income** | downtime (trained) | Ply that specialty for daily income (see [./dcs-by-level.md](./dcs-by-level.md)). |

**Season of Ghosts / Shenmen Lores worth tracking:** *Willowshore Lore* (the village,
its people, the local area), *Sangpotshi Lore* (the Tian afterlife / cycle of souls — key
to the AP's ghost theme), and a **creature-specific Lore** unlocked after a foe debuts
(e.g. the AP's signature monster's Lore), which then gives a bonus on RK about it. Also
common in Tian Xia: *Tian Xia Lore*, *Mwangi/region Lore*, *Spirit Lore*, *Theater Lore*.

---

## Medicine — key ability: **Wisdom**

| Action | Traits | Gist |
|---|---|---|
| **Treat Wounds** | exploration; healing, manipulate | **DC 15** (trained), 10 min. Success = heal **2d8**; Crit = **4d8**; Crit Fail = target takes **1d8** damage. Then that target is **immune to your Treat Wounds for 1 hour.** **Optional higher DCs add a flat bonus to the HP regained:** DC 20 (Expert) → **+10**; DC 30 (Master) → **+30**; DC 40 (Legendary) → **+50** (the Continual Recovery feat lowers the immunity window from 1 hour to **10 minutes**). |
| **Administer First Aid** | 2 actions; manipulate | **Stop Bleeding** (vs the bleed's DC, ends persistent bleed) or **Stabilize** a dying creature (vs 5 + that creature's recovery DC) — halts dying at 0 HP, does not heal. |
| **Treat Disease** | downtime; manipulate | Tend a sick creature over time vs the disease's DC → bonus on its next save (Crit) / penalty on Crit Fail. |
| **Treat Poison** | 1 action; manipulate | One-time aid vs the poison's DC → bonus on its next save. |
| **Recall Knowledge** | secret | Anatomy, diseases, poisons, medical lore; identify a wound's cause. |

---

## Nature — key ability: **Wisdom**

| Action | Traits | Gist |
|---|---|---|
| **Recall Knowledge** | secret | Animals, beasts, fey, plants, weather, geography; identify primal magic/effects. |
| **Command an Animal** | 1 action; auditory, concentrate | Order an animal to act vs a DC by its training; Fail = it doesn't comply. |
| **Identify Magic / Learn a Spell** | exploration (trained) | For **primal** magic, as Arcana but Nature-keyed. |

---

## Occultism — key ability: **Intelligence**

| Action | Traits | Gist |
|---|---|---|
| **Recall Knowledge** | secret | The esoteric, aberrations, **spirits/undead/hauntings**, planes, mysteries; identify occult magic/effects. **Primary skill for ghosts** — central to *Season of Ghosts* and the **Haunting** subsystem ([./subsystems/](./subsystems/)). |
| **Decipher Writing** | exploration, secret (trained) | Read occult/esoteric text. |
| **Identify Magic / Learn a Spell** | exploration (trained) | For **occult** magic. |

---

## Performance — key ability: **Charisma**

| Action | Traits | Gist |
|---|---|---|
| **Perform** | 1 action (varies); concentrate + sense trait (auditory/visual) | A single act (sing, recite, dance) for an audience vs a DC; sets the quality of a moment. Often used as social initiative or a one-off impression. |
| **Earn Income** | downtime (trained) | Perform for pay vs task-level DC (see [./dcs-by-level.md](./dcs-by-level.md)). |
| RK | secret | Theater, music, the arts, famous performers (Theater Lore overlaps). |

---

## Religion — key ability: **Wisdom**

| Action | Traits | Gist |
|---|---|---|
| **Recall Knowledge** | secret | Deities, religious traditions, the planes, **the dead/afterlife/undead**, divine creatures; identify divine magic/effects. Pairs with Occultism on ghost lore and *Sangpotshi*. |
| **Decipher Writing** | exploration, secret (trained) | Read religious/scriptural text. |
| **Identify Magic / Learn a Spell** | exploration (trained) | For **divine** magic. |

---

## Society — key ability: **Intelligence**

| Action | Traits | Gist |
|---|---|---|
| **Recall Knowledge** | secret | Local laws, customs, history, nobility, settlements, languages, organizations. |
| **Subsist** | downtime | Find food/shelter in a settlement (vs Simple/level DC). |
| **Create Forgery** | downtime; secret (trained) | Forge a document; opposed by Perception when examined. |
| **Decipher Writing** | exploration, secret (trained) | Read codes/ciphers/dead languages. |

---

## Stealth — key ability: **Dexterity**

| Action | Traits | Gist |
|---|---|---|
| **Hide** | 1 action; secret | Vs observers' Perception DCs while you have cover/concealment → become **hidden** (they know roughly where, but you're not seen). |
| **Sneak** | 1 action; move, secret | Move up to your Speed while staying **undetected** vs Perception DCs; Crit Fail = you become *observed*. |
| **Conceal an Object** | 1 action; manipulate, secret | Hide an item on your person vs Perception DCs. |
| **Avoid Notice** | exploration | Travel using Stealth so foes don't notice you (sets stealthy initiative). |
| RK | secret | Thieves, criminals, infiltration tradecraft (overlaps Thievery). |

---

## Survival — key ability: **Wisdom**

| Action | Traits | Gist |
|---|---|---|
| **Sense Direction** | exploration; secret | Avoid getting lost / find your bearings vs a level/Simple DC. |
| **Subsist** | downtime | Find food and shelter in the wild vs a DC by terrain harshness. |
| **Track** | exploration; concentrate, move | Follow tracks vs a DC; ongoing checks each hour or at obstacles. |
| **Cover Tracks** | exploration; concentrate, move | Hide your own trail (trained). |
| RK | secret | Wilderness survival, terrain, weather, navigation. |

---

## Thievery — key ability: **Dexterity**

| Action | Traits | Gist |
|---|---|---|
| **Pick a Lock** | 2 actions; manipulate | Vs the lock's DC (needs thieves' tools). Success = one of the lock's needed successes; Crit Fail = tool breaks. Complex locks need multiple successes. |
| **Disable a Device** | 2 actions; manipulate | Vs trap/device DC. Success = disable (or one step toward it); Crit Fail = may trigger it. |
| **Steal** | 1 action; manipulate | Take a poorly guarded item vs its owner's Perception DC (penalty if actively watched / item is stowed). |
| **Palm an Object** | 1 action; manipulate | Pocket a nearby unattended/lightly watched object vs Perception DC. |
| RK | secret | Locks, traps, security, the criminal trade. |

---

## See also

- [./core-resolution.md](./core-resolution.md) — the d20 roll, four degrees, nat 20/1, Hero Points
- [./dcs-by-level.md](./dcs-by-level.md) — Simple DCs, level-based DCs, RK & Earn Income DCs
- [./conditions.md](./conditions.md) — *off-guard, frightened, grabbed, prone, hidden, undetected*, etc.
- [./combat.md](./combat.md) — the three-action economy, MAP, how *attack*-trait Athletics actions interact
- [./subsystems/](./subsystems/) — Influence (Diplomacy), Hauntings (Occultism/Religion), Research, Reputation
- [../bridge/system-profile.md](../bridge/system-profile.md) — secret checks & the Player ≠ PC knowledge seam
