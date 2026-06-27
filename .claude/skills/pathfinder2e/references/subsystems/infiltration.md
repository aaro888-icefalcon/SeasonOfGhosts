# Infiltration — Getting In Unseen, Over Obstacles (PF2e Subsystem)

A structured way to run **breaking into / sneaking through a guarded place**: the party
accumulates **Infiltration Points (IP)** toward named **objectives** by beating **obstacles**
(skill checks), while the opposition accumulates **Awareness Points (AwP)** that measure how
close it is to **catching on**. Two pools race. From **GM Core** (legacy: *Gamemastery
Guide* "Infiltration"), it drives every "get into the hostile site quietly" beat in
*Season of Ghosts* — the teahouse back rooms, the manor, the Silkwasp camp.

> **IP collides with Influence's "IP."** In *this* file, **IP = Infiltration Points** and
> **AwP = Awareness Points**. Don't carry an Influence Point total into an infiltration.

Resolution itself (d20 + four degrees) lives in [../core-resolution.md](../core-resolution.md);
the underlying point-track chassis (this is an **opposed** VP track) lives in
[./victory-points.md](./victory-points.md); which skill fits which obstacle lives in
[../skills.md](../skills.md); DCs by level in [../dcs-by-level.md](../dcs-by-level.md).

> **Every check runs through the engine — never invent a result:**
> `python3 .claude/skills/mythic-gm/scripts/dice.py roll 1d20+<mod>`
> Pick the obstacle's DC (§3), roll, read the degree (§4), award IP **and/or** AwP, re-check
> both pools (§5–6).

---

## 1. When to use Infiltration vs. a single check

| Situation | Use |
|---|---|
| One door, one guard, one quick sneak | a lone **Stealth/Thievery/Deception** action ([../skills.md](../skills.md)) |
| A multi-stage approach to a guarded place, with a "do we get caught?" clock | **Infiltration subsystem** (this file) |
| The plan blows up into a fight or a foot-chase out | drop to **[../combat.md](../combat.md)** / the **Chase** subsystem |
| Learning a secret *inside* the place over time | run **Research** ([./research.md](./research.md)) nested in the infiltration |
| Talking a specific gatekeeper around across a scene | **Influence** ([./influence.md](./influence.md)) — its result can become an Edge here |

A single Sneak answers "did I get past this one guard?" Infiltration answers "did the **whole
operation** succeed before the place woke up?" — letting many skills, many PCs, and a plan
contribute to one outcome under a rising alarm.

---

## 2. The infiltration statblock

Stat the operation once, before play, and record it to campaign-state.

| Field | What it is |
|---|---|
| **Objectives** | the goals, each with an **IP cost** to complete — e.g. *Reach the records room (5 IP)*, *Steal the ledger (3 IP)*, *Get out clean (2 IP)*. A simple job has one objective; a heist chains several. |
| **Obstacles** | the discrete barriers between the party and each objective (a wall, a patrol, a locked vault, a checkpoint). Each obstacle lists the **skills** that beat it and a **DC** per skill (§3). |
| **Awareness threshold(s)** | the AwP totals at which the opposition reacts (§6) — commonly a **soft tier** (suspicion: patrols double, DCs rise) and a **hard tier** (alarm: infiltration ends, combat/chase begins). |
| **Time / round structure** | infiltration runs in **exploration time**; the limiter is the **objective count** (and the Awareness cap), not a turn clock — but a *timed* job can add a deadline clock. |
| **Edges** | advantages the party can *earn or prepare* (reconnaissance, a bribed guard, a disguise, a map) that grant bonuses, reduce IP cost, or suppress AwP (§7). |
| **Complications** | events that fire on failure or by the world-tick — a wandering patrol, a shift change, a locked-down wing (§8). |

> No published statblock? Build one fast: name **1–3 objectives** with **IP costs** (≈3–5 each),
> list the **obstacles** between them, set each obstacle's **DC** from
> [../dcs-by-level.md](../dcs-by-level.md) (Level-based for the site's level, **Hard +2** for a
> well-guarded barrier, **+rarity** for magical wards), set the **Awareness threshold** by §6,
> and note **prep Edges** the party could bank. Statting workflow:
> [../../bridge/system-profile.md](../../bridge/system-profile.md).

---

## 3. Obstacles & the checks that beat them

An **obstacle** is one barrier. It names the **skills** that apply and a **DC** for each (off-list
skills are harder or barred). Typical mappings — full action notes in [../skills.md](../skills.md):

