# Campaign State — Season of Ghosts (Willowshore)

> The single source of truth. Overwrite this at the end of **every** scene.
> If a change happened in the fiction but isn't written here, it didn't happen.

## Frame
- **Adventure Source mode:** Prepared Adventure (ingested "Season of Ghosts" AP, run as an atomized sandbox)
- **RPG / System Profile:** Pathfinder 2e → `.claude/skills/pathfinder2e/bridge/system-profile.md`
- **Setting / canon:** Willowshore / Shenmen (Tian Xia) → `setting-canon.md`
- **Genre & stakes vocabulary:** folk-horror + cozy + mystery — death/maiming/capture, dread, the wrongness beneath small-town comfort
- **Resolution:** Fate Check   ·   **Chaos flavor:** normal
- **Discipline:** HARDCORE (no softening; Peril Points OFF unless player opts in)
- **Content consent (Session Zero):** FULL HORROR — no lines, no veils (arachnid/body-horror imagery on the table)
- **Diminisher:** 1 (party of 4 — PC Daegon + 3 GM-run allies; encounters run at full published strength)

## CURRENT ADVENTURE: Act 1 — The Summer That Never Was
_Each adventure has its **own** Threads & Characters Lists and Theme priority. The Lists + Theme order +
tens-counter are the machine source of truth in **`threads.json` / `characters.json` / `adventure.json`**
(the dice roll those, any length); the sections below are a human-readable **snapshot** — keep them
roughly in sync but edit the JSON via `state.py`._
_A **new adventure** begins when the current one's main Thread(s) Conclude (`threads.json` empties) or the
player declares one — then roll new Themes (`adventure_crafter.py themes --campaign <dir>`), clear the
Threads List, carry over only still-relevant Characters, archive the rest._

- **Adventure status:** active
- **Theme priority (this adventure):** Tension, Mystery, Personal, Social, Action — in `adventure.json` → `state.py adventure show <campaign>`  _(rolled per RPG style)_

## Chaos Factor: 3
_(1–9; −1 if the PC was mostly in control of the last scene, +1 if it was chaotic)_

## Threads List — snapshot of `threads.json` (the dice roll the JSON, not this)
_Manage with `state.py thread add|weight|remove|show <campaign> "<name>"`. **Weight (max 3)** = re-adding
when Invoked/featured → that Thread is weight× as likely. Base list = 25 weighted slots; a longer list
still fully rolls over (two-stage roll: NEW / PRE-EXISTING / CHOOSE MOST LOGICAL). Remove all of a
concluded Thread. Curate — prune the irrelevant._
1. Escape the wrong, looping summer day
2. Root out the noppera-bo wearing the town's stolen faces _(Choe & his festival crew found slaughtered & faceless at the mill; ~11 faces taken & now WORN by infiltrators)_
3. Get back home to Willowshore
4. Protect the townsfolk
5. Relight the Eternal Lantern
6. Understand what is wrong with the town

