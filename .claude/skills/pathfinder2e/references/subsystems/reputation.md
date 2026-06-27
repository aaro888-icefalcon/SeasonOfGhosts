# Reputation — Per-NPC Attitude + Faction/Settlement Standing (PF2e Subsystem)

How the world *feels* about the party, on two layers that feed each other:

1. **Per-NPC attitude** — where one individual sits on the **Hostile → Helpful** ladder, and how
   single checks (Make an Impression, Request, Aid) and the [Influence](./influence.md) subsystem
   move them.
2. **Group / Settlement Reputation** — a persistent **Victory-Point ledger** (the standard PF2e
   **Reputation** subsystem from **GM Core**; legacy: *Gamemastery Guide* "Reputation", a.k.a. the
   *Renown* family). *Season of Ghosts* runs **three** ledgers in parallel: **Northridge**,
   **Southbank**, and an overall **Willowshore** standing. Named tiers gate town support (cheaper
   services, allies, "location support" benefits) or impose penalties.

The point engine under layer 2 is the [Victory Points](./victory-points.md) template — Reputation
is "a VP ledger with **no limiter** and **degradation on hostile acts**." Resolution itself
(d20 + four degrees) lives in [../core-resolution.md](../core-resolution.md); DCs in
[../dcs-by-level.md](../dcs-by-level.md).

> **Every check runs through the engine — never invent a result:**
> `python3 .claude/skills/mythic-gm/scripts/dice.py roll 1d20+<mod>`
> Roll the social check, read the degree, then move attitude (layer 1) and/or award Reputation
> Points (layer 2).

---

## 1. Layer 1 — Per-NPC attitude

Every NPC sits on the five-step **attitude ladder**. This is the moment-to-moment disposition that
gates what they'll do for the party *right now*.

```
Hostile  →  Unfriendly  →  Indifferent  →  Friendly  →  Helpful
(worst)                    (default)                    (best)
```

| Attitude | What it means at the table |
|---|---|
| **Hostile** | Actively wants the party harmed/gone; won't deal. Combat-adjacent. |
| **Unfriendly** | Dislikes/distrusts; refuses most requests, may obstruct. |
| **Indifferent** | Neutral — the **default** for a stranger. Grants only easy, low-cost favors. |
| **Friendly** | Likes the party; grants normal favors, gives the benefit of the doubt. |
| **Helpful** | Will go out of their way, take risks, grant big favors at low cost. |

> *Season of Ghosts* default: **most townsfolk start Indifferent.** Tengu PCs draw **jorogumo
> animosity** (start a step lower with jorogumo-aligned NPCs) — see
> [../../bridge/bridge.md](../../bridge/bridge.md).

### 1.1 Checks that shift attitude one step

| Action | Roll | Effect on attitude |
|---|---|---|
| **Make an Impression** (Diplomacy, 1 min) | vs target **Will DC** | Crit Success **+2 steps** · Success **+1** · Failure no change · Crit Fail **−1**. The shift lasts until the NPC has reason to reconsider (often the rest of the conversation/day). |
| **Coerce** (Intimidation, ~1 min) | vs target **Will DC** | Success → temporarily **Unfriendly** + complies; Crit Fail → **Hostile** and won't be coerced again. Fear-based, brittle, and feeds *negative* faction Reputation. |
| **Request** (Diplomacy, 1 action) | vs a DC the GM sets by favor size | Doesn't itself move attitude on Success; **Crit Fail** drops attitude **one step** and they refuse. Gated by current attitude (see 1.2). |
| **Aid / good deeds in fiction** | GM adjudicates | A meaningful kindness can justify a free step up; a betrayal, a step (or more) down. |

> The full action stat lines (traits, time, scaling) live in [../skills.md](../skills.md)
> (Make an Impression, Request, Coerce). Make an Impression is also the **single-check** basis of
> the [Influence](./influence.md) subsystem — see 1.3.

### 1.2 Attitude gates Request

What an NPC will grant on a successful **Request** depends on where they sit:

| Current attitude | Will they deal? | Favor ceiling |
|---|---|---|
| Hostile | No. | — |
| Unfriendly | Rarely; hard DC, small asks only. | Trivial |
| Indifferent | Yes, but cautious. | Small / low-risk |
| Friendly | Yes, normally. | Normal favors |
| Helpful | Yes, generously. | Big favors, low cost, will take risks |

### 1.3 Single check vs. the Influence subsystem

| Situation | Use |
|---|---|
| One quick favor / a single persuasive moment | a lone **Make an Impression** or **Request** (this file, 1.1) |
| Winning someone over **across a scene/event** with a deadline and several approaches | the **[Influence](./influence.md)** subsystem (points across rounds) |
| Long-term **town / faction** standing between encounters | **Reputation**, layer 2 below |

