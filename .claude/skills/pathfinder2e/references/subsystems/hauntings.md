# Hauntings & Haunts — Supernatural Hazards (PF2e Subsystem)

A **haunt** is a hazard with a soul: a trapped emotion, a restless spirit, or a curse bound to a
place. Mechanically it is a **hazard** (from **GM Core**, "Hazards"; legacy: *Gamemastery Guide*
+ *Core Rulebook* "Hazards") — it has a **level**, a **Stealth DC to notice**, a **trigger**, an
**attack/effect**, and a **Reset** or **Disable** routine. Unlike a trap, a haunt's effect is
usually **mental, spirit, void/negative, or fear-based** (often the **frightened** condition) and
its "Disable" is usually a **Religion or Occultism check to quell** the spirit rather than
Thievery to jam a mechanism. Haunts are the rules-spine of *Season of Ghosts*: the season's rising
dread is run as a recurring haunt-manifestation tick.

Resolution itself (d20 + four degrees) lives in [../core-resolution.md](../core-resolution.md);
DCs by level in [../dcs-by-level.md](../dcs-by-level.md); the **frightened**/mental conditions a
haunt inflicts live in [../conditions.md](../conditions.md).

> **Every check runs through the engine — never invent a result:**
> `python3 .claude/skills/mythic-gm/scripts/dice.py roll 1d20+<mod>`
> Roll Perception vs the Stealth DC to notice; roll the haunt's attack or the PC's save; roll the
> disable check (Religion/Occultism/Thievery) vs the haunt's DC. Read the four degrees each time.

---

## 1. When something is a haunt (vs. a creature, a trap, or a Fate Question)

| Situation | Use |
|---|---|
| A **place** does something supernatural on a trigger, then resets — cold spots, whispers, a re-enacted death, a grasping presence | **Haunt** (this file) — a hazard |
| An autonomous ghost/spirit that **acts on its own turn**, moves, and can be reasoned with or fought round-by-round | a **creature** (initiative + [../combat.md](../combat.md)); stat to its level |
| A purely mechanical trap (pit, dart, glyph) with no spirit | a **hazard** with a Thievery disable (same chassis, mundane skin) |
| "Is this room haunted at all?" / "does the dread surface here?" | a **Fate Question** first ([../../bridge/subsystems.md](../../bridge/subsystems.md)); on Yes, build/roll a haunt |

A haunt is **reactive scenery with teeth**: it waits, triggers once (or per round while present),
hits, then **resets** until permanently quelled. A creature *chooses*; a haunt *fires*.

---

## 2. Haunt anatomy (the statblock)

Stat a haunt once, before it triggers, and record it to campaign-state. Every haunt has these
fields (PF2e hazard format):