## Characters List (NPCs/forces; PC is NOT listed) — snapshot of `characters.json`
_Same: `state.py char add|weight|remove|show <campaign> "<name>"`; weight = re-add (max 3); the dice roll
the JSON. Add/weight when an NPC is introduced or featured; remove when it permanently exits._
1. Granny Hu (Hu Ban-niang) — Northridge elder / power-broker
2. Old Matsuki (Matsuki Shou) — Southbank elder / living history
3. Heh Shan-Bao (Governor) — appointed governor (vanished with his manor)
4. Choe Chung-hu (miller) — Reenactment Festival organizer; never arrived with the ransom breakfast
5. Ha Hai-er (town guard) — watchtower survivor
6. Kim Gu-won (Kofusachi cleric) — Granny Hu's aide / Exchange Manager
7. Doctor Dami (Mababangloob) — charitable doctor, Hand of Spring — **[FACE-STOLEN: a noppera-bo wears Dami's face & voice and is loose in town; the real Dami's fate unknown. Per Reza's note.]**
8. Zheng Peng (watch officer) — imperial barracks
9. Ugly Cute (stone guardian) — missing Spider Gate spider
10. Reza — Daegon's teen apprentice (barber-surgeon trade); Close Ties anchor; last in town

## Tens-cycle counter (Theme-die 10s rolled so far): in `adventure.json` _(auto-updated by turning-point)_

## Adventure Features List (prepared-adventure mode only)
_Key Act-1 locations, set-pieces & objectives (player-knowable; spoiler reveals withheld). PF2e difficulties noted where the module sets them._
1. Wooded Clearing (W38) — campaign-start; PCs wake blindfolded after the Reenactment Festival; giant centipedes attack (Trivial 1)
2. Game trail / Duyue River bridge — the road home; Mirage Mist (day), Crimson Moon + Blood Rain (night) plague the land while the Lantern is dark
3. Spider Gate (W33) — guardian spider "Ugly Cute" missing; empty entrance lantern (refillable for +2 vs the manifestations)
4. Eastern Watchtower — Ha Hai-er; recite 4 of the 8 Practices to earn trust; lantern-oil cask
5. The Eight Practices of the season of ghosts — social/survival rule-set
6. Matsuki Estate (W5), Southbank — Old Matsuki; learn the lantern prayer, get 3 copper coins to bless
7. Ceiba-Duyue Exchange / Trade Office (W29), Northridge — Granny Hu & Kim Gu-won
8. Crossing the water — Ceiba River swim / Willowshore Dam (W18) / Woodraft Lake + Grasping Currents haunt
9. Town shrines — Invoke Shrine Blessing to bless the 3 coins (Abadar/Daikitsu/Kofusachi/Pharasma + others)
10. Dawnstep Bridge (W11) + The Eternal Lantern (W10) — buso Gurglegut holds it (Moderate 1); relighting ends mist/moon/blood-rain (core Ch.1 objective)
11. Hand of Spring clinic (W27) — Doctor Dami; phantom gecko; source of lethargy poison
12. Downtown Willowshore (W19) — barracks/prison, the vanished Governor's Manor (empty lot B1), residences, Happy Kappa bathhouse
13. Cerulean Teahouse (W22) — Mo Douqiu the rokurokubi mastermind; captive villagers; Qing Mai-Lai's will
14. The Mindscape Border — fog ring near Gourd Lake that loops all travel back; blocks the road to Karahai
15. Shinzo & Yix — the mysterious traveling merchant; vital supply line
16. Willowshore Hinterlands — Gourd Lake, Eyes of Fumeiyoshi (D9), Canary Inn (D4), Hunter's Hut (D6), Peachwood Groves; ~2nd-level wilds
17. The Great Willow (W37) — kodama kami; "we are in a cage"; Into the Infestation (D7, Xungu)
18. Gorge of Fangs and Teeth (D10) — rescue Ugly Cute; leads to the lumber camp & Wall of Ghosts
19. The Wall of Ghosts — impenetrable mist barrier sealing the western mindscape
20. Who Leads Willowshore? — Matsuki vs Granny Hu leadership duel (Influence subsystem)
21. The Lumber Camp (E1-E17), ~8 miles west — noppera-bo Prayers (Zoudou) & Rovers (Mugirou); abducted townsfolk
22. The Ritual Site (D12) — Zoudou's rite over Kum Meng-sung at the Wall; the name "Kugaptee" surfaces as the chief clue

## Campaign roster (persists across adventures: recurring NPCs, long arcs)
- **Daegon** (PC) — barber-surgeon, Hand of Spring practice.
- **Reza** — Daegon's apprentice (Close Ties).
- **Dr. Dami Mababangloob** — Daegon's partner & senior mentor (W19).

## PC(s)
- **Daegon** — Human Investigator 1 (Alchemical Sciences), barber-surgeon. See `character-sheet.md`. HP 17/17. Conditions/injuries: none. Hero Points: 1. Resources: formula book (4), ~8 sp.
- **Close Ties:** Reza (apprentice). Also partner/mentor Dr. Dami (Hand of Spring).
- **Party (GM-run allies; see `companions.md`):** Su-Won (half-elf Monk, HP 20), Lan (gnome Druid/Leaf, HP 18), Tobi (tengu Commander, HP 16) — fellow festival abductees — plus **Ha Hai-er** (town guard, joined Scene 3, wants to reach her daughter [Northridge] & husband Edha [Matsuki estate]).
- **Known intel:** an external/supernatural influence puppets ordinary animals (talking, fearless); **noppera-bo / face-stealers** are infiltrating wearing the faces of dead/taken townsfolk (weak to loud sound; no sight/smell). The town guardian "Ugly Cute" is gone & the gate **Eternal Lantern is OUT** (party carries a cask of lamp oil to refill it). Relighting the Lantern is revealed to be the same problem as fixing what's wrong with the town.

## Overlays
- **Keyed Scenes:** _(Trigger → Event; Count)_ none
- **Thread Progress Track:** _(Focus Thread, Track 10/15/20, points, flashpoint flag)_ none
- **Peril Points:** OFF _(or: N remaining, player-invoked only)_

## Clocks (offscreen factions/threats)
- none

## Adventure Crafter state (crafter mode)
- **Active Turning Point (Scene 3):** Altered scene → thread *Relight the Eternal Lantern*; char *Ha Hai-er* invoked. Plot Points: Fraud · Protector · It's a Secret · Framed · Travel Setting. Rendered: Eastern Watchtower standoff — Ha Hai-er, lone survivor, crossbow leveled, accuses the party of being monsters wearing neighbors' faces; demands they recite the 8 Practices to prove they're flesh. Two guards dead of snake-venom, two jinkin gremlins sword-slain. (She's hiding something — *It's a Secret*.)
- Theme priority: Tension, Mystery, Personal, Social, Action

## Scene
- **Scene #:** 7 (Scenes 1–6 resolved; inside the Matsuki estate refuge)
- **Reza:** found ALIVE & safe at Graveside Manners (verified via a private memory); now with the party, armed with a field kit. (You So-Jin was absent/gone from her shop.)
- **Captive:** noppera-bo trickster stashed bound & gagged in You So-Jin's barricaded herb-shop (graveyard), to interrogate later.
- **URGENT:** the **Dami-thing** (noppera-bo wearing Dr. Dami) reached the Matsuki refuge AHEAD of the party and was let inside — now among the wounded & children as the trusted doctor. Party got through the gate (Society success) but is NOT yet believed about Dami.
- **Active Turning Point:** none (Scene 6 framed Expected). _Standing reveal: **Relight the Eternal Lantern ≡ Understand what is wrong with the town.**_
- **Captive:** a **noppera-bo trickster** taken ALIVE (gagged, bound to a stretcher-board, hauled by Su-Won) — caught in Daegon's clinic mid-fabricating a fake **Reza** face from her belongings → confirms it does NOT have the real Reza. Not yet interrogated.
- **Last scene recap (2–3 sentences):** Into fog-bound Willowshore (town shuttered, faces untrustworthy). Daegon led to his clinic, the **Hand of Spring** — found dark & ransacked (sleep/paralytic stock looted). Inside: a noppera-bo building a half-made **Reza** mask from her things; party lit the room & **captured it alive** (Lan's tangle vine + nonlethal subdual). Search (success): **Reza escaped alive & smart** (out the window with a field kit) and left a coded note — *Dr. Dami was FACE-STOLEN (a thing wears her now, don't trust her); Reza's gone to ground at Graveside Manners ("where the dead are kind").* Party + captive headed south to the graveyard.
- **Self-audit drift counter (consecutive soft scenes):** 0

## Archive pointer
- Resolved threads / dead characters → `archive.md`
