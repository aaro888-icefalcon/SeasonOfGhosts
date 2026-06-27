# Conditions — Numeric Effects & How They End

Every PF2e condition with its exact mechanical effect. Conditions are either **on/off**
(you have it or you don't) or **valued N** (carry a number; "Frightened 2"). Edition note:
Remaster (Player Core / GM Core) and legacy Core Rulebook (2019) are mechanically identical
here; the one rename is **Off-Guard** (Remaster) = **Flat-Footed** (legacy).

See also: `./core-resolution.md` (degrees of success) · `./combat.md` (where most of these
apply) · `./death.md` (Dying / Wounded / Doomed loop) · `../bridge/system-profile.md`.

**Run every roll through the engine — never invent a result:**

```
python3 .claude/skills/mythic-gm/scripts/dice.py roll 1d20+<mod>
```

---

## Bonus/penalty types (so they stack correctly)

Most condition penalties are **status** penalties. Status penalties **do not stack** — only
the **worst** status penalty of a given kind applies. Circumstance and item penalties are
separate types and stack with status. Track this when layering conditions.

| Condition | Penalty type |
|---|---|
| Frightened, Sickened, Stupefied, Drained (to checks/HP), Enfeebled, Clumsy | **status** |
| Off-Guard (−2 AC) | **circumstance** |
| Enfeebled (to Athletics/Str-damage), Drained (to Fortitude) | **status** |

When two status penalties hit the same roll, apply only the larger. Example: Frightened 2 and
Sickened 1 both give status penalties to attack rolls → apply **−2** (the worse), not −3.

---

## Valued-condition shorthand

For any condition written **N**, the number *is* the penalty/effect magnitude unless noted.
"Reduce by 1" means subtract 1 from the value; at **0** the condition ends.

---

# Conditions (alphabetical)

## Blinded
- Can't see. **All terrain is difficult terrain.** Automatically **critically fail** Perception
  checks that require sight. If a check requires sight (e.g., reading), you fail.
- You are **Off-Guard** to all enemies. If vision is your only precise sense, you take a
  **−4 status penalty to Perception** (no penalty if you have another precise sense).
- Immune to visual effects.
- **Ends:** when the cause ends (spell duration, regaining sight). Overrides Dazzled.

## Clumsy N
- **−N status penalty** to Dexterity-based checks and DCs: **AC, Reflex saves, attack rolls
  with Dex (ranged/finesse), Acrobatics, Stealth, Thievery,** and Dex-based skill DCs.
- **Ends:** per source; varies.

## Concealed
- Hard to see (fog, dim light, behind a curtain). Attacks against you (and your sight-based
  checks targeting through it) require a **DC 5 flat check**; success = the effect works.
- Does **not** make you Off-Guard by itself.
- **Ends:** when the obscuring condition ends. (Contrast **Hidden/Undetected** — those are
  *detection states*, not conditions; see `./combat.md`.)

## Confused
- You are **Off-Guard**, don't treat anyone as an ally, can't Delay/Ready/use reactions.
- Each turn you must use all your actions to **Strike** (or cast offensive cantrips at) a
  **randomly determined target**; if no other viable target, you target yourself (auto-hit, no
  crit). If attacking/casting is impossible, you babble and waste your actions.
- **Each time you take damage from an attack or spell**, you may attempt a **DC 11 flat check**;
  on a success the Confused condition ends.
- **Ends:** a successful DC 11 flat check (triggered by taking damage), or when the source ends.

## Controlled
- Another creature dictates your actions. You act on the controller's directions.
- **Ends:** when the controlling effect ends.

## Dazzled
- All creatures and objects are **Concealed** from you (DC 5 flat check to target with sight).
- **Ends:** per source. Subsumed by Blinded (Blinded is worse).

## Deafened
- Automatically **critically fail** Perception checks that require hearing; **−2 status
  penalty** to Perception checks that involve sound but don't solely require it, and to
  initiative if rolling Perception.
- Must succeed at a **DC 5 flat check** to cast spells with an auditory/verbal component (on
  failure the action is lost).
- **Ends:** when the cause ends.

## Doomed N — *(horror: shortens the path to death)*
- **Reduces your dying threshold (the value of Dying at which you die) by N.** Normally you die
  at **Dying 4**; Doomed 1 → you die at **Dying 3**; Doomed 2 → die at **Dying 2**; etc.
- Doomed does **not** itself cause Dying — it just makes Dying lethal sooner.
- **Reduce Doomed by 1 each time you make a full night's rest** (it ticks down on rest, not
  per turn).
