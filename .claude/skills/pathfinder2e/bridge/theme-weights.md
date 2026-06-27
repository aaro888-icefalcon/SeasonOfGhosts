# Theme Weights — Season of Ghosts   (hook: themes; FIXED for the whole campaign)
# Every adventure/act rolls its 5 Theme priorities from these weights. Season of Ghosts is
# folk horror + mystery + community drama: dread and the unknown lead, the bonds of a small
# town and its people give the horror its weight, action is real but not the point.
Action: 1
Tension: 4
Mystery: 3
Social: 2
Personal: 2
# Optional fixed First-Priority theme (horror -> Tension leads the dread):
first_priority: Tension

# Apply this by setting adventure.json's theme_order to a Tension/Mystery-led order at
# session zero (a horror-style roll, or fix it). The campaign default written to the
# campaign is:  Tension, Mystery, Personal, Social, Action.
#
# Per-act lean (interpretation, not a re-weight — keep the fixed weights, color the rolls):
#   Act 1 Summer  — Mystery + Tension (what is wrong here? why does the day repeat?)
#   Act 2 Fall    — Social + Tension (hold the town together as the siege builds)
#   Act 3 Winter  — Personal + Tension (grief, scarcity, who do you save?)
#   Act 4 Spring  — Mystery + Tension (the murders; unmask the un-weavers)
# The closest engine style preset is "horror"; you may roll with
#   adventure_crafter.py themes --style horror --campaign campaign
# then nudge toward the order above, OR set it directly via state.py adventure set-themes.
