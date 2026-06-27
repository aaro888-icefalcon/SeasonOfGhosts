# Chases — Pursuit & Flight Over Obstacles (PF2e Subsystem)

A **chase** abstracts a pursuit, flight, or race into a sequence of **obstacles**, each cleared
by a skill check at a stated DC. The party banks **Chase Points (CP)** toward a goal while a
**quarry, a timer, or a clock** advances against them; falling behind has named consequences.
From **GM Core** "Chases" (legacy: *Gamemastery Guide* "Chases"). It is the **opposed/clocked**
flavor of the [Victory Points engine](./victory-points.md) — read that for the shared chassis;
this file sets the dials and adds the obstacle structure.

Resolution itself (d20 + four degrees) lives in [../core-resolution.md](../core-resolution.md);
DCs come from [../dcs-by-level.md](../dcs-by-level.md).

> **Every check runs through the engine — never invent a result:**
> `python3 .claude/skills/mythic-gm/scripts/dice.py roll 1d20+<mod>`
> Pick the obstacle's DC, roll, read the degree, then advance CP and the limiter per the tables.

---

## 1. When to run a chase (vs. a single check or combat)

| Situation | Use |
|---|---|
| A single leap, a sprint over one barrier | one **Athletics/Acrobatics** action ([../skills.md](../skills.md)) |
| Catching, escaping, or racing someone **over a span of ground/time**, with stages and a deadline | **Chase subsystem** (this file) |
| The pursuit is really a stand-up fight on the move | **combat** with movement ([../combat.md](../combat.md)) — a chase only abstracts the *travel*, not blows traded |

A chase is the *travel-scale* analogue of Influence: instead of rounds of persuasion you run
**obstacles**, instead of IP you bank **CP**, and instead of an event clock the limiter is the
**quarry's lead** or a **deadline**.

---

## 2. The chase statblock (define once, before play)

Fill these six [VP fields](./victory-points.md) and record to campaign-state.

| Field | Chase's version |
|---|---|
| **Pool name** | **Chase Points (CP)** — progress toward the goal |
| **Check & DC** | a skill the obstacle allows, vs that **obstacle's DC** (§4) |
| **Award table** | default: crit **+2 CP** / succ **+1 CP** / fail **0** / crit-fail **0 or −1** (§5) |
| **Thresholds** | the **goal CP** that ends the chase in the party's favor (§6) |
| **Limiter** | the race against a **quarry's lead**, a **timer**, or a **clock** (§3, §7) |
| **Degradation** | falling behind: lost ground, a tightening clock, a setback condition (§7) |

A chase is usually **opposed** (you vs. the quarry/clock). The two sub-shapes:

| Shape | What's racing | Win / lose |
|---|---|---|
| **Goal-CP race** | party CP vs. a **timer** (fixed rounds) or a **quarry's own CP** | reach **goal CP** before the timer ends / before the quarry reaches *its* goal |
| **Lead track** | a **gap value** (rounds of lead) that grows or shrinks | close the gap to 0 (catch) or open it past a cap (escape) — see §7 |

Pick one shape at setup and stick to it; don't mix meters mid-chase.

---

## 3. The loop an AI GM runs

```
SET UP: lay out the OBSTACLES in order (§4). Set goal CP (§6) and the limiter
        (timer rounds, quarry CP, or starting lead — §7). CP = 0. Record to state.

EACH ROUND (every participant acts; quarry/clock acts too):
    1. The PC faces the CURRENT obstacle. Pick the skill they'll use against it.
    2. Apply the obstacle's listed bonus/penalty for that skill choice (§4).
    3. Roll: dice.py roll 1d20+<mod>  vs the obstacle's DC.
    4. Read four degrees → award CP (§5); apply any setback on a crit-fail.
    5. Advance the LIMITER: tick the timer / move the quarry's CP / adjust the lead (§7).
    6. When CP clears the current obstacle's cost, advance to the NEXT obstacle.
    7. Re-check the end conditions (§6); narrate gained/lost ground immediately.

END when: CP reaches GOAL (party wins) OR the limiter is exhausted /
          the quarry reaches its goal / the lead caps out (party loses) — §6.
```

Track: **current CP**, **current obstacle index**, **limiter remaining** (timer / quarry CP /
lead value), and any **standing conditions** picked up (a sprained ankle = clumsy, etc.).
Persist to campaign-state if the chase spans scenes.

> Each participant rolls **once per round** against the shared obstacle (this is the chase's
> own action economy — *not* the three-action turn). With one solo PC, the chase is faster and
> swingier; see the Diminisher note in §8.

---

## 4. Obstacles — the spine of the chase

