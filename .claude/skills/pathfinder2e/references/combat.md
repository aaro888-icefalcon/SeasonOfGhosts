# Combat — The Three-Action Turn, Attacks, Damage, Dying & Solo Scaling

Combat in PF2e is the d20 engine ([./core-resolution.md](./core-resolution.md)) wrapped in a
**3-action economy**. Edition note: identical in Remaster (Player Core / GM Core) and legacy
Core Rulebook (2019). For who's *in* the fight and how tough they are, stat foes from
[./dcs-by-level.md](./dcs-by-level.md) §6; the NPC-statting workflow + **Diminisher** live in
[../bridge/system-profile.md](../bridge/system-profile.md).

> **Every roll runs through the engine — never invent a result:**
> `python3 .claude/skills/mythic-gm/scripts/dice.py roll 1d20+<mod>`
> Roll the d20 for attacks/saves, and roll the **damage expression** separately (e.g.
> `dice.py roll 2d8+6`). Read the face and total off the output.

See also: [./conditions.md](./conditions.md) (every numeric status effect) ·
[./core-resolution.md](./core-resolution.md) · [./dcs-by-level.md](./dcs-by-level.md) ·
[../bridge/system-profile.md](../bridge/system-profile.md).

---

## 1. The encounter loop

1. **Roll initiative.** Usually **Perception**; a creature trying to **ambush** rolls
   **Stealth** (sneaking) or **Deception** (a feint/Create a Diversion start) instead. Each
   combatant rolls once: `dice.py roll 1d20+<Perception (or Stealth/Deception) mod>`. Highest
   total acts first; on a **PC-vs-NPC tie the NPC goes first**, and tied PCs decide their own
   order among themselves. This is one d20 check, **not**
   a degree-of-success roll — just rank the totals.
2. **Take turns in order.** On your turn you get **3 actions + 1 reaction**, plus any number of
   **free actions** (see §2).
3. **At each combatant's turn end / start,** resolve start-of-turn effects: **recovery checks**
   if dying (§6), **persistent damage** (§5), regeneration, etc.
4. **Repeat rounds** until one side is defeated, flees, or the fiction ends the fight.

A **round** = one turn for every combatant (~6 seconds of game time).

---

## 2. Action economy

**3 actions** per turn; spend them in any order, repeat actions freely. Plus **1 reaction**
(used on *others'* turns or in response to a trigger) and unlimited **free actions** (each has
a trigger or costs nothing).

| Cost | Common actions (icons in books) |
|---|---|
| **1 action** | **Stride** (move your Speed), **Strike** (one attack), **Step** (5 ft, no trigger of reactions), **Raise a Shield**, **Interact** (draw/manipulate), **Demoralize**, **Trip / Grapple / Shove / Disarm** (Athletics), **Feint**, **Recall Knowledge**, **Stand**, **Drop prone**, most 1-action spells |
| **2 actions** | **Cast a Spell** (the *usual* cost — most spells are 2 actions), **Sudden Charge**, **Treat Wounds** is an activity (out of combat), many class activities |
| **3 actions** | Big spells/activities, some **Cast a Spell** (e.g. heightened areas), full activities |
| **Reaction** | **Shield Block** (§7), **Attack of Opportunity** (only if the creature *has* it — most PCs/monsters do **not** by default), readied actions |
| **Free action** | **Release** (drop held item), **Drop prone** in some contexts, certain triggered class features; declare the trigger |

**Spell action cost varies** — read the spell. "Cast a Spell = 2 actions" is the common case,
not a rule; cantrips and many spells are 2, some are 1 or 3, reactions/free for a few. A spell's
**area or save DC** comes from the caster's stats, not [./dcs-by-level.md](./dcs-by-level.md) §3
(use the moderate spell-DC column when statting an NPC caster).

### Movement & positioning quick-refs

- **Step** (1 action, 5 ft) never triggers reactions — use it to disengage safely.
- **Stride** provokes Attacks of Opportunity from foes that have that reaction.
- **Flanking**: when you and an ally are on opposite sides of a foe, it's **off-guard** to both
  (−2 circumstance to its AC). Solo PCs rarely flank — note this when scaling (§8).

