# Influence — Social Encounters Over Rounds (PF2e Subsystem)

A structured **social combat**: across a fixed number of **rounds**, the party accumulates
**Influence Points (IP)** against each NPC's **Influence thresholds** by making the right skill
checks at that NPC's **Influence DC**. This is *not* a single Diplomacy roll — it is a multi-
round system from **GM Core** (legacy: *Gamemastery Guide* "Influence"), used heavily across
*Season of Ghosts* to win over the notables of Willowshore.

Resolution itself (d20 + four degrees) lives in [../core-resolution.md](../core-resolution.md);
how to read attitude into long-term town standing lives in [./reputation.md](./reputation.md).

> **Every check runs through the engine — never invent a result:**
> `python3 .claude/skills/mythic-gm/scripts/dice.py roll 1d20+<mod>`
> Pick the DC from the NPC's statblock below, roll, then read the degree of success.

---

## 1. When to use Influence vs. a single check

| Situation | Use |
|---|---|
| One quick favor / a single moment of persuasion | a lone **Diplomacy** action (Make an Impression, Request — see [../skills.md](../skills.md)) |
| Winning someone over **across a scene/event**, with a deadline and multiple approaches | **Influence subsystem** (this file) |
| Long-term **town/faction standing** between encounters | **Reputation** ([./reputation.md](./reputation.md)) |

A single Make an Impression check moves **attitude** one step. Influence is the *campaign-scale*
version: the same fiction, but tracked in points across rounds so several skills, several PCs,
and several approaches all contribute to one NPC's eventual disposition.

---

## 2. The NPC's Influence statblock

Every Influence target is defined by these fields. Stat them once, before the encounter, and
record to campaign-state.

| Field | What it is |
|---|---|
| **Perception** | used for the **Discover** action's DC (see §4) |
| **Will** | the NPC's mental defense; informs the Influence DC band |
| **Influence DC** | the DC to **gain** Influence Points (the "Influence" action, §5). Usually a Level-based DC for the NPC's level, often **Hard (+2)** for a guarded notable |
| **Discovery DCs** | a small list keyed to specific skills (e.g. *Society DC 18, Diplomacy DC 20*) that reveal facts when met (§4) |
| **Influence thresholds** | the IP totals that unlock outcomes — e.g. **4 / 8 / 12** → minor / solid / total support |
| **Resistances** | skills/approaches that are **harder**: take a **penalty** to the Influence check (e.g. "Resistance 2 to Intimidation") |
| **Weaknesses** | skills/approaches that are **easier**: a **bonus** or **+IP** when used (e.g. "+2 circumstance, or +1 IP, when you flatter their lineage") |
| **Bias / motivation** | the lever (pride, fear, family, gold) — found via Discover; using it is the Weakness |
| *(optional)* **Penalties** | named missteps that *cost* IP or worsen attitude (e.g. "mention the curse → −1 IP and one attitude step down") |

> If you don't have a published statblock, build one fast: pick the NPC's **level**, read its
> **Level-based DC** and **Will/Perception** from the creature benchmarks in
> [../dcs-by-level.md](../dcs-by-level.md), set the Influence DC to that Level-based DC (Hard
> +2 for the cagey), and choose thresholds from §6. Statting workflow + the Diminisher:
> [../../bridge/system-profile.md](../../bridge/system-profile.md).

---

## 3. The round structure (what an AI GM runs)

An Influence encounter has a **time limit in rounds** (the event's length — a banquet, a town
meeting, one evening). Each round, each participating PC may take **one** Influence-subsystem
action below (this is the social analogue of a turn — it is *not* the three-action economy;
one action per character per round here).

```
FOR each round (1 .. round_limit):
    FOR each PC present:
        choose ONE:
          • DISCOVER  — learn the NPC's bias / a Discovery DC fact (§4)
          • INFLUENCE — skill check vs Influence DC to gain IP (§5)
          • (roleplay / other social action — GM adjudicates, may grant circumstance bonus)
    Apply any NPC reactions, penalties, or scene events (Mythic Random Event if the
      engine fires one).
    Re-check thresholds (§6); if a threshold is newly crossed, narrate the unlock.
WHEN rounds exhausted (or NPC leaves): final IP total sets the outcome (§6).
```

Track per NPC: **current IP**, **rounds remaining**, **facts discovered**, **known weaknesses/
resistances**, **current attitude**. Persist this to campaign-state between scenes if the event
spans sessions.

---

## 4. The Discover action

Learn what makes the NPC tick — their **bias, weakness, or a usable fact** — so later Influence
checks land harder.

- **Roll:** a skill check (often **Perception**, **Society**, or a relevant **Recall Knowledge**
  / **Lore**) vs the NPC's listed **Discovery DC** for that skill (or vs the NPC's **Perception
  DC** for reading them socially). This is typically a **secret check** — apply
  **Player ≠ PC knowledge**.
- **Outcomes (four degrees):**

| Degree | Result |
|---|---|
| **Critical Success** | Reveal **two** pieces of info (e.g. a weakness *and* a resistance to avoid), or one weakness plus a bonus tidbit. |
| **Success** | Reveal **one** piece of info — a weakness, a resistance, or a bias. |
| **Failure** | Learn nothing this round. |
| **Critical Failure** | Learn **false** info, or the NPC notices the prying → may impose a **penalty** / worsen attitude. |

Discovering a **weakness** is what lets you trigger it on the Influence action (§5). Discovering
a **resistance** lets you *avoid* the penalty by not using that approach. Discovery costs a round
but pays off across all remaining rounds — front-load it.

---

