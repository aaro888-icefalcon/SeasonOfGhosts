# Downtime Activities & Preparing Willowshore (PF2e Subsystem)

**Downtime** is the play mode between adventuring days — days or weeks spent crafting, healing,
earning coin, training, or (in *Season of Ghosts*) **fortifying Willowshore** against the
fall/winter assault. Each activity is one or more skill checks, usually vs. a **Level-based** or
**Simple DC**, paying out over **days** rather than minutes. From **Player Core / GM Core**
(legacy: *Core Rulebook* Ch. 4 "Downtime"). The SoG-specific **Preparing Willowshore** track
(§9) is a Victory-Point pool layered on top of these activities.

Resolution itself (d20 + four degrees) lives in [../core-resolution.md](../core-resolution.md);
which skill does what in [../skills.md](../skills.md); DCs in [../dcs-by-level.md](../dcs-by-level.md);
the point-track chassis in [./victory-points.md](./victory-points.md).

> **Every check runs through the engine — never invent a result:**
> `python3 .claude/skills/mythic-gm/scripts/dice.py roll 1d20+<mod>`
> Pick the DC, roll, read the four degrees, then apply the activity's payout below.

---

## 1. How downtime works

- **Time unit.** A downtime "day" = 8 hours of work. Most activities resolve **per day**; some
  (Long-Term Rest, long-term Treat Wounds, Retrain) span **days or weeks**. In *Season of Ghosts*
  the unit of account is the **downtime week** (§9): roughly 5 working days.
- **One activity per character per day**, unless an activity says otherwise (you can split a day,
  GM permitting). Idle time isn't a downtime activity — it heals nothing extra.
- **Concentration / interruption.** A day interrupted by combat or an event is lost for that
  day's activity (the GM decides whether partial progress carries).
- **DC source.** Activity-defined fixed DCs (Treat Wounds DC 15) use that number; trade activities
  (Craft, Earn Income) use a **task level → Level-based DC** ([../dcs-by-level.md](../dcs-by-level.md) §3);
  "how hard for this expertise" calls use a **Simple DC** by rank (§2 there).

> **Solo pacing.** Don't roll a check per in-world day for a 7-day rest — make **one** check (or
> one per week) and narrate the elapsed time. Advance the world-tick clocks for the time spent
> ([../../bridge/subsystems.md](../../bridge/subsystems.md)); downtime is not free of consequence
> when a curse clock is ticking.

---

## 2. Earn Income

Ply a trade, perform, or apply a Lore for a **daily wage**. Choose a **task** of a given **level**
(the GM sets what work is available; usually ≤ party level). Roll the keyed skill — **Crafting**,
**Performance**, or a **Lore** — vs. the **Level-based DC for the task level**. You earn the wage
for **your proficiency rank** for each day, for as many days as the task lasts.

