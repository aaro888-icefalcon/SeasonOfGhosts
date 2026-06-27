# DCs by Level, Simple DCs & Creature Benchmarks (PF2e)

How to set the DC for any check, and how to stat a foe on the fly. Resolution itself
(d20 + degrees of success) lives in [./core-resolution.md](./core-resolution.md). NPC
statting procedure and the Diminisher live in
[../bridge/system-profile.md](../bridge/system-profile.md).

> **Every roll runs through the engine:** `python3 .claude/skills/mythic-gm/scripts/dice.py roll 1d20+<mod>`.
> Never invent a die result. Pick the DC from the rules below, roll, then read the four
> degrees of success.

---

## 1. Picking which DC to use

| Situation | Use |
|---|---|
| A general task whose hardness depends on **proficiency** the world expects | **Simple DC** (§2) |
| A task whose hardness scales with the **level** of the obstacle, creature, spell, item, or region | **Level-based DC** (§3) |
| An action that targets a creature's defense (AC, save DC, etc.) | The creature's stat — see benchmarks (§6) |

Always start from the base DC, then apply any **difficulty adjustments** (§4) and **rarity**
(§4) as a sum. Adjustments stack.

---

## 2. Simple DCs (by proficiency rank)

Use when there's no obvious level to key off — recalling lore, a Society-knowledge tidbit,
crafting/earn-income tasks defined by rank, or any "how hard for *this kind* of expertise"
call.

| Proficiency the task implies | Simple DC |
|---|---|
| Untrained | **10** |
| Trained | **15** |
| Expert | **20** |
| Master | **30** |
| Legendary | **40** |

Note the deliberate gaps (no 25 / 35): Simple DCs are coarse. For finer control, use a
Level-based DC instead.

---

## 3. Level-based DCs

The default for **most checks against the world**: an obstacle, hazard, creature, spell,
or item of a given level sets the DC. This is also the spine of NPC stat benchmarks below.

| Level | DC | Level | DC | Level | DC |
|---|---|---|---|---|---|
| −1 | 13 | 8 | 24 | 17 | 38 |
| 0 | 14 | 9 | 26 | 18 | 39 |
| 1 | 15 | 10 | 27 | 19 | 41 |
| 2 | 16 | 11 | 28 | 20 | 42 |
| 3 | 18 | 12 | 30 | 21 | 44 |
| 4 | 19 | 13 | 31 | 22 | 45 |
| 5 | 20 | 14 | 32 | 23 | 47 |
| 6 | 22 | 15 | 34 | 24 | 48 |
| 7 | 23 | 16 | 35 | 25 | 50 |

**Formula** (reproduces the table): base **DC 14 at level 0**, **+1 per level**, plus an
extra **+1 at every level divisible by 3** that has been reached (levels 3, 6, 9, 12 …).
Below 0: −1 per level. When in doubt, read the table.

---

## 4. Difficulty adjustments & rarity

Add these to the chosen base DC (Simple or Level-based). They stack; sum them.

| Adjustment | Mod | Use when… |
|---|---|---|
| Incredibly easy | **−10** | trivial; rarely worth a roll |
| Very easy | **−5** | clearly favorable circumstances |
| Easy | **−2** | a small edge / good tools |
| *(unadjusted)* | 0 | standard |
| Hard | **+2** | a real complication |
| Very hard | **+5** | stacked obstacles |
| Incredibly hard | **+10** | near the edge of possible |

| Rarity (of the thing being attempted/recalled) | Mod |
|---|---|
| Common | 0 |
| Uncommon | **+2** |
| Rare | **+5** |
| Unique | **+10** |

> Adjust by the **number affected**, not your gut: if a task is hard because of two
> distinct obstacles, that's still one +2 (Hard), not +4 — unless each obstacle is itself a
> separate check. Use the largest single appropriate band rather than summing many small
> ones, except where rarity clearly adds on top of a difficulty band.

---

## 5. Spell DCs, save DCs & setting DCs