---

## 3. The Multiple Attack Penalty (MAP)

Every **attack** after your first **in the same turn** takes a cumulative penalty. It is an
**untyped penalty** (stacks with everything; see [./core-resolution.md](./core-resolution.md)).

| Attack this turn | Normal weapon | **Agile** weapon |
|---|---|---|
| 1st attack | +0 | +0 |
| 2nd attack | **−5** | **−4** |
| 3rd (and later) | **−10** | **−8** |

- MAP **resets at the start of each of your turns.**
- It applies to any action with the **attack** trait (Strikes, Trip/Grapple/Shove/Disarm,
  spell **attack** rolls, etc.), counting all such actions taken this turn.
- It does **not** apply to actions without the attack trait, and a spell **save** (target rolls
  vs your DC) is not an attack roll — no MAP there, though casting still costs your actions.

Apply MAP in the dice command: a 2nd Strike at +9 base → `dice.py roll 1d20+4`.

---

## 4. Attacks vs AC, and critical hits

A **Strike** (or spell attack) is a d20 check vs the target's **AC** (read four degrees in
[./core-resolution.md](./core-resolution.md)):

| Degree | Trigger | Result |
|---|---|---|
| **Critical hit** | total **≥ AC + 10**, **or** a **natural 20 that hits** | **double damage** (§5) |
| **Hit** | total ≥ AC | normal damage |
| **Miss** | total < AC by 1–9 | no damage |
| **Critical miss** | total ≤ AC − 10, or a **nat 1** | no damage; some weapons/effects add a fumble effect |

- **Nat 20 / nat 1 step the degree** (per [./core-resolution.md](./core-resolution.md)): a nat
  20 that would only hit becomes a **crit**; a nat 1 on a roll that beat AC by 10+ drops to a
  normal hit. A nat 20 that *still* misses AC by more than 10 is only a regular miss after the
  step (rare).
- **Off-guard** (flat-footed in legacy) = **−2 circumstance to the target's AC** (flanking,
  surprise, prone, grabbed, etc.). See [./conditions.md](./conditions.md).
- **Cover**: standard cover = **+2 circumstance AC**; greater cover = **+4** (Take Cover action
  can raise it). It's the *defender's* bonus.

---

## 5. Damage

**Damage dealt = weapon/spell dice + ability/bonuses**, then modified by the target's defenses.

1. **Roll the damage expression** via the engine: weapon damage die × number of dice + **Str**
   (melee) or applicable bonus + **weapon specialization / runes / spell bonuses**. E.g. a
   greatsword with +4 Str → `dice.py roll 1d12+4`. Persistent/extra-die effects add their own
   dice.
2. **Critical hit → double it.** The standard rule: **double the total damage** *after* adding
   modifiers (roll once, sum, ×2). Some effects instead say "roll twice"; default to doubling
   the total unless an ability states otherwise. **Deadly / fatal** weapon traits add extra
   dice on a crit — apply per the trait.
3. **Apply weakness, then resistance** to the relevant damage type:
   - **Weakness N (type)** → **+N** damage of that type (applied per instance of that type).
   - **Resistance N (type)** → **−N** (minimum 0). **Immunity** → 0 from that type/effect.
   - If both could apply to one instance, the rules resolve them as written; net them and never
     drop below 0.
4. **Subtract from HP.** At **0 HP**, see §6 (dying).

### Persistent damage

Some effects deal **persistent damage** (bleed, fire, acid, etc.):

- It triggers **at the end of the affected creature's turn**, dealing the listed dice each time
  (`dice.py roll <expr>`).
- After taking it, the creature attempts a **flat DC 15 check** to end it (`dice.py roll 1d20`,
  no modifiers — flat check). **Success ends it.**
- **Assisted recovery** (someone helps, or an obvious remedy like water on fire) can lower the
  flat DC to **10**, or auto-end it for an appropriate full remedy — GM call, one attempt.

### Saves vs effects