A single Make an Impression nudges one NPC one step. Influence is the campaign-scale version of the
same fiction. **The resulting attitude is what you carry forward into layer 2** — winning a notable
to *Helpful* is exactly what rolls a faction's Reputation Points up.

---

## 2. Layer 2 — Group / Settlement Reputation (the VP ledger)

A **persistent score** per faction/settlement, on the standard PF2e Reputation track. Unlike
Influence (round-limited) or Research (clock-limited), Reputation has **no limiter** — it is a
running ledger that lasts the whole campaign, moving up when the party helps a group and **down**
when it harms one.

It is a [Victory Points](./victory-points.md) track with these dials set:

| VP field | Reputation's setting |
|---|---|
| **Pool** | Reputation Points (RP) — **one ledger per faction** (Northridge, Southbank) + an overall Willowshore score |
| **Check & DC** | usually **no roll to bank it** — RP is *awarded by the GM for fictional deeds*; where a check is involved it's the social/quest check that earned the deed |
| **Award** | by deed weight, not a degree table (see 2.2) — small deed ±1, notable ±2, major ±3 |
| **Thresholds** | named **tiers** with point bands (see 2.3) |
| **Limiter** | **none** — persistent ledger |
| **Degradation** | **on hostile acts** — harming a faction subtracts RP (and can subtract from the *other* faction's view too) |

### 2.1 The two-faction structure (Northridge vs. Southbank)

Willowshore's two districts/factions are perpetually at odds (their bickering is a live setting
tension — [../../bridge/bridge.md](../../bridge/bridge.md),
[setting-canon.md](../../bridge/setting-canon.md) is ground truth). Track them **separately**:

| Ledger | Tracks |
|---|---|
| **Northridge RP** | standing with the Northridge faction and its notables |
| **Southbank RP** | standing with the Southbank faction and its notables |
| **Willowshore RP** | overall village standing (heroism the whole town witnesses — saving everyone, public victories) |

> **Tension rule — pleasing one can strain the other.** Many deeds are zero-sum between the
> districts. Taking a side in a Northridge/Southbank dispute, or championing one district's
> interest at the other's expense, **raises one ledger and may lower the other.** This is the
> *Season of Ghosts* "**Teeth-Clenching Teamwork**" beat: the party must keep two feuding factions
> cooperating, and visibly favoring either side costs goodwill on the far bank. Deeds that help the
> **whole** village (the Willowshore ledger) avoid the trade-off and are the safest way to raise
> overall standing.

### 2.2 Awarding & losing Reputation Points

Award by deed weight, not by die degree. Apply to the ledger(s) the deed touches.

| Deed | RP change |
|---|---|
| Small favor / errand / a notable won to **Friendly** | **+1** to that faction |
| Notable service / public good / a notable won to **Helpful** | **+2** |
| Major heroism (avert a disaster, save lives, win a defense) | **+3** (often to **Willowshore** + a faction) |
| Minor offense / broken promise / public rudeness | **−1** |
| Serious harm (theft from, betrayal of, Coercing a faction's people) | **−2** |
| Atrocity against the faction (a death, a sacking, siding openly with its enemy) | **−3**, and likely **+/−** on the rival ledger |

> **Degradation is intrinsic, not per-tick.** Reputation does **not** decay on a timer (unlike a
> deadline track). It only moves on *deeds*. Friendly/helpful play is sticky; harm is what reverses
> it. Never erode RP just because time passed.

### 2.3 Reputation tiers (named thresholds)

The standard PF2e Reputation tiers, by accumulated points per ledger. Read the current band to
know what that faction does for (or to) the party:

| RP total | Tier | What it unlocks |
|---:|---|---|
| **−30 or worse** | **Hated** | Faction is **Hostile**: refuses service, may attack/expel; allies turn away. |
| **−29 … −15** | **Hostile (Hated→Unfriendly)** | Obstruction, inflated prices, refused favors; doors shut. |
| **−14 … −3** | **Unfriendly** | Cold; only grudging, costly dealings. |
| **−2 … +14** | **Ignored / Neutral** | The default. Normal prices, no special help, no penalty. |
| **+15 … +29** | **Liked / Admired** | Warm. **Cheaper services** (favorable prices), small standing favors, the odd **ally** lending a hand. |
| **+30 or more** | **Revered / Famous** | Faction is **Helpful** to the town: discounted/free key services, reliable **allies**, **location "support" benefits** unlocked (see 2.4). |

> These bands match the published Reputation tiers' shape (a symmetric −/+ ladder centered on a
> wide neutral band). The numbers above are the operational defaults for this engine — if a
> published *Season of Ghosts* table gives specific tier points for a given faction, that table in
> [setting-canon.md](../../bridge/setting-canon.md) **overrides** these. Don't invent extra tiers.

### 2.4 What the tiers actually buy — town support & "location support"

Crossing into a positive tier turns standing into **mechanical support**. Narrate the unlock the
moment a ledger crosses a threshold.