- **Spell attack / spell DC** (a caster's offense) come from the caster's statistics, not
  this table. For an NPC caster you're statting, read the **moderate spell DC** column in
  §6 (or shift one band for a glass-cannon / brute).
- **Saving throws vs. spells**: the *target* rolls a save against the *caster's* spell DC.
  Don't re-derive a DC from level here — use the caster's number.
- **Hazards, traps, environmental DCs** use the hazard's level on the Level-based table
  (§3), then adjustment bands for circumstances.
- **A check "against a creature"** (Demoralize, Feint, Trip, Grapple, Recall Knowledge
  about it, etc.) targets one of that creature's defenses — its **Will/Perception/Fortitude/
  Reflex DC, AC**, or the **Level-based DC for its level** for Recall Knowledge. See §6.

---

## 6. Creature benchmarks by level (on-the-fly statting)

These are the GM Core **Building Creatures** benchmark numbers. To stat a foe quickly:
pick its **level**, then read one value from each column at the **role band** you want
(high / moderate / low). The NPC-statting workflow and the **Diminisher** (how to weaken a
statblock down a level or two on the fly) live in
[../bridge/system-profile.md](../bridge/system-profile.md).

**Reading a band:** a typical creature is "moderate" across the board. Make a **brute** by
taking high HP + high Strike, low AC + low save; a **skirmisher/sniper** by high attack,
moderate-to-low HP; a **caster** by high spell DC, low-to-moderate other stats.

### 6a. AC, attack bonus, saving throws

| Lvl | AC (mod) | Atk hi / mod / lo | Save hi / mod / lo |
|---|---|---|---|
| −1 | 15 | 10 / 8 / 6 | 9 / 5 / 2 |
| 0 | 16 | 10 / 8 / 6 | 9 / 5 / 2 |
| 1 | 16 | 11 / 9 / 7 | 10 / 6 / 3 |
| 2 | 18 | 13 / 11 / 9 | 11 / 7 / 4 |
| 3 | 19 | 14 / 12 / 10 | 12 / 8 / 5 |
| 4 | 21 | 16 / 14 / 12 | 14 / 9 / 6 |
| 5 | 22 | 17 / 15 / 13 | 15 / 11 / 7 |
| 6 | 24 | 19 / 17 / 15 | 17 / 12 / 8 |
| 7 | 25 | 20 / 18 / 16 | 18 / 13 / 9 |
| 8 | 27 | 22 / 20 / 18 | 19 / 15 / 10 |
| 9 | 28 | 23 / 21 / 19 | 21 / 16 / 11 |
| 10 | 30 | 25 / 23 / 21 | 22 / 17 / 12 |
| 11 | 31 | 27 / 24 / 22 | 24 / 19 / 13 |
| 12 | 33 | 28 / 26 / 24 | 25 / 20 / 14 |

### 6b. Hit Points (use the band that matches the role)

| Lvl | HP high | HP moderate | HP low |
|---|---|---|---|
| −1 | 9 | 7 | 5 |
| 0 | 17 | 14 | 11 |
| 1 | 26 | 21 | 16 |
| 2 | 40 | 32 | 25 |
| 3 | 59 | 48 | 37 |
| 4 | 78 | 63 | 48 |
| 5 | 97 | 78 | 59 |
| 6 | 123 | 99 | 75 |
| 7 | 148 | 119 | 90 |
| 8 | 173 | 139 | 105 |
| 9 | 198 | 159 | 120 |
| 10 | 223 | 179 | 135 |
| 11 | 248 | 199 | 150 |
| 12 | 273 | 219 | 165 |

> HP "high/moderate/low" are the **midpoints** of the GM Core ranges. Each band spans
> roughly ±a handful of HP; pick the midpoint unless you have a reason to nudge.

### 6c. Offense: moderate spell/area DC & moderate Strike damage

For most foes, read the **moderate** column here alongside moderate AC/attack/HP above.
For a Strike, roll the listed damage expression via the dice script; the value shown is the
average that expression produces.

| Lvl | Spell / area DC (mod) | Strike dmg (mod) — expression *(avg)* |
|---|---|---|
| −1 | 16 | `1d4+1` *(~3)* |
| 0 | 16 | `1d6+2` *(~5)* |
| 1 | 17 | `1d6+3` *(~6)* |
| 2 | 18 | `1d10+4` / `2d6+3` *(~9)* |
| 3 | 20 | `1d12+5` / `2d8+4` *(~12)* |
| 4 | 21 | `2d8+6` *(~15)* |
| 5 | 22 | `2d10+7` *(~18)* |
| 6 | 24 | `2d12+7` / `3d8+6` *(~20)* |
| 7 | 25 | `3d10+6` / `2d12+9` *(~22)* |
| 8 | 27 | `3d12+5` / `4d8+8` *(~25)* |
| 9 | 28 | `4d8+10` *(~28)* |
| 10 | 30 | `4d10+8` *(~30)* |
| 11 | 31 | `4d10+10` *(~32)* |
| 12 | 33 | `4d12+9` / `5d10+8` *(~35)* |

> Damage expressions are interchangeable forms of the same band — use whichever fits the
> weapon (a maul vs. a flurry of claws). Roll it; don't assume the average.

---

## 7. Quick worked examples

- **Climb a sheer wall, no obstacle level given** → Simple DC. Trained-difficult footing →
  **DC 15**; slick with rain (Hard, +2) → **DC 17**. Roll Athletics:
  `dice.py roll 1d20+<Athletics mod>`.
- **Recall Knowledge about a level-4 uncommon creature** → Level-based DC 19 (L4) + 2
  (Uncommon) = **DC 21**. Roll the relevant Knowledge skill.
- **Stat a level-2 ambusher (skirmisher)** → AC 18, attack +13 (high), HP 25 (low), saves
  11/7/4, Strike `1d10+4` (~9). Roll its attack: `dice.py roll 1d20+13`.

---

## See also

- [./core-resolution.md](./core-resolution.md) — the d20 roll and four degrees of success
- [./skills.md](./skills.md) — which skill attempts what, and at what DC
- [./combat.md](./combat.md) — attacks, MAP, damage, AC, death/dying
- [./conditions.md](./conditions.md) — numeric effects that modify these DCs and rolls
- [../bridge/system-profile.md](../bridge/system-profile.md) — NPC statting procedure + the Diminisher