- **Ends:** when it reaches 0. A potent dread/curse condition; use sparingly for stakes.

## Drained N — *(horror: lasting Con/HP erosion)*
- **−N status penalty to Constitution-based checks** (notably **Fortitude saves**).
- **Lose Hit Points** equal to **N × your level** immediately when Drained is applied (one
  time), and your **maximum HP is reduced by the same amount** while Drained.
  - Raising Drained to a higher value: lose the *additional* (newN − oldN) × level HP.
- **Reduce Drained by 1 each time you get a full night's rest** (also restoring that night's
  worth of max HP). Recovered HP from rest is capped by the reduced max.
- **Ends:** when it reaches 0. Classic effect of energy drain / undead.

## Dying N — *(horror: the bleed-out clock)*
- You are **Unconscious** and **near death**. **You die when Dying reaches 4** (modified down
  by **Doomed** — see above).
- When you're reduced to 0 HP you usually start at **Dying 1** (or **Dying 2** if the hit was a
  critical hit, or if you were already Wounded — add your Wounded value).
- **Each round at the start of your turn**, roll a **recovery check**: a flat check vs
  **DC 10 + current Dying value**.
  - **Crit success:** Dying −2 · **Success:** Dying −1 · **Failure:** Dying +1 ·
    **Crit failure:** Dying +2.
- Taking damage while Dying increases Dying by 1 (by 2 if a crit). When Dying is **removed**
  by reaching 0 (e.g., healed to ≥1 HP, or recovery brings it to 0), you become **Wounded 1**
  (or Wounded +1).
- **Run recovery as:** `python3 .claude/skills/mythic-gm/scripts/dice.py roll 1d20` and compare
  to DC 10 + Dying.
- **Ends:** healed to ≥1 HP, or recovery check brings Dying to 0 → you wake, gaining/raising
  **Wounded**. Full sequence in `./death.md`.

## Encumbered
- You are **Clumsy 1** and take a **−10-foot status penalty to all Speeds** (from carrying Bulk
  over your limit).
- **Ends:** when you drop enough Bulk to be at/under your limit.

## Enfeebled N
- **−N status penalty to Strength-based checks and DCs:** **melee attack rolls using Str,
  Athletics,** and **melee damage rolls** that use your Strength modifier.
- **Ends:** per source.

## Fascinated
- **−2 status penalty to Perception and skill checks**, and you **can't use concentrate actions
  unless they relate to the subject** of your fascination (e.g., you can't cast an offensive
  spell at the thing you're fascinated by).
- You aren't otherwise prevented from acting.
- **Ends:** broken by hostility from the source toward you/your allies, or per the effect.

## Fatigued
- **−1 status penalty to AC and saving throws.**
- **Can't use exploration activities while traveling** (e.g., can't Investigate or Scout).
- **Ends:** after a **full night's rest**.

## Frightened N — *(THE core horror condition)*
- **−N status penalty to ALL your checks and DCs** — attack rolls, saves, skill checks,
  Perception, AC (as a DC), spell DCs. It hits *everything*.
- **At the end of each of your turns, reduce Frightened by 1** automatically (it decays).
- Some effects (e.g., being in an aura, or "can't reduce below 1 while X") pin the value;
  honor those if stated, otherwise it always ticks down by 1 per turn.
