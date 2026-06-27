# Victory Points — the Generic Point-Track Engine (PF2e Subsystem)

The **Victory Point (VP)** subsystem is the chassis under most of PF2e's structured non-combat
tracks: **Influence**, **Research**, **Reputation**, **Infiltration** (Awareness/Edge), Chases,
and the *Season of Ghosts* bespoke tracks (**Preparation Points**, the Willowshore curse clock).
The pattern: **accumulate points toward named thresholds across repeated checks**, sometimes
under a **deadline (a clock)** and sometimes with **degradation** (points or progress leaking
away). From **GM Core** "Victory Points" (legacy: *Gamemastery Guide* "Victory Points").

This file is the **template**. The named tracks specialize it; run any unfamiliar or bespoke
track by these rules so they all behave consistently. Resolution itself (d20 + four degrees)
lives in [../core-resolution.md](../core-resolution.md); DCs come from
[../dcs-by-level.md](../dcs-by-level.md).

> **Every check runs through the engine — never invent a result:**
> `python3 .claude/skills/mythic-gm/scripts/dice.py roll 1d20+<mod>`
> Pick the DC, roll, read the degree of success, then award VP per the table below.

---

## 1. The anatomy of a VP track

Define these six fields once, before play, and record them to campaign-state. Every named
subsystem is just a VP track with these slots filled in.

| Field | What it is | Influence's version | Research's version |
|---|---|---|---|
| **Pool name** | what the points represent | Influence Points (IP) | Research Points (RP) |
| **Check & DC** | the roll that earns/loses VP, and against what | a chosen skill vs the NPC's **Influence DC** | a chosen skill vs the library/topic's **Research DC** |
| **Award table** | VP per degree of success (§3) | crit +2 / succ +1 / fail 0 / crit-fail −1 | same default |
| **Thresholds** | the VP totals that unlock outcomes (§4) | e.g. 4 / 8 / 12 | per "breakpoint" facts revealed |
| **Limiter** | what bounds the track — a **deadline/clock**, an **attempt cap**, or none (§5) | rounds of the event | time before the secret matters / library closes |
| **Degradation** | whether VP/progress **leaks** over time or on failure (§6) | misstep or crit-fail can cost IP | a guarded source can erase progress |