| Support type | Trigger | Effect |
|---|---|---|
| **Cheaper services** | Liked+ with a faction | Favorable prices on goods/lodging/healing from that district; a discount or a freebie at Revered. |
| **Allies** | Liked+ (reliable at Revered) | A faction NPC lends aid — an extra hand in a fight, intel, an escort, a witness. |
| **Location "support" benefits** | a **notable made Helpful** *or* the controlling faction reaching Liked+ | A specific Willowshore location grants an ongoing benefit when the party uses it — e.g. the temple offers free recovery, the smith reserves stock, a shop becomes a safehouse. This is the AP's "**a helpful NPC unlocks that location's support**" note: turning the person who runs a place to **Helpful** switches on that place's standing benefit. |
| **Preparation Points** | high standing during the defense (Acts 2–3) | A trusting town pitches in: faction goodwill feeds **Preparation Points** for the Willowshore defense — see [./downtime.md](./downtime.md) and 3 below. |
| **Penalties** | Unfriendly− with a faction | Inflated prices, refused service, obstruction, lost informants; Hostile escalates to expulsion or violence. |

---

## 3. Mapping to *Season of Ghosts*

| Beat | Reputation framing |
|---|---|
| **Per-NPC attitude (Act 1 daily loop)** | Track each notable's attitude (1.1). The looping day lets the party learn levers and re-attempt Make an Impression — bank that into the right faction ledger once it sticks. |
| **Winning a notable via [Influence](./influence.md)** | The Influence encounter's **final attitude** is the input to layer 2: a notable raised to **Helpful** is **+2** to their faction *and* flips that person's **location support** on (2.4). |
| **Northridge vs. Southbank disputes — "Teeth-Clenching Teamwork"** | Keep both ledgers up by favoring the **whole town**; taking a side trades RP between the banks (2.1). Use the **Willowshore** ledger for cross-faction heroism. |
| **Public heroism / saving the village** | **+3 Willowshore RP** (and usually both faction ledgers), driving the town toward Liked/Revered and the support benefits in 2.4. |
| **Coercion, theft, taking sides badly, leaving people to die** | Subtract RP (2.2); a faction sliding to Unfriendly/Hostile shuts off services and informants — felt in later acts. |
| **The defense (Acts 2–3)** | High faction standing converts to **Preparation Points** and **allies on the wall** — coordinate with [./downtime.md](./downtime.md) ("Preparing Willowshore"). |

### 3.1 The world-tick

The bridge's **world-tick** advances Reputation **on trigger** (when a PC action helps/harms/sways a
faction or notable), not on a fixed clock: it adjusts Northridge/Southbank RP and per-NPC attitude,
checks threshold effects (newly unlocked support, newly triggered hostility), and records to
setting-canon live state — see [../../bridge/subsystems.md](../../bridge/subsystems.md) ("Willowshore
Reputation" row).

### 3.2 What to persist to campaign-state

After any scene that moved standing, record: **Northridge RP**, **Southbank RP**, **Willowshore RP**,
each ledger's **current tier**, any **support benefits unlocked** (which location, what effect), and
**per-NPC attitude** for every named notable interacted with. Persist so later scenes — and the
world-tick — stay consistent.

> **Player ≠ PC knowledge:** the *exact* RP number is GM bookkeeping. Narrate it as felt social
> reality — warmer greetings, a discount offered, a door that no longer opens — not as a printed
> score. See [../../bridge/system-profile.md](../../bridge/system-profile.md).

---

## Edition note

Remaster **GM Core** "Reputation" and "Influence" are the primary references. Legacy (2019)
equivalents are in the *Gamemastery Guide* under the same names ("Reputation" / "Influence" /
"Victory Points"); the *Renown* mechanic in older organization-play material is the same point-tier
idea. The attitude ladder, the four degrees, DCs, and the three-action economy are identical across
editions — only some surrounding terminology differs.

---

## See also

- [../core-resolution.md](../core-resolution.md) — the d20 check and four degrees of success
- [../skills.md](../skills.md) — Make an Impression, Request, Coerce, Aid (the attitude-shifting actions)
- [../dcs-by-level.md](../dcs-by-level.md) — Will DCs and Level-based DCs for the social checks
- [./influence.md](./influence.md) — winning a notable over a scene; its final attitude feeds this ledger
- [./victory-points.md](./victory-points.md) — the point-track template Reputation specializes
- [./downtime.md](./downtime.md) — Preparation Points the town's goodwill feeds during the defense
- [../../bridge/subsystems.md](../../bridge/subsystems.md) — the world-tick "Willowshore Reputation" trigger
- [../../bridge/setting-canon.md](../../bridge/setting-canon.md) — ground truth for Northridge/Southbank, notables, location support
- [../../bridge/system-profile.md](../../bridge/system-profile.md) — statting + the Player ≠ PC knowledge seam