| Obstacle type | Skills that beat it (examples) |
|---|---|
| **Patrols / sentries / open ground** | **Stealth** (Sneak, Hide, Avoid Notice), **Deception** (Create a Diversion) |
| **Locked door / vault / trapped mechanism** | **Thievery** (Pick a Lock, Disable a Device), **Athletics** (Force Open) |
| **Walls / roofs / gaps / moats** | **Athletics** (Climb, Long Jump, Swim), **Acrobatics** (Balance, Squeeze, Tumble Through) |
| **Checkpoints / guards who must be talked past** | **Deception** (Impersonate, Lie), **Diplomacy**, **Society** (knowing the password/protocol), **Intimidation** |
| **Recognizing the layout / spotting the watch** | **Perception**, **Society**, a relevant **Lore** (often as a *recon Edge*, §7) |
| **Wards / haunts / magical locks** (common in SoG) | **Occultism / Arcana** to identify & bypass; a haunt may need [./hauntings.md](./hauntings.md) |

- **Most infiltration checks are SECRET** (the GM rolls; Player ≠ PC knowledge) — the PC
  shouldn't know whether a clean-looking success actually tripped a silent alarm.
- An obstacle can require **multiple successes** (its full IP cost) — several checks chip at it.
- **Group obstacles:** several PCs each roll; tally their IP. The **weakest sneaker** is also the
  most likely to feed Awareness, so split tasks to strengths.
- **DC band:** set obstacle DCs at the site's **Level-based DC**, push to **Hard (+2)** for the
  well-defended, add **rarity** for magical security ([../dcs-by-level.md](../dcs-by-level.md)).

---

## 4. The four degrees — IP and Awareness together

Each obstacle check reads on the standard four degrees ([../core-resolution.md](../core-resolution.md)).
Infiltration's signature is that **a check can earn progress *and* raise the alarm at once**:

| Degree | Infiltration Points (IP) | Awareness Points (AwP) |
|---|---|---|
| **Critical Success** | **+2 IP** (or full obstacle progress) | **+0 AwP** (extra-quiet; may grant an **Opportunity**, §7) |
| **Success** | **+1 IP** | **+0 AwP** |
| **Failure** | **+0 IP** | **+1 AwP** — slow, no progress; you drew a little notice |
| **Critical Failure** | **+0 IP** | **+2 AwP** — a clear slip (a dropped tool, a snapped twig, a wrong answer) |

- **Nat 20** bumps a degree up, **nat 1** bumps a degree down — exactly as
  [../core-resolution.md](../core-resolution.md) specifies. A nat-1 success becomes a failure
  (and starts feeding Awareness).
