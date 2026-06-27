# Core Resolution — The d20 Check & Four Degrees of Success

The single resolution engine for almost everything in PF2e: roll **1d20 + modifiers vs a
DC**, then read the result against **four degrees of success**. Combat attacks, saves, skill
checks, spell DCs — all use this. Edition note: identical in Remaster (Player Core / GM Core)
and legacy Core Rulebook (2019); only some surrounding terms differ.

See also: `./dcs-by-level.md` (what DC to use) · `./skills.md` · `./combat.md` ·
`./conditions.md` · `../bridge/system-profile.md` (the routing seam).

---

## The d20 check

```
1d20  +  ability mod  +  proficiency  +  item  +  circumstance  +  status  −  penalties   vs  DC
```

| Term | What it is |
|---|---|
| **1d20** | one twenty-sided die; never roll more than one d20 for a single check |
| **ability mod** | Str / Dex / Con / Int / Wis / Cha modifier appropriate to the check |
| **proficiency** | rank bonus **+ your level** *if trained or better*; **+0 (no level)** if untrained |
| **item** | from gear (e.g. a +1 weapon potency, a fine tool) — *item* type |
| **circumstance** | from the situation (cover, flanking, aid) — *circumstance* type |
| **status** | from spells/conditions (bless, frightened, sickened) — *status* type |
| **penalties** | subtract; carry the same three types (circumstance/status/item) + untyped |

**Proficiency bonus by rank** (add your **level** to every rank from Trained up):

| Rank | Bonus |
|---|---|
| Untrained | +0 (do **not** add level) |
| Trained | +2 + level |
| Expert | +4 + level |
| Master | +6 + level |
| Legendary | +8 + level |

**Run the roll through the engine — never invent a result:**

```
python3 .claude/skills/mythic-gm/scripts/dice.py roll 1d20+<mod>
```

e.g. a trained level-3 character with a +4 Dex doing a Stealth check: `1d20+9` (3 level + 2
trained + 4 Dex). Read the d20 face and the total off the engine's output.

**Ties succeed.** A total that *equals* the DC is a Success (the roller wins ties).

---

## The four degrees of success

Compare the **total** to the **DC**:

| Degree | Condition |
|---|---|
| **Critical Success** | total ≥ DC **+ 10** (beat the DC by 10 or more) |
| **Success** | total ≥ DC (meet or beat) |
| **Failure** | total < DC, missing by **1–9** |
| **Critical Failure** | total ≤ DC **− 10** (miss by 10 or more) |

Always resolve to a **degree**, not a yes/no — most actions print distinct outcomes for all
four (the action text in `./skills.md` / `./combat.md`).

### Natural 20 and natural 1 (adjust by one step)

After comparing total to DC to find the base degree, **shift it one step**:

- **Natural 20** on the d20 → improve the degree by one step (Crit Fail→Fail, Fail→Success,
  Success→Crit Success). A nat 20 is **not** an automatic crit — it bumps whatever you earned.
- **Natural 1** on the d20 → worsen the degree by one step (Crit Success→Success,
  Success→Fail, Fail→Crit Fail).

Order matters: **compare to the DC first, then apply the nat-20/nat-1 step.** A nat 20 that
only reached Failure becomes a Success; a nat 1 on a roll that beat the DC by 10+ drops from
Crit Success to plain Success. (You cannot step below Crit Failure or above Crit Success.)

---

## Bonus & penalty stacking

Three **stacking categories**: **circumstance**, **status**, **item**. Within a single type,
**only the highest applies** (they do *not* stack with each other); across the three types,
they **do** add together. **Untyped** penalties (e.g. the multiple attack penalty) stack with
everything.

| Rule | Effect |
|---|---|
| Two circumstance bonuses (+1 cover, +2 aid) | take the **highest** (+2), not +3 |
| A circumstance +2 **and** a status +1 **and** an item +1 | all three add → **+4** |
| A circumstance bonus **and** a circumstance penalty | net them (highest of each side, then sum) |
| Untyped penalties (MAP, etc.) | always apply on top |

When in doubt, label each modifier's type, keep the best of each type, then sum the types.

---

## Mapping to the engine (rule-mode Fate Questions)

When PF2e has **no mechanic** for an uncertain outcome, the engine's **rule-mode Fate
Question** stands in, and its answer maps onto the four degrees:

| Fate answer (rule-mode) | Degree of success |
|---|---|
| **Exceptional Yes** | **Critical Success** |
| **Yes** | **Success** |
| **No** | **Failure** |
| **Exceptional No** | **Critical Failure** |

This mirrors the d20: nat-20/Exc-Yes is the "exceptional" up-step, nat-1/Exc-No the down-step.
Prefer a **real d20 check** whenever a DC exists; reserve the Fate Question for genuinely
rule-less world facts (see `../bridge/system-profile.md` for the routing seam). Either way the
randomness runs through `dice.py` — honest and shown.

---

## Hero Points (the player's lever only)

- The player **starts each session with 1 Hero Point**; the GM may award more for heroics.
- **Spend 1 to reroll** a check you just made — you **must take the second result**, even if
  worse. (Spending all Hero Points to avoid death is a separate combat use — see
  `./combat.md` "death and dying".)
- Hero Points are the **player's opt-in resource**, announced aloud. The **GM never spends
  them**, and never spends them *for* the player. No GM "Peril Points" equivalent is used.

---

## Special check types (brief)

- **Recall Knowledge** — a skill check (Arcana / Nature / Occultism / Religion / Society /
  Crafting / Medicine / Lore, per topic) vs a **level-based DC** for the subject (often
  +rarity adjustment; see `./dcs-by-level.md`). Crit Success = extra/precise info; Failure =
  nothing; Crit Failure = **a wrong belief**. Typically a **secret check** (below).
- **Secret checks** — the **GM rolls** so the player doesn't see the die (Recall Knowledge,
  Sense Motive, many Perception/Stealth checks). In solo play, **still run it through
  `dice.py`** and read the degree, but narrate only what the PC could plausibly know — apply
  **Player ≠ PC knowledge**; never leak the raw number when the fiction hides it.
- **Assurance** (skill feat) — instead of rolling, take a **flat 10 + proficiency bonus**
  (no other bonuses or penalties of any kind apply). Use it to *guarantee* clearing low DCs
  without a roll; it can never crit.