- **Ends:** when it reaches 0 (typically a few rounds after the scare, via the per-turn decay).
- *Operational note:* This is the workhorse fear mechanic — apply Frightened 1–2 for unsettling
  reveals, 3+ for genuine terror; the auto-decay keeps it self-limiting and dramatic.

## Grabbed
- You are **Off-Guard** and **Immobilized** (can't move from your space).
- Casting a spell or using a manipulate/move action while Grabbed requires a **DC 5 flat check**
  or the action is lost.
- **Ends:** Escape (Athletics/Acrobatics/unarmed attack action vs the grabber's DC), or the
  grabber releases / is incapacitated.

## Immobilized
- **You can't take any action with the move trait** (can't Step, Stride, etc.). You can still
  act otherwise. If something forces you to move, you don't.
- **Ends:** per the source (often tied to Grabbed/Restrained or a held effect).

## Invisible
- **Undetected** by everyone (unless they have special senses). Creatures must **guess your
  square** and even then attacks vs you take the Undetected penalties and need a **DC 11 flat
  check** to hit.
- You're **not automatically hidden if you make noise**; Seek can locate you to **Hidden**.
- **Ends:** when the effect ends.

## Off-Guard — *(legacy: Flat-Footed)*
- **−2 circumstance penalty to AC** against the creatures you're Off-Guard to (often everyone).
- Many things impose it: being flanked, Grabbed/Restrained/Prone, attacking from Hidden, certain
  feats, Blinded, etc.
- **Ends:** when the triggering condition ends (it's almost always situational, not valued).

## Paralyzed
- You are **Off-Guard** and **can't act except to Recall Knowledge** and other purely mental
  actions; you can't use any action with the move, manipulate, or attack traits.
- **Ends:** per source.

## Persistent Damage
- A **damage type + amount** that recurs **at the end of each of your turns** (e.g., "2d6
  persistent fire"). Roll it each turn via the engine.
- **After each tick**, attempt a **DC 15 flat check**; **success ends** the persistent damage.
  The DC can be lowered by appropriate assistance (e.g., dousing fire → as low as DC 10, GM's
  call).
- **Run as:** `python3 .claude/skills/mythic-gm/scripts/dice.py roll 2d6` for the damage, then
  `... roll 1d20` for the DC 15 flat check.
- **Ends:** a successful flat check, or the appropriate remedy.

## Petrified
- Turned to **stone**: **Unconscious** for purposes of being unable to act, but **HP/conditions
  are frozen** — you can't act, sense, or take/heal damage; your statistics don't change.
- **Ends:** only by a specific effect that restores you (e.g., the relevant counter to the
  petrifying source).

## Prone
- Lying down. **−2 circumstance penalty to attack rolls**, and you're **Off-Guard** (−2 AC).
- You **can't use most move actions except Crawl** (5 ft, move trait) or **Stand** (1 action).
- While Prone you can use **Take Cover** to gain greater cover (**+4 circumstance bonus to AC**)
  against ranged attacks even without an object to hide behind — but you remain Off-Guard.
- **Ends:** **Stand** (single action), or any forced standing.

## Quickened
- **You gain 1 additional action at the start of your turn.** The granting effect usually
  restricts what the extra action may be used for — honor that restriction.
- **Ends:** when the effect ends.

## Restrained
- You are **Off-Guard** and **Immobilized**, and you **can't use any actions with the attack or
  manipulate traits except to attempt to Escape** or Force Open your bonds.
- Restrained overrides (is stricter than) Grabbed.
- **Ends:** Escape vs the restrainer's DC, or release.

## Sickened N — *(horror: nausea, "the body recoils")*
- **−N status penalty to ALL checks and DCs** (like Frightened, but does **not** auto-decay).
- **You can't willingly ingest anything** (food, potions, elixirs) while Sickened.
- **Reduce by spending an action to retch:** attempt a **Fortitude save**; on a **success**
  reduce Sickened by 1 (by 2 on a **critical success**). You can keep retching while Sickened.
- **Run the save:** `python3 .claude/skills/mythic-gm/scripts/dice.py roll 1d20+<Fort>` vs the
  effect's DC.
- **Ends:** when it reaches 0 (via retching or the source). Great for revulsion/horror beats.

## Slowed N
- **At the start of your turn, lose N actions** (you begin with 3 − N actions that turn; your
  reaction is unaffected unless stated).
- Slowed doesn't stack with itself — use the highest value affecting you.
- **Ends:** per source.

## Stunned N
- **Lose N actions** total. Unlike Slowed, Stunned is a **lump sum**: on your next turn(s) you
  lose actions until N is paid off, then it ends. (Stunned 3 = lose 3 actions across your
  turns; if a turn gives 3 actions you lose all 3 and Stunned ends.)
- Stunned also overrides Slowed for actions lost on the same turn (don't double-subtract — apply
  the larger of the two for that turn).
- **Ends:** when the action total N is fully paid.

## Stupefied N
- **−N status penalty to Intelligence-, Wisdom-, and Charisma-based checks and DCs** (including
  Will saves, mental skills, and **spell attack rolls / spell DCs**).
- **To Cast a Spell**, attempt a **flat check of DC 5 + N**; on failure the spell is lost.
- **Run as:** `python3 .claude/skills/mythic-gm/scripts/dice.py roll 1d20` vs DC 5 + N.
- **Ends:** per source.

## Unconscious
- **Asleep or knocked out.** You're **Off-Guard**, **Blinded**, **Prone** (if you fall), can
  take **no actions**, and have a **−4 status penalty to AC, Perception, and Reflex saves**.
- You take an automatic **critical hit** from adjacent melee attackers? — no: melee Strikes vs
  Unconscious are not auto-crits, but you are Off-Guard and easy to hit; a **coup de grâce**
  follows GM adjudication. (Standard rule: Unconscious = Off-Guard + the −4, not auto-crit.)
- If Unconscious due to **0 HP**, you are also **Dying** (see above). If at ≥1 HP (asleep), you
  **wake** when you take damage or on a loud disturbance (Perception, with the −4).
- **Ends:** regaining HP above the threshold, waking, or being roused.

## Wounded N — *(horror: each brush with death cuts deeper)*
- Tracks how many times you've recently recovered from **Dying**. **When you next become Dying,
  add your Wounded value to the starting Dying value.** (Wounded 1 → next time you drop to 0 HP
  you start at Dying 2 instead of 1; Wounded 2 → Dying 3; etc. — which, with **Doomed**, can
  kill fast.)
- Becoming Dying again **increases Wounded by 1**.
- **Ends:** Wounded is **removed entirely** when you are **restored to full Hit Points** *and*
  rest for 10 minutes, or by **Treat Wounds**-style recovery per its rules. (It does **not**
  tick down by 1; it clears all at once on full healing.)
- *Operational note:* Wounded + Doomed are the two "death gets closer" dials — Wounded raises
  where the next Dying *starts*, Doomed lowers where Dying *kills*. The full interaction lives in
  `./death.md`.

---

## Quick-reference: which conditions impose a status penalty to *everything*

These are the broad horror dials — they degrade all d20 rolls and DCs:

| Condition | To all checks/DCs? | Decays automatically? | How to clear |
|---|---|---|---|
| **Frightened N** | **Yes (−N)** | **Yes, −1 each turn** | Auto-decay to 0 |
| **Sickened N** | **Yes (−N)** | No | Retch (Fort save), source |
| Stupefied N | Mental checks/DCs only (−N) | No | Source |
| Enfeebled N | Str-based only (−N) | No | Source |
| Clumsy N | Dex-based only (−N) | No | Source |
| Drained N | Con-based only (−N) + HP loss | No (−1 per rest) | Full night's rest ×N |
| Doomed N | (lowers death threshold) | No (−1 per rest) | Full night's rest ×N |
| Wounded N | (raises next Dying start) | No | Full HP + 10 min rest |

For the death spiral itself — **0 HP → Dying → recovery → Wounded → Doomed** — see
`./death.md`.