A track is **one-sided** (only you push toward your thresholds — Influence, Research,
Preparation) or **opposed** (two pools race, or a hazard pool counts up against you —
Infiltration's Awareness Points, a chase clock). Most SoG tracks are one-sided.

---

## 2. The loop an AI GM runs

```
SET UP: name the pool, set the DC, pick thresholds (§4), pick the limiter (§5),
        decide degradation (§6). Record to campaign-state. Start VP = 0.

REPEAT (each round / attempt / scene, until the limiter ends it):
    1. PC declares an approach (which skill, what fiction).
    2. Apply approach modifiers FIRST (bonuses for the right lever,
       penalties for a resisted approach) — see the named track's statblock.
    3. Roll: dice.py roll 1d20+<mod>  vs the track's DC.
    4. Read the four degrees → award VP from the track's table (§3).
    5. Apply degradation if any fired (§6).
    6. Advance the limiter one notch (spend a round, tick the clock).
    7. Re-check thresholds (§4); narrate any newly crossed threshold immediately.

END when the limiter is exhausted (or a terminal threshold is hit):
    final VP total → outcome band (§4).
```

Track per VP pool: **current VP**, **limiter remaining** (rounds/attempts/clock segments),
**thresholds already crossed**, and any **standing modifiers** discovered. Persist to
campaign-state between scenes when a track spans sessions.

---

## 3. Awarding points by degree of success

The **default** VP award — used by Influence, Research, and most bespoke SoG tracks unless the
track says otherwise:

| Degree | VP awarded |
|---|---|
| **Critical Success** | **+2 VP** |
| **Success** | **+1 VP** |
| **Failure** | **+0 VP** |
| **Critical Failure** | **−1 VP** (or a setback — see below) |

Degrees follow the standard rules in [../core-resolution.md](../core-resolution.md): beat the DC
by **10+** = critical success; fail by **10+** (or roll a nat 1 that turns a success into a
failure) = critical failure; a **nat 20** bumps one degree up, a **nat 1** bumps one degree down.

**Common variants** (the track's statblock declares which it uses):

| Variant | What changes | Where seen |
|---|---|---|
| **Crit-fail = setback, not −VP** | crit-fail instead advances a deadline, alerts a foe, or raises Awareness Points | Infiltration, Research (a guard notices) |
| **No negative floor** | VP can't drop below 0 (failures stall but never reverse) | Preparation Points, friendly tracks |
| **Bonus VP on lever** | using a discovered weakness/right approach gives **+1 VP** on a success (or +2 circ to the check) | Influence weaknesses |
| **Bigger swings** | crit +3 / −2 for high-stakes, fast tracks | short chases, climactic pushes |

> Do **not** invent a richer award table when the default works. Reach for a variant only when
> the named track specifies it or the fiction clearly demands it (a betrayal *should* cost VP).

---

## 4. Setting thresholds & reading the outcome

Thresholds are the VP totals that unlock results. Read the **running** total each round (to
narrate mid-track wins) and the **final** total against the bands when the limiter ends.

| VP reached | Typical outcome |
|---|---|
| Below 1st threshold | No progress / no help; the goal is unmet. |
| **1st threshold** | Minor success — a hint, a small favor, partial intel. |
| **2nd threshold** | Solid success — meaningful aid, a key fact, real ground gained. |
| **3rd threshold** | Full success — the objective is won outright; doors open. |

**How to pick the numbers.** Scale thresholds to the **expected number of scoring opportunities**
(how many productive checks the limiter allows × the party's likely success rate). A clean,
edition-consistent default:

| Limiter size (productive attempts available) | Suggested thresholds |
|---|---|
| Short (≈3–4 attempts) | **2 / 4 / 6** |
| Medium (≈5–6 attempts) | **4 / 8 / 12** |
| Long (≈8+ attempts) | **6 / 12 / 18** |

Rule of thumb: **1st ≈ attempts ÷ 2**, **2nd ≈ attempts**, **3rd ≈ attempts × 1.5** for a small
party. Scale down for a lone PC, up for several PCs each contributing per round. A track that
**must** be winnable (the plot can't dead-end) should set its top threshold below the realistic
max VP; a track that's *meant* to be hard sets it above the comfortable total. Some tracks
expose only **one** threshold (binary: cure found / not found); others a fine ladder.

---

## 5. The limiter — deadlines, clocks & attempt caps

Most VP tracks are bounded; an unbounded track just becomes "roll until you win," which is dull.
Pick exactly one limiter:

| Limiter | How it works | Example |
|---|---|---|
| **Round limit** | a fixed number of rounds; one scoring action per PC per round | Influence event (banquet = N rounds) |
| **Clock / deadline** | a segmented clock ticking toward a bad event; the track ends when it fills | Research before the cultists complete the ritual |
| **Attempt cap** | a hard number of tries (failures still consume one) | a library with limited consultable tomes |
| **Resource cost** | each attempt spends time/coin/supplies; you stop when the resource runs out | downtime days, Preparation Points window |
| **Opposed pool** | a *second* pool counts up against you; you lose if it hits its threshold first | Infiltration Awareness, a chase |

Clocks are the engine's native limiter — the **world-tick** hook advances them at bookkeeping
(see [../../bridge/subsystems.md](../../bridge/subsystems.md)). When a VP track shares a clock
with the world-tick (e.g. Preparation Points runs against the act's defense deadline), let the
tick advance the limiter so the deadline arrives on schedule whether or not the PC is rolling.

> **Player ≠ PC knowledge:** the *position* of a hidden clock (the curse, an enemy's progress)
> is **felt, not announced**. Roll and tick honestly through the engine, but narrate pressure,
> not segment counts — see [../../bridge/system-profile.md](../../bridge/system-profile.md).

---

## 6. Degradation — when points leak

Some tracks **lose** progress over time, modelling decay, a fading opportunity, or active
opposition. Decide at setup whether and how degradation fires:

| Degradation type | Trigger | Effect |
|---|---|---|
| **On crit-fail** | a botched check | −1 VP (the default award table already does this) |
| **On misstep** | using a flagged wrong approach (an insult, a tripped alarm) | a defined −VP and/or a step on an opposed pool |
| **Per tick / per scene** | time passing without attention | −1 VP each interval (intel goes stale, goodwill cools) |
| **On opposed action** | a rival or hazard acts | the opposed pool gains, or your pool is reduced |

Degradation is what makes a track *tense* rather than monotonic — but it's optional. Friendly,
constructive tracks (Preparation Points) usually have **no per-tick decay**; adversarial or
time-pressured tracks (Research under a deadline, the curse clock) do. Never apply degradation
the track didn't declare; it must be set up front so it's fair.

---

## 7. The named tracks — which dial each one sets

Every PF2e and SoG track is this engine with the dials set. Use the sibling file for the
specifics; use **this** file for any track that lacks one.

| Track | Pool | Limiter | Degradation | Reference |
|---|---|---|---|---|
| **Influence** | Influence Points | round limit (event length) | crit-fail / misstep −IP | [./influence.md](./influence.md) |
| **Research** | Research Points | clock / attempt cap | guarded source can erase progress | ./research.md |
| **Reputation** | Reputation (per faction) | none (persistent ledger) | hostile acts subtract | ./reputation.md |
| **Preparation Points** | Prep Points (Willowshore defense) | season deadline (Acts 2–3) | none (constructive) | ./downtime.md |
| **Infiltration** | Edge vs **Awareness** (opposed) | objective-count + Awareness cap | Awareness rises on crit-fail | the Infiltration entry / GM Core |
| **The Willowshore curse** | hidden clock | per-3-scene world-tick | counts *up* against the party | [../../bridge/subsystems.md](../../bridge/subsystems.md) |

---

## 8. Mapping to *Season of Ghosts*

The module leans on two bespoke VP tracks; run both by the template above.

| SoG track | VP framing |
|---|---|
| **Preparation Points** (Acts 2–3, defending Willowshore) | One-sided VP pool. **Pool** = Prep Points; **check** = the relevant downtime activity vs a Level-based DC; **award** = default (no negative floor — failures stall, never reverse); **limiter** = the season's defense **deadline** (the world-tick "Preparation Points" row tallies every 3 scenes, [../../bridge/subsystems.md](../../bridge/subsystems.md)); **thresholds** set the **defense outcome** (rout → costly win → clean victory). Influence successes with notables can feed Prep Points — see [./influence.md](./influence.md) §8 and ./downtime.md. |
| **Reputation** (Northridge / Southbank standing) | A *persistent* VP ledger with **no limiter** and **degradation on hostile acts**: helping a faction adds, harming it subtracts; thresholds unlock standing support or trigger hostility. Fired on trigger by the world-tick "Willowshore Reputation" row. See ./reputation.md. |
| **The Willowshore curse / mindscape decay** | A hidden **opposed** clock that counts *up* against the party (a deadline-style limiter the PCs are racing). Advanced per-3-scenes by the world-tick; **felt, not announced** (Player ≠ PC knowledge). |
| **Any new bespoke track the module throws up** | Don't improvise ad hoc — fill the six §1 fields (pool, DC, award, thresholds, limiter, degradation), record them, and run §2's loop so it behaves like every other track. |

**Statting a bespoke track on the fly:** name the **pool**; set the **DC** from
[../dcs-by-level.md](../dcs-by-level.md) (Level-based for the obstacle, often Hard +2 if it's
guarded); use the **default award table** (§3); pick **thresholds** from §4 by counting the
attempts the limiter allows; choose **one limiter** (§5) and declare **degradation** (§6) up
front. Record it to setting-canon live state so later scenes stay consistent.

---

## See also

- [../core-resolution.md](../core-resolution.md) — the d20 check and four degrees of success
- [../dcs-by-level.md](../dcs-by-level.md) — Level-based / Simple DCs and difficulty bands for the track's DC
- [./influence.md](./influence.md) — the round-limited social VP track (the worked example)
- ./research.md — the clock/deadline VP track
- ./reputation.md — the persistent VP ledger (Northridge / Southbank)
- ./downtime.md — Preparation Points for the Willowshore defense
- [../../bridge/subsystems.md](../../bridge/subsystems.md) — the world-tick that advances clocks and Reputation
- [../../bridge/system-profile.md](../../bridge/system-profile.md) — statting + the Player ≠ PC knowledge seam for hidden clocks