- **No "−IP" on a botch.** Unlike Influence, a crit-fail here doesn't subtract Infiltration
  Points; the cost of failure is **Awareness**, the opposition's pool. This matches the
  Infiltration variant noted in [./victory-points.md](./victory-points.md) §3 ("crit-fail =
  setback, not −VP").
- **Take longer to lower risk:** a PC may spend extra time on an obstacle to take a
  **lower-DC / safer** approach (less Awareness on a miss) at the cost of in-fiction time and the
  clock. Reward patient, well-cased jobs.

---

## 5. Infiltration Points & objectives

IP are **per-objective progress**. Tally IP toward each objective's listed cost; when the cost is
met, that objective is **achieved** — narrate it (the door is open, the ledger is in hand) and move
to the next obstacle/objective.

| State | Meaning |
|---|---|
| IP below an objective's cost | The objective is **in progress** — keep beating its obstacles. |
| IP meets an objective's cost | Objective **achieved**; advance the plan. |
| All objectives achieved **before** the Awareness hard tier | **Infiltration succeeds** — the party gets in, does the job, and gets out unblown. |
| Awareness hard tier hit **first** | **Infiltration fails / goes loud** — see §6. |

Run the operation as a sequence of obstacles; each obstacle is one or more checks that earn IP
toward the current objective. Track per operation: **IP per objective**, **current AwP**,
**obstacles cleared**, **Edges banked/spent**, **complications fired**. Persist to campaign-state
if the job spans sessions.

---

## 6. Awareness Points — the opposition's pool

AwP is the **opposed** pool: it counts **up** against the party (see the opposed-track pattern in
[./victory-points.md](./victory-points.md)). Set its thresholds to the operation's tension:

| AwP reached (example 4 / 8) | The opposition's response |
|---|---|
| Below soft tier | Routine — the place is calm; standard DCs. |
| **Soft tier** (suspicion) | Patrols **double up / sweep more often**, lights come on, obstacle DCs **rise (+1)**, and **new obstacles** may appear. The party can still win, but it's tighter. |
| **Hard tier** (alarm) | **Infiltration ends.** The place locks down: the target escapes/relocates, reinforcements muster — drop into **[../combat.md](../combat.md)** or a **Chase** to escape. |

- **Awareness is usually HIDDEN.** Player ≠ PC knowledge: the AwP number is **felt, not
  announced** — narrate rising tension (a guard pauses, a dog barks, a door you passed is now
  shut) rather than "Awareness is 6." See [../../bridge/system-profile.md](../../bridge/system-profile.md).
- AwP rises mainly from **Failures / Critical Failures** (§4), from **complications** (§8), and
  from **world-tick** patrol ticks on a timed job. Obstacle checks never *lower* AwP on their own
  (a crit success just gives no AwP); AwP only drops via an **Opportunity** or an **Edge** (§7).
- **One soft tier, then a hard tier** is the clean default. A long heist can stack tiers every few
  AwP (suspicion → active search → alarm); per GM Core the standard is a tier **every 5 AwP** with
  DCs climbing cumulatively (+1, then +2…) and the **hard cap usually at twice the total IP needed**.

---

## 7. Edges & opportunities

**Edges** are advantages the party **earns through prep or play** that tilt the operation. They
are the reward for casing the job rather than charging it.

| Edge | How it's earned | What it does |
|---|---|---|
| **Reconnaissance** | a successful Recall Knowledge / Perception / Society / Lore (or a prior scout) | learn an obstacle's DC, skills, or a complication in advance; often a **+1/+2 circumstance** to the relevant check |
| **A bribed / Influenced insider** | an **Influence** win on a gatekeeper ([./influence.md](./influence.md)), or coin | **skip an obstacle**, gain a password, or **−1 AwP** when used |
| **Disguise / cover identity** | Deception (Impersonate), a prepared kit | beat **checkpoint** obstacles with Deception/Society; lowers AwP gain from being seen |
| **The right tool** | thieves' tools, a climbing kit, a forged document, a map | enables / lowers the DC of a specific obstacle |
| **A diversion** | a planted distraction, a second team | **−1 AwP** or a free pass on one obstacle while attention is elsewhere |

- **Opportunities** are *situational* edges that surface mid-run (a guard leaves his post, a window
  is open, a shift change): a **Critical Success** or a Fate Question may grant one. Seize it for a
  bonus or a skipped obstacle, or it passes.
- **Banking prep:** Edges earned in a downtime scene *before* the job carry in. This is where
  scouting, shopping, and social work pay off — front-load Edges, then spend them.
- An Edge generally grants **one of**: a circumstance bonus, a reduced IP cost, a skipped obstacle,
  or an AwP reduction. Don't stack the same Edge twice on one check.

---

## 8. Complications

Friction the GM injects on failure, at thresholds, or when the world-tick turns. Tie a short list
to the operation; fire one and resolve it as a mini-obstacle.

| Trigger | Complication |
|---|---|
| A **Failure / Critical Failure** | **A patrol closes in** — an extra obstacle now, or **+1 AwP**; or a **tool breaks / door jams**. |
| Reaching the **soft Awareness tier** | **Shift change / sweep** — guards reposition; an already-cleared route is watched again. |
| **World-tick** during a timed job | **Time pressure** — a scheduled event (the target leaves, the gate locks at dusk) advances; +1 AwP. |
| A **Fate Question / Mythic Random Event** fires | Interpret the event as the complication for this obstacle (a haunt stirs → [./hauntings.md](./hauntings.md); an NPC arrives → improvise). |
| **Hard tier** | **Discovery** — the alarm goes up; infiltration ends, go to combat/chase. |

If the engine fires a **Mythic Random Event** during an infiltration beat, treat it as that beat's
complication and interpret it through the operation.

---

## 9. The loop an AI GM runs

```
SET UP: list OBJECTIVES (+IP costs) and the OBSTACLES between them; set obstacle DCs
        (§3); set AWARENESS soft/hard tiers (§6); note banked EDGES (§7).
        Record to campaign-state. IP = 0 per objective; AwP = 0.

REPEAT (obstacle by obstacle, until objectives done OR Awareness hard tier):
    1. PC declares an approach to the current obstacle (which skill, what fiction).
    2. Apply EDGES that fit (bonus / reduced cost / skipped obstacle / −AwP) — §7.
    3. Roll (usually SECRET):  dice.py roll 1d20+<mod>  vs the obstacle's DC.
    4. Read the four degrees → award IP and/or AwP (§4).
    5. Fire any COMPLICATION (§8); apply world-tick patrol ticks on a timed job.
    6. Re-check: objective met? (advance). Awareness tier crossed? (escalate, §6).

END:
    all objectives met before hard tier  → infiltration SUCCEEDS (in, done, out clean).
    Awareness hard tier hit first        → DISCOVERED → combat / chase to escape.
```

This is exploration/downtime time, not the three-action turn. The **limiter** is the objective
count plus the Awareness cap (an opposed pool — [./victory-points.md](./victory-points.md) §5);
a *timed* job adds a deadline clock the world-tick advances
([../../bridge/subsystems.md](../../bridge/subsystems.md)).

---

## 10. Mapping to *Season of Ghosts* — the infiltration beats

Run each as a §2 statblock. Stat obstacle DCs at the site's **Level-based DC**, push **Hard (+2)**
for guarded barriers, add **rarity** for magical wards; set a **soft tier** (suspicion) and a
**hard tier** (alarm → combat/chase).

| SoG beat | Objectives & obstacles | Edges / opportunities | Awareness escalation |
|---|---|---|---|
| **The teahouse** (slipping into the back rooms / private floor to overhear or retrieve) | *Reach the back room* → obstacles: a watched main floor (**Stealth/Deception**), a staff-only door (**Thievery/Deception**), a private office (**Thievery** lock). | Recon the staff routine; a friendly server (**Influence** → insider Edge); a cover identity (Impersonate) to pass as staff. | Soft: staff get suspicious, doors are watched. Hard: thrown out / confronted → social fallout or a fight. |
| **The manor** (breaking into a fortified residence — grounds, then the house, then the prize) | *Cross the grounds (3 IP)* → *Enter the house (3 IP)* → *Reach the target room & take the prize (4 IP)* → *Exit clean (2 IP)*. Obstacles: wall/gate (**Athletics/Thievery**), patrolling guards (**Stealth**), interior locks (**Thievery**), a study/vault (**Thievery + Perception**). | Cased layout (recon Edge → known patrol timing); a bribed gate guard; the right tools; a diversion to thin the patrol. | Soft: guards double, dogs out, interior DCs +1, new patrols. Hard: house alarm → lockdown → **[../combat.md](../combat.md)** or a **Chase** out. |
| **The Silkwasp camp** (penetrating a hostile encampment — perimeter, then a specific tent/captive/cache) | *Breach the perimeter (3 IP)* → *Move through the camp unseen (4 IP)* → *Reach the objective tent — free a captive / take the cache / plant evidence (4 IP)* → *Withdraw (2 IP)*. Obstacles: sentries & watchfires (**Stealth/Deception**), open lanes between tents (**Stealth**, Create a Diversion), a guarded tent (**Thievery/Athletics**), challenge by a patrol (**Deception/Intimidation/Society**). | Approach under cover of dark/weather (Edge); a captured password or sign (**Society**/recon); a haunt or the camp's own dread as cover/complication ([./hauntings.md](./hauntings.md)). | Soft: camp rouses, sentries sweep, a horn readied. Hard: the camp turns out in force → **[../combat.md](../combat.md)** (a pitched fight you likely can't win) or a **Chase** to flee. |