| Field | What it is |
|---|---|
| **Name & traits** | the haunt's identity + traits (**haunt**, plus e.g. *mental*, *fear*, *void*/*negative*, *occult/divine*, *complex* if it acts on initiative) |
| **Level** | drives every other number; pick it (often = region/scene level), then read the rest off [../dcs-by-level.md](../dcs-by-level.md) |
| **Stealth DC (to notice)** | the **Perception DC** a PC beats to spot the haunt *before* it fires (= Level-based DC, often **Hard +2** for a subtle haunt). Stealth here is the haunt's "to-hit you by surprise" defense, **not** an init bonus unless it's *complex*. |
| **Disable** | the routine to **neutralize/quell** it — usually a skill check vs a DC (§4). The signature haunt disable is **Religion or Occultism** to soothe/banish the spirit; a *triggered* haunt may also be foiled by **Thievery** (disarm the physical trigger) or a clever action. |
| **AC / Saves** | only on haunts you can *attack* (a focus object, a manifesting form). Read **AC, Fort/Ref/Will** off the creature benchmarks for its level ([../dcs-by-level.md](../dcs-by-level.md)). Many haunts have **no AC** — they can't be hit, only quelled. |
| **HP & Hardness** *(or none)* | a haunt tied to a **physical focus** (a portrait, a corpse, an altar) has HP/Hardness — destroy the focus to end it. A bodiless haunt has **no HP**; force it down only via Disable/Reset. |
| **Trigger** | what sets it off: a creature enters the space, touches the focus, speaks a name, the sun sets, a Practice is broken (§6), etc. State it precisely. |
| **Routine / Effect** | what it does when triggered — an **attack** (vs AC) or a **save** (vs the haunt's DC), dealing **mental / spirit / void damage** and/or inflicting **frightened**, *fleeing*, *stupefied*, *drained*, etc. ([../conditions.md](../conditions.md)). A **complex** haunt has a multi-action routine on its own initiative. |
| **Reset** | how it re-arms — typically "**Reset** 1 minute / 1 hour / when the spirit's grief renews / each night." Until **permanently** disabled it keeps coming back. |

> **No statblock to hand?** Build one fast: pick the haunt's **level** → read its **Level-based
> DC** from [../dcs-by-level.md](../dcs-by-level.md) for the **Stealth DC** *and* the **Disable
> DC** (Hard +2 for a stubborn spirit; +rarity for an esoteric one); pick **AC/HP/Hardness only
> if it can be attacked** (else "—"); write a one-line **trigger**, a one-line **effect**
> (damage type + condition + save), and a **Reset**. Statting workflow:
> [../../bridge/system-profile.md](../../bridge/system-profile.md).

---

## 3. The loop an AI GM runs

```
WHEN a haunt's location/condition comes into play:
    1. NOTICE: each PC who could perceive it rolls Perception
         → dice.py roll 1d20+<perc>  vs the haunt's STEALTH DC.
       Beat it → the PC senses the wrongness BEFORE it fires (may act first: avoid,
       Disable, leave). Fail → no warning; the haunt triggers on them.
    2. TRIGGER: when the stated trigger occurs, the haunt fires its ROUTINE.
       - If COMPLEX (trait): roll initiative; it acts each round on its own turn
         (Stealth used as its init) until Disabled or its Reset window closes.
       - Else: it fires once now.
    3. RESOLVE the effect:
       - attack haunt → vs target AC:  dice.py roll 1d20+<atk>   (crit on +10 / nat 20)
       - OR target saves → PC rolls:  dice.py roll 1d20+<save>  vs the haunt's DC
       - apply damage (mental/spirit/void) + condition (frightened, etc.) by degree.
    4. DISABLE attempt (a PC spends the action/activity): chosen skill
         → dice.py roll 1d20+<mod>  vs the haunt's DISABLE DC (§4).
       Enough successes (often 1; tough/complex haunts need 2) → SUPPRESSED.
    5. RESET: if not permanently quelled, the haunt re-arms per its Reset entry.
```

Track per haunt: **level, Stealth DC, Disable DC & skills, trigger, effect, Reset, HP/Hardness
(if any), and whether it is suppressed vs. permanently ended.** Persist to campaign-state — a
place-bound haunt recurs every time the party returns until its *root* is addressed.

> **One PC = swingier.** A lone solo PC gets **one** Perception roll to notice and one action to
> Disable — there's no party to spread attempts across. See the **Diminisher** note in §7.

---

## 4. The Disable / quell routine (skill check vs DC)

Disabling a haunt is a **skill check (or skill activity) vs the haunt's Disable DC** — the
Level-based DC for its level, often **Hard (+2)**. Match the skill to the haunt's nature:

| Skill | Disables a haunt that… | Typical action |
|---|---|---|
| **Religion** | is a spirit/undead/divine echo — soothe, rebuke, lay it to rest; pairs with *Sangpotshi* lore on the cycle of souls | a check, sometimes as a brief rite |
| **Occultism** | is an esoteric/mental/curse-born haunt — the **primary ghost skill** in SoG; understand & sever the binding | a check |
| **Thievery** | has a **physical trigger** (a tripwire of bone, a rigged door, a focus mechanism) — disarm the trigger | Disable a Device |
| **Intimidation / Diplomacy** | is driven by a **lingering emotion** (rage, grief) — cow it or console it, if the fiction allows | a check |
| **Medicine / Nature / Crafting / Arcana** | matches an unusual focus (a poisoned corpse, a blighted tree, a constructed reliquary, an arcane scar) | a check |
| **Religion or Occultism (either)** | most generic haunts — offer **both** as the default route | a check |

- **Degrees on the Disable check** (standard hazard rules):

| Degree | Disable result |
|---|---|
| **Critical Success** | the haunt is **disabled fully** — and a stubborn/complex one that needed several successes counts this as **two** |
| **Success** | one success banked: the haunt is **suppressed** (needs 1 success on a simple haunt; the Nth on a complex one) |
| **Failure** | no progress; the haunt is **unaffected** and may trigger / take its turn |
| **Critical Failure** | the haunt **triggers immediately** (or gets a free routine), and the botcher may take the effect — grief lashes out |

- **Suppress vs. end.** A successful Disable usually **suppresses** the haunt (it won't fire this
  scene), but it **Resets** later unless its *root* is resolved — destroy the **focus** (deal its
  HP through Hardness), complete the spirit's unfinished business, or break the curse via the
  story. Player ≠ PC knowledge: the PC may not know which it was until the haunt does (or doesn't)
  return.
- **Attacking the focus.** If the haunt has **HP/Hardness**, smashing the bound object is an
  alternate disable: subtract Hardness from each hit, drop it to 0 HP to end the haunt. Bodiless
  haunts (no HP) **can only be quelled**, never hit.

---

## 5. Scaling a haunt's level (and the Diminisher)

A haunt's **level** sets its Stealth DC, Disable DC, attack/save DC, damage, and (if any) AC/HP —
all from [../dcs-by-level.md](../dcs-by-level.md). To pitch a haunt:

1. **Pick the level** = the region/scene level (or the menace you want). Read the **Level-based
   DC** for the **Stealth DC** and the **Disable DC**.
2. **Damage** scales with level like a hazard's: roughly **moderate single-target damage** for
   that level (read the creature/hazard damage benchmark in [../dcs-by-level.md](../dcs-by-level.md)).
   A nastier haunt uses **Hard (+2)** DCs and high damage; a background "atmosphere" haunt uses
   base or **Easy (−2)** DCs and a small effect (mostly frightened).
3. **Rarity** for esoteric haunts: **+2 (Uncommon) / +5 (Rare)** to its DCs — most nindoru-born
   haunts are at least Uncommon.

**Solo Diminisher.** The AP assumes 4 PCs; this campaign runs **one** (the configured Diminisher
is **½** — see [../../bridge/system-profile.md](../../bridge/system-profile.md),
[../combat.md](../combat.md) "solo scaling"). Apply it to haunts:

| Lever | How the Diminisher (½) adjusts it |
|---|---|
| **Haunt level** | drop a deadly haunt **~2–4 levels** below the party so a single PC's lone Perception/save/Disable rolls aren't an instant-loss — keep DCs reachable |
| **Successes to disable** | prefer **1 success** to suppress (don't demand a party's worth of attempts from one PC) |
| **Complex haunts** | run them with **fewer routine actions** or a shorter Reset window, or make them simple (one-shot) for solo play |
| **Damage** | use **moderate, not high**, single-target damage at that level — a lone PC can't spread it |

Use **one Diminisher consistently** across combat and haunts. For a full party set Diminisher = 1
(no scaling); for 2–3 PCs ≈ ¾.

---

## 6. The world-tick: the season of ghosts as a haunt cadence

In *Season of Ghosts*, haunts aren't only keyed to rooms — the **season itself manifests them**.
The Hauntings row fires **every scene** during the long nights ([../../bridge/subsystems.md](../../bridge/subsystems.md)):

```
EACH SCENE (Hauntings world-tick, summer / long nights):
    Fate Question: "Does the season's dread surface here?"  (odds by the REGION floor + curse clock)
    Yes → roll the haunt generator (generators/haunt.json via dice.py table …),
          build a §2 statblock at the scene's level (apply the §5 Diminisher),
          and run the §3 loop.
    No  → atmosphere only (a cold draft, a misheard name) — no mechanical haunt.
```

- The hidden **Willowshore Curse / mindscape-decay clock** raises haunt odds and boldness as it
  climbs ([../../bridge/subsystems.md](../../bridge/subsystems.md)). Player ≠ PC knowledge: the
  clock is **felt, not announced** — narrate the nights tightening, never the number.
- **Region floor:** Willowshore's hinterlands were *traditionally* safe, so the baseline odds
  start **low** and rise as the season and curse advance.

### The Eight Practices as haunt modifiers (superstitions)

The town's **Eight Practices** ([../../bridge/setting-canon.md](../../bridge/setting-canon.md) →
"The Eight Practices") are local rules-of-warding. Treat them as **soft circumstance modifiers**
on haunt encounters — never as hard mechanics unless the fiction earns it:

| Practice (paraphrased) | Run it as |
|---|---|
| Don't call a ghost a ghost · don't whistle at night · don't leave laundry out · don't turn when your name is called from behind | **Keeping** a Practice → the dread-surface odds tick **down**, or a circumstance **bonus** to notice/resist a haunt that scene. **Breaking** one → a **trigger** (the haunt fires) or a circumstance **penalty** / odds **up**. |
| Don't enter water near a ghost · don't lean on walls by day · don't eat food with two protruding sticks · don't pat heads/shoulders | use as **bespoke triggers**: the act that violates the Practice is exactly what sets a matching haunt off (entering the canal wakes the drowned; the head-pat invites the clinging spirit). |

Whether the Practices *truly* ward anything is **hotly debated in town** — keep that ambiguity:
sometimes obeying helps, sometimes it's just fear. Let Fate Questions and the curse clock decide,
and never confirm the "rule" to the PC outright.

---

## 7. Mapping to *Season of Ghosts* — the supernatural toolbox

The AP's supernatural content is **atomized into the toolbox clusters** under
`bridge/adventures/season-of-ghosts/` (retrieved via that adventure's `index.json` — see
[../../SKILL.md](../../SKILL.md), [../../bridge/bridge.md](../../bridge/bridge.md)). Two things in
particular live there and feed this subsystem:

- **Spirit manifestations / haunts** — the season's keyed and wandering haunts. Pull a cluster's
  haunt by location/thread, stat it via §2, run it via §3.
- **Minor & major spirit powers** — the AP's supernatural toolkit (the abilities spirits, the
  cursed dead, and corrupting **nindoru** wield, scaled minor → major). These **live in the
  toolbox clusters**, not in this rules file; retrieve the relevant cluster and skin a haunt's
  **Routine/Effect** (§2) with the spirit power it should manifest (e.g. a major spirit power
  becomes a *complex* haunt's signature routine; a minor one, a simple haunt's single effect).

