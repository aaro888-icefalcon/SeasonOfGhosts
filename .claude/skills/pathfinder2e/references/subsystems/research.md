# Research — Investigation as a Structured Subsystem (PF2e Subsystem)

A way to run an **investigation** — a library, an archive, a knowledgeable witness, a haunted
ruin's records — as accumulated progress rather than one Recall Knowledge roll. The party
spends **time** to make **Research checks** (Lore, Occultism, Religion, Society, etc.) against
a **Research DC**; successes earn **Research Points (RP)**; crossing **RP thresholds** unlocks
**tiers** of knowledge. From **GM Core** (legacy: *Gamemastery Guide* "Research"), it is the
backbone of every long mystery beat in *Season of Ghosts* — uncovering the looping curse, the
nindoru's nature, and the monastery's buried history.

Resolution itself (d20 + four degrees) lives in [../core-resolution.md](../core-resolution.md);
which skill fits which topic lives in [../skills.md](../skills.md); DCs by level in
[../dcs-by-level.md](../dcs-by-level.md).

> **Every check runs through the engine — never invent a result:**
> `python3 .claude/skills/mythic-gm/scripts/dice.py roll 1d20+<mod>`
> Pick the Research DC (§2), roll, read the degree of success (§4), award RP, re-check tiers.

---

## 1. When to use Research vs. a single check

| Situation | Use |
|---|---|
| One fact, recalled on the spot | a lone **Recall Knowledge** action ([../skills.md](../skills.md)) |
| A mystery uncovered **over time** through study/searching, with layered reveals | **Research subsystem** (this file) |
| Persuading a person across a scene to *give up* what they know | **Influence** ([./influence.md](./influence.md)) — then the *facts* they yield feed Research tiers |
| A timed search of a hostile location (avoid notice) | **Infiltration** ([./infiltration.md](./infiltration.md)); Research can run inside it |

Recall Knowledge answers "what do I already know?" Research answers "what can I learn if I
**dig**?" — and it rewards multiple skills, multiple sessions, and patience.

---

## 2. The Research topic statblock

Stat each investigation once, before play, and record it to campaign-state. A topic = a
**library/source** with these fields.

| Field | What it is |
|---|---|
| **Research DC** | the DC for a Research check. Default = the **Level-based DC** for the topic's level (the depth/obscurity of the secret), often **Hard (+2)** for a guarded truth, plus **rarity** (Uncommon +2, Rare +5) for esoteric lore. See [../dcs-by-level.md](../dcs-by-level.md). |
| **Applicable skills** | the skills that can make progress here, each with its own DC if they differ — e.g. *Occultism (DC 20), Religion (DC 20), Library Lore (DC 18), Academia Lore (DC 18)*. Off-list skills are **harder or barred**. |
| **RP thresholds** | the cumulative RP totals that unlock each **knowledge tier** — e.g. **5 / 10 / 15** → surface / substance / secret. |
| **Knowledge tiers** | the actual reveals unlocked at each threshold (write the prose the GM narrates). Tier 1 is freely findable; the top tier is the buried truth. |
| **Time increment** | how long one Research check takes — typically **1 hour, a half-day, or a full day**, depending on the source (a shelf vs. a sprawling archive). |
| **Max RP / depletion** | the cap: once the source is exhausted (top tier reached, or RP maxed), no more progress here — go to a *different* source. |
| **Events** | a short list of complications keyed to RP totals or failures (§5). |
| *(optional)* **Special gates** | a tier that needs a **key** first — a translated text, a found relic, a name learned elsewhere — before its RP can be earned. |

> No statblock to hand? Build one fast: pick the secret's **level** (how deep it's buried),
> read the **Level-based DC** from [../dcs-by-level.md](../dcs-by-level.md), set Research
> DC = that (+2 Hard / +rarity for occult or hidden lore), list **2–4 skills** that fit the
> source, choose **3 tiers** (5/10/15 for a meaty mystery; 3/6/9 for a small one), and write
> the reveal for each. Statting workflow: [../../bridge/system-profile.md](../../bridge/system-profile.md).

---

## 3. The loop an AI GM runs

A Research effort is a sequence of **time increments**. Each increment, each PC present makes
**one Research check** (or assists). This is *exploration/downtime time*, not the three-action
turn — track the in-fiction clock, because Research **costs days the antagonists also use**
(see §7).

```
WHILE the topic is not exhausted AND the PC keeps researching:
    Advance the in-fiction clock by the topic's TIME INCREMENT.
    FOR each researching PC:
        choose a skill from the topic's APPLICABLE skills.
        Research check  →  dice.py roll 1d20+<mod>  vs that skill's Research DC.
        Read the four degrees → award RP (§4).
    Total RP; if a new THRESHOLD is crossed, unlock & narrate that TIER (§6).
    Check EVENTS (§5): a complication may fire on this increment.
    If max RP reached or top tier unlocked → topic EXHAUSTED; move to another source.
```