Many spells/hazards deal damage or impose conditions on a **saving throw** (Fort/Ref/Will): the
*target* rolls vs the source's DC, reading four degrees — typically **crit success = no effect /
half-or-less, success = half, failure = full, crit failure = double or worse**. Read the
specific effect. Conditions imposed land per [./conditions.md](./conditions.md).

---

## 6. Dying & death (run this precisely)

When a creature drops to **0 HP**, it falls **unconscious** and (if it can die) gains the
**dying** condition. The **wounded** condition tracks how close to death past brushes have left
it. Honor real death — see §9.

### Going down

| Trigger of reaching 0 HP | Starting **dying** value |
|---|---|
| Reduced to 0 HP by a normal hit/effect | **dying 1** |
| Reduced to 0 HP by a **critical hit** (or a crit-fail on a save vs a death/damage effect) | **dying 2** |
| **+ already had wounded N** | **add N** to the above (e.g. crit while wounded 1 → dying 3) |

A creature at **dying** is **unconscious** and prone. **Dying ≥ 4 = DEAD.** (So you can die the
instant you drop if a crit lands you at dying 4+, e.g. wounded 2 + crit = dying 4.) Massive
damage that would reduce you to **negative HP equal to your maximum HP in one blow also kills**
outright (e.g. a 50-max-HP creature taken to −50).

### Recovery check (start of each of your turns while dying)

At the **start of your turn** while dying, attempt a **recovery check**: a flat check
(`dice.py roll 1d20` — flat, no modifiers) against a **DC equal to 10 + your current dying
value** (so dying 1 → DC 11, dying 2 → DC 12, dying 3 → DC 13; certain effects further adjust
the DC). Compare the d20 total to that DC and read the four degrees:

| Degree | vs DC (= 10 + dying) | Effect on **dying** |
|---|---|---|
| **Critical success** | total ≥ DC + 10 | dying **−2** |
| **Success** | total ≥ DC | dying **−1** |
| **Failure** | total < DC by 1–9 | dying **+1** |
| **Critical failure** | total ≤ DC − 10, or a **nat 1** | dying **+2** |

- If a recovery check (or any source) brings dying to **0**, you **lose the dying condition**,
  regain consciousness at **0 HP** (still prone/weak), and gain **wounded 1** (or **+1** to
  existing wounded). You can then act on later turns.
- If dying **reaches 4**, you are **DEAD**.
- **Taking damage while dying** increases dying by **1** (by **2** if it was a crit). **Healing**
  to 1+ HP removes dying (you wake), but you keep your wounded value.

### The wounded condition

| State | Meaning |
|---|---|
| **Wounded N** | each future time you gain **dying**, add **N** to its starting value |
| Gaining dying while wounded | dying starts higher (see "Going down" table) |
| Removing wounded | requires **Treat Wounds** to full HP, a successful skill action, or appropriate magic — it does **not** clear on its own from waking up |

Track **dying** and **wounded** separately on the statblock/PC sheet. Unconscious-at-0-HP
without dying (e.g. a stabilized creature, or one that can't die) just stays out until healed.

---

## 7. Shields

A shield is an item you must actively use:

- **Raise a Shield** (1 action): gain the shield's **circumstance AC bonus** (typically **+2**
  for a steel/wooden shield) until your next turn. The bonus only applies **while raised.**
- **Shield Block** (reaction; requires the feat/feature — most martials have it): when raised
  and you'd take damage, the shield absorbs up to its **Hardness**; you and the shield split the
  remainder (you take what's left over Hardness; the shield takes Hardness's worth as item
  damage, or the full blocked amount per its rules).
- **Shield stats**: **Hardness / HP / Break Threshold (BT)**. Damage to the shield over its
  Hardness reduces its HP; at **BT** it's broken (unusable until repaired). Typical sturdy
  shield: **Hardness 5, HP 20, BT 10** (steel); wooden ~**Hardness 3, HP 12, BT 6**. Repair
  with the **Repair** activity (Crafting).