| SoG beat | Haunt framing |
|---|---|
| **The season's rising dread** (the long nights of summer onward) | the **world-tick cadence** of §6: each scene, Fate-Question the dread, roll `generators/haunt.json`, stat at scene level (§5 Diminisher), run §3. Eight Practices nudge the odds (§6). |
| **A place-bound haunt** (a death re-enacted at the monastery; a grief soaked into a house) | a §2 statblock with a **focus** (HP/Hardness to destroy) and a **Religion/Occultism Disable** (§4); it **Resets** until its root/unfinished business is resolved via the story. |
| **A nindoru-corrupted haunt / spirit power** | pull the **minor/major spirit power** from the toolbox cluster; build the haunt **Uncommon/Rare** (+2/+5 DCs, §5), often **complex** (its own initiative), with **mental/void** damage and heavy **frightened**. Tie its permanent end to the broader investigation ([./research.md](./research.md)). |
| **Fleeing a haunt through the long night** | hand off to a **Chase** where the party is the quarry and "safety" is the goal — haunt pressure is the limiter, crit-fail setbacks lean on **frightened** ([./chases.md](./chases.md), [../conditions.md](../conditions.md)). |
| **Studying ghosts wakes them** | a Research increment can **stir a haunt** ([./research.md](./research.md) §5) — the act of digging is the trigger. |

