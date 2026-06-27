# System Profile — Pathfinder 2e   (hook: resolve)

The RPG seam. PF2e owns task resolution and combat; Mythic answers world questions and
paces. Edition: **Remaster-primary, legacy-aware** (DCs, degrees of success, and the
three-action economy are identical across editions; only some naming differs).
Detail lives in `../references/` — load on demand.

- **Dice convention:** d20 + modifiers vs a DC. One d20 per check; ties go to the roller (a
  result that *equals* the DC succeeds).
- **Express a roll as:** `python3 .claude/skills/mythic-gm/scripts/dice.py roll 1d20+<mod>`
  (e.g. `1d20+9`). Damage as its dice string (e.g. `2d6+4`, `3d8`). Persistent/extra dice
  rolled separately. Use `adv`/`dis` only for systems with advantage — PF2e has none; model
  fortune/misfortune by rolling `1d20` twice and taking higher/lower in two calls.
- **Core resolution — FOUR degrees of success** (`../references/core-resolution.md`):
  - **Critical Success** — beat the DC by 10+ (or a *natural 20* that is at least a success).
  - **Success** — meet or beat the DC.
  - **Failure** — miss the DC by 1–9.
  - **Critical Failure** — miss by 10+ (or a *natural 1* that is at most a failure).
  - A natural 20 bumps the result up one step; a natural 1 bumps it down one step (after
    comparing to the DC). This is how PF2e expresses "exceptional" — so a Fate-Question
    **Exceptional Yes/No maps to a Critical Success/Failure** in rule-mode.
- **Degrees of success?:** **yes** — pervasive. Almost every action has distinct crit-success
  / success / failure / crit-failure outcomes; always resolve to a degree, not a binary.
- **DCs:** level-based. Simple DCs by proficiency: Untrained 10 · Trained 15 · Expert 20 ·
  Master 30 · Legendary 40. Level-based DCs and the standard ±difficulty adjustments
  (Incredibly Easy −10 … Incredibly Hard +10; rarity: Uncommon +2, Rare +5, Unique +10) are
  in `../references/dcs-by-level.md`. **Use level-based DCs for most checks against the world.**
- **Stats / skills:** six abilities (Str, Dex, Con, Int, Wis, Cha) as modifiers. Proficiency
  ranks add **rank bonus + your level when trained or better**: Untrained +0, Trained +2,
  Expert +4, Master +6, Legendary +8 (each plus level). Perception + 16 skills (Acrobatics,
  Arcana, Athletics, Crafting, Deception, Diplomacy, Intimidation, Lore[*], Medicine, Nature,
  Occultism, Performance, Religion, Society, Stealth, Survival, Thievery). See
  `../references/skills.md` for each skill's actions and what it can attempt.
- **Defenses / health:** **AC** = 10 + proficiency + Dex (capped by armor) + item bonuses.
  **HP** = ancestry HP + (class HP + Con mod) × level. Three **saves** — Fortitude, Reflex,
  Will. **Hero Points** (start each session with 1; spend 1 to reroll, all to avoid death)
  are the *player's* opt-in pool — never spent by the GM (see the discipline: Peril Points
  are OFF; Hero Points are the player's lever, announced aloud).
- **Combat** (`../references/combat.md`): each turn = **3 actions + 1 reaction**. Initiative is
  usually a Perception check (sometimes Stealth/Deception for ambush). Attacks use a
  **multiple attack penalty**: −5 on the 2nd attack, −10 on the 3rd (−4/−8 with an agile
  weapon). Attack vs AC; crit on beating AC by 10 or a nat 20 → **double damage**. Damage =
  weapon/spell dice + mods; apply resistance/weakness. **Death/dying:** at 0 HP you're
  **dying 1** (dying 2 if the hit was a crit, +1 if you had the wounded condition); roll a
  flat DC 10 **recovery check** each turn (success −1 dying, crit −2, failure +1, crit
  failure +2); **dying 4 = dead**. Surviving raises **wounded** by 1. This is **real death** —
  honor it (no GM rescue; only the player may spend Hero Points).
- **NPC / monster statting (on the fly):** PF2e creatures are built to **level benchmarks**.
  To stat a foe in play: pick a **creature level**, then read the benchmark line for that
  level — moderate AC, high/moderate/low attack bonus, HP, save spread, and a moderate
  strike DC/damage — from `../references/dcs-by-level.md` ("creature benchmarks"). Express the
  result in PF2e units: **AC, HP, Fort/Ref/Will, attack bonus, damage dice, spell/ability
  DC.** When the *value itself* is uncertain, decide the expected value, ask a Fate Question,
  and read the **NPC Statistics Table** (`oracle.py answer npc_statistics …`: Yes = as
  expected, ExcYes +25%, No −25%, ExcNo −50%). Prefer the book's printed stat block when a
  cluster cites one — the Bestiary clusters point to it.
- **THE DIMINISHER (solo scaling):** this campaign is configured for **a single PC**
  (changeable at Session Zero). The AP assumes a party of 4 at "moderate" budget, so apply a
  **Diminisher of ½** to encounter scale: roughly halve the number of identical foes, or drop
  a single foe's level by ~2–4 (use one Diminisher consistently — see
  `../references/combat.md` "solo scaling"). For a full party of PCs, set Diminisher = 1 (no
  scaling); for 2–3 PCs, ≈ ¾. Record the chosen Diminisher in `campaign-state.md`.
- **Routing default — PF2e resolves**: combat; skill checks & saves; spell attacks/DCs;
  exploration & downtime **activities** (Craft, Treat Wounds, Earn Income, Repair, Subsist,
  etc.); and the **subsystems** (Influence, Victory Points, Research, Reputation, Chases,
  Infiltration, Hauntings — `../references/subsystems/`). **Defer to a Fate Question** for:
  does a thing/feature exist, an NPC's disposition or off-screen choice not set by a check,
  what's happening elsewhere, and any uncertain world fact PF2e has no rule for.
- **Subsystems ported as structured checks (not raw Fate Questions):** Influence, Victory
  Points / downtime, Research, Reputation (Northridge/Southbank + per-NPC), Chases,
  Infiltration, and **Hauntings** (haunts have AC/saves/Stealth DC and a disable routine).
  Each has rules — see `../references/subsystems/`. Fear/horror is modeled by the
  **frightened** condition and the AP's spirit powers, not a separate sanity meter.