## 5. The Influence action

The point-scoring action: a skill check **vs the NPC's Influence DC** to gain **IP**.

- **Roll:** any skill the PC can justify as an *approach* — Diplomacy (reason/charm),
  Intimidation (pressure), Deception (flattery/lies), Performance (impress), Society
  (shared status), a relevant **Lore**, even Medicine or Crafting if the fiction supports it.
- **Apply weaknesses & resistances first** (they modify *this* check):

| Modifier | Effect on the Influence check |
|---|---|
| Using a discovered **weakness** | bonus to the check (commonly **+2 circumstance**) **or** **+1 IP** on success — per the statblock |
| Using a skill the NPC **resists** | **penalty** to the check (commonly **−2**, or the listed Resistance value) |
| Using an approach the NPC **dislikes** (a named misstep) | a defined **penalty** — often **−1 IP** and/or an attitude step down |

- **Outcomes (four degrees):**

| Degree | IP gained |
|---|---|
| **Critical Success** | **+2 IP** (+ any weakness bonus IP) |
| **Success** | **+1 IP** |
| **Failure** | **+0 IP** |
| **Critical Failure** | **−1 IP** and/or the NPC turns colder — may lock out that PC/skill for the rest of the encounter |

Wrong approaches don't just fail — a Critical Failure or a flagged misstep can **subtract IP**
and burn a round, so Discover before you push hard.

---

## 6. Influence thresholds & outcomes

The final (or running) IP total is read against the NPC's thresholds. Thresholds scale with how
hard the NPC is to sway; a 5-round event for a guarded notable might use **4 / 8 / 12**.

| IP reached | Typical outcome |
|---|---|
| Below first threshold | No help; NPC unmoved or annoyed. |
| **1st threshold** | Minor concession — a small favor, a hint, lukewarm goodwill. |
| **2nd threshold** | Solid support — meaningful aid, an introduction, a resource. |
| **3rd threshold** | Full backing — the NPC commits, opens doors, takes risks for the party. |

Set thresholds by event length: roughly **rounds ÷ 2**, **rounds**, and **rounds × 1.5** for a
party of several PCs, scaling down for fewer participants. Crossing a threshold mid-encounter
should be narrated immediately (the NPC visibly warms).

---

## 7. Attitude steps (the disposition track)

Influence outcomes also move the NPC along the standard **attitude ladder** — the same five
steps Make an Impression and Request use:

```
Hostile  →  Unfriendly  →  Indifferent  →  Friendly  →  Helpful
(worst)                    (default)                    (best)
```

- Hitting a higher threshold tends to **step attitude up**; a Critical Failure or a flagged
  misstep can **step it down**.
- Attitude gates **Request** (see [../skills.md](../skills.md)): an *Indifferent* NPC grants
  little, a *Friendly* one grants normal favors, a *Helpful* one grants more and at lower risk;
  a *Hostile* NPC won't deal at all.
- IP is the *encounter-scale* meter; attitude is the *resulting disposition* you carry forward.
  Feed the final attitude into **Reputation** for the town-wide ledger
  ([./reputation.md](./reputation.md)).

---

## 8. Mapping to *Season of Ghosts* — winning over Willowshore

The module is dense with social beats; almost every "win over a notable" arc is an Influence
encounter. Run them like this:

| Beat | Influence framing |
|---|---|
| Winning a Willowshore notable to your side (a councilor, the temple, a guild head) | One Influence encounter; **Discover** their bias (Act 1 daily-loop info is gold here), then **Influence** with the matching approach over the event's rounds. |
| A festival, town meeting, funeral, or banquet | The **round limit** = the event's duration; several notables present at once → run parallel IP tracks, one per NPC. |
| Rallying the town to **prepare its defense** (Acts 2–3) | Influence successes can feed **Preparation Points** — coordinate with [./downtime.md](./downtime.md) ("Preparing Willowshore"). |
| Long-term standing across the season | Roll each notable's resulting **attitude** into **Northridge / Southbank Reputation** ([./reputation.md](./reputation.md)); the world-tick "Willowshore Reputation" row fires on these swings ([../../bridge/subsystems.md](../../bridge/subsystems.md)). |

**Statting a Willowshore notable on the fly:** pick their level (most are low — L0–L3), read
the **Level-based DC** and **Will/Perception** from [../dcs-by-level.md](../dcs-by-level.md),
set **Influence DC = that DC (often +2 Hard)**, give **2–3 Discovery DCs** tied to obvious
skills, name **one weakness** (their pride/fear/loved-one) and **one resistance** (the approach
that offends them), and choose **thresholds** per §6. Record it to setting-canon live state so
later scenes remember it.

> Player ≠ PC knowledge: Discover is usually **secret**. Roll it through `dice.py`, read the
> degree, but narrate only what the PC could plausibly perceive — never leak the raw weakness
> list before it's been earned.

---

## See also

- [../core-resolution.md](../core-resolution.md) — the d20 check and four degrees of success
- [../skills.md](../skills.md) — Make an Impression, Request, and which skill fits which approach
- [../dcs-by-level.md](../dcs-by-level.md) — Level-based DCs, Hard/Very Hard bands, NPC benchmarks
- [./reputation.md](./reputation.md) — carrying attitude into Northridge/Southbank standing
- [./downtime.md](./downtime.md) — Preparation Points for the Willowshore defense
- [../../bridge/system-profile.md](../../bridge/system-profile.md) — NPC statting + the Player ≠ PC knowledge seam
- [../../bridge/subsystems.md](../../bridge/subsystems.md) — the world-tick that advances Reputation