**Running it operationally:** Fear/horror is modeled by the **frightened** condition + the AP's
spirit powers, **not a separate sanity meter**
([../../bridge/system-profile.md](../../bridge/system-profile.md)). Roll the notice (Perception vs
Stealth DC), the effect (attack vs AC, or PC save vs the haunt's DC), and the Disable
(Religion/Occultism/Thievery vs DC) **all through the engine**, honestly. Persist each place-bound
haunt's **suppressed vs. permanently-ended** state to campaign-state, and keep Player ≠ PC
knowledge of whether a quelled spirit is truly gone.

---

## See also

- [../core-resolution.md](../core-resolution.md) — the d20 check and four degrees of success
- [../dcs-by-level.md](../dcs-by-level.md) — Level-based DCs (Stealth/Disable/effect DCs), Hard/Very Hard bands, rarity, creature/hazard benchmarks for AC/HP/saves/damage
- [../conditions.md](../conditions.md) — frightened, fleeing, stupefied, drained, and the mental/void effects haunts inflict
- [../combat.md](../combat.md) — initiative for *complex* haunts, attacking a focus, solo scaling / the Diminisher
- [../skills.md](../skills.md) — Religion, Occultism, Thievery, Perception and the actions a Disable uses
- [./research.md](./research.md) — investigating a haunt's root (and when study wakes it)
- [./chases.md](./chases.md) — fleeing a haunt through the long night
- [../../bridge/subsystems.md](../../bridge/subsystems.md) — the Hauntings world-tick, curse clock, and dread-surface cadence
- [../../bridge/setting-canon.md](../../bridge/setting-canon.md) — the Eight Practices, Shenmen/Willowshore, the nindoru
- [../../bridge/system-profile.md](../../bridge/system-profile.md) — haunt statting, the Diminisher, frightened-not-sanity, Player ≠ PC knowledge
- [../../SKILL.md](../../SKILL.md) / [../../bridge/bridge.md](../../bridge/bridge.md) — the AP toolbox clusters where spirit manifestations and minor/major spirit powers live