Track per topic: **current RP**, **tiers unlocked**, **time spent**, **skills already used**,
**any gate keys obtained**, **events fired**. Persist to campaign-state between scenes — a long
mystery spans many sessions.

---

## 4. The Research check & RP

A skill check **vs the topic's Research DC** for that skill. Common skills, with the SoG topics
each fits:

| Skill | Good for (per [../skills.md](../skills.md)) |
|---|---|
| **Library Lore** | navigating archives/stacks efficiently — the meta-skill of *finding* the right text |
| **Academia Lore** | scholarship, schools, treatises, recorded history |
| **Society** | local history, customs, settlements, organizations, languages — Willowshore's records |
| **Occultism** | **the primary skill for ghosts** — spirits, hauntings, the esoteric, mindscapes; central to SoG ([../skills.md](../skills.md)) |
| **Religion** | the dead/afterlife/*Sangpotshi*, divine creatures, temple records — pairs with Occultism on ghost lore |
| **Arcana / Nature / Crafting / Medicine** | when the source is magical, natural, made, or a body/wound |
| **a narrow Lore** (*Willowshore Lore, Sangpotshi Lore, Spirit Lore*) | a tightly-matched source — often a **lower DC** or **+RP** because it's exactly on-topic |

- **Most Research checks are SECRET** (the GM rolls; narrate by Player ≠ PC knowledge) — the
  PC shouldn't know whether a fruitless hour means "nothing here" or "you missed it."
- **RP by degree:**

| Degree | RP gained |
|---|---|
| **Critical Success** | **+2 RP** (and may reveal a bonus detail, or skip a gate) |
| **Success** | **+1 RP** |
| **Failure** | **+0 RP** — the time is still spent |
| **Critical Failure** | **+0 RP**, and an **event** fires (§5) — bad lead, lost time, or notice drawn |

- **Aid / assist:** a second PC can Aid (a prep check vs DC 15, adjusted) to grant a
  circumstance bonus to the lead researcher's check — see [../skills.md](../skills.md).
- **A matched narrow Lore** (e.g. *Willowshore Lore* on the village's own history) may, per the
  topic statblock, get **−2 DC** or **+1 RP on success** — reward the right tool.

---

## 5. Research events (complications)

Research isn't free of friction. Tie a short event list to the topic; fire one on a **Critical
Failure**, on reaching certain RP, or when the world-tick says the clock has turned. Examples to
draw from (the GM picks or rolls):

| Trigger | Event |
|---|---|
| Critical Failure | **False lead** — a tier's reveal is *wrong* until corrected by a later success; or a wasted day (advance the curse/enemy clock, §7). |
| Critical Failure in a hostile/watched place | **Notice** — someone learns the party is digging; feed an **Influence** resistance, a **Reputation** ding, or an enemy move ([./reputation.md](./reputation.md), [../../bridge/subsystems.md](../../bridge/subsystems.md)). |
| Mid-tier RP | **A gate appears** — the next tier needs a key (a translation, a relic, a name) found elsewhere before its RP can be earned. |
| Any increment, by Fate Question | **A haunt stirs** — the studied subject reacts; run [./hauntings.md](./hauntings.md). The act of researching ghosts can *wake* them. |
| Top tier | **The truth costs something** — the final reveal is also a danger (the curse notices it's been seen). Player ≠ PC knowledge until earned. |

If the engine fires a **Mythic Random Event** during a Research increment, treat it as the
event for that increment and interpret it through the topic.

---

## 6. RP thresholds & knowledge tiers

The running RP total unlocks tiers in order. Narrate each the moment it's crossed.

| RP reached (example 5 / 10 / 15) | Tier unlocked |
|---|---|
| Below tier 1 | Nothing usable yet — only the question, sharpened. |
| **Tier 1 (surface)** | The public/obvious layer — what any diligent search turns up. A foothold and the next lead. |
| **Tier 2 (substance)** | The real shape of it — names, dates, mechanism, a usable advantage (a weakness, a ritual step, a true history). |
| **Tier 3 (secret)** | The buried truth — the spoiler-grade revelation that reframes the mystery and often unlocks a way to *act* on it. |

Set thresholds by depth: a small mystery uses **3 / 6 / 9**, a season-spanning one **5 / 10 /
15** or more. A higher tier may be **gated** (§5) regardless of RP. Once the top tier is
unlocked the source is **exhausted** — further answers need a *new* source (a different
archive, a witness via [./influence.md](./influence.md), or a haunt confronted directly).

---

## 7. Time cost & the clocks (why Research is risky in SoG)

Research **spends in-fiction time**, and in *Season of Ghosts* time is contested:

- Each increment (hour / half-day / day) **advances the world-tick clocks** — the hidden
  **Willowshore Curse / mindscape-decay clock** and **enemy faction moves** both tick on a
  cadence ([../../bridge/subsystems.md](../../bridge/subsystems.md)). A higher curse clock
  raises **haunt odds** ([./hauntings.md](./hauntings.md)) and enemy boldness.
- So a slow investigation (many Failures = many wasted increments) literally lets the
  antagonist gain ground. **Library Lore** and a matched **narrow Lore** earn RP faster →
  fewer increments → the clock turns less. Efficiency is a defense, not a luxury.
- Player ≠ PC knowledge: the curse clock is **felt, not announced**. Narrate dread (the day
  loops tighter, the nights longer), never the raw number.

---

## 8. Mapping to *Season of Ghosts* — the investigative spine

The AP is a mystery; nearly every revelation is a Research topic. Run these as parallel
investigations, each its own statblock, advancing as the party finds sources.

| SoG investigation | Sources / skills | Tier shape (surface → secret) |
|---|---|---|
| **Uncovering the curse** (the looping day, Act 1; Kugaptee's growing reach later) | the village's own memory & records (*Willowshore Lore*, **Society**), the felt wrongness (**Occultism**), temple lore on broken cycles (**Religion**, *Sangpotshi Lore*) | T1: *something is repeating / wrong with time here* → T2: *the loop's mechanism and who/what anchors it* → T3: *the curse's true source and how it can be broken*. |
| **The monastery's history** | archives, deeds, and old chronicles (**Academia Lore**, **Library Lore**, **Society**), inscriptions & relics (**Religion**, **Arcana**) | T1: *what the place was and when it fell* → T2: *what was practiced/buried there and why it was abandoned* → T3: *the secret the monastery still holds — the link to the present haunting*. |
| **The nindoru** (the spirit-corruptors behind the season's dread) | **Occultism** (primary — spirits/aberrations/the esoteric), **Religion** (the dead & afterlife), a **creature-specific Lore** unlocked after they debut, captured texts/remains (**Arcana/Medicine**) | T1: *these are not ordinary ghosts* → T2: *their nature, what they want, what harms them (a weakness)* → T3: *their master/web and how to sever it* — gate this tier behind facts won elsewhere. |

**Running it operationally:**
- Stat each as a §2 topic at **Hard (+2)** Research DC for its level, **+rarity** for the
  occult ones (nindoru lore is **Uncommon/Rare** → +2/+5). Pick thresholds **5 / 10 / 15**.
- **Gate the top tier** of *the nindoru* and *the curse* behind a key learned elsewhere (a name
  from an Influenced NPC, a relic from the monastery) — this braids the three investigations so
  no single topic dumps the whole spoiler.
- Sources cross-feed the subsystems: a witness's facts come via **Influence**
  ([./influence.md](./influence.md)); a haunted archive may force a **Haunting**
  ([./hauntings.md](./hauntings.md)); a hostile site folds into **Infiltration**
  ([./infiltration.md](./infiltration.md)).
- Every increment ticks the **curse and enemy clocks** ([../../bridge/subsystems.md](../../bridge/subsystems.md)) — record time spent.

> Player ≠ PC knowledge is paramount here — the campaign **hinges** on hidden revelations.
> Roll Research **secret**, award RP behind the screen, and narrate only the tier the party has
> actually earned. Never leak Tier 2/3 truths early, and never confirm a False Lead as false
> until a later success corrects it.

---

## See also

- [../core-resolution.md](../core-resolution.md) — the d20 check and four degrees of success
- [../skills.md](../skills.md) — Recall Knowledge, the Lores, Occultism/Religion/Society, Aid
- [../dcs-by-level.md](../dcs-by-level.md) — Level-based DCs, Hard band, rarity adjustments
- [./influence.md](./influence.md) — persuading a source to yield facts that feed Research tiers
- [./hauntings.md](./hauntings.md) — when studying ghosts wakes them
- [./infiltration.md](./infiltration.md) — researching inside a hostile/watched location
- [./reputation.md](./reputation.md) — getting noticed while digging
- [../../bridge/subsystems.md](../../bridge/subsystems.md) — the curse & enemy clocks Research time advances
- [../../bridge/system-profile.md](../../bridge/system-profile.md) — topic statting + the Player ≠ PC knowledge seam