**Running it operationally:**
- **Front-load Edges:** scout, shop, and run **Influence** on a gatekeeper *before* the job —
  banked Edges are the difference between a clean job and a bloody one.
- **Nest other subsystems:** learning a secret inside is **Research** ([./research.md](./research.md));
  a haunt-warded site triggers **Hauntings** ([./hauntings.md](./hauntings.md)); getting caught
  drops you into **[../combat.md](../combat.md)** or a **Chase**; a discovered infiltration can
  ding **Reputation** ([./reputation.md](./reputation.md)).
- **Roll Awareness secret.** The party should feel the camp/manor/teahouse tightening around them
  without seeing the number — narrate the closing net, tick AwP honestly behind the screen.
- A **timed** beat (the target leaves at dawn, the gate locks at dusk) hands the limiter to the
  **world-tick** ([../../bridge/subsystems.md](../../bridge/subsystems.md)) so the deadline arrives
  on schedule whether or not the party is rolling.

> Player ≠ PC knowledge is the heart of infiltration: roll obstacle and Awareness checks
> **secret**, award IP/AwP behind the screen, and narrate only what the PCs could perceive. Never
> announce "you tripped the alarm at AwP 8" — show the guard's head turning.

---

## See also

- [../core-resolution.md](../core-resolution.md) — the d20 check and four degrees of success
- [./victory-points.md](./victory-points.md) — the opposed point-track chassis (Edge vs Awareness)
- [../skills.md](../skills.md) — Stealth (Sneak/Hide/Avoid Notice), Thievery, Deception (Impersonate/Create a Diversion), Athletics
- [../dcs-by-level.md](../dcs-by-level.md) — Level-based DCs, the Hard band, rarity adjustments for warded obstacles
- [./influence.md](./influence.md) — winning over a gatekeeper to earn an insider Edge (and its separate "IP")
- [./research.md](./research.md) — learning a secret *inside* the infiltrated site over time
- [./hauntings.md](./hauntings.md) — magical wards / haunts as obstacles or complications
- [./reputation.md](./reputation.md) — fallout when an infiltration is discovered
- [../combat.md](../combat.md) — what happens when an infiltration goes loud
- [../../bridge/subsystems.md](../../bridge/subsystems.md) — the world-tick that advances timed-job deadlines & patrols
- [../../bridge/system-profile.md](../../bridge/system-profile.md) — statting + the Player ≠ PC knowledge seam for hidden Awareness