A chase is a **list of obstacles in order**. Each obstacle is a mini-statblock the party must
clear before moving on. Author 3–6 of them for a typical chase.

| Obstacle field | What it is |
|---|---|
| **Name / fiction** | "the crowded market", "the slick rooftops", "the toll gate" |
| **Allowed skills + DC** | which skills can attempt it, each at a DC (usually the **Level-based DC** for the chase's level — [../dcs-by-level.md](../dcs-by-level.md), often **Hard +2** for a nasty stage) |
| **CP to clear** | how many CP this obstacle costs to pass (commonly **1**; tough obstacles **2**) |
| **Crit-fail setback** | what a botch does (lose ground, gain a condition, an extra CP to clear) |

**Multiple skills per obstacle.** Offer **2–3 options** so different builds contribute, e.g. a
fence is **Athletics (climb)** *or* **Acrobatics (vault)** *or* **Thievery (pick the gate)**;
charming past the guards might be **Diplomacy** or **Deception**. The fiction decides which the
PC can justify. A clearly *suboptimal* approach takes a difficulty band penalty (§ adjustments
in [../dcs-by-level.md](../dcs-by-level.md)); the obvious approach is at the base DC.

**Setting the obstacle DC.** Use the **Level-based DC** for the chase's intended level (the
quarry's or region's level). Routine stage = base DC; a real complication = **Hard (+2)**; a
brutal, signature obstacle = **Very Hard (+5)**. Don't exceed Very Hard unless the stage is
*meant* to cost the party.

---

## 5. Awarding Chase Points by degree

Default award (declare a variant in the statblock if the chase differs):

| Degree | CP awarded | Also |
|---|---|---|
| **Critical Success** | **+2 CP** | may *skip* the obstacle's setback entirely / shave a round of lead |
| **Success** | **+1 CP** | normal progress |
| **Failure** | **+0 CP** | no progress this round; the obstacle still blocks you |
| **Critical Failure** | **+0 CP** (or **−1**) | trigger the obstacle's **setback** (§4): lose ground, gain a condition, or add CP to clear |

Degrees follow [../core-resolution.md](../core-resolution.md): beat the DC by **10+** = crit
success; miss by **10+** (or nat 1 dropping a success to a failure) = crit failure; **nat 20**
bumps up one degree, **nat 1** bumps down one. The crit-success "skip the setback / gain ground"
is the chase's reward for a clean roll; the crit-fail setback is its teeth.

> Use the **bigger-swing** [VP variant](./victory-points.md) (crit +3 / setback −2) only for
> short, climactic chases where each round must matter. Default swings suit most pursuits.

---

## 6. Goal, end conditions & reading the outcome

The **goal CP** is the sum the party must bank to win (catch the quarry / reach safety / finish
the race). Scale it to the obstacle count and the limiter.

| Outcome | Trigger |
|---|---|
| **Party wins** | CP reaches **goal** before the limiter ends (quarry caught, escape made, race won) |
| **Party loses** | the **timer runs out**, the **quarry reaches its own goal CP**, or the **lead caps out** (§7) before the party hits goal |
| **Partial / messy** | the chase ends "even" — narrate a costly draw (quarry slips away but drops something; the party arrives late but arrives) |

**Picking goal CP** (from the [VP threshold guidance](./victory-points.md)): roughly **one CP
per obstacle**, +1–2 for a longer chase, then sanity-check against the limiter so the chase is
*winnable but not certain*. A 4-obstacle pursuit on a 6-round timer might set **goal = 5 CP**:
the party can clear it with a couple of good rolls to spare, but a string of failures loses it.

| Chase size | Obstacles | Suggested goal CP | Suggested timer (rounds) |
|---|---|---|---|
| Short | 2–3 | **3** | 4 |
| Medium | 3–4 | **5** | 6 |
| Long / climactic | 5–6 | **7–8** | 8–10 |

---

## 7. The limiter — quarry, timer & lead

A chase must press; pick **one** limiter at setup ([VP §5](./victory-points.md)).

| Limiter | How it works | Falling-behind consequence |
|---|---|---|
| **Timer (rounds)** | a fixed round count; if CP < goal when it ends, the party fails | the deadline simply arrives — quarry vanishes / the bomb goes off |
| **Quarry CP (opposed pool)** | the quarry banks its **own CP** each round (roll for it, or tick a fixed rate); whoever hits goal first wins | every quarry success widens the gap; ties to the party losing the race |
| **Lead track (gap)** | a single **gap value** in rounds of lead; the party's net result each round closes or opens it | gap grows on the party's failures → at **+cap the quarry escapes**; gap to **0 = caught** |