Example: raised steel shield (Hardness 5) takes an 11-damage hit, Shield Block → shield negates
5, you take 6, shield takes 5 toward its HP.

---

## 8. Solo scaling — the Diminisher

The Adventure Path's encounters assume **4 PCs at "moderate" budget.** A single PC will be
crushed by an unadjusted fight. Apply the **Diminisher** consistently (record it in
`campaign-state.md`; default **½** for one PC — see
[../bridge/system-profile.md](../bridge/system-profile.md)).

| Party size | Diminisher | Apply by… |
|---|---|---|
| **1 PC** (default) | **½** | halve identical-foe counts, **or** drop a solo boss ~**2–4 levels** |
| 2–3 PCs | **≈ ¾** | trim counts modestly / drop a boss ~1–2 levels |
| 4 PCs | **1** (none) | run as written |

**Two ways to diminish — pick one per encounter:**

1. **Halve the count.** A mob of 4 identical foes → **2.** An "elite + 2 minions" → "elite + 1"
   or just the elite. Keep at least one foe.
2. **Lower a solo boss's level by ~2–4** and re-read its benchmark line in
   [./dcs-by-level.md](./dcs-by-level.md) §6 (lower AC, attack, HP, saves, Strike, spell DC).
   A 4-level drop is the practical floor before a "boss" stops feeling like one.

### XP budget guidance (party-of-4 baseline)

Encounter threat is built from an **XP budget**; each foe costs XP by its level **relative to
the party level**. The party-of-4 budgets:

| Threat | XP budget (party of 4) |
|---|---|
| Trivial | **40** |
| Low | **60** |
| Moderate | **80** |
| Severe | **120** |
| Extreme | **160** |

**Creature XP by level relative to PC level** (the cost of one foe):

| Foe level vs party | XP each |
|---|---|
| Party −4 | 10 |
| Party −3 | 15 |
| Party −2 | 20 |
| Party −1 | 30 |
| **Party level** | **40** |
| Party +1 | 60 |
| Party +2 | 80 |
| Party +3 | 120 |
| Party +4 | 160 |

**Per-PC adjustment:** the rules scale the budget by **±~20 per threat band for each PC above/
below 4** (e.g. Moderate: 80 for 4 PCs → ~60 for 3, ~40 for 2, **~20 for a solo PC**). The
simplest operational rule for solo play: **budget ≈ ¼ of the party-of-4 number** (one PC's
share), then build to that with diminished counts/levels above. Example — a written "Moderate"
(80) fight, solo: aim for ~20 XP → a single **party-level** foe is already 40 (a *Severe* solo
fight), so use a **Party −2** foe (20 XP) for a true moderate solo encounter, or keep the
party-level foe and treat the fight as **deliberately hard.**

---

## 9. Death is honored; Hero Points are the player's only lever

- **Real death stands.** Reaching **dying 4**, or the massive-damage rule, **kills.** The GM does
  **not** retcon, fudge, or rescue. The dice (run through the engine) decide.
- **Hero Points** are the **player's** resource only (see
  [./core-resolution.md](./core-resolution.md) "Hero Points"):
  - **Spend 1 to reroll** a check (take the second result).
  - **Spend ALL your Hero Points (minimum 1) to avoid death**: you immediately **stabilize at
    0 HP** and **lose the dying condition** (you keep wounded, and stay unconscious until
    healed). This is the only "cheat death" — it costs every point you have, and **only the
    player declares it.** The GM never spends Hero Points and never spends them for the player.
- NPCs/monsters don't get Hero Points or recovery checks unless their statblock says so; most
  simply die at 0 HP (or are taken out per the fiction).

---

## See also

- [./core-resolution.md](./core-resolution.md) — the d20 roll, four degrees, nat-20/nat-1, Hero Points
- [./dcs-by-level.md](./dcs-by-level.md) — AC/attack/HP/save/Strike benchmarks for statting foes
- [./conditions.md](./conditions.md) — off-guard, frightened, dying, wounded, persistent, and every numeric status
- [../bridge/system-profile.md](../bridge/system-profile.md) — NPC statting procedure + the Diminisher setting