| Degree | Earn Income result |
|---|---|
| **Critical Success** | Earn the income of a task **one level higher** (use the next row's rate). |
| **Success** | Earn the listed income for your proficiency at the task level. |
| **Failure** | Earn the **failure** (untrained-trained pittance) rate — a few coppers. |
| **Critical Failure** | Earn **nothing**; you may also be dismissed from the job. |

**Income earned per day, by task level & proficiency** (gp/day unless noted; sp = silver):

| Task lvl | Failure | Trained | Expert | Master | Legendary |
|---|---|---|---|---|---|
| 0 | 1 cp | 5 cp | 5 cp | 5 cp | 5 cp |
| 1 | 2 cp | 2 sp | 2 sp | 2 sp | 2 sp |
| 2 | 4 cp | 3 sp | 3 sp | 3 sp | 3 sp |
| 3 | 8 cp | 5 sp | 5 sp | 5 sp | 5 sp |
| 4 | 1 sp | 7 sp | 8 sp | 8 sp | 8 sp |
| 5 | 2 sp | 9 sp | 1 gp | 1 gp | 1 gp |
| 6 | 3 sp | 1 gp 5 sp | 2 gp | 2 gp | 2 gp |
| 7 | 4 sp | 2 gp | 2 gp 5 sp | 2 gp 5 sp | 2 gp 5 sp |
| 8 | 5 sp | 2 gp 5 sp | 3 gp | 3 gp | 3 gp |
| 9 | 6 sp | 3 gp | 4 gp | 4 gp | 4 gp |
| 10 | 7 sp | 4 gp | 5 gp | 6 gp | 6 gp |
| 11 | 8 sp | 5 gp | 6 gp | 8 gp | 8 gp |
| 12 | 9 sp | 6 gp | 8 gp | 10 gp | 10 gp |

> **Gist for a solo GM:** wage ≈ **task level in gp/day at master+**, roughly **half that at
> trained**. Higher proficiency only pays more at task level **4+**. A critical success bumps you to
> the next task-level row. For levels 13–20, continue the curve (≈ 13–15 gp → 50 gp/day at L20
> legendary); read the published table when the exact coin matters.

---

## 3. Craft

Make an item you have the **formula** for, with raw materials and **Crafting** proficiency
(trained+). Setup is **4 days** (or the item's listed time), then roll **Crafting vs. the
item's Level-based DC**. You must supply materials worth **half the item's price** up front.

| Degree | Craft result |
|---|---|
| **Critical Success** | Item is made; recover materials and reduce remaining cost using the **next-higher** Earn-Income rate per added day (finish faster/cheaper). |
| **Success** | Item is made; pay off the rest of the price in materials, or spend more days "earning" the remaining cost at your Earn-Income rate (Craft DC). |
| **Failure** | No progress, but materials aren't lost; you may try again (lose the setup days). |
| **Critical Failure** | Fail and **ruin 10%** of the materials' value. |

Practical loop: setup days → one Craft check → on success, either pay the balance in coin or spend
extra days knocking it down at your daily income rate. **Crafting is rarely faster or cheaper than
just buying** below high proficiency — it shines for rare/uncommon items, repairs, and consumables.

---

## 4. Repair

Restore Hit Points to a **broken or damaged item** with a **repair kit** and **Crafting** (trained).
One attempt takes **10 minutes** (so it's an exploration/downtime hybrid). DC is the item's
**Level-based DC** (or a Simple DC the GM sets for mundane gear).

| Degree | HP restored |
|---|---|
| **Critical Success** | Restore **10 + (Crafting rank ×10)** HP. |
| **Success** | Restore **5 + (Crafting rank ×5)** HP. |
| **Failure** | No HP restored. |
| **Critical Failure** | Deal **2d6 damage** to the item (a botch worsens the break). |

Rank multiplier: trained = ×1, expert = ×2, master = ×3, legendary = ×4. An item below 0 HP is
**destroyed** and can't be Repaired. Repair clears the **broken** condition once HP rises above the
Broken Threshold (half max HP).

---

## 5. Treat Wounds (long-term) & related healing

The 10-minute **Treat Wounds** action (Medicine, DC 15 base; 2d8 / 4d8 / −/ 1d8 self-harm) is
detailed in [../skills.md](../skills.md). Two healing modes matter for downtime:

| Mode | Time | Effect |
|---|---|---|
| **Treat Wounds (repeat)** | 10 min/try; the **patient** is immune for 1 hour after being treated | Heal 2d8+ per success; the **Continual Recovery** feat lowers the patient's immunity from 1 hour to **10 minutes**, so treatments can be chained back-to-back until HP is full. |
| **Long-term Treat Wounds** | a full **week** of bed rest under care | Successful weekly Medicine vs. the patient's level DC roughly **doubles** natural healing for the week. Use for slow recovery of a downed NPC offscreen. |
| **Treat Disease / Treat Poison** | recurring over the affliction's interval | Each successful Medicine check vs. the affliction DC grants a bonus to the patient's next save (crit) / penalty on crit-fail; see [../skills.md](../skills.md). |

The simplest downtime heal-up is **Long-Term Rest** (§8): full days of rest restore HP at double
the per-night rate without any check.

---

## 6. Subsist

Find **food and shelter** without paying for them, over a day. Roll **Survival** (wilderness) or
**Society** (settlement) vs. the **DC by terrain/locale** (Level-based for the region, or a
Simple DC the GM picks; harsh terrain is Hard +2 or worse).

| Degree | Subsist result |
|---|---|
| **Critical Success** | Provide subsistence living for yourself **and one** other creature. |
| **Success** | Provide **subsistence** living (squalid food and shelter) for yourself. |
| **Failure** | No food/shelter; you suffer the effects of going without (fatigue, hunger). |
| **Critical Failure** | As failure, **and** you're exposed to a hazard or lose a chance to act (GM's call). |

Subsistence is bare survival, not comfort — it staves off starvation but grants no rest bonus.

---

## 7. Retrain & 8. Identify Magic

**Retrain** swaps a chosen build option for another of equal kind, with downtime **and usually a
teacher**:

| Retrain | Time |
|---|---|
| A trained **skill** (one rank), a **feat**, or a **class feature** | **1 week** (per item; longer for higher-rank skills or with no instructor) |
| Increasing a **skill's proficiency rank** | **weeks per rank** (e.g. expert→master ≈ several weeks) |

Retraining requires a plausible **trainer or text** and the GM's leave; you can't retrain feats with
prerequisites you'd break, and you don't refund spent resources — you trade one option for another.

**Identify Magic** (Remaster: folded into **Recall Knowledge / identify**; legacy "Identify Magic"
activity) determines what a magic item, effect, or location **does**. It's a **10-minute** check —
**Arcana / Nature / Occultism / Religion** keyed to the magic's tradition — vs. the item/effect's
**Level-based DC** (rarity adds: uncommon +2, rare +5).

| Degree | Identify Magic result |
|---|---|
| **Critical Success** | Learn all attributes, including activation, runes, and quirks. |
| **Success** | Learn what it does and how to use it. |
| **Failure** | No info; you can't try again until you **gain a level** or new info. |
| **Critical Failure** | You get a **wrong** impression (the GM lies plausibly). |

---

## 8. Long-Term Rest

A full day of **resting** (not adventuring, not other downtime) with no checks: each full day of
rest restores HP equal to your **Constitution modifier × your level × 2** (i.e. **double** a night's
natural healing), and a full day of rest can recover from many conditions and afflictions on their
own schedule. Resting requires reasonable shelter and food; interruptions (combat, a haunt) **end
that day's rest** with no benefit.

| Recovery | Rate |
|---|---|
| **One night** (≈8 h sleep) | Con mod × level HP; recover 1 step of fatigue/some conditions. |
| **Full day of Long-Term Rest** | **double** the nightly HP; faster condition/affliction clocks. |

---

## 9. Preparing Willowshore — the SoG downtime track

In **Acts 2 (fall)** and **3 (winter)** the town knows an attack is coming. Between investigation
beats, the PCs spend **downtime weeks** helping Willowshore ready itself. Each productive week is a
downtime activity that, on success, earns **Preparation Points (Prep Points)** toward a season
**deadline**; the accumulated total sets how the **defense** plays out. This is a one-sided
**Victory-Point** track — run it by [./victory-points.md](./victory-points.md) with the dials below.

### 9a. The track at a glance (the six VP fields)

| Field | Value |
|---|---|
| **Pool name** | **Preparation Points (Prep Points)** |
| **Check & DC** | the chosen activity's skill (§9c) vs. a **Level-based DC for the party level** ([../dcs-by-level.md](../dcs-by-level.md)); a clearly favorable approach is Easy −2, a sabotaged/cursed site is Hard +2. |
| **Award table** | default VP (§9b) |
| **Thresholds** | season **defense outcome** (§9d) |
| **Limiter** | **resource cost = the season's downtime weeks**, bounded by the defense **deadline** (the world-tick "Preparation Points" row tallies every 3 scenes — [../../bridge/subsystems.md](../../bridge/subsystems.md)). |
| **Degradation** | **none** — constructive track, **no negative floor** (a failed week stalls, never reverses). A crit-fail wastes the week and may *create* a problem (spoiled food, an injury) but does **not** subtract Prep Points. |

### 9b. Awarding Prep Points by degree

| Degree | Prep Points |
|---|---|
| **Critical Success** | **+2** Prep Points (the work goes exceptionally well; may also give a circumstance edge to the defense later). |
| **Success** | **+1** Prep Point. |
| **Failure** | **+0** — the week is spent, no progress. |
| **Critical Failure** | **+0**, and a **complication** (a setback in the fiction; never a Prep Point loss). |

### 9c. The activities (what a week can buy)

Each is one week → one check. Pick the skill that fits the fiction; the table gives sensible
defaults. A PC may **Aid** another's weekly check (Aid action → +1/+2/−1 circ on a successful Aid).

| Activity | Skill(s) | What it represents |
|---|---|---|
| **Aid the harvest** | Survival, Nature, or Athletics (labor) | Bring in food and lumber before frost — stores for the siege. |
| **Reinforce buildings** | Crafting, Athletics, or relevant Lore (Engineering) | Barricade, shore up walls and the bridge, ready defensible points. |
| **Prepare & preserve food** | Survival, Crafting, or Cooking Lore | Smoke, salt, and cellar provisions so the town can hold out. |
| **Research the threat / wards** | Occultism, Religion, Society, or the **Research** subsystem ([./research.md](./research.md)) | Learn the enemy's nature and set protective wards; can feed extra Prep Points on a tier reveal. |
| **Restore the Cerulean Teahouse (W25)** | Crafting, Society, Diplomacy | Reopen the teahouse as a rally point / morale & coordination hub. |
| **Rally the townsfolk** | Diplomacy, Performance, the **Influence** subsystem ([./influence.md](./influence.md)) | Win notables' cooperation; Influence successes with key NPCs convert to Prep Points (see [./influence.md](./influence.md) §8). |

### 9d. Thresholds → defense outcome

Scale thresholds to the **weeks the season allows** (count the downtime weeks before the deadline;
each PC can contribute one activity per week). Default for a typical run of **~6 productive weeks**:

| Prep Points reached | Defense outcome |
|---|---|
| Below 1st threshold (**< 4**) | **Rout** — the town is unready; the assault hits hard, key NPCs/buildings are lost, the fight begins on the back foot. |
| **1st (4)** | **Costly defense** — Willowshore survives but bloodied: losses, harder encounters, a depleted morale. |
| **2nd (8)** | **Solid defense** — prepared positions and supplies; the assault is met evenly, manageable losses. |
| **3rd (12)** | **Clean victory** — fortified, fed, warded, and rallied; the defenders get circumstance edges and the town comes through largely intact. |

Use [./victory-points.md](./victory-points.md) §4 to **rescale** if your season has more or fewer
weeks: 1st ≈ weeks ÷ 2, 2nd ≈ weeks, 3rd ≈ weeks × 1.5 (counting all PCs' contributions). With a
lone PC, lower the thresholds accordingly so the track stays winnable.

### 9e. The loop an AI GM runs

```
SET UP (start of Act 2, and again Act 3): Prep Points = 0. Confirm the season's
        downtime weeks (the limiter) and pick thresholds (§9d) for that week-count.

REPEAT each downtime week, until the deadline:
    1. PC(s) pick an activity (§9c) and the skill that fits the fiction.
    2. Set the DC = Level-based for party level (±2 for favorable/cursed conditions).
    3. Roll: dice.py roll 1d20+<mod>  vs. that DC.   (Aiders roll Aid first.)
    4. Read the four degrees → award Prep Points (§9b). No subtraction, ever.
    5. Crit-fail → narrate a complication, not a point loss.
    6. Spend the week; advance world-tick clocks for the elapsed time
       (curse clock, enemy moves — ../../bridge/subsystems.md). The
       "Preparation Points" tick tallies the running total every 3 scenes.
    7. Re-check thresholds; narrate any newly secured improvement.

DEADLINE (season's end → the assault scene):
    final Prep Points → defense outcome band (§9d). Carry the consequences
    (losses, edges, surviving NPCs) into the battle.
```

Track **current Prep Points**, **weeks remaining**, and **thresholds crossed**; persist to
campaign-state between sessions (the track spans an act). The deadline arrives on the world-tick
schedule whether or not the PCs spend every week productively — wasted weeks are a real cost.

> **Felt, not announced.** Show the town getting readier (or more frantic) in the fiction; don't
> read out the Prep Point count. Players see barricades rising and larders filling, and **feel**
> whether it's enough — see [../../bridge/system-profile.md](../../bridge/system-profile.md).

---

## See also

- [./victory-points.md](./victory-points.md) — the point-track chassis Preparation Points runs on
- [../skills.md](../skills.md) — Craft, Repair, Treat Wounds, Earn Income, Subsist, Identify Magic by skill
- [../dcs-by-level.md](../dcs-by-level.md) — Level-based & Simple DCs (Earn Income / Craft task levels)
- [../core-resolution.md](../core-resolution.md) — the d20 check and four degrees of success
- [./influence.md](./influence.md) — §8: rallying notables feeds Prep Points
- [./research.md](./research.md) — researching the threat / wards as a downtime activity
- [./reputation.md](./reputation.md) — Northridge / Southbank standing, which shapes who helps
- [../../bridge/subsystems.md](../../bridge/subsystems.md) — the world-tick that tallies Prep Points and advances clocks
- [../../bridge/system-profile.md](../../bridge/system-profile.md) — Player ≠ PC knowledge for the hidden tally