**Running an offscreen quarry simply.** You don't have to roll the quarry's every obstacle. Two
clean options: (a) give the quarry a **fixed rate** (e.g. +1 CP/round, or +2 if it's faster than
the party), or (b) tie its progress to the **engine clock** — let the world-tick advance the
"enemy faction moves" or an offscreen clock so the lead changes on schedule
([../../bridge/subsystems.md](../../bridge/subsystems.md)). For a pursuit the party is *fleeing*,
invert it: the quarry is the pursuer and **goal CP = distance to safety**.

> **Player ≠ PC knowledge:** the quarry's exact lead/CP is **felt, not announced** — narrate
> "they're slipping out of sight" or "you're gaining", not "the gap is 3"
> ([../../bridge/system-profile.md](../../bridge/system-profile.md)). Roll and tick honestly.

**Degradation / setbacks** (the chase's teeth, declared up front):

| Setback | Trigger | Effect |
|---|---|---|
| **Lose ground** | crit-fail on an obstacle | gap +1 round, or **−1 CP** |
| **Gain a condition** | a fall, a graze, exhaustion | a relevant condition — e.g. **clumsy 1**, **enfeebled 1**, persistent damage ([../conditions.md](../conditions.md)) |
| **Harder obstacle** | a botch fouls the path | the current obstacle costs **+1 CP** to clear, or its DC rises one band |
| **Quarry surges** | the quarry takes its turn | quarry **+1 CP** / lead **+1** |

---

## 8. Mapping to *Season of Ghosts* — pursuit & flight beats

Run any SoG chase/pursuit by the structure above. Stat the chase to the **scene's level**
(quarry's level or region level) and apply the **Diminisher** for solo play.

| SoG beat | Chase framing |
|---|---|
| **Pursuing the governor** (or any fleeing notable/agent through Willowshore) | Goal-CP race. **Obstacles** = the town's terrain: the crowded **Northridge market** (Athletics shove-through / Society read-the-crowd), the **canal/Southbank bridges** (Acrobatics / Athletics swim), a **toll or temple gate** (Diplomacy/Deception/Thievery), rooftops (Acrobatics). **Goal ≈ 5 CP** over ~4 obstacles; **limiter** = the quarry's lead (fixed +1 CP/round, +2 if mounted/forewarned). Catch = confrontation scene; escape = the governor reaches their refuge and the Threads List advances. |
| **Fleeing a haunt or spirit through the long night** | The party is the **quarry**; goal CP = **distance to safety** (a warded threshold, dawn). Obstacles are the cursed landscape; crit-fail setbacks lean on **frightened**/conditions, not damage ([../conditions.md](../conditions.md)). Haunt pressure is the limiter — let the **Hauntings** world-tick raise the stakes ([../../bridge/subsystems.md](../../bridge/subsystems.md)). |
| **Racing a clock to reach/stop something** (a ritual, a victim, a closing gate) | Timer limiter = a segmented **clock**; CP race to the destination before it fills. Tie the timer to the world-tick so it arrives on schedule whether or not the PC rolls well. |
| **Any new pursuit the module throws up** | Don't improvise ad hoc — fill the §2 statblock, author 3–6 §4 obstacles (each with 2–3 allowed skills + DC + setback), set goal CP and one limiter (§6–§7), and run §3's loop so it behaves like every other chase. |

**Statting a chase on the fly:** pick the **chase level** (quarry/region level) → read its
**Level-based DC** from [../dcs-by-level.md](../dcs-by-level.md) (Hard +2 for nasty stages);
author **3–6 obstacles** with 2–3 skills each; set **goal CP** and **timer** from §6's table;
choose **one limiter** (§7) and declare **setbacks** up front. **Solo Diminisher:** a lone PC
rolls one die per obstacle, so shorten the chase (fewer obstacles, lower goal CP) or slow the
quarry's rate — keep it winnable. Record the chase to setting-canon live state.

---

## See also

- [./victory-points.md](./victory-points.md) — the shared point-track engine (chases are its opposed/clocked flavor)
- [../core-resolution.md](../core-resolution.md) — the d20 check and four degrees of success
- [../dcs-by-level.md](../dcs-by-level.md) — Level-based DCs + Hard/Very Hard bands for obstacle DCs
- [../skills.md](../skills.md) — Athletics, Acrobatics, and the other skills obstacles allow
- [../conditions.md](../conditions.md) — clumsy/enfeebled/frightened and other crit-fail setbacks
- [./influence.md](./influence.md) — the round-structured sibling subsystem (social, not spatial)
- [../../bridge/subsystems.md](../../bridge/subsystems.md) — the world-tick that can advance a quarry's lead or a chase clock
- [../../bridge/system-profile.md](../../bridge/system-profile.md) — chase statting + the Player ≠ PC knowledge seam for hidden leads
